--! qt:dataset:src
CREATE TABLE dest1(key INT, ten INT, one INT, value STRING) STORED AS TEXTFILE;

EXPLAIN
FROM src
INSERT OVERWRITE TABLE dest1
MAP src.key, CAST(src.key / 10 AS INT), CAST(src.key % 10 AS INT), src.value
USING 'cat' AS (tkey, ten, one, tvalue)
DISTRIBUTE BY tvalue, tkey
SORT BY ten DESC, one ASC;


FROM src
INSERT OVERWRITE TABLE dest1
MAP src.key, CAST(src.key / 10 AS INT), CAST(src.key % 10 AS INT), src.value
USING 'cat' AS (tkey, ten, one, tvalue)
DISTRIBUTE BY tvalue, tkey
SORT BY ten DESC, one ASC;


SELECT dest1.* FROM dest1;
