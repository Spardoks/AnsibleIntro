## Установка и первичная настройка clickhouse, vector, lighthouse

Playbook:
 - Устанавливаются и настраиваются clickhouse, vector, lighthouse
 

Чтобы playbook работал необходимо:
 - Загрузить зависимости из requirements.yml
 - Предоставить доступы для работы ansible на хостах через ssh
 - Добавить ip-адреса серверов в inventory
 - Указать имена пользователей и пароли в inventory
 - Запустить playbook:

```bash
$ ansible-playbook -i inventory/prod.yml site.yml
```

Протестировано:
- Managed Node для clickhouse, vector, lighthouse - AlmaLinux 8.10-genericcloud с python 3.6.8
- Control Node - Debian 12 с Python 3.11.2, ansible-core 2.16.8