# GGPC
Backend API for GGPC project on RoR


Инструкция по запуску сервера

Установить docker и docker-compose

Выполнить команды:

docker-compose build

docker-compose run api bundle

docker-compose run api rails db:create

docker-compose run api rails db:migrate

docker-compose run api rails db:seed

docker-compose up -d (поднятие сервера)

docker-compose stop (остановка сервера)
