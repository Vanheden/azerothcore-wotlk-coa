-- Spell Charges cheat status line for .cheat status.
DELETE FROM `acore_string` WHERE `entry` = 35480;
INSERT INTO `acore_string` (`entry`, `content_default`) VALUES
(35480, 'Spell charges: {}.');
