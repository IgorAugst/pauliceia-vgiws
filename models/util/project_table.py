#!/usr/bin/env python
# -*- coding: utf-8 -*-


# test

def get_subquery_project_table(**kwargs):
    # DEFAULT WHERE
    # by default, get all results that are visible (that exist)
    conditions_of_where = ["project.visible=TRUE"]

    # conditions of WHERE CLAUSE
    if "project_id" in kwargs and kwargs["project_id"] is not None:
        conditions_of_where.append("project.id = {0}".format(kwargs["project_id"]))

    elif "user_id" in kwargs and kwargs["user_id"] is not None:
        conditions_of_where.append("project.fk_user_id_owner = {0}".format(kwargs["user_id"]))

    else:
        # default get all features, without where clause
        pass

    # default get all features, without where clause
    where_clause = ""

    # if there is some condition, put in where_clause
    if conditions_of_where:
        where_clause = "WHERE " + " AND ".join(conditions_of_where)

    # default get all features
    subquery_table = """
        (
            SELECT id, create_at, removed_at, fk_user_id_owner FROM project {0}
        ) AS project
    """.format(where_clause)

    return subquery_table
