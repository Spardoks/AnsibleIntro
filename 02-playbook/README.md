# Домашнее задание к занятию 2 «Работа с Playbook»

https://github.com/netology-code/mnt-homeworks/tree/MNT-video/08-ansible-02-playbook

## Подготовка к выполнению

1. * Необязательно. Изучите, что такое [ClickHouse](https://www.youtube.com/watch?v=fjTNS2zkeBs) и [Vector](https://www.youtube.com/watch?v=CgEhyffisLY).
2. Создайте свой публичный репозиторий на GitHub с произвольным именем или используйте старый.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.
4. Подготовьте хосты в соответствии с группами из предподготовленного playbook.

## Основная часть

1. Подготовьте свой inventory-файл `prod.yml`.
2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2. От вас не требуется использовать все возможности шаблонизатора, просто вставьте стандартный конфиг в template файл. Информация по шаблонам по [ссылке](https://www.dmosk.ru/instruktions.php?object=ansible-nginx-install). не забудьте сделать handler на перезапуск vector в случае изменения конфигурации!
3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.
4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook). Так же приложите скриншоты выполнения заданий №5-8
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.

## Решение основной части

0. Готовим окружение
    ```
    alma8
    https://github.com/Spardoks/TerraformLibvirtTesting/blob/main/main.tf
    terraform apply

    python3 -m venv venv
    source venv/bin/activate
    # Удалить текущую версию Ansible
    pip uninstall ansible-core
    # Установить Ansible 2.16 для совместимости с python 3.6 из alma8 
    # https://docs.ansible.com/ansible/latest/reference_appendices/python_3_support.html
    pip install ansible-core==2.16.8

    ansible --version
    ansible -m ping -i inventory/prod.yml clickhouse-01
    ansible-playbook site.yml -i inventory/prod.yml

    ```
    ![task_0](./screens/task_0.png)  

1-4. Добавляем новый хост в inventory, добавляем новую группу переменных, добавляем playbook в site.yml, lj,добавляем шаблоны  
5. Запускаем `ansible-lint site.yml` и исправляем ошибки  
6. Запускаем playbook с флагом check `ansible-playbook site.yml -i inventory/prod.yml --check` - check выдаёт ошибку, потому что не может найти пакет для установки, а также запустить сервис  
7. Запускаем playbook с флагом diff `ansible-playbook site.yml -i inventory/prod.yml --diff`
    ![task_7](./screens/task_7.png)
8. Запускаем playbook с флагом diff повторно `ansible-playbook site.yml -i inventory/prod.yml --diff` - изменений не видим
    ![task_8](./screens/task_8.png)
9. Готовим [Readme](./playbook/README.md)