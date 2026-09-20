--
-- Ascension client anti-cheat alerts (CMSG_ANTICHEAT_ALERT, opcode 0x51F).
-- The client reports local anti-tamper/anti-debug detections; one row per alert.
-- `reason` is the client alert type (for example "AntiDebug" or
-- "DBG_ISDEBUGGERPRESENT"); `details` keeps the remaining payload as hex so new
-- client fields can be inspected without a schema change.
CREATE TABLE IF NOT EXISTS `player_anticheat_alert` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `account` int unsigned NOT NULL,
  `guid` int unsigned NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL DEFAULT '',
  `reason` varchar(64) NOT NULL,
  `details` varchar(512) NOT NULL DEFAULT '',
  `size` int unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_player_anticheat_alert_guid` (`guid`),
  KEY `idx_player_anticheat_alert_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
