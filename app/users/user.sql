DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `profiles`;

CREATE TABLE users (
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `first_name` VARCHAR(50) NULL,
    `last_name` VARCHAR(50) NULL,
    `username` VARCHAR(50) UNIQUE NOT NULL,
    `email` VARCHAR(100) UNIQUE NOT NULL,
    `is_admin` BOOLEAN DEFAULT 0 NOT NULL,
    `is_staff` BOOLEAN DEFAULT 0 NOT NULL,
    `is_active` BOOLEAN DEFAULT 1 NOT NULL,
    `password_hash` VARCHAR(120) NOT NULL
);

CREATE TABLE profiles (
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `user_id` INTEGER UNIQUE NOT NULL,
    `registration_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `bio` TEXT,
    `profile_picture_url` VARCHAR(255),
    `website_url` VARCHAR(255),
    `location` VARCHAR(100),
    FOREIGN KEY (`user_id`) REFERENCES users(`id`)
);

CREATE TABLE notifications (
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `user_id` INTEGER NOT NULL,
    `notification_type` VARCHAR(50) NOT NULL,
    `notification_message` TEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES users(`id`)
);

CREATE TABLE user_settings (
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `user_id` INTEGER NOT NULL,
    `setting_name` VARCHAR(50) NOT NULL,
    `setting_value` TEXT,
    FOREIGN KEY (`user_id`) REFERENCES users(`id`),
    UNIQUE (`user_id`, `setting_name`)
);

-- Insert initial user settings
INSERT INTO `user_settings` (`user_id`, `setting_name`, `setting_value`) VALUES
    (1, 'theme_preference', 'light'),
    (1, 'push_notifications', '1'),
    (1, 'email_notifications', '1'),
    (1, 'language', 'en'),
    (1,'text_size', 'medium'),
    (1, 'text_color', 'black'),
    (1, 'background_color', 'white'),
    (1, 'color_contrast', 'normal'),
    (1, 'social_media_connected', '1'),
    (1, 'dark_mode', '0')

--
    