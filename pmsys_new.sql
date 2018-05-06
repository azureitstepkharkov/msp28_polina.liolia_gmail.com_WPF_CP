-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 02 2018 г., 01:51
-- Версия сервера: 5.6.38
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pmsys_new`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment_task`
--

CREATE TABLE `comment_task` (
  `id` int(10)   NOT NULL,
  `task_id` int(10)   NOT NULL,
  `author_id` int(10)   NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comment_task`
--

INSERT INTO `comment_task` (`id`, `task_id`, `author_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Some strange comment...', '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(2, 2, 4, 'Some silly comment...', '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(3, 3, 3, 'Some important comment...', '2018-04-28 21:50:11', '2018-04-28 21:50:11');

-- --------------------------------------------------------

--
-- Структура таблицы `comment_user`
--

CREATE TABLE `comment_user` (
  `id` int(10)   NOT NULL,
  `user_id` int(10)   NOT NULL,
  `author_id` int(10)   NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comment_user`
--

INSERT INTO `comment_user` (`id`, `user_id`, `author_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 'Very good client! Pays in time.', '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(2, 4, 5, 'Very responsible dev!', '2018-04-28 21:50:11', '2018-04-28 21:50:11');

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10)   NOT NULL,
  `type_id` int(10)   NOT NULL,
  `user_id` int(10)   NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `type_id`, `user_id`, `value`) VALUES
(1, 1, 1, '+380502178569'),
(2, 1, 1, '+380687412589'),
(3, 4, 2, 'skypeclient123'),
(4, 5, 3, '+380678523698'),
(5, 3, 3, 'client___VIP@mail.ru'),
(6, 8, 1, 'myContact');

-- --------------------------------------------------------

--
-- Структура таблицы `contact_types`
--

CREATE TABLE `contact_types` (
  `id` int(10)   NOT NULL,
  `contact_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `contact_types`
--

INSERT INTO `contact_types` (`id`, `contact_type`) VALUES
(3, 'Email'),
(2, 'Fax'),
(8, 'myType'),
(1, 'Phone'),
(4, 'Skype'),
(7, 'Telegram'),
(5, 'Viber'),
(6, 'WhatsApp');

-- --------------------------------------------------------

--
-- Структура таблицы `file_task`
--

CREATE TABLE `file_task` (
  `id` int(10)   NOT NULL,
  `task_id` int(10)   NOT NULL,
  `user_id` int(10)   NOT NULL,
  `path` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `file_task`
--

INSERT INTO `file_task` (`id`, `task_id`, `user_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'storage/111.jpg', '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(2, 2, 3, 'storage/222.jpg', '2018-04-28 21:50:11', '2018-04-28 21:50:11');

-- --------------------------------------------------------

--
-- Структура таблицы `laradrop_files`
--

CREATE TABLE `laradrop_files` (
  `id` int(10)   NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_thumbnail` smallint(6) NOT NULL DEFAULT '0',
  `meta` text COLLATE utf8mb4_unicode_ci,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public_resource_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10)   NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2015_08_09_000000_create_laradrop_files_table', 1),
(4, '2016_02_25_000000_modify_laradrop_files_table_add_nesting', 1),
(5, '2017_11_24_144440_entrust_setup_tables', 1),
(6, '2017_11_29_232330_create_contact_types_table', 1),
(7, '2017_11_29_232429_create_contacts_table', 1),
(8, '2017_11_30_180030_change_users_table_column_status', 1),
(9, '2017_11_30_215449_CreateTechnologyTables', 1),
(10, '2017_11_30_222239_create_user_technology_table', 1),
(11, '2017_12_01_145312_create_projects_table', 1),
(12, '2017_12_01_171604_create_tasks_table', 1),
(13, '2017_12_01_183047_create_task_user_table', 1),
(14, '2017_12_01_184222_create_task_comment_table', 1),
(15, '2017_12_01_184840_create_task_file_table', 1),
(16, '2017_12_01_193421_create_user_comment_table', 1),
(17, '2017_12_02_013252_create_project_technology_table', 1),
(18, '2017_12_02_014159_create_task_technology_table', 1),
(19, '2018_01_11_012010_add_avatar_to_users', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10)   NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'adminperm', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(2, 'add_user', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(3, 'deactivate_user', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(4, 'edit_user', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(5, 'add_technology', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(6, 'remove_technology', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(7, 'edit_technology', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(8, 'add_contact_type', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(9, 'remove_contact_type', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(10, 'edit_contact_type', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(11, 'add_client', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(12, 'deactivate_client', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(13, 'edit_client', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(14, 'comment_client', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(15, 'add_programmer', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(16, 'deactivate_programmer', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(17, 'edit_programmer', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(18, 'comment_programmer', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(19, 'add_project', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(20, 'edit_project', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(21, 'deactivate_project', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(22, 'add_task', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(23, 'edit_task', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(24, 'change_task_status', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(25, 'remove_task', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(26, 'comment_task', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(27, 'index_user', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(28, 'index_technology', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(29, 'index_contact_type', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(30, 'index_client', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(31, 'index_programmer', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(32, 'index_project', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(33, 'index_task', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(34, 'index_comment_task', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(35, 'index_comment_user', NULL, NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10)   NOT NULL,
  `role_id` int(10)   NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(20, 2),
(22, 2),
(23, 2),
(24, 2),
(26, 2),
(28, 2),
(29, 2),
(32, 2),
(33, 2),
(34, 2),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(24, 4),
(26, 4),
(28, 4),
(29, 4),
(32, 4),
(33, 4),
(34, 4),
(15, 5),
(16, 5),
(17, 5),
(18, 5),
(22, 5),
(23, 5),
(24, 5),
(25, 5),
(26, 5),
(27, 5),
(28, 5),
(29, 5),
(30, 5),
(31, 5),
(32, 5),
(33, 5),
(34, 5),
(35, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE `projects` (
  `id` int(10)   NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `client_id` int(10)   NOT NULL,
  `project_manager_id` int(10)   NOT NULL,
  `status` enum('in_work','completed','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in_work',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `client_id`, `project_manager_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Proj1', 'complex project for important customer', 2, 3, 'in_work', '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(2, 'Proj2', 'simple project for important customer', 2, 3, 'in_work', '2018-04-28 21:50:11', '2018-04-28 21:50:11');

-- --------------------------------------------------------

--
-- Структура таблицы `project_technology`
--

CREATE TABLE `project_technology` (
  `project_id` int(10)   NOT NULL,
  `technology_id` int(10)   NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `project_technology`
--

INSERT INTO `project_technology` (`project_id`, `technology_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(1, 3, '2018-04-28 21:50:11', '2018-04-28 21:50:11');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(10)   NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin Role', 'Admin Role', '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(2, 'Client', 'Client Role', 'Client Role', '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(3, 'ProjectMan', 'ProjectMan Role', 'ProjectMan Role', '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(4, 'Programmer', 'Programmer Role', 'Programmer Role', '2018-04-28 21:50:10', '2018-04-28 21:50:10'),
(5, 'TeamLeader', 'TeamLeader Role', 'TeamLeader Role', '2018-04-28 21:50:10', '2018-04-28 21:50:10');

-- --------------------------------------------------------

--
-- Структура таблицы `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10)   NOT NULL,
  `role_id` int(10)   NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(6, 1),
(2, 2),
(6, 2),
(3, 3),
(6, 3),
(4, 4),
(6, 4),
(5, 5),
(6, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10)   NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `project_id` int(10)   NOT NULL,
  `start` datetime NOT NULL DEFAULT '2018-04-29 00:50:09',
  `end` datetime NOT NULL DEFAULT '2018-04-29 00:50:09',
  `status` enum('new','in_progress','completed','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `description`, `project_id`, `start`, `end`, `status`, `created_at`, `updated_at`) VALUES
(1, 'task1', 'create db', 1, '2018-04-29 00:50:09', '2018-04-29 00:50:09', 'new', '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(2, 'task2', 'write a lot of code', 1, '2018-04-29 00:50:09', '2018-04-29 00:50:09', 'new', '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(3, 'task1', 'edit layout', 2, '2018-04-29 00:50:09', '2018-04-29 00:50:09', 'new', '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(4, 'task2', 'add imgs', 2, '2018-04-29 00:50:09', '2018-04-29 00:50:09', 'new', '2018-04-28 21:50:11', '2018-04-28 21:50:11');

-- --------------------------------------------------------

--
-- Структура таблицы `task_technology`
--

CREATE TABLE `task_technology` (
  `task_id` int(10)   NOT NULL,
  `technology_id` int(10)   NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `task_technology`
--

INSERT INTO `task_technology` (`task_id`, `technology_id`, `created_at`, `updated_at`) VALUES
(1, 3, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(2, 1, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(3, 1, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(4, 6, '2018-04-28 21:50:11', '2018-04-28 21:50:11');

-- --------------------------------------------------------

--
-- Структура таблицы `task_user`
--

CREATE TABLE `task_user` (
  `task_id` int(10)   NOT NULL,
  `user_id` int(10)   NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `task_user`
--

INSERT INTO `task_user` (`task_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 5, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(2, 4, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(3, 4, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(4, 4, '2018-04-28 21:50:11', '2018-04-28 21:50:11');

-- --------------------------------------------------------

--
-- Структура таблицы `technologies`
--

CREATE TABLE `technologies` (
  `id` int(10)   NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `technologies`
--

INSERT INTO `technologies` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'PHP', 'Laravel 5', '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(2, 'C#', 'ASP.NET', '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(3, 'MySQL', NULL, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(4, 'MSSQL', NULL, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(5, 'ADO.NET', NULL, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(6, 'CSS', NULL, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(7, 'JS', NULL, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(8, 'HTML', NULL, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(9, 'XML', NULL, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(10, 'JSON', NULL, '2018-04-28 21:50:11', '2018-04-28 21:50:11'),
(11, 'AJAX', NULL, '2018-04-28 21:50:11', '2018-04-28 21:50:11');

-- --------------------------------------------------------

--
-- Структура таблицы `technology_user`
--

CREATE TABLE `technology_user` (
  `user_id` int(10)   NOT NULL,
  `technology_id` int(10)   NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `technology_user`
--

INSERT INTO `technology_user` (`user_id`, `technology_id`) VALUES
(4, 1),
(5, 1),
(5, 2),
(4, 3),
(5, 3),
(5, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10)   NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT 'storage/avatars/user.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `avatar`) VALUES
(1, 'User_admin', 'user_admin@gmail.com', '$2y$10$MkvXeO/n6GelHYc61ZN8bev.xA5R.gEC5FufZM3oE3z9zQBvXvRZW', 'active', NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10', 'storage/avatars/user.png'),
(2, 'User_client', 'User_client@gmail.com', '$2y$10$eNFBQ96yavGXOEN35iL8hu5WHANV8EsJHN4231NBrstTPg56nAJxa', 'active', NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10', 'storage/avatars/user.png'),
(3, 'User_pm', 'User_pm@gmail.com', '$2y$10$PmZrWWRftrFdoZWtCRb5Jucxy.t3D9NJSCUWqZ/C/D9OmSE5CdVYS', 'active', NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10', 'storage/avatars/user.png'),
(4, 'User_dev', 'User_dev@gmail.com', '$2y$10$CwFfE6Znv7U.ce9EmomDPOEPXyuM3L8k1t4fozuikHaWc3IyT4Rii', 'active', NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10', 'storage/avatars/user.png'),
(5, 'User_tl', 'User_tl@gmail.com', '$2y$10$qI5soNlKOPbP9wsHl97ju.Pjpm.zTPTR0X60fSd1bX1YNt7G8I8.S', 'active', NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10', 'storage/avatars/user.png'),
(6, 'super', 'super@gmail.com', '$2y$10$lAtv8AgjzlZXZoNmpqjQ7ucJEle.4nwVR4evGAIqObvMqZc47.Hum', 'active', NULL, '2018-04-28 21:50:10', '2018-04-28 21:50:10', 'storage/avatars/user.png');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment_task`
--
ALTER TABLE `comment_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_task_task_id_foreign` (`task_id`),
  ADD KEY `comment_task_author_id_foreign` (`author_id`);

--
-- Индексы таблицы `comment_user`
--
ALTER TABLE `comment_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_user_user_id_foreign` (`user_id`),
  ADD KEY `comment_user_author_id_foreign` (`author_id`);

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_type_id_foreign` (`type_id`),
  ADD KEY `contacts_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `contact_types`
--
ALTER TABLE `contact_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact_types_contact_type_unique` (`contact_type`);

--
-- Индексы таблицы `file_task`
--
ALTER TABLE `file_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_task_task_id_foreign` (`task_id`),
  ADD KEY `file_task_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `laradrop_files`
--
ALTER TABLE `laradrop_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laradrop_files_parent_id_index` (`parent_id`),
  ADD KEY `laradrop_files_lft_index` (`lft`),
  ADD KEY `laradrop_files_rgt_index` (`rgt`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_client_id_foreign` (`client_id`),
  ADD KEY `projects_project_manager_id_foreign` (`project_manager_id`);

--
-- Индексы таблицы `project_technology`
--
ALTER TABLE `project_technology`
  ADD PRIMARY KEY (`project_id`,`technology_id`),
  ADD KEY `project_technology_technology_id_foreign` (`technology_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_project_id_foreign` (`project_id`);

--
-- Индексы таблицы `task_technology`
--
ALTER TABLE `task_technology`
  ADD PRIMARY KEY (`task_id`,`technology_id`),
  ADD KEY `task_technology_technology_id_foreign` (`technology_id`);

--
-- Индексы таблицы `task_user`
--
ALTER TABLE `task_user`
  ADD PRIMARY KEY (`task_id`,`user_id`),
  ADD KEY `task_user_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `technologies`
--
ALTER TABLE `technologies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `technologies_name_unique` (`name`);

--
-- Индексы таблицы `technology_user`
--
ALTER TABLE `technology_user`
  ADD PRIMARY KEY (`user_id`,`technology_id`),
  ADD KEY `technology_user_technology_id_foreign` (`technology_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment_task`
--
ALTER TABLE `comment_task`
  MODIFY `id` int(10)   NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `comment_user`
--
ALTER TABLE `comment_user`
  MODIFY `id` int(10)   NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10)   NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `contact_types`
--
ALTER TABLE `contact_types`
  MODIFY `id` int(10)   NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `file_task`
--
ALTER TABLE `file_task`
  MODIFY `id` int(10)   NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `laradrop_files`
--
ALTER TABLE `laradrop_files`
  MODIFY `id` int(10)   NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10)   NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10)   NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10)   NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10)   NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10)   NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `technologies`
--
ALTER TABLE `technologies`
  MODIFY `id` int(10)   NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10)   NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment_task`
--
ALTER TABLE `comment_task`
  ADD CONSTRAINT `comment_task_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `comment_user`
--
ALTER TABLE `comment_user`
  ADD CONSTRAINT `comment_user_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `contact_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `file_task`
--
ALTER TABLE `file_task`
  ADD CONSTRAINT `file_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `file_task_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_project_manager_id_foreign` FOREIGN KEY (`project_manager_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `project_technology`
--
ALTER TABLE `project_technology`
  ADD CONSTRAINT `project_technology_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_technology_technology_id_foreign` FOREIGN KEY (`technology_id`) REFERENCES `technologies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `task_technology`
--
ALTER TABLE `task_technology`
  ADD CONSTRAINT `task_technology_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_technology_technology_id_foreign` FOREIGN KEY (`technology_id`) REFERENCES `technologies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `task_user`
--
ALTER TABLE `task_user`
  ADD CONSTRAINT `task_user_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `technology_user`
--
ALTER TABLE `technology_user`
  ADD CONSTRAINT `technology_user_technology_id_foreign` FOREIGN KEY (`technology_id`) REFERENCES `technologies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `technology_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
