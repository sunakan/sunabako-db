-- https://www.timedia.co.jp/tech/selecting-max-record-in-group-by/

CREATE TABLE public.sample_table (
    id serial NOT NULL,
    group_id bigint NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    comment character varying NOT NULL
);

INSERT INTO public.sample_table
VALUES
    (1, 1, '2013-12-01', 'C')
    , (2, 2, '2013-12-01', 'A')
    , (3, 1, '2013-12-02', 'B')
    , (4, 2, '2013-11-30', 'D')
    , (5, 1, '2013-12-02', 'わざとupdated_atを重複させた1(記事にはないレコード)')
    , (6, 2, '2013-12-02', 'わざとupdated_atを重複させた2(記事にはないレコード)')
;
