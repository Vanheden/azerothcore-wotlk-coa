-- Cloak of Flames (3475): Immolation aura (21142) tooltip rises by 2 damage
-- for +20 spell power, confirming a 0.10 direct spell-power coefficient.
DELETE FROM `spell_bonus_data` WHERE `entry` = 21142;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(21142, 0.10, 0, 0, 0, 'Cloak of Flames: Immolation damage shield, 10% spell power');
