[SQLで同一グループの中で最大/最小のレコードを取得する](https://qiita.com/inouet/items/4f1d7f299725597d8407)

mpywさんのコメント

LEFT JOINを使う方法

```sql
SELECT x.*
FROM items x
LEFT JOIN items y
  ON x.category = y.category
  AND (x.price < y.price OR x.price = y.price AND x.id > y.id)
WHERE y.id IS NULL;
```

### EXPLAIN

postgres

```
EXPLAIN SELECT x.*
FROM items x
LEFT JOIN items y
  ON x.category = y.category
  AND (x.price < y.price OR x.price = y.price AND x.id > y.id)
WHERE y.id IS NULL;
```

```
                                   QUERY PLAN
---------------------------------------------------------------------------------
 Hash Left Join  (cost=13.82..29.14 rows=1 width=444)
   Hash Cond: ((x.category)::text = (y.category)::text)
   Join Filter: ((x.price < y.price) OR ((x.price = y.price) AND (x.id > y.id)))
   Filter: (y.id IS NULL)
   ->  Seq Scan on items x  (cost=0.00..11.70 rows=170 width=444)
   ->  Hash  (cost=11.70..11.70 rows=170 width=226)
         ->  Seq Scan on items y  (cost=0.00..11.70 rows=170 width=226)
(7 rows)
```
