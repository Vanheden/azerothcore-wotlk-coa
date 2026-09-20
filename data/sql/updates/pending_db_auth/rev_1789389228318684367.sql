-- Spell Charges cheat command permission (.cheat spellcharges), first custom id in the 1000+ block.
DELETE FROM `rbac_permissions` WHERE `id` = 1000;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(1000, 'Command: cheat spellcharges');
DELETE FROM `rbac_linked_permissions` WHERE `id` = 197 AND `linkedId` = 1000;
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
(197, 1000);
