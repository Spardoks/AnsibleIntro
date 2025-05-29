## Установка и первичная настройка clickhouse и vector

Playbook:
 - Загружаются дистрибутивы, указанные в group_vars
 - Устанавливается clickhouse
 - Создаётся clickhouse бд logs
 - Запускает clickhouse-server
 - Устанавливается vector
 - На основе шаблонов настраивается vector для связи с бд logs, добавляется systemd сервис
 - Запускается vector

Чтобы playbook работал:
 - Необходимо предоставить доступы для работы ansible на хостах через ssh
 - Добавить ip-адреса серверов в inventory
 - Указать имена пользователей и пароли в inventory
 - В файлах vars необходимо указать версии дистрибутивов
 - Запустить playbook:

```bash
$ ansible-playbook -i inventory/prod.yml site.yml
```

Протестировано:
- Managed Node для clickhouse, vector - AlmaLinux 8.10-genericcloud с python 3.6.8
- Control Node - Debian 12 с Python 3.11.2, ansible-core 2.16.8