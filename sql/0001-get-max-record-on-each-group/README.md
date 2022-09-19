[同一グループの中で最大のレコードを取得する SQL を書く](https://www.timedia.co.jp/tech/selecting-max-record-in-group-by/)

ng

```sql
SELECT group_id, MAX(updated_at)
  FROM sample_table
  GROUP BY group_id;
```

syntax error

```
SELECT id, group_id, MAX(updated_at), comment
FROM sample_table
GROUP BY group_id;
```

postgresだとダメ

```
ERROR: pq: column "sample_table.id" must appear in the GROUP BY clause or be used in an aggregate function
```

ok?

`updated_at` が最大のレコードが2つあると複数とられる

```sql
SELECT *
FROM sample_table AS m
WHERE updated_at = (
    SELECT MAX(updated_at)
    FROM sample_table AS s
    WHERE m.group_id = s.group_id
);
```

or

```sql
SELECT *
FROM sample_table AS m
WHERE NOT EXISTS (
    SELECT 1
    FROM sample_table AS s
    WHERE m.group_id = s.group_id
    AND m.updated_at < s.updated_at
);
```

```
 id | group_id |       updated_at       |                       comment
----+----------+------------------------+-----------------------------------------------------
  3 |        1 | 2013-12-02 00:00:00+00 | B
  5 |        1 | 2013-12-02 00:00:00+00 | わざとupdated_atを重複させた1(記事にはないレコード)
  6 |        2 | 2013-12-02 00:00:00+00 | わざとupdated_atを重複させた2(記事にはないレコード)
(3 rows)
```
