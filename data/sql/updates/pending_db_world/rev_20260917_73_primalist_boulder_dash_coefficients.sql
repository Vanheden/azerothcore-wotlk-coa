-- Primalist Boulder Dash (500692) rolls forward and triggers helper 500693 every 0.5 sec to damage the
-- enemies it rolls over. The parent's description promises ${$500693m1+$500693ppl1+$AP*.5+$SP*1} Physical
-- damage, but the helper's school damage effect is BasePoints 0 / DieSides 1 (a flat 1) with
-- EffectBonusMultiplier 0, and it has no `spell_bonus_data` row, no rank chain to fall back to and no script.
-- SpellDamageBonusDone therefore adds neither the 0.5 attack power term nor the 1.0 spell power term, so every
-- roll-over hit lands for 1 damage.
-- The helper is a plain SPELL_EFFECT_SCHOOL_DAMAGE (no weapon-percent or normalized-weapon term to double up
-- with), is triggered only by 500692, and is SPELL_DAMAGE_CLASS_MELEE without a ranged mask, so the attack
-- power term resolves to melee AP as the description states.
START TRANSACTION;
DELETE FROM `spell_bonus_data` WHERE `entry` = 500693;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(500693, 1, 0, 0.5, 0, 'Local Primalist: Boulder Dash - damage per enemy rolled over');
COMMIT;
