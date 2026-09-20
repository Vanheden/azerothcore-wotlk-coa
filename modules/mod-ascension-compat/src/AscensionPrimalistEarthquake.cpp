/* Copyright (C) 2016+ AzerothCore, GNU AGPL v3. */

#include "AscensionPrimalistEarthquake.h"
#include "Player.h"
#include "SpellAuraDefines.h"
#include "SpellMgr.h"
#include <array>

namespace
{
constexpr uint32 PRIMALIST_FAMILY = uint32(CLASS_WILDWALKER) + 6;
constexpr std::array<uint32, 6> EARTHQUAKE_RANKS =
    {520412, 520741, 520742, 520743, 520744, 520745};
}

void ApplyAscensionPrimalistEarthquakeContract(SpellInfo* spellInfo)
{
    if (!spellInfo || spellInfo->SpellFamilyName != PRIMALIST_FAMILY)
        return;

    bool isEarthquakeRank = false;
    for (uint32 rankId : EARTHQUAKE_RANKS)
        if (spellInfo->Id == rankId)
        {
            isEarthquakeRank = true;
            break;
        }
    if (!isEarthquakeRank)
        return;

    // Effect 0 is the real periodic-damage tick of this ground effect (persistent area
    // aura); effect 1 only re-applies the accompanying root via a periodic trigger spell
    // and carries no damage/heal value of its own. LoadSpellInfoCustomAttributes() only
    // treats SPELL_AURA_PERIODIC_DUMMY (and a few other value-less aura types) as safe to
    // ignore on an area-aura effect; SPELL_AURA_PERIODIC_TRIGGER_SPELL is not on that list,
    // so effect 1's nonzero placeholder CalcValue() gets the whole spell classified
    // SPELL_ATTR0_CU_BINARY_SPELL. Because the school is Nature (not Normal/Holy), that
    // flag routes every tick through Unit::MagicSpellHitResult's full-miss roll (silently,
    // with no combat log entry) instead of Unit::CalcAbsorbResist's partial resist, so most
    // ticks land as zero damage while the root debuff from effect 1 stays visibly applied.
    if (spellInfo->Effects[EFFECT_0].Effect == SPELL_EFFECT_PERSISTENT_AREA_AURA &&
        spellInfo->Effects[EFFECT_0].ApplyAuraName == SPELL_AURA_PERIODIC_DAMAGE &&
        spellInfo->Effects[EFFECT_1].Effect == SPELL_EFFECT_PERSISTENT_AREA_AURA &&
        spellInfo->Effects[EFFECT_1].ApplyAuraName == SPELL_AURA_PERIODIC_TRIGGER_SPELL)
        spellInfo->AttributesCu &= ~SPELL_ATTR0_CU_BINARY_SPELL;
}
