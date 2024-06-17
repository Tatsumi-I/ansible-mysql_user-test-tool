# ansible-mysql_user-test-tool

This tool helps in validating the creation of mysql users in ansible.

このツールは MySQL に対する Ansible の挙動を確認するのに役立ちます。

## How to use

使い方は次の通りです。

1. `$ docker compose up --build -d`
2. `$ docker compose logs ansible`
3. `$ docker compose exec -it mysql bash`
4. `# mysql -u root -p`
5. `mysql> SELECT Host, User, Db, Select_priv, Update_priv FROM mysql.db;`

`playbook-test.yml` における `vars` > `mysql_users` を適宜編集し、`docker compose up -d` を実行してユーザー情報が更新されたか確認します。

## Tips

複数のデータベースに対する権限を設定するには、次のように `/` を使って指定する必要があります。

ref. https://docs.ansible.com/ansible/latest/collections/community/mysql/mysql_user_module.html#parameter-priv 

```yml
- { name: user2, state: present, host: 'localhost', priv: 'database_a.*:SELECT/database_b.*:ALL', password: password2 }
```
これにより ansible は `user2` に対して、同一サーバに共存するデータベース（ `database_a` と `database_b` ）両方に対する権限を付与できます。
