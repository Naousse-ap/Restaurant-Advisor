<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RestaurantController;
use App\Http\Controllers\MenuController;
use App\Http\Controllers\UserController;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

//Inscription
Route::post('/register', [UserController::class, 'create']);

//Authentification
Route::post('/auth', [UserController::class, 'auth']);

//Avoir une liste d’utilisateurs
Route::get('/users', [UserController::class, 'getAll']);

//Récupérer la liste des restaurants
Route::get('/restaurants', [RestaurantController::class, 'getAll']);

//Récupérer le restaurant correspondant à l'id donné
Route::get('/restaurants/{id}', [RestaurantController::class, 'getByID']);

//Créer un restaurant
Route::post('/restaurants', [RestaurantController::class, 'create']);

//Modifier un restaurant
Route::put('/restaurant/{id}', [RestaurantController::class, 'update']);

//Créer un menu pour un restaurant
Route::post('restaurants/{id}/menus', [MenuController::class, 'create']);

//Récupérer la liste des menus
Route::get('/menus', [MenuController::class, 'getAll']);

//Récupérer le menu correspondant à l'id donné
Route::get('/menus/{id}', [MenuController::class, 'getByID']);

//Récupérer les menus d'un restaurant
Route::get('/restaurants/{id}/menus', [MenuController::class, 'All']);

//Supprimer un restaurant (peut pas supp si les menus associés pas supp avant)
Route::delete('/restaurant/{id}', [RestaurantController::class, 'destroy']);

//Modifier un menu
Route::put('/menus/{id}', [MenuController::class, 'update']);

//Supprimer un menu
Route::delete('/menus/{id}', [MenuController::class, 'destroy']);
