-- https://qiita.com/inouet/items/4f1d7f299725597d8407

create table public.items (
  id int not null primary key,
  name varchar(100),
  price int,
  category varchar(100)
);

insert into public.items values(1, 'りんご', 190, 'くだもの');
insert into public.items values(2, 'みかん', 100, 'くだもの');
insert into public.items values(3, 'きゅうり', 80, '野菜');
insert into public.items values(4, '人参', 110, '野菜');
insert into public.items values(5, 'キャベツ', 110, '野菜');
insert into public.items values(6, '豚肉', 300, '肉');
insert into public.items values(7, '牛肉', 400, '肉');
