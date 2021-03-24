<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{    
//Avoir une liste d’utilisateurs
//Route::get('/users', [UserController::class, 'getAll']);
    function getAll() {
        $getAll = User::all();
        if (count($getAll) == 0)
            return response()->json([
                "message" => "There is no user"
            ], 400);
        
        return response()->json([
            "message" => "Here is the list of users",
            "data" => $getAll
        ], 200);
    }
    
//Inscription
// Route::post('/register', [UserController::class, 'create']);
    function create(Request $request) {
        $validator = Validator::make($request->all(), [
            'username' => 'required|string|max:255|unique:User,username',
            'password' => 'required|string|min:6',
            'email' => 'required|string|email|max:255|unique:User,email',
            'name' => 'required|string|max:255',
            'firstname' => 'required|string|max:255',
            'age' => 'required|numeric|max:100',
        ]);
        
        if ($validator->fails()) {
            return response()->json([
                "message" => $validator->errors()->first()
            ], 400);
        }
        
        $user = User::create([
            'username' => $request->get("username"),
            'password' => $request->get('password'),
            'email' => $request->get('email'),
            'name' => $request->get("name"),
            'firstname' => $request->get('firstname'),
            'age' => $request->get('age'),            
        ]);
        
        if ($user)
            return response()->json([
                "message" => "The user has been created",
                "data" => $user
            ], 201);
        
    }
    
//Authentification
//Route::post('/auth', [UserController::class, 'auth']);
    function auth(Request $request) {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255|exists:User,email',
            'password' => 'required|string|min:6|exists:User,password',
        ]);
        
        if ($validator->fails()) {
            return response()->json([
                "message" => $validator->errors()->first()
            ], 400);
        }
        
        $user = User::whereEmail(request('email'))
              ->wherePassword(request('password'))
              ->first();
        
        if ($user)
            return response()->json([
                "message" => "You have been authenticated",
                "data" => $user
            ], 200);    
    }   
}
