<?php

class gameModel {


    function connectDB(){
        $db = new PDO('mysql:host=localhost;'.'dbname=juegos_bd;charset=utf8', 'root', '');
        return $db;
    }

    function getAll($select, $sort = null, $order = null, $begin = null, $end = null, $value = null){ 
        $db = $this->connectDB();

        $query = "SELECT $select FROM games";

        if (isset($select) && $value != null){
            $query = "SELECT games.* FROM games WHERE  $select='$value'";
        }
        
        if(isset($select) && $sort != null && $order != null){
            $query = "SELECT $select FROM games ORDER BY $sort $order";
        }

        if(isset($select) && $begin != null && $end != null){
            $query = "SELECT $select FROM games LIMIT $begin, $end";
        }

        if($select != null && $sort != null && $order != null && $begin != null && $end != null ){
            $query = "SELECT $select FROM games ORDER BY $sort $order LIMIT $begin, $end";
        }

        $query = $db->prepare($query);
        $query->execute();
        $games = $query->fetchAll(PDO::FETCH_OBJ);
        return $games;
    
        }



    public function get($id) {
        $db = $this->connectDB();
        $query = $db->prepare("SELECT * FROM games WHERE id = ?");
        $query->execute([$id]);
        $games = $query->fetch(PDO::FETCH_OBJ);
        
        return $games;
    }

    public function insert($nombre, $descripcion, $genero_id, $calificacion, $precio, $imagen) {
        $db = $this->connectDB();
        $query = $db->prepare("INSERT INTO games(nombre, descripcion, genero_id, calificacion, precio, imagen) VALUES (?,?,?,?,?,?)");
        $query->execute([$nombre, $descripcion, $genero_id, $calificacion, $precio, $imagen]);

        return $db->lastInsertId();
    }

    function delete($id) {
        $db = $this->connectDB();
        $query = $db->prepare('DELETE FROM games WHERE id = ?');
        $query->execute([$id]);
    }
}
    

