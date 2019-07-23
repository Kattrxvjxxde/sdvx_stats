# 環境

- `ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-darwin18]`

- `postgres (PostgreSQL) 11.4`

# 構築

- bundle install

```
$ bundle install
```

- PostgreSQLを起動

- db整備

```
$ bundle exec rails db:create
$ bundle exec rails db:migrate
$ bundle exec rails db:seed
```

# 起動

```
$ bundle exec rails s
```


# 機能

## 譜面データ取込

- 取り込むデータを `datas/chart_info/chart_info_YYYYMMDD.csv` として用意し、以下実行

```
$ bundle exec rails r lib/scripts/chart_update.rb
```
