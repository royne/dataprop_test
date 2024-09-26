# README
Previous steps

  * install docker and docker-compose

Steps for installation

  * sudo docker-compose build
  * sudo docker-compose run web bundle exec rails db:create
  * sudo docker-compose run web bundle exec rails db:migrate
  * sudo docker-compose run web bundle exec rails db:seed

Run project

  * sudo docker-compose up

Stop containers

  * sudo docker-compose down 

to enter the container

  * sudo docker-compose run web bash


