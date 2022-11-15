<?php
require_once './app/models/game-model.php';
require_once './app/views/api-views.php';

class GameApiController {
    private $model;
    private $view;

    private $data;

    public function __construct() {
        $this->model = new gameModel();
        $this->view = new ApiView();
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }

    public function getGames($params = null) {
        $columns = array('nombre' => 'nombre ',
                              'descripcion' => 'descripcion ',
                              'genero_id' => 'genero_id ',
                              'calificacion' => 'calificacion ',
                              'precio' => 'precio ',
                              'imagen' => 'imagen '
                            );

        $select = $_GET["select"] ?? "*";
        $sort = $_GET["sort"] ?? null;
        $order = $_GET["order"] ?? null; 
        $begin= $_GET["begin"] ?? null;
        $end = $_GET["end"] ?? null;
        $value = $_GET["value"] ?? null;

              
             if(in_array($select, $columns) || $select == "*"){
                $games = $this->model->getAll($select);
            }
            else if (in_array($select, $columns) || $select == "*" && isset($value)){
                $games = $this->model->getAll($select, $value); 
            }
                else if (in_array($select, $columns) || $select == "*" && isset($sort) && isset($order) && strtoupper($order) == "ASC" || strtoupper($order) == "DESC"){
                $games = $this->model->getAll($select, $sort, $order);
            } 
                else if ($sort && $begin >= "0" && $begin <= "9" && $end >= "0" && $end <= "9") {
                 $games = $this->model->getAll($select, $sort, $order, $begin, $end);
            } 

            $games = $this->model->getAll($select, $sort, $order, $begin, $end, $value);
    
            $this->view->response($games);
    }

    public function getGame($params = null) {
        $id = $params[':ID'];
        $game = $this->model->get($id);

        if ($game)
            $this->view->response($game);
        else 
            $this->view->response("La impresión con el id=$id no existe", 404);
    }

    public function deleteGame($params = null) {
        $id = $params[':ID'];

        $game = $this->model->get($id);
        if ($game) {
            $this->model->delete($id);
            $this->view->response($game);
        } else 
            $this->view->response("La impresión con el id= $id no existe", 404);
    }

    public function insertGame($params = null) {
        $game = $this->getData();

        if (empty($game->nombre) || empty($game->descripcion) || empty($game->genero_id) || empty($game->calificacion) || empty($game->precio)|| empty($game->imagen)) {
            $this->view->response("Complete los datos", 400);
        } else {
            $id = $this->model->insert($game->nombre, $game->descripcion,$game->genero_id , $game->calificacion, $game->precio, $game->imagen);
            $game = $this->model->get($id);
            $this->view->response($game, 201);
        }
    }

}
