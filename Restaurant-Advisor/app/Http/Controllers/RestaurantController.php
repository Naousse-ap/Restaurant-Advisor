<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\Restaurant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RestaurantController extends Controller
{
//Récupérer la liste des restaurants
//Route::get('/restaurants', [RestaurantController::class, 'getAll']);
    function getAll() {
        $getAll = Restaurant::all();
        if (count($getAll) == 0)
            return response()->json([
                //"message" => "No restaurant"
            ], 400);
        
        return response()->json(
            //"message" => "Here is the list of restaurants",
            $getAll
        , 200);
    }
    
//Récupérer le restaurant correspondant à l'id donné
//Route::get('/restaurants/{id}', [RestaurantController::class, 'getByID']);
    function getByID($id) {
        $restaurant = Restaurant::where("id", $id)->first();
        if ($restaurant == null){
            return response()->json([
                //"message" => "Restaurant not existing"
            ], 400);
        }
        
        return response()->json([
            "message" => "Here is the requested restaurant",
            "data" => $restaurant
        ], 200);
        
    }
    
//Supprimer un restaurant (peut pas supp si les menus associés pas supp avant)
//Route::delete('/restaurant/{id}', [RestaurantController::class, 'destroy']);
    function destroy($id) {
        Menu::where("restaurant_id", $id)->delete();
        $destroy = Restaurant::where("id", $id)->delete();
        if ($destroy)
            return response()->json([
                "message" => "Restaurant deleted"
            ], 200);
        
            //faire en sorte de supprimer les menus en meme temps que le restaurants 

        return response()->json([
            "message" => "The restaurant could not be deleted because it does not exist."
        ], 400);
    }

//Créer un restaurant
//Route::post('/restaurants', [RestaurantController::class, 'create']);
    function create(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'description' => 'required|string|max:255',
            'grade' => 'required|numeric|max:20',
            'localization' => 'required|string|max:255',
            'phone_number' => 'required|string|max:20|unique:Restaurant,phone_number',
            'website' => 'required|string|max:255|unique:Restaurant,website',
            'hours' => 'required|string|max:255',
            'picture'
        ]);
        
        if ($validator->fails()) {
            return response()->json([
                "message" => $validator->errors()->first()
            ], 400);
        }

        $restaurant = Restaurant::create([
            'name' => $request->get("name"),
            'description' => $request->get('description'),
            'grade' => $request->get('grade'),
            'localization' => $request->get("localization"),
            'phone_number' => $request->get('phone_number'),
            'website' => $request->get('website'),
            'hours' => $request->get('hours'),
            'picture' =>$request->get('picture'),
            ]);

    if ($restaurant)
        return response()->json([
        "message" => "The restaurant has been created",
        "data" => $restaurant
    ], 201);
}
    
    
//Modifier un restaurant
//Route::put('/restaurant/{id}', [RestaurantController::class, 'update']);
    function update(Request $request, $id) {
    
        $restaurant = Restaurant::where("id", $id)->first();
        if ($restaurant == null){
            return response()->json([
                "message" => "The restaurant could not be modified because it does not exist."
            ], 400);
        }
        
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'description' => 'required|string|max:255',
            'grade' => 'required|numeric|max:20',
            'localization' => 'required|string|max:255',
            'phone_number' => 'required|string|max:20|unique:Restaurant,phone_number',
            'website' => 'required|string|max:255|unique:Restaurant,website',
            'hours' => 'required|string|max:255',
            'picture'
        ]);
        
        if ($validator->fails()) {
            return response()->json([
                "message" => $validator->errors()->first()
            ], 400);
        }
        
        $restaurant = Restaurant::where("id", $id)->update([
            "id" => $id,
            "name" => $request->get("name"),
            "description" => $request->get("description"),
            "grade" => $request->get("grade"),
            "localization" => $request->get("localization"),
            "phone_number" => $request->get("phone_number"),
            "website" => $request->get("website"),
            "hours" => $request->get("hours"),
            "picture" => $request->get("picture")
        ]);
        
        if ($restaurant)
            return response()->json([
                "message" => "Modified restaurant"
            ], 200);
    
    }   
}




