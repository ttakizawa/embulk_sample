# embulk_sample
Embulk Data load sample

## コンテナのビルド、立ち上げ

```bash
# コンテナのビルド
docker-compose build
# コンテナの立ち上げ
docker-compose up -d
# コンテナにログイン
docker exec -it embulk bash
```

## スキーマ定義の自動作成

Embulkには元データの先頭を読んで展開処理やスキーマ定義を自動生成するguessサブコマンドが用意されている

```bash
embulk guess ./opt/example_csv.yml -o ./opt/config.yml
```

## CSVの内容を標準出力に表示する

congig.ymlが作成された状態でコンテナ内で以下のコマンドを実行する

```bash
# パースを確認するためのDRY-RUNコマンド
embulk preview ./opt/config.yml

# 本実行
embulk run ./opt/config.yml
```

## CSVのデータをBQにingestする

