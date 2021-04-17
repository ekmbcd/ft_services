
FLUSH PRIVILEGES;
-- identified by e' la password
CREATE DATABASE IF NOT EXISTS wordpress;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql-service
-- Generation Time: Apr 10, 2021 at 01:11 PM
-- Server version: 10.5.8-MariaDB-log
-- PHP Version: 7.4.15



