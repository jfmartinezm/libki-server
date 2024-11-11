ALTER TABLE clients ADD COLUMN `library` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL AFTER `name`;
ALTER TABLE print_files ADD COLUMN `client_library` varchar(191) DEFAULT NULL AFTER `client_name`;
ALTER TABLE `statistics` ADD COLUMN `client_library` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL AFTER `client_name`;
ALTER TABLE users ADD COLUMN `library` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL AFTER `status`;