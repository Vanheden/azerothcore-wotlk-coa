-- Greater Imp's authored basic attack. The level-scaled base is supplied by the Xoroth callback.
DELETE FROM `spell_bonus_data` WHERE `entry` = 630930;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(630930, 0.6, 0, 0.3, 0, 'Greater Imp - Burning Slap');
