# geoDataProduct

## fetch_tiles
指定された範囲の各種地図情報をダウンロードする。本モジュールでは標準地図、オルソ図、色別標高図がダウンロードが可能

本ディレクトリには、以下のコードが格納されている。

### make_geojson.ipynb
地図上での範囲指定から、対象範囲のgeotiffファイルを作成する。
### fetch_tiles.ipynb
geotiffファイルを入力として、各種地図情報をダウンロードする。
### merge_tiles.ipynb
ダウンロードした各種地図をマージする。