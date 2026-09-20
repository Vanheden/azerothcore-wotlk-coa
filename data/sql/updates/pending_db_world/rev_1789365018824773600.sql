-- #51: Animated Blood's three ranks reference creatures absent from the local world database.
-- Entry/display joins come from the copied client's Creature.dbc (f1/f19), corroborated with stock Bloodworm.
-- Native guardian summoning supplies owner faction, level, count, duration and combat behavior.
DELETE FROM `creature_template_model` WHERE `CreatureID` IN (315301, 325301, 335301);
INSERT INTO `creature_template` (`entry`, `name`, `minlevel`, `maxlevel`, `faction`, `unit_class`, `type`)
SELECT `summon`.`entry`, `summon`.`name`, 1, 1, 14, 1, 8
FROM (
    SELECT 315301 AS `entry`, 'Animated Blood' AS `name`
    UNION ALL SELECT 325301, 'Blood Worm'
    UNION ALL SELECT 335301, 'Blood Parasite'
) AS `summon`
WHERE NOT EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = `summon`.`entry`);

-- These two model/display records are in the copied client but absent from the server DBCs.
-- The native DBC SQL loader reads these overrides; no local binary DBC replacement is needed.
DELETE FROM `creaturedisplayinfo_dbc` WHERE `ID` IN (93307, 236827);
INSERT INTO `creaturedisplayinfo_dbc`
(`ID`, `ModelID`, `CreatureModelScale`, `CreatureModelAlpha`, `TextureVariation_1`) VALUES
(93307, 10899, 4, 255, 'bloodelemental'),
(236827, 110722, 0.2, 255, 'bloodticklarva');

DELETE FROM `creaturemodeldata_dbc` WHERE `ID` IN (10899, 110722);
INSERT INTO `creaturemodeldata_dbc`
(`ID`, `Flags`, `ModelName`, `ModelScale`, `CollisionWidth`, `CollisionHeight`, `MountHeight`) VALUES
(10899, 3, 'creature\\bloodelemental\\bloodelemental.mdx', 1, 2.03128004, 1, 0),
(110722, 0, 'Creature\\bloodticklarva\\bloodticklarva.mdx', 1, 0, 2, 0);

-- Use the core's default bounds/reach for the newly registered displays.
DELETE FROM `creature_model_info` WHERE `DisplayID` IN (93307, 236827);
INSERT INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `Gender`) VALUES
(93307, 0.389, 1.5, 2),
(236827, 0.389, 1.5, 2);

DELETE FROM `creature_template_model` WHERE `CreatureID` IN (315301, 325301, 335301);
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(315301, 0, 93307, 1, 1),
(325301, 0, 15983, 1, 1),
(335301, 0, 236827, 1, 1);

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_ascension_animated_blood';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(573299, 'spell_ascension_animated_blood'),
(573356, 'spell_ascension_animated_blood'),
(573357, 'spell_ascension_animated_blood');
