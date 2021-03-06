-- @author prabhd 
-- @created 2013-02-01 12:00:00 
-- @modified 2013-02-01 12:00:00 
-- @tags cte HAWQ 
-- @product_version gpdb: [4.3-],hawq: [1.1-]
-- @db_name world_db
-- @description test8b: CTE defined in the HAVING clause

WITH w AS (SELECT a, b FROM foo where b < 5)
SELECT a, sum(b) FROM foo
WHERE b > 1
GROUP BY a
HAVING sum(b) < ( WITH z AS (SELECT c FROM bar, w WHERE c = w.a AND c < 2) SELECT c+2 FROM z) ORDER BY 1;
