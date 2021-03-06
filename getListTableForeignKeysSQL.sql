SELECT rc.RDB$CONSTRAINT_NAME AS "constraint_name",
    rc.RDB$RELATION_NAME AS "on table",
    d1.RDB$FIELD_NAME AS "on field",
    d2.RDB$DEPENDED_ON_NAME AS "references table",
    d2.RDB$FIELD_NAME AS "references field",
    refc.RDB$UPDATE_RULE AS "on update",
    refc.RDB$DELETE_RULE AS "on delete"
FROM RDB$RELATION_CONSTRAINTS AS rc
LEFT JOIN RDB$REF_CONSTRAINTS refc ON rc.RDB$CONSTRAINT_NAME = refc.RDB$CONSTRAINT_NAME
LEFT JOIN RDB$DEPENDENCIES d1 ON d1.RDB$DEPENDED_ON_NAME = rc.RDB$RELATION_NAME
LEFT JOIN RDB$DEPENDENCIES d2 ON d1.RDB$DEPENDENT_NAME = d2.RDB$DEPENDENT_NAME
WHERE rc.RDB$CONSTRAINT_TYPE = 'FOREIGN KEY'
    AND d1.RDB$DEPENDED_ON_NAME <> d2.RDB$DEPENDED_ON_NAME
    AND d1.RDB$FIELD_NAME <> d2.RDB$FIELD_NAME
    AND rc.RDB$RELATION_NAME =  'TEST'; -- Table Name