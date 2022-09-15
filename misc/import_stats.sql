DROP TABLE IF EXISTS `get5_stats_players`;
DROP TABLE IF EXISTS `get5_stats_maps`;
DROP TABLE IF EXISTS `get5_stats_matches`;

CREATE TABLE `get5_stats_matches`
(
    `matchid`     int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `start_time`  datetime             NOT NULL,
    `end_time`    datetime             NULL     DEFAULT NULL,
    `winner`      varchar(16)          NOT NULL DEFAULT '',
    `series_type` varchar(64)          NOT NULL DEFAULT '',
    `team1_name`  varchar(64)          NOT NULL DEFAULT '',
    `team1_score` smallint(5) unsigned NOT NULL DEFAULT '0',
    `team2_name`  varchar(64)          NOT NULL DEFAULT '',
    `team2_score` smallint(5) unsigned NOT NULL DEFAULT '0',
    `server_id`   int(10) unsigned     NOT NULL DEFAULT '0',
    PRIMARY KEY (`matchid`),
    KEY `server_id` (`server_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE `get5_stats_maps`
(
    `matchid`     int(10) unsigned     NOT NULL,
    `mapnumber`   tinyint(3) unsigned  NOT NULL,
    `start_time`  datetime             NOT NULL,
    `end_time`    datetime             NULL     DEFAULT NULL,
    `winner`      varchar(16)          NOT NULL DEFAULT '',
    `mapname`     varchar(64)          NOT NULL DEFAULT '',
    `team1_score` smallint(5) unsigned NOT NULL DEFAULT '0',
    `team2_score` smallint(5) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`matchid`, `mapnumber`),
    CONSTRAINT `get5_stats_maps_matchid` FOREIGN KEY (`matchid`) REFERENCES `get5_stats_matches` (`matchid`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE `get5_stats_players`
(
    `matchid`            int(10) unsigned      NOT NULL,
    `mapnumber`          tinyint(3) unsigned   NOT NULL,
    `steamid64`          bigint(21) unsigned   NOT NULL,
    `team`               varchar(16)           NOT NULL DEFAULT '',
    `rounds_played`      smallint(5) unsigned,
    `name`               varchar(64)           NOT NULL,
    `kills`              smallint(5) unsigned,
    `deaths`             smallint(5) unsigned,
    `assists`            smallint(5) unsigned,
    `flashbang_assists`  smallint(5) unsigned,
    `teamkills`          smallint(5) unsigned,
    `knife_kills`        smallint(5) unsigned,
    `headshot_kills`     smallint(5) unsigned,
    `damage`             int(10) unsigned      NOT NULL,
    `utility_damage`     smallint(5) unsigned,
    `enemies_flashed`    smallint(5) unsigned,
    `friendlies_flashed` smallint(5) unsigned,
    `bomb_plants`        smallint(5) unsigned,
    `bomb_defuses`       smallint(5) unsigned,
    `v1`                 smallint(5) unsigned,
    `v2`                 smallint(5) unsigned,
    `v3`                 smallint(5) unsigned,
    `v4`                 smallint(5) unsigned,
    `v5`                 smallint(5) unsigned,
    `2k`                 smallint(5) unsigned,
    `3k`                 smallint(5) unsigned,
    `4k`                 smallint(5) unsigned,
    `5k`                 smallint(5) unsigned,
    `firstkill_t`        smallint(5) unsigned,
    `firstkill_ct`       smallint(5) unsigned,
    `firstdeath_t`       smallint(5) unsigned,
    `firstdeath_ct`      smallint(5) unsigned,
    `tradekill`          smallint(5) unsigned,
    `kast`               smallint(5) unsigned,
    `contribution_score` smallint(5) unsigned,
    `mvp`                smallint(5) unsigned,
    PRIMARY KEY (`matchid`, `mapnumber`, `steamid64`),
    KEY `steamid64` (`steamid64`),
    CONSTRAINT `get5_stats_players_matchid` FOREIGN KEY (`matchid`) REFERENCES `get5_stats_matches` (`matchid`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;