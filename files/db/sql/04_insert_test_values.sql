﻿
-- -----------------------------------------------------
-- Table user
-- -----------------------------------------------------
-- clean user table
DELETE FROM user_;

-- add users
INSERT INTO user_ (id, username, email, password, created_at, is_email_valid, terms_agreed) 
VALUES (1001, 'admin', 'admin@admin.com', 'admin', '2017-01-01', TRUE, TRUE);

INSERT INTO user_ (id, username, email, password, created_at, is_email_valid, terms_agreed) 
VALUES (1002, 'rodrigo', 'rodrigo@admin.com', 'rodrigo', '2017-01-01', TRUE, TRUE);

INSERT INTO user_ (id, username, email, password, created_at, is_email_valid, terms_agreed) 
VALUES (1003, 'miguel', 'miguel@admin.com', 'miguel', '2017-01-01', FALSE, TRUE);

INSERT INTO user_ (id, username, email, password, created_at, is_email_valid, terms_agreed) 
VALUES (1004, 'rafael', 'rafael@admin.com', 'rafael', '2017-01-01', TRUE, FALSE);

INSERT INTO user_ (id, username, email, password, created_at, is_email_valid, terms_agreed) 
VALUES (1005, 'gabriel', 'gabriel@admin.com', 'gabriel', '2017-01-01', FALSE, FALSE);


-- -----------------------------------------------------
-- Table user_tag
-- -----------------------------------------------------
-- clean user_tag table
DELETE FROM user_tag;

-- insert values in table user_tag
-- user 1001
INSERT INTO user_tag (k, v, fk_user_id) VALUES ('name', 'Administrator', 1001);
INSERT INTO user_tag (k, v, fk_user_id) VALUES ('institution', 'INPE', 1001);
-- user 1002
INSERT INTO user_tag (k, v, fk_user_id) VALUES ('name', 'Rodrigo', 1002);
INSERT INTO user_tag (k, v, fk_user_id) VALUES ('institution', 'INPE', 1002);
-- user 1003
INSERT INTO user_tag (k, v, fk_user_id) VALUES ('name', 'Miguel', 1003);
-- user 1004
INSERT INTO user_tag (k, v, fk_user_id) VALUES ('name', 'Rafael', 1004);
-- user 1005
INSERT INTO user_tag (k, v, fk_user_id) VALUES ('name', 'Gabriel', 1005);



-- -----------------------------------------------------
-- Table auth
-- -----------------------------------------------------
-- clean auth table
DELETE FROM auth;

-- insert values in auth table
-- user 1001
INSERT INTO auth (id, is_admin, allow_bulk_import, fk_user_id) VALUES (1001, TRUE, TRUE, 1001);
-- user 1002
INSERT INTO auth (id, is_admin, allow_bulk_import, fk_user_id) VALUES (1002, TRUE, TRUE, 1002);
-- user 1003
INSERT INTO auth (id, is_admin, allow_bulk_import, fk_user_id) VALUES (1003, FALSE, TRUE, 1003);
-- user 1004
INSERT INTO auth (id, is_admin, allow_bulk_import, fk_user_id) VALUES (1004, FALSE, FALSE, 1004);
-- user 1005
INSERT INTO auth (id, is_admin, allow_bulk_import, fk_user_id) VALUES (1005, FALSE, FALSE, 1005);



-- -----------------------------------------------------
-- Table group_
-- -----------------------------------------------------
-- clean group_ table
DELETE FROM group_;

-- add group
INSERT INTO group_ (id, created_at, fk_user_id) VALUES (1001, '2017-01-01', 1001);
INSERT INTO group_ (id, created_at, fk_user_id) VALUES (1002, '2017-03-25', 1001);
INSERT INTO group_ (id, created_at, fk_user_id) VALUES (1003, '2017-12-25', 1002);
INSERT INTO group_ (id, created_at, fk_user_id) VALUES (1004, '2017-05-13', 1003);
INSERT INTO group_ (id, created_at, removed_at, fk_user_id, visible) VALUES (1005, '2017-08-15', '2017-10-25', 1003, FALSE);
INSERT INTO group_ (id, created_at, removed_at, fk_user_id, visible) VALUES (1006, '2017-06-24', '2017-12-25', 1004, FALSE);


-- -----------------------------------------------------
-- Table group_tag
-- -----------------------------------------------------
-- clean group_tag table
DELETE FROM group_tag;

-- insert values in table group_tag
-- SOURCE: -
-- group 1001
INSERT INTO group_tag (k, v, fk_group_id) VALUES ('name', 'Admins', 1001);
INSERT INTO group_tag (k, v, fk_group_id) VALUES ('description', 'Just admins', 1001);
-- group 1002
INSERT INTO group_tag (k, v, fk_group_id) VALUES ('name', 'INPE', 1002);
INSERT INTO group_tag (k, v, fk_group_id) VALUES ('description', '', 1002);
-- group 1003
INSERT INTO group_tag (k, v, fk_group_id) VALUES ('name', 'UNIFESP SJC', 1003);
INSERT INTO group_tag (k, v, fk_group_id) VALUES ('description', '', 1003);
-- group 1004
INSERT INTO group_tag (k, v, fk_group_id) VALUES ('name', 'UNIFESP Guarulhos', 1004);
INSERT INTO group_tag (k, v, fk_group_id) VALUES ('description', '', 1004);
-- group 1005
INSERT INTO group_tag (k, v, fk_group_id) VALUES ('name', 'Emory', 1005);
INSERT INTO group_tag (k, v, fk_group_id) VALUES ('description', '', 1005);
-- group 1006
INSERT INTO group_tag (k, v, fk_group_id) VALUES ('name', 'Arquivo Público do Estado de São Paulo', 1006);
INSERT INTO group_tag (k, v, fk_group_id) VALUES ('description', '', 1006);


-- -----------------------------------------------------
-- Table user_group
-- -----------------------------------------------------
-- clean user_group table
DELETE FROM user_group;

-- add user in a group
-- group 1001
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, group_permission, fk_user_id_added_by) 
VALUES (1001, 1001, '2017-01-01', 'admin', 1001);
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, group_permission, fk_user_id_added_by) 
VALUES (1001, 1002, '2017-03-25', 'admin', 1001);
-- group 1002
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, group_permission, fk_user_id_added_by) 
VALUES (1002, 1001, '2017-05-13', 'admin', 1001);
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, group_permission, fk_user_id_added_by) 
VALUES (1002, 1002, '2017-06-13', 'admin', 1001);
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, can_receive_notification, fk_user_id_added_by) 
VALUES (1002, 1003, '2017-08-15', FALSE, 1001);
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, fk_user_id_added_by) 
VALUES (1002, 1004, '2017-12-08', 1002);
-- group 1003
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, group_permission, fk_user_id_added_by) 
VALUES (1003, 1002, '2017-12-12', 'admin', 1002);
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, can_receive_notification, fk_user_id_added_by) 
VALUES (1003, 1003, '2017-12-15', FALSE, 1002);
-- group 1004
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, group_permission, fk_user_id_added_by) 
VALUES (1004, 1003, '2017-01-11', 'admin', 1003);
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, group_permission, fk_user_id_added_by) 
VALUES (1004, 1004, '2017-05-02', 'admin', 1003);
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, can_receive_notification, fk_user_id_added_by) 
VALUES (1004, 1001, '2017-06-15', FALSE, 1004);
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, can_receive_notification, fk_user_id_added_by) 
VALUES (1004, 1002, '2017-12-19', FALSE, 1004);
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, fk_user_id_added_by) 
VALUES (1004, 1005, '2017-12-20', 1004);
-- group 1005
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, group_permission, fk_user_id_added_by) 
VALUES (1005, 1003, '2017-01-10', 'admin', 1003);
-- group 1006
INSERT INTO user_group (fk_group_id, fk_user_id, added_at, group_permission, fk_user_id_added_by) 
VALUES (1006, 1004, '2017-01-10', 'admin', 1004);



-- -----------------------------------------------------
-- Table project
-- -----------------------------------------------------
-- clean project table
DELETE FROM project;

-- add layer
INSERT INTO project (id, created_at, fk_group_id, fk_user_id) VALUES (1001, '2017-11-20', 1001, 1001);
INSERT INTO project (id, created_at, fk_group_id, fk_user_id) VALUES (1002, '2017-10-12', 1001, 1002);
INSERT INTO project (id, created_at, fk_group_id, fk_user_id) VALUES (1003, '2017-12-23', 1002, 1002);
INSERT INTO project (id, created_at, fk_group_id, fk_user_id) VALUES (1004, '2017-09-11', 1002, 1004);
INSERT INTO project (id, created_at, fk_group_id, fk_user_id, visible) VALUES (1005, '2017-06-04', 1003, 1005, FALSE);



-- -----------------------------------------------------
-- Table project_tag
-- -----------------------------------------------------
-- clean project_tag table
DELETE FROM project_tag;

-- insert values in table project_tag
-- SOURCE: -
-- project 1001
INSERT INTO project_tag (k, v, fk_project_id) VALUES ('name', 'admin', 1001);
INSERT INTO project_tag (k, v, fk_project_id) VALUES ('description', 'default project', 1001);
-- project 1002
INSERT INTO project_tag (k, v, fk_project_id) VALUES ('name', 'test project', 1002);
INSERT INTO project_tag (k, v, fk_project_id) VALUES ('url', 'http://somehost.com', 1002);
-- project 1003
INSERT INTO project_tag (k, v, fk_project_id) VALUES ('name', 'hello world', 1003);



-- -----------------------------------------------------
-- Table layer
-- -----------------------------------------------------
-- clean layer table
DELETE FROM layer;

-- add layer
INSERT INTO layer (id, created_at, fk_project_id, fk_user_id) VALUES (1001, '2017-11-20', 1001, 1001);
INSERT INTO layer (id, created_at, fk_project_id, fk_user_id) VALUES (1002, '2017-10-12', 1001, 1002);
INSERT INTO layer (id, created_at, fk_project_id, fk_user_id) VALUES (1003, '2017-12-23', 1002, 1002);
INSERT INTO layer (id, created_at, fk_project_id, fk_user_id) VALUES (1004, '2017-09-11', 1004, 1003);
INSERT INTO layer (id, created_at, fk_project_id, fk_user_id, visible) VALUES (1005, '2017-06-04', 1003, 1004, FALSE);



-- -----------------------------------------------------
-- Table layer_tag
-- -----------------------------------------------------
-- clean layer_tag table
DELETE FROM layer_tag;

-- insert values in table layer_tag
-- SOURCE: -
-- layer 1001
INSERT INTO layer_tag (k, v, fk_layer_id) VALUES ('name', 'default', 1001);
INSERT INTO layer_tag (k, v, fk_layer_id) VALUES ('description', 'default layer', 1001);
INSERT INTO layer_tag (k, v, fk_layer_id) VALUES ('theme', 'generic', 1001);
-- layer 1002
INSERT INTO layer_tag (k, v, fk_layer_id) VALUES ('name', 'test_layer', 1002);
INSERT INTO layer_tag (k, v, fk_layer_id) VALUES ('description', 'test_layer', 1002);
INSERT INTO layer_tag (k, v, fk_layer_id) VALUES ('theme', 'crime', 1002);
-- layer 1003
INSERT INTO layer_tag (k, v, fk_layer_id) VALUES ('name', 'layer 3', 1003);
INSERT INTO layer_tag (k, v, fk_layer_id) VALUES ('description', 'test_layer', 1003);
INSERT INTO layer_tag (k, v, fk_layer_id) VALUES ('theme', 'addresses', 1003);
-- layer 1004
INSERT INTO layer_tag (k, v, fk_layer_id) VALUES ('name', 'layer 4', 1004);
INSERT INTO layer_tag (k, v, fk_layer_id) VALUES ('description', 'test_layer', 1004);
-- layer layer_tag
INSERT INTO layer_tag (k, v, fk_layer_id) VALUES ('name', 'layer 5', 1005);
INSERT INTO layer_tag (k, v, fk_layer_id) VALUES ('description', 'test_layer', 1005);

-- UPDATE layer SET visible = FALSE, removed_at=LOCALTIMESTAMP WHERE id=1001;



-- -----------------------------------------------------
-- Table changeset
-- -----------------------------------------------------
-- clean changeset table
DELETE FROM changeset;

-- add changeset open
-- closed changesets (they will be closed in the final of file)
INSERT INTO changeset (id, created_at, fk_layer_id, fk_user_id) VALUES (1001, '2017-10-20', 1001, 1001);
INSERT INTO changeset (id, created_at, fk_layer_id, fk_user_id) VALUES (1002, '2017-11-10', 1002, 1002);
INSERT INTO changeset (id, created_at, fk_layer_id, fk_user_id) VALUES (1003, '2017-11-15', 1001, 1001);
INSERT INTO changeset (id, created_at, fk_layer_id, fk_user_id) VALUES (1004, '2017-01-20', 1002, 1002);
-- open changesets
INSERT INTO changeset (id, created_at, fk_layer_id, fk_user_id) VALUES (1005, '2017-03-25', 1003, 1003);
INSERT INTO changeset (id, created_at, fk_layer_id, fk_user_id) VALUES (1006, '2017-05-13', 1004, 1004);


-- -----------------------------------------------------
-- Table changeset_tag
-- -----------------------------------------------------
-- clean changeset_tag table
DELETE FROM changeset_tag;

-- insert values in table changeset_tag
-- SOURCE: -
-- changeset 1001
INSERT INTO changeset_tag (k, v, fk_changeset_id) VALUES ('created_by', 'pauliceia_portal', 1001);
INSERT INTO changeset_tag (k, v, fk_changeset_id) VALUES ('comment', 'a changeset created', 1001);
-- changeset 1002
INSERT INTO changeset_tag (k, v, fk_changeset_id) VALUES ('created_by', 'test_postgresql', 1002);
INSERT INTO changeset_tag (k, v, fk_changeset_id) VALUES ('comment', 'changeset test', 1002);
-- changeset 1003
INSERT INTO changeset_tag (k, v, fk_changeset_id) VALUES ('created_by', 'pauliceia_portal', 1003);
INSERT INTO changeset_tag (k, v, fk_changeset_id) VALUES ('comment', 'a changeset created', 1003);
-- changeset 1004
INSERT INTO changeset_tag (k, v, fk_changeset_id) VALUES ('created_by', 'test_postgresql', 1004);
INSERT INTO changeset_tag (k, v, fk_changeset_id) VALUES ('comment', 'changeset test', 1004);



-- -----------------------------------------------------
-- Table notification
-- -----------------------------------------------------
-- clean notification table
DELETE FROM notification;

-- add notification
INSERT INTO notification (id, created_at, fk_user_id) VALUES (1001, '2017-01-01', 1001);
INSERT INTO notification (id, created_at, fk_user_id) VALUES (1002, '2017-03-25', 1001);
INSERT INTO notification (id, created_at, fk_user_id, is_read) VALUES (1003, '2017-12-25', 1001, TRUE);
INSERT INTO notification (id, created_at, fk_user_id) VALUES (1004, '2017-05-13', 1002);
INSERT INTO notification (id, created_at, fk_user_id) VALUES (1005, '2017-12-25', 1002);
INSERT INTO notification (id, created_at, fk_user_id) VALUES (1006, '2017-05-13', 1003);
INSERT INTO notification (id, created_at, removed_at, fk_user_id, is_read, visible) VALUES (1007, '2017-08-15', '2017-10-25', 1003, TRUE, FALSE);
INSERT INTO notification (id, created_at, fk_user_id) VALUES (1008, '2017-12-25', 1004);
INSERT INTO notification (id, created_at, removed_at, fk_user_id, visible) VALUES (1009, '2017-06-24', '2017-12-25', 1005, FALSE);
INSERT INTO notification (id, created_at, fk_user_id, is_read) VALUES (1010, '2017-05-13', 1005, TRUE);



-- -----------------------------------------------------
-- Table notification_tag
-- -----------------------------------------------------
-- clean notification_tag table
DELETE FROM notification_tag;

-- insert values in table notification_tag
-- SOURCE: -
-- notification 1001
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('body', 'Happy Birthday', 1001);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('url', '', 1001);
-- with the 'type' key the frontend can select a icon
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('type', 'birthday', 1001);
-- notification 1002
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('body', 'You was added in a group called X', 1002);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('url', '', 1002);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('type', 'group', 1002);
-- notification 1003
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('body', 'Created a new project in group X', 1003);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('url', '', 1003);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('type', 'project', 1003);
-- notification 1004
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('body', 'Created a new layer in project Y', 1004);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('url', '', 1004);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('type', 'layer', 1004);
-- notification 1005
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('body', 'A new review was made in layer Z', 1005);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('url', '', 1005);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('type', 'review', 1005);
-- notification 1006
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('body', 'You gained a new trophy', 1006);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('url', '', 1006);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('type', 'award', 1006);
-- notification 1007
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('body', 'Created a new project in group X', 1007);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('url', '', 1007);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('type', 'project', 1007);
-- notification 1008
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('body', 'You gained more points', 1008);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('url', '', 1008);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('type', 'point', 1008);
-- notification 1009
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('body', 'A new review was made in layer Z', 1009);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('url', '', 1009);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('type', 'review', 1009);
-- notification 1010
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('body', 'You gained more points', 1010);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('url', '', 1010);
INSERT INTO notification_tag (k, v, fk_notification_id) VALUES ('type', 'point', 1010);



-- -----------------------------------------------------
-- Table current_point
-- -----------------------------------------------------
-- clean current_point table
DELETE FROM current_point;

-- add node
INSERT INTO current_point (id, geom, fk_changeset_id) VALUES (1001, ST_GeomFromText('MULTIPOINT((-23.546421 -46.635722))', 4326), 1001);
INSERT INTO current_point (id, geom, fk_changeset_id) VALUES (1002, ST_GeomFromText('MULTIPOINT((-23.55045 -46.634272))', 4326), 1002);
INSERT INTO current_point (id, geom, fk_changeset_id) VALUES (1003, ST_GeomFromText('MULTIPOINT((-23.542626 -46.638684))', 4326), 1003);
INSERT INTO current_point (id, geom, fk_changeset_id) VALUES (1004, ST_GeomFromText('MULTIPOINT((-23.547951 -46.634215))', 4326), 1004);
INSERT INTO current_point (id, geom, fk_changeset_id) VALUES (1005, ST_GeomFromText('MULTIPOINT((-23.530159 -46.654885))', 4326), 1001);
-- add node as GeoJSON
INSERT INTO current_point (id, geom, fk_changeset_id) 
VALUES (1006, 
	ST_GeomFromGeoJSON(
		'{
		    "type":"MultiPoint",
		    "coordinates":[[-54, 33]],
		    "crs":{"type":"name","properties":{"name":"EPSG:4326"}}
		}'
	), 
	1003);
INSERT INTO current_point (id, geom, fk_changeset_id) 
VALUES (1007, 
	ST_GeomFromGeoJSON(
		'{
		    "type":"MultiPoint",
		    "coordinates":[[-21, 42]],
		    "crs":{"type":"name","properties":{"name":"EPSG:4326"}}
		}'
	), 
	1002);



-- -----------------------------------------------------
-- Table current_point_tag
-- -----------------------------------------------------
-- clean current_point_tag table
DELETE FROM current_point_tag;

-- insert values in table current_point_tag
-- SOURCE: AialaLevy_theaters20170710.xlsx
-- node 1001
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('address', 'R. São José', 1001);
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('start_date', '1869', 1001);
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('end_date', '1869', 1001);
-- node 1002
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('address', 'R. Marechal Deodoro', 1002);
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('start_date', '1878', 1002);
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('end_date', '1910', 1002);
-- node 1003
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('address', 'R. 11 de Junho, 9 = D. José de Barros', 1003);
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('start_date', '1886', 1003);
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('end_date', '1916', 1003);
-- node 1004
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('address', 'R. 15 de Novembro, 17A', 1004);
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('start_date', '1890', 1004);
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('end_date', '1911', 1004);
-- node 1005
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('address', 'R. Barra Funda, 74', 1005);
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('start_date', '1897', 1005);
INSERT INTO current_point_tag (k, v, fk_current_point_id) VALUES ('end_date', '1897', 1005);


-- -----------------------------------------------------
-- Operations with current_node
-- -----------------------------------------------------

-- "remove" some nodes
UPDATE current_point SET visible = FALSE WHERE id>=1003 AND id<=1005;



-- -----------------------------------------------------
-- Table current_line
-- -----------------------------------------------------
-- clean current_line table
DELETE FROM current_line;

-- add way
INSERT INTO current_line (id, geom, fk_changeset_id) VALUES (1001, ST_GeomFromText('MULTILINESTRING((333188.261004703 7395284.32488995,333205.817689791 7395247.71277836,333247.996555184 7395172.56160195,333261.133400433 7395102.3470075,333270.981533908 7395034.48052247,333277.885095545 7394986.25678192))', 4326), 1001);
INSERT INTO current_line (id, geom, fk_changeset_id) VALUES (1002, ST_GeomFromText('MULTILINESTRING((333270.653184563 7395036.74327773,333244.47769325 7395033.35326418,333204.141105934 7395028.41654752,333182.467715735 7395026.2492085))', 4326), 1002);
INSERT INTO current_line (id, geom, fk_changeset_id) VALUES (1003, ST_GeomFromText('MULTILINESTRING((333175.973956142 7395098.49130924,333188.494819187 7395102.10309665,333248.637266893 7395169.13708777))', 4326), 1003);
INSERT INTO current_line (id, geom, fk_changeset_id) VALUES (1004, ST_GeomFromText('MULTILINESTRING((333247.996555184 7395172.56160195,333255.762310051 7395178.46616912,333307.926051785 7395235.76603312,333354.472159794 7395273.32392717))', 4326), 1004);
INSERT INTO current_line (id, geom, fk_changeset_id) VALUES (1005, ST_GeomFromText('MULTILINESTRING((333266.034554577 7395292.9053933,333308.06080675 7395235.87476644))', 4326), 1002);
-- add way as GeoJSON
INSERT INTO current_line (id, geom, fk_changeset_id) 
VALUES (1006, 
	ST_GeomFromGeoJSON(
		'{
		    "type":"MultiLineString",
		    "coordinates":[[[-54, 33], [-32, 31], [-36, 89]]],
		    "crs":{"type":"name","properties":{"name":"EPSG:4326"}}
		}'
	), 
	1002);
INSERT INTO current_line (id, geom, fk_changeset_id) 
VALUES (1007, 
	ST_GeomFromGeoJSON(
		'{
		    "type":"MultiLineString",
		    "coordinates":[[[-21, 56], [-32, 31], [-23, 74]]],
		    "crs":{"type":"name","properties":{"name":"EPSG:4326"}}
		}'
	), 
	1003);


-- -----------------------------------------------------
-- Table current_line_tag
-- -----------------------------------------------------
-- clean current_line_tag table
DELETE FROM current_line_tag;

