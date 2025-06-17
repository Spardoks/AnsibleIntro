# Домашнее задание к занятию 4 «Работа с roles»

https://github.com/netology-code/mnt-homeworks/blob/MNT-video/08-ansible-04-role/README.md

## Подготовка к выполнению

1. Познакомьтесь с [LightHouse](https://youtu.be/ymlrNlaHzIY?t=929).
2. Создайте два пустых публичных репозитория в любом своём проекте: vector-role и lighthouse-role.
3. Добавьте публичную часть своего ключа к своему профилю на GitHub.

## Основная часть

Ваша цель — разбить ваш playbook на отдельные roles. 

Задача — сделать roles для ClickHouse, Vector и LightHouse и написать playbook для использования этих ролей. 

Ожидаемый результат — существуют три ваших репозитория: два с roles и один с playbook.

**Что нужно сделать**

1. Создайте в старой версии playbook файл `requirements.yml` и заполните его содержимым:

   ```yaml
   ---
     - src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
       scm: git
       version: "1.13"
       name: clickhouse 
   ```

2. При помощи `ansible-galaxy` скачайте себе эту роль. (`cd playbook && ansible-galaxy install -r requirements.yml -p roles`)
3. Создайте новый каталог с ролью при помощи `ansible-galaxy role init vector-role`. (`cd roles && ansible-galaxy role init vector-role`)
4. На основе tasks из старого playbook заполните новую role. Разнесите переменные между `vars` и `default`. 
5. Перенести нужные шаблоны конфигов в `templates`.
6. Опишите в `README.md` обе роли и их параметры. Пример качественной документации ansible role [по ссылке](https://github.com/cloudalchemy/ansible-prometheus).
7. Повторите шаги 3–6 для LightHouse. Помните, что одна роль должна настраивать один продукт. (`cd roles && ansible-galaxy role init lighthouse--role`)
8. Выложите все roles в репозитории. Проставьте теги, используя семантическую нумерацию. Добавьте roles в `requirements.yml` в playbook.
9. Переработайте playbook на использование roles. Не забудьте про зависимости LightHouse и возможности совмещения `roles` с `tasks`.
10. Выложите playbook в репозиторий.
11. В ответе дайте ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.

---
## Выполнение основной части и её особенности

Для подготовки окружения можно использовать данные артефакты https://github.com/Spardoks/AnsibleIntro/tree/main/02-playbook/TerraformLibvirtTesting

```
# alma8
# https://github.com/Spardoks/TerraformLibvirtTesting/blob/main/main.tf
terraform apply

python3 -m venv venv
source venv/bin/activate
# Удалить текущую версию Ansible
pip uninstall ansible-core
# Установить Ansible 2.16 для совместимости с python 3.6 из alma8 
# https://docs.ansible.com/ansible/latest/reference_appendices/python_3_support.html
pip install ansible-core==2.16.8

ansible --version

ansible-galaxy install -r requirements.yml -p roles
ansible -m ping -i inventory/prod.yml all
ansible-playbook site.yml -i inventory/prod.yml
```

Если возникнут проблемы с ролью `AlexeySetevoi/ansible-clickhouse`, которая активируется через `site.yml` playbook, то можно использовать `site_local_clickhouse_task.yml`, который оттестирован на окружении выше

### Особенности создания удалённых ролей

```
git checkout -b vectore-role
# clear no need files
git commit -m "Task #3: create Vector-role to use in ansible reqs"
git tag -a vector_role_1.0.0 -m "Vector role ready"
git push origin vector_role_1.0.0


git checkout -b lighthouse-role
# clear no need files
git commit -m "Task #3: create Lighthouse-role to use in ansible reqs"
git tag -a lighthouse_role_1.0.0 -m "Lighthouse role ready"
git push origin lighthouse_role_1.0.0

```