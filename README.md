# circleci-init

## Description
circleci用のリポジトリをテンプレートリポジトリから作成するコマンド

## Features

1. github cliを利用してgithubに新規リポジトリを作成する
2. githubリポジトリに対応するgitリポジトリをローカル環境の指定したパスに作成する

## Requirement

- github cliがインストールされていること
- `circleci-template`という名前のテンプレートリポジトリを用意すること

## Installation

```
$ git clone https://github.com/inayuky/circleci-init
```

コマンドのaliasを設定しておくのがおすすめ。

```.zshrc
alias circleci-init="/path/to/this/circleci-init/create_prj.sh"
```

`.env`にリポジトリを作成するパスを設定する。

```.env
DEST_DIR="/path/to/repo"
```

## Usage

`.env`に指定したパスに`reponame1`のリポジトリを作成する。
`.env`パスを入力していない場合はカレントディレクトリにリポジトリが作成される。

```
circleci-init reponame1
```

パスは`.env`ではなく第２引数でも指定できる。

```
circleci-init reponame1 "/path/to/repo"
```

## License

MIT