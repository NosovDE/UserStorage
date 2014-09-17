UserStorage - Хранилище пользователей
===========

Spring Framework + Spring MVC + Spring JDBC Template

* Требования ПО

JDK 1.7+
Maven 3+
MySQL 5.5+

* Предварительная настройка

SQL скрипты расположены в подпапке sql:

1) Создание  БД: mysql < create-database.sql
2) Создание таблицы: mysql user_storage < create-tables.sql


=== Сборка и Запуск ===

 mvn tomcat:run-war

 http://127.0.0.1:8080/UserStorage



[ ![Codeship Status for NosovDE/UserStorage](https://www.codeship.io/projects/dea70e30-2094-0132-2300-5a4be02c6d84/status)](https://www.codeship.io/projects/35995)

