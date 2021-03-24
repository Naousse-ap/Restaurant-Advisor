<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\Restaurant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MenuController extends Controller
{
//Récupérer la liste des menus
//Route::get('/menus', [MenuController::class, 'getAll']);
    function getAll() {
        $getAll = Menu::all();
        if (count($getAll) == 0)
            return response()->json([
                "message" => "No menu"
            ], 400);
        
        return response()->json(
            //"message" => "Here are the menus",
            $getAll
        , 200);
    }
    
//Récupérer les menus d'un restaurant
//Route::get('/restaurants/{id}/menus', [MenuController::class, 'All']);
    function All($id) {
        $restaurant = Restaurant::where("id", $id)->first();
        if ($restaurant == null){
            return response()->json([
                "message" => "Restaurant not existing"
            ], 400);
        }
        
        $All = Menu::where('restaurant_id' , $id)->first();
        if ($All == null){
            return response()->json([
                "message" => "No menu in this restaurant"
            ], 400);
        }
        
        $All = Menu::where('restaurant_id' , $id)->get();
        return response()->json(
            //"message" => "Here are the menus of the restaurant",
            $All
        , 200);
    }
    
//Récupérer le menu correspondant à l'id donné
//Route::get('/menus/{id}', [MenuController::class, 'getByID']);
    function getByID($id) {
        $menu = Menu::where("id", $id)->first();
        if ($menu == null){
            return response()->json([
                "message" => "Menu does not exist"
            ], 400);
        }
        
        return response()->json(
           // "message" => "Retrieve the menu corresponding to the given id",
           $menu
        , 200);
    }
    
//Créer un menu pour un restaurant
//Route::post('restaurants/{id}/menus', [MenuController::class, 'create']);
    function create(Request $request, $id) {
        $restaurant = Restaurant::where("id", $id)->first();
        if ($restaurant == null){
            return response()->json([
                "message" => "The menu could not be created because the restaurant does not exist."
            ], 400);
        }

        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'description' => 'required|string|max:255',
            'price' => 'required|numeric|max:1000',
            'picture'=>'max:1000',
        ]);
        
        if ($validator->fails()) {
            return response()->json([
                "message" => $validator->errors()->first()
            ], 400);
        }

        $menu = Menu::create([
            "name" => $request->get("name"),
            "description" => $request->get("description"),
            "price" => $request->get("price"),
            "picture" => $request->get("picture"),
            "restaurant_id" => $id
        ]);
        
        if ($menu)
            return response()->json(
                //"message" => "The menu has been created",
                 $menu
            , 201);
        
    }
    
//Supprimer un menu
//Route::delete('/menus/{id}', [MenuController::class, 'destroy']);
    function destroy($id) {
        $destroy = Menu::where("id", $id)->delete();
        if ($destroy)
            return response()->json([
                "message" => "Deleted menu"
            ], 200);
        
        return response()->json([
            "message" => "The menu could not be deleted because it does not exist."
        ], 400);
    }
    
//Modifier un menu
//Route::put('/menus/{id}', [MenuController::class, 'update']);
    function update(Request $request, $id) {
        $menu = Menu::where("id", $id)->first();
        if ($menu == null){
            return response()->json([
                "message" => "The menu could not be modified because it does not exist."
            ], 400);
        }
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'description' => 'required|string|max:255',
            'price' => 'required|numeric|max:100',
            'picture'=>'max:1000',
        ]);
        
        if ($validator->fails()) {
            return response()->json([
                "message" => $validator->errors()->first()
            ], 400);
        }
        
        $menu = Menu::where("id", $id)->update([
            "id" => $id,
            "name" => $request->get("name"),
            "description" => $request->get("description"),
            "price" => $request->get("price"),
            "picture" => $request->get("picture"),
        ]);
        
        if ($menu)
            return response()->json([
                "message" => "Modified menu"
            ], 200);

    }
}
