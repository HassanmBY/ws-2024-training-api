<?php

include_once "config.php";
include_once "headers.php";
include_once "token.php";

// Init des variables utilisées globalement dans le script
$method = $_SERVER['REQUEST_METHOD'];
$args = [];

// Gestion au cas ou pas de route
if (!isset($_GET['route'])) {
    $resp['message'] = "No route";
    echo json_encode($resp);
    http_response_code(403);
    die;
}

$route = $_GET['route'];


// Get Request
if ($method === "GET") {
    $query = "SELECT * FROM $route ";

   // Création requete sql
    if (isset($_GET['_id'])) {
        $query .= "WHERE _id = :_id";
        $args['_id'] = $_GET['_id'];
    }

    if (isset($_GET['filter'])) {
        $filter = json_decode($_GET['filter'], true);
        $query .= " WHERE 1 ";
        foreach ($filter as $key => $value) {
            if ($key === "sender._id") {
                $key = "sender";
            }
            $query .= " AND $key = :$key ";
            $args[$key] = $value;
        }
    }

    $req = $conn->prepare($query);
    $req->execute($args);

    $nbHits = $req->rowCount();
    $data = $req->fetchAll(PDO::FETCH_ASSOC);

    // Ajout de détails lorsque  l'on récupère un message 
    if ($route === "messages") {
        foreach ($data as $key => $value) {
            $data[$key]["sender"] = ["_model" => "senders", "_id" => $data[$key]['sender']];
        }
    }

    if ($nbHits > 0) {
        $resp = $data;
    } else {
        $resp['message'] = "No  data found";
    }
}


// Post Request
if ($method === "POST") {
    $json = file_get_contents('php://input');
    $object = json_decode($json, true);
    $headers = getallheaders();

    //Verification api-key
    if (!isset($headers["api-key"]) || $headers['api-key'] != getToken()) {
        $resp['error'] = "Permission denied";
        http_response_code(403);
        echo json_encode($resp);
        die;
    }

    $query = "INSERT INTO $route SET ";

    // Création requete sql
    foreach ($object['data'] as $key => $value) {
        if ($route === "messages" && $key === "sender") {
            $sender = $value;
            $value = $sender['_id'];
        }
        $query .= "$key = :$key, ";
        $args[$key] = $value;
    }

    $query = rtrim($query, ", ");


    $req = $conn->prepare($query);
    $req->execute($args);

    $nbHits = $req->rowCount();
    $data = $req->fetchAll(PDO::FETCH_ASSOC);

    if ($nbHits > 0) {
        // Methode GET sur la route afin d'afficher la nouvelle rangée ajoutée
        $query = "SELECT * FROM $route ORDER BY _created DESC LIMIT 1";


        $req = $conn->prepare($query);
        $req->execute();

        $data = $req->fetchAll(PDO::FETCH_ASSOC);

        if ($route === "messages") {
            foreach ($data as $key => $value) {
                $data[$key]["sender"] = ["_model" => "senders", "_id" => $data[$key]['sender']];
            }
        }

        $resp = $data[0];
    } else {
        $resp['message'] = "No  data found";
    }
}


echo json_encode($resp);
