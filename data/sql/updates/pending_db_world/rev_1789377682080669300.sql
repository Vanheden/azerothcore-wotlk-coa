--
-- PvP Ruleset selection: preserve unrelated bindings on these spells.
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_ascension_ruleset_select';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(84420, 'spell_ascension_ruleset_select'),
(84421, 'spell_ascension_ruleset_select'),
(84422, 'spell_ascension_ruleset_select');
