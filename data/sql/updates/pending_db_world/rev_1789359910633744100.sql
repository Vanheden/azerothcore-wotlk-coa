-- Travel Permit: open its menu only after the native item spell successfully casts.
UPDATE `item_template` SET `ScriptName` = 'item_ascension_travel_permit' WHERE `entry` = 977028;
DELETE FROM `spell_script_names` WHERE `spell_id` = 1001088 AND `ScriptName` = 'spell_ascension_travel_permit';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (1001088, 'spell_ascension_travel_permit');
