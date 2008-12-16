CREATE TABLE `bill_items` (
  `id` int(11) NOT NULL auto_increment,
  `bill_id` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `type` varchar(255) default NULL,
  `amount` int(11) default NULL,
  `name` varchar(255) default NULL,
  `taxed` tinyint(1) default NULL,
  `description` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bills` (
  `id` int(11) NOT NULL auto_increment,
  `code` varchar(255) default NULL,
  `written_on` date default NULL,
  `customer_name` varchar(255) default NULL,
  `subject` varchar(255) default NULL,
  `payment_condition` varchar(255) default NULL,
  `payment_due_date` date default NULL,
  `bank` text,
  `from` text,
  `total_amount` int(11) default NULL,
  `tax` int(11) default NULL,
  `description` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO schema_migrations (version) VALUES ('20081121115018');

INSERT INTO schema_migrations (version) VALUES ('20081216041543');