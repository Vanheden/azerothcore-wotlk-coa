--
-- Shared native redirect lifecycle for Veering Winds, Feral Pressure and Warning Shot.
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_threat_redirect';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_threat_redirect_active';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(574356, 'aura_ascension_threat_redirect'),
(534605, 'aura_ascension_threat_redirect'),
(534480, 'aura_ascension_threat_redirect'),
(574357, 'aura_ascension_threat_redirect_active'),
(535214, 'aura_ascension_threat_redirect_active'),
(535097, 'aura_ascension_threat_redirect_active');

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_barometric_pressure';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(803563, 'aura_ascension_barometric_pressure');

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_electrical_charge';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_charged_conduit';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(704149, 'aura_ascension_electrical_charge'),
(803790, 'aura_ascension_charged_conduit');

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_ascension_blood_feast_corpses';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_ascension_blood_feast_drain';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(706607, 'spell_ascension_blood_feast_corpses'),
(706606, 'spell_ascension_blood_feast_drain');

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_hemostasis';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_hemostasis_ready';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_ascension_blood_burst';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(681304, 'aura_ascension_hemostasis'),
(302895, 'aura_ascension_hemostasis_ready'),
(803326, 'spell_ascension_blood_burst');

DELETE FROM `spell_bonus_data` WHERE `entry` = 803326;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(803326, 1.03, 0, 0.43, 0, 'CoA Blood Burst: Shadow power and attack power');

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_ranger_advantage';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(804329, 'aura_ascension_ranger_advantage');

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_playing_dirty';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_dirty_fighter';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(681787, 'aura_ascension_playing_dirty'),
(806978, 'aura_ascension_dirty_fighter');

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_ascension_hookshot';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_hookshot_ready';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(-800360, 'spell_ascension_hookshot'),
(803857, 'aura_ascension_hookshot_ready');

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_ascension_outmaneuver';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_ascension_decoy_strike';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_outmaneuver_mark';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_decoy_window';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(557325, 'spell_ascension_outmaneuver'),
(557325, 'aura_ascension_outmaneuver_mark'),
(557326, 'aura_ascension_decoy_window'),
(557328, 'spell_ascension_decoy_strike');

DELETE FROM `spell_proc` WHERE `SpellId` = 557325;
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`,
`SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`,
`DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(557325, 0, 0, 0, 0, 0, 40, 1, 2, 3, 0, 0, 0, 100, 0, 0);

DELETE FROM `spell_bonus_data` WHERE `entry` = 557328;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(557328, 0, 0, 0.55, 0, 'CoA Decoy Strike: attack power');

DELETE FROM `spell_bonus_data` WHERE `entry` = 681235;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(681235, 0, 0, 0.35, 0, 'CoA Sucker Punch: attack power');

DELETE FROM `spell_bonus_data` WHERE `entry` = 803106;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(803106, 0, 0, 0.25, 0, 'CoA Viper''s Bite: bleed bonus attack power');

DELETE FROM `spell_bonus_data` WHERE `entry` = 801935;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(801935, 0, 0, 0, 0.2, 'CoA Enchanted Flare: periodic ranged attack power');

-- Keep the authored companion auras tied to their owning buff's lifetime.
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_arcane_palm_sigil';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_runemaster_hurricane';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_ascension_hurricane_damage';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(-805380, 'aura_ascension_arcane_palm_sigil'),
(645435, 'aura_ascension_runemaster_hurricane'),
(645437, 'spell_ascension_hurricane_damage');

DELETE FROM `spell_proc` WHERE `SpellId` = -805380;
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`,
`SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`,
`DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(-805380, 126, 0, 0, 0, 0, 332116, 1, 2, 3, 2, 6, 0, 100, 0, 0);

DELETE FROM `spell_bonus_data` WHERE `entry` IN (712298, 807819, 707466);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(712298, 0, 0, 0, 0, 'CoA Fists of Power: copied resolved Runeblade damage'),
(807819, 0, 0, 0, 0, 'CoA Palm Sigil: copied resolved direct magic damage per tick'),
(707466, 0, 0, 0, 0, 'CoA Rift Clone: owner attack power supplied by script');

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_volcanic_blast';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_ascension_gaze_of_theradras';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(680451, 'aura_ascension_volcanic_blast'),
(681480, 'aura_ascension_volcanic_blast'),
(805919, 'spell_ascension_gaze_of_theradras');

DELETE FROM `spell_proc` WHERE `SpellId` IN (680451, 681480, 572908);
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`,
`SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`,
`DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(680451, 9, 0, 0, 0, 0, 332116, 1, 2, 2, 2, 0, 0, 100, 0, 0),
(681480, 9, 0, 0, 0, 0, 332116, 1, 2, 2, 2, 0, 0, 100, 0, 0),
(572908, 0, 0, 0, 0, 0, 68, 1, 2, 12287, 0, 0, 0, 100, 0, 1);

DELETE FROM `spell_bonus_data` WHERE `entry` = 681353;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(681353, 0, 0, 0, 0, 'CoA Volcanic Blast: copied resolved critical damage');

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_crimson_thirst';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(807415, 'aura_ascension_crimson_thirst');

DELETE FROM `spell_proc` WHERE `SpellId` = 807415;
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`,
`SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`,
`DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(807415, 1, 0, 0, 0, 0, 332116, 1, 2, 3, 2, 0, 0, 100, 0, 0);

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_battle_cleric';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(300347, 'aura_ascension_battle_cleric'),
(680639, 'aura_ascension_battle_cleric');

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_ascension_melt_copy';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_desynchronization';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_ahead_of_the_game';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_ripple_release';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'aura_ascension_echo_duration';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(807570, 'spell_ascension_melt_copy'),
(561310, 'aura_ascension_desynchronization'),
(560948, 'aura_ascension_ahead_of_the_game'),
(806296, 'aura_ascension_ripple_release'),
(804455, 'aura_ascension_echo_duration');

DELETE FROM `spell_proc` WHERE `SpellId` = 560948;
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`,
`SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`,
`DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(560948, 0, 0, 0, 0, 0, 349524, 3, 2, 3, 2, 0, 0, 100, 0, 0);

DELETE FROM `spell_bonus_data` WHERE `entry` = 807570;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(807570, 0, 0, 0, 0, 'CoA Melt Reality: copied resolved periodic damage');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 804591 AND `spell_effect` = 800046 AND `type` = 2;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 804833 AND `spell_effect` = 805161 AND `type` = 2;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 807555 AND `spell_effect` = 807464 AND `type` = 2;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(804591, 800046, 2, 'CoA Thunder King: companion movement speed'),
(804833, 805161, 2, 'CoA Stormcloak: companion dispel resistance'),
(807555, 807464, 2, 'CoA Flurry: companion resistance and damage-taken debuff');

-- Captured Creature entry 503201 supplies display 29352 (existing model 3134).
DELETE FROM `creature_template_model` WHERE `CreatureID` = 503201;
INSERT INTO `creature_template` (`entry`, `name`, `minlevel`, `maxlevel`, `faction`, `unit_class`, `type`, `ScriptName`)
SELECT 503201, 'Power Sphere', 1, 1, 35, 2, 4, 'npc_ascension_power_sphere'
WHERE NOT EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 503201);
UPDATE `creature_template` SET `ScriptName` = 'npc_ascension_power_sphere' WHERE `entry` = 503201;
DELETE FROM `creature_template_model` WHERE `CreatureID` = 503201;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(503201, 0, 29352, 1, 1);

-- Captured Creature entry 50171 uses display 11686; Clone Me supplies the player's appearance.
DELETE FROM `creature_template_model` WHERE `CreatureID` = 50171;
INSERT INTO `creature_template` (`entry`, `name`, `minlevel`, `maxlevel`, `faction`, `unit_class`, `type`, `ScriptName`)
SELECT 50171, 'Decoy', 1, 1, 35, 1, 7, 'npc_ascension_outmaneuver_decoy'
WHERE NOT EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 50171);
UPDATE `creature_template` SET `ScriptName` = 'npc_ascension_outmaneuver_decoy' WHERE `entry` = 50171;
DELETE FROM `creature_template_model` WHERE `CreatureID` = 50171;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(50171, 0, 11686, 1, 1);

-- Captured Rift Clone entry 840004 uses display 11686 before Clone Me applies the owner's appearance.
DELETE FROM `creature_template_model` WHERE `CreatureID` = 840004;
INSERT INTO `creature_template` (`entry`, `name`, `minlevel`, `maxlevel`, `faction`, `unit_class`, `type`, `ScriptName`)
SELECT 840004, 'Rift Clone', 1, 1, 35, 2, 7, 'npc_ascension_rift_clone'
WHERE NOT EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 840004);
UPDATE `creature_template` SET `ScriptName` = 'npc_ascension_rift_clone' WHERE `entry` = 840004;
DELETE FROM `creature_template_model` WHERE `CreatureID` = 840004;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(840004, 0, 11686, 1, 1);

-- Captured transformation entries. The corresponding DBC rows are prepared by secondary_appearances.py.
DELETE FROM `creature_template_model` WHERE `CreatureID` IN (346852, 377942, 421460, 462071);
INSERT INTO `creature_template` (`entry`, `name`, `minlevel`, `maxlevel`, `faction`, `unit_class`, `type`)
SELECT 346852, 'Ancient of Lore', 1, 1, 35, 1, 7
WHERE NOT EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 346852);
DELETE FROM `creature_template_model` WHERE `CreatureID` = 377942;
INSERT INTO `creature_template` (`entry`, `name`, `minlevel`, `maxlevel`, `faction`, `unit_class`, `type`)
SELECT 377942, 'Conduit', 1, 1, 35, 1, 4
WHERE NOT EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 377942);
DELETE FROM `creature_template_model` WHERE `CreatureID` = 421460;
INSERT INTO `creature_template` (`entry`, `name`, `minlevel`, `maxlevel`, `faction`, `unit_class`, `type`)
SELECT 421460, 'Natural Disguise', 1, 1, 35, 1, 7
WHERE NOT EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 421460);
DELETE FROM `creature_template_model` WHERE `CreatureID` = 462071;
INSERT INTO `creature_template` (`entry`, `name`, `minlevel`, `maxlevel`, `faction`, `unit_class`, `type`)
SELECT 462071, 'Hemostasis', 1, 1, 35, 1, 7
WHERE NOT EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 462071);
DELETE FROM `creature_template_model` WHERE `CreatureID` IN (346852, 377942, 421460, 462071);
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(346852, 0, 111213, 1, 1),
(377942, 0, 94074, 1, 1),
(421460, 0, 421460, 1, 1),
(462071, 0, 462071, 1, 1);
