<?php
require_once './libs/Router.php';
require_once './app/controllers/game-api.controller.php';

$router = new Router();


$router->addRoute('game', 'GET', 'GameApiController', 'getGames');
$router->addRoute('game/:ID', 'GET', 'GameApiController', 'getGame');
$router->addRoute('game/:ID', 'DELETE', 'GameApiController', 'deleteGame');
$router->addRoute('game', 'POST', 'GameApiController', 'insertGame'); 


$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
