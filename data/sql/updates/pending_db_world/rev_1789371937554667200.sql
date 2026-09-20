--
-- Restore the quest cache through native persistent container loot instead of its unhandled dummy spell.
UPDATE `item_template` SET `Flags` = `Flags` | 4, `ScriptName` = 'item_ascension_adventurer_cache'
WHERE `entry` = 1397885;

-- Local fallback pool: one random food, potion, material bundle, or world-drop armor item.
-- The original private loot weights are unavailable. The script chooses an eligible category equally,
-- then a level-appropriate item within it; native loot retains the result until collected.
DELETE FROM `item_loot_template` WHERE `Entry` = 1397885;
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`,
`MinCount`, `MaxCount`, `Comment`)
SELECT 1397885, `entry`, 0, 0, 0, 1, 1, 1, CASE WHEN `class` = 4 THEN 1 ELSE 3 END,
'Adventurer cache - local supplies and world-drop armor'
FROM `item_template` WHERE `entry` IN
(117, 2287, 3770, 3771, 4599, 8952, 159, 1179, 1205, 1708, 1645, 8766,
118, 858, 929, 1710, 3928, 13446, 2455, 3385, 3827, 6149, 13443,
2589, 2592, 4306, 4338, 14047, 2770, 2771, 2772, 3858, 10620,
2447, 2450, 3355, 3820, 8838, 2318, 2319, 4234, 4304, 8170)
OR (`class` = 4 AND `Quality` BETWEEN 1 AND 3 AND `bonding` IN (0, 2)
AND `RequiredLevel` <= 60 AND `maxcount` = 0 AND `entry` IN
(SELECT `Item` FROM `reference_loot_template` WHERE `Reference` = 0 AND `Entry` BETWEEN 1010000 AND 1039999));