-- insert values in table current_line_tag
-- SOURCE: db_pauliceia
-- way 1
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('name', 'rua boa vista', 1001);
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('start_date', '1930', 1001);
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('end_date', '1930', 1001);
-- way 2
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('address', 'rua tres de dezembro', 1002);
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('start_date', '1930', 1002);
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('end_date', '1930', 1002);
-- way 3
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('address', 'rua joao briccola', 1003);
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('start_date', '1930', 1003);
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('end_date', '1930', 1003);
-- way 4
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('address', 'ladeira porto geral', 1004);
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('start_date', '1930', 1004);
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('end_date', '1930', 1004);
-- way 5
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('address', 'travessa porto geral', 1005);
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('start_date', '1930', 1005);
INSERT INTO current_line_tag (k, v, fk_current_line_id) VALUES ('end_date', '1930', 1005);


-- -----------------------------------------------------
-- Operations with current_way
-- -----------------------------------------------------

-- "remove" some lines
UPDATE current_line SET visible = FALSE WHERE id>=1003 AND id<=1007;



-- -----------------------------------------------------
-- Table current_polygon
-- -----------------------------------------------------
-- clean current_polygon table
DELETE FROM current_polygon;

-- add area
INSERT INTO current_polygon (id, geom, fk_changeset_id) VALUES (1001, ST_GeomFromText('MULTIPOLYGON(((0 0, 1 1, 2 2, 3 3, 0 0)))', 4326), 1001);
INSERT INTO current_polygon (id, geom, fk_changeset_id) VALUES (1002, ST_GeomFromText('MULTIPOLYGON(((2 2, 3 3, 4 4, 5 5, 2 2)))', 4326), 1002);
-- add area as GeoJSON 
INSERT INTO current_polygon (id, geom, fk_changeset_id) 
VALUES (1006, 
	ST_GeomFromGeoJSON(
		'{
		    "type":"MultiPolygon",
		    "coordinates":[[[[-54, 33], [-32, 31], [-36, 89], [-54, 33]]]],
		    "crs":{"type":"name","properties":{"name":"EPSG:4326"}}
		}'
	), 
	1003);
INSERT INTO current_polygon (id, geom, fk_changeset_id) 
VALUES (1007, 
	ST_GeomFromGeoJSON(
		'{
		    "type":"MultiPolygon",
		    "coordinates":[[[[-12, 32], [-21, 56], [-32, 31], [-23, 74], [-12, 32]]]],
		    "crs":{"type":"name","properties":{"name":"EPSG:4326"}}
		}'
	), 
	1004);


-- -----------------------------------------------------
-- Table current_polygon_tag
-- -----------------------------------------------------
-- clean current_polygon_tag table
DELETE FROM current_polygon_tag;

-- insert values in table current_polygon_tag
-- SOURCE: -
-- area 1
INSERT INTO current_polygon_tag (k, v, fk_current_polygon_id) VALUES ('building', 'hotel', 1001);
INSERT INTO current_polygon_tag (k, v, fk_current_polygon_id) VALUES ('start_date', '1870', 1001);
INSERT INTO current_polygon_tag (k, v, fk_current_polygon_id) VALUES ('end_date', '1900', 1001);
-- area 2
INSERT INTO current_polygon_tag (k, v, fk_current_polygon_id) VALUES ('building', 'theater', 1002);
INSERT INTO current_polygon_tag (k, v, fk_current_polygon_id) VALUES ('start_date', '1920', 1002);
INSERT INTO current_polygon_tag (k, v, fk_current_polygon_id) VALUES ('end_date', '1930', 1002);


-- -----------------------------------------------------
-- Operations with current_area
-- -----------------------------------------------------

-- "remove" some areas
UPDATE current_polygon SET visible = FALSE WHERE id>=1006 AND id<=1007;



-- -----------------------------------------------------
-- Final operations
-- -----------------------------------------------------
-- close the changesets
UPDATE changeset SET closed_at = '2017-12-01' WHERE id>=1001 AND id<=1004;

