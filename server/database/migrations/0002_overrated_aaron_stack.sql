PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_notes` (
	`id` text PRIMARY KEY NOT NULL,
	`userId` text NOT NULL,
	`title` text NOT NULL,
	`content` text NOT NULL,
	`image` text,
	`icon` text,
	`published` integer DEFAULT false NOT NULL,
	`created_at` integer,
	`updated_at` integer,
	FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
INSERT INTO `__new_notes`("id", "userId", "title", "content", "image", "icon", "published", "created_at", "updated_at") SELECT "id", "userId", "title", "content", "image", "icon", "published", "created_at", "updated_at" FROM `notes`;--> statement-breakpoint
DROP TABLE `notes`;--> statement-breakpoint
ALTER TABLE `__new_notes` RENAME TO `notes`;--> statement-breakpoint
PRAGMA foreign_keys=ON;