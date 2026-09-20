-- AscensionCreaturePresetMgr::LoadFromDB selects from `creature_display_preset`, but no migration
-- ever creates it, so a realm that did not already have the table refuses to start:
--   [1146] Table 'acore_world.creature_display_preset' doesn't exist
--   Your database structure is not up to date.
--
-- Columns and types are taken from that query and the Field::Get calls beside it: entry and
-- display_id form the key, guild_id and the eleven item columns are read as uint32, and the
-- appearance columns as uint8.
CREATE TABLE IF NOT EXISTS `creature_display_preset` (
  `entry` INT UNSIGNED NOT NULL,
  `display_id` INT UNSIGNED NOT NULL,
  `race` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `gender` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `class` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `skin` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `face` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `hair` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `haircolor` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `facialhair` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `guild_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `item_head` INT UNSIGNED NOT NULL DEFAULT 0,
  `item_shoulders` INT UNSIGNED NOT NULL DEFAULT 0,
  `item_body` INT UNSIGNED NOT NULL DEFAULT 0,
  `item_chest` INT UNSIGNED NOT NULL DEFAULT 0,
  `item_waist` INT UNSIGNED NOT NULL DEFAULT 0,
  `item_legs` INT UNSIGNED NOT NULL DEFAULT 0,
  `item_feet` INT UNSIGNED NOT NULL DEFAULT 0,
  `item_wrists` INT UNSIGNED NOT NULL DEFAULT 0,
  `item_hands` INT UNSIGNED NOT NULL DEFAULT 0,
  `item_back` INT UNSIGNED NOT NULL DEFAULT 0,
  `item_tabard` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`entry`, `display_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
