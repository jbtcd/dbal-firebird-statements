SELECT RDB$INDEX_NAME
FROM RDB$INDICES
WHERE RDB$RELATION_NAME='TEST' -- Table Name
    AND RDB$UNIQUE_FLAG IS NULL
    AND RDB$FOREIGN_KEY IS NULL;