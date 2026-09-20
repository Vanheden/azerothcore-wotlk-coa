-- Chronomancer Time mechanics and missing summons. Existing quest/content records are not rewritten.
DELETE FROM `spell_script_names` WHERE `spell_id` = 804505 AND `ScriptName` = 'aura_ascension_timeline_tether';
DELETE FROM `spell_script_names` WHERE `spell_id` = 801294 AND `ScriptName` = 'spell_ascension_rewind';
DELETE FROM `spell_script_names` WHERE `spell_id` = 706973 AND `ScriptName` = 'aura_ascension_backtrack';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(804505, 'aura_ascension_timeline_tether'),
(801294, 'spell_ascension_rewind'),
(706973, 'aura_ascension_backtrack');

-- The authored talent has 100% proc chance and no internal cooldown; each periodic damage/heal reduces by 1s.
DELETE FROM `spell_proc` WHERE `SpellId` = 804505;
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`,
`SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`,
`DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(804505, 0, 0, 0, 0, 0, 262144, 3, 2, 0, 2, 0, 0, 100, 0, 0);

DELETE FROM `spell_bonus_data` WHERE `entry` IN (560355, 560374, 583921);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(560355, 0, 0, 0, 0, 'Chronomancer - Renewal copies Epoch healing'),
(560374, 0, 0, 0, 0, 'Chronomancer - Protection copies Epoch healing'),
(583921, 0, 0, 0, 0, 'Chronomancer - Oblivion copies Epoch healing');

-- Copied Creature.dbc entry 50071 uses invisible display 11686; native Clone Me supplies the owner's appearance.
INSERT INTO `creature_template` (`entry`, `name`, `minlevel`, `maxlevel`, `faction`, `unit_class`, `type`,
`BaseAttackTime`, `RangeAttackTime`, `ScriptName`)
SELECT 50071, 'Infinite Clone', 1, 1, 35, 8, 7, 2000, 2000, 'npc_ascension_infinite_clone'
WHERE NOT EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 50071);
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`)
SELECT 50071, 0, 11686, 1, 1
WHERE NOT EXISTS (SELECT 1 FROM `creature_template_model` WHERE `CreatureID` = 50071);

-- First stage uses the native ritual portal display; completion uses the installed Caverns of Time hourglass.
-- Two participants are the Chronomancer and one helper. The completed hourglass uses native meeting-stone rules.
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data6`, `data7`)
SELECT 194109, 18, 7358, 'Hourglass of Time Ritual', 1, 2, 1200007, 1, 1
WHERE NOT EXISTS (SELECT 1 FROM `gameobject_template` WHERE `entry` = 194109);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`)
SELECT 194112, 23, 7133, 'Hourglass of Time', 0.025, 1, 300
WHERE NOT EXISTS (SELECT 1 FROM `gameobject_template` WHERE `entry` = 194112);
