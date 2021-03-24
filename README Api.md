# Groupe de granie_l

## Création et mise en place du projet

---


Pour créer un projet: `composer create-project laravel/laravel restaurant-advisor` puis aller dans le projet `cd restaurant-advisor`

### Création d'une DB dans mysql

`Show Databases;` -> Cette commande consiste à voir les Databases existantes.

`Create Database restaurant;` -> Création de la Database "restaurant" pour le projet.

`Use restaurant;` -> Pour selectionner la DB restaurant.

`Show tables;` -> Voir les tables dans la DB sélectionner au dessus.

### Configuration du .env

Changement des lignes suivantes dans le **.env** correspondant a la DB restaurant creer juste au dessus :

     DB_DATABASE=restaurant
     DB_USERNAME=root
     DB_PASSWORD=

## Migrations & Models

---


*  php artisan make:model Menu --migration -> Commande pour creer model et migration appeler Menu. (Faire la même pour Restaurant et User)
*  /app/model -> Emplacement des models.
*  /database/migration -> Emplacement des migrations.
*  php artisan migrate -> Envoyer les migrations.
*  php artisan migrate:refresh -> Relancer les migrations pour obtenir les mises à jours.

Bien mettre dans l'ordre les migrations (sinon la migration echoue si il y a des clé, elle ne peux pas faire appelle a un Id si la migration de cette Id est en dessous).
`protected $table = 'Restaurant';` -> Ne pas oublier de mettre dans les Models cette ligne sinon les routes ne fonctionnent pas.

## Prérequis pour les routes

---


Pour cela nous allons avoir besoin de créer des Controllers ainsi que des Seeders afin de tester si cela fonctionne.

`App\Http\Controllers` -> Emplacement des Controllers.

Pour créer les Controllers nous faisons `php artisan make:controller MenuController` -> Ici nous créons le Controller Menu.

Création d'un seeder avec `php artisan make:seeder RestaurantSeeder`
Lancer le Seeder avec `php artisan db:seed --class=RestaurantSeeder`
Puis ajouter les Seeders dans le fichier `DatabaseSeeders` qui se situe dans `/database/seeders`

    $this->call([
        RestaurantSeeder::class,
        MenuSeeder::class,
    ]);
    
Pour finir faire `composer dump-autoload` puis `php artisan db:seed` pour lancer tout les seeds.

## Création des routes

---


Afin de déterminer nos routes avec le préfixe /api/ dans leur url, nous créeons nos routes dans le fichier `api.php`.
Et nous implémentons les routes demandées dans le sujet avec la bonne synthaxe pour chacune d'entre elles ainsi que le bon type que ce soit "GET, POST, DELETE, et PUT".

Pour définir les routes nous procédons commme suit :

``Route::`le type`('`l'URL`', ['`nom du controller`'::class, '`nom de la fonction passé dans le controller`']);``

Chacunes des routes se rapportent à une fonction dans le controller auquel elle fait appelle :
  ```
function `nom de la fonction`() {
        return response()->json(`nom du model`::all(), `200`);
    }
```


- Avec 200 étant le status réponse attendu dans le sujet.
- Et json() permettant de retourner les informations de la base de données sous forme d'un tableau json.

Pour finir, nous pouvons tester nos routes à l'aide du logiciel "Postman".  
En effet en faisant un `php artisan serve` nous récupérons l'url de notre projet que nous renseignons dans la partie "my workspace" de postman et nous pouvons ainsi tester les routes que nous venons de créer en renseignant le type, l'url de notre site dans notre cas `http://127.0.0.1:8000` ainsi que `/api/`et l'url de notre route a tester tel que `users/`.


## Fonctionnement des requêtes

---

Nous avons donc du préparer 14 requêtes en tout, soit 14 routes différentes ainsi que 14 fonctions dans nos controllers.

###    1.  Requêtes pour UserController

*   Notre première requête est la requête pour effectuer une inscription grâce à la fonction `create` dans notre `UserController`.  
Pour effectuer la requête qui passe par une route de type **POST**, il est nécessaire de donner les paramètres requis à une inscription dans notre cas il faut renseigner `login (username dans notre cas), password, email, name, firstname, age`.     
Si notre inscription s'est bien déroulée, les informations renseignées sont rentrées en base de données on retourne le message suivant `The user has been created` et le status est alors un 201.    
En revanche si il manque une des information requise un message d'erreur indiquant quels sont les paramètres manquants sera retourné tel que `"message": "The name field is required."` ainsi qu'un status 400.   
De même si un utilisateur rentre deux fois les mêmes données un message tel que ` "message": "The username has already been taken."` pour indiquer que les informations ne sont pas unique et un status 400 sont retournés.
*    >Pour tester cette requête on se place sur l'url /api/register de notre projet : `Route::post('/register', [UserController::class, 'create']);`

*   Nous avons ensuite une requête nous permettant de nous authentifier grâce à la fonction `auth` dans notre `UserController`.    
C'est aussi une route de type **POST** pour laquelle il faut fournir l'`email, password` de notre utilisateur.   
Si nous renseignons le bon mot de passe ainsi que la bonne adresse mail de notre compte nous obtenons en réponse un status `200` ainsi que le message `You have been authenticated`.   
Dans le cas ou nous oublions de renseigner une des information requise un message d'erreur indiquant quels sont les paramètres manquants sera retourné tel que `"message": "The email field is required.` ainsi qu'un status 400.   
Et enfin dans le cas où une des information rentrée serait éronnée nous obtenons un message d'erreur notifiant une invalidité tel que `"message": "The selected password is invalid."`et un status 400.
*    >Pour tester cette requête on se place sur l'url /api/auth de notre projet : `Route::post('/auth', [UserController::class, 'auth']);`

*   Et pour finir avec les requêtes liées au UserController nous avons la requête nous permettant de lister tous les utilisateurs avec la fonction `getAll` dans notre `UserController`. Dans ce cas là il s'agit d'une route de type **GET**.   
Dans le cas où tout se passe bien soit lorsqu'il existe des utilisateurs, tous les utilisateurs connus sont retournés sous forme de tableau avec le message `Here is the list of users` et nous avons un status `200`.   
En revanche dans le cas où il n'y a aucun utilisateurs existant nous avons fait en sorte de retourner un message d'erreur disant `There is no user` ainsi que le status 400.
*    >Pour tester cette requête on se place sur l'url /api/users de notre projet : `Route::get('/users', [UserController::class, 'getAll']);`

###    2. Requêtes pour RestaurantController

*   Pour commencer nous avons une requête permettant de récupérer la liste de tous les restaurants grâce à la fonction `getAll` dans notre `RestaurantController`. Il s'agit d'une route de type **GET**.   
Si tout se passe bien soit lorsqu'il existe des restaurants, tous les restaurants connus sont retournés sous forme de tableau avec le message `Here is the list of restaurants` et nous avons un status `200`.   
En revanche dans le cas où il n'y a aucun restaurants existants dans la base de données nous avons fait en sorte de retourner un message d'erreur disant `No restaurant` ainsi que le status 400
*    >Pour tester cette requête on se place sur l'url /api/restaurants de notre projet : `Route::get('/restaurants', [RestaurantController::class, 'getAll']);`

*   Ensuite nous avons une requête nous permettant de récupérer les informations d'un restaurant en fonction de son id grâce à la fonction `getByID` dans notre `RestaurantController`.    
Il s'agit là aussi d'une route de type **GET**.   
Quand tout se passe bien soit lorsqu'il y a bien un restaurant correspondant à l'id, alors le restaurant demandé est retourné sous forme de tableau avec le message `Here is the requested restaurant` et nous avons un status `200`.   
En revanche dans le cas où il n'existe pas de restaurant correspondant à l'id renseigné dans la base de données nous avons fait en sorte de retourner un message d'erreur disant `Restaurant not existing` ainsi que le status 400.
*    >Pour tester cette requête on se place sur l'url /api/restaurants/{id} de notre projet : `Route::get('/restaurants/{id}', [RestaurantController::class, 'getByID']);`

*   La requête suivante nous permet de supprimer un restaurant grâce à la fonction `destroy` dans notre `RestaurantController`.    
Il s'agit pour cette fois d'une route de type **DELETE**.   
Si l'on souhaite supprimer un restaurant qui n'existe pas nous retournons le message d'erreur suivant `The restaurant could not be deleted because it does not exist.` ainsi qu'un status 400.   
Par contre si l'on souhaite supprimer un restaurant dont l'existence est vérifiée via son id, nous avons fait en sorte de faire appel à tous les menus rattachés à ce restaurants afin de les supprimer et ainsi de supprimer le restaurant demandé. De ce fait, nous retournons le message `Restaurant deleted`et le status 200.
*    >Pour tester cette requête on se place sur l'url /api/restaurant/{id} de notre projet : `Route::delete('/restaurant/{id}', [RestaurantController::class, 'destroy']);`

*   La prochaine requête à pour but de créer un restaurant grâce à la fonction `create` dans notre `RestaurantController`.   
Pour effectuer la requête qui passe par une route de type **POST**, il est nécessaire de donner les paramètres requis à la création d'un restaurant dans notre cas il faut renseigner `name, description, grade, localization, phone_number, website, hours`.  
Dans le cas où la création du restaurant s'est bien déroulée, les informations renseignées sont rentrées en base de données, on retourne le message suivant `The restaurant has been created` et le status est alors un 201.   
En revanche si il manque une des information requise un message d'erreur indiquant quels sont les paramètres manquants sera retourné ainsi qu'un status 400.   
De même, si un utilisateur rentre deux fois les mêmes données un message pour indiquer que les informations ne sont pas unique tel que `"message": The phone number has already been taken.`et un status 400 sont retournés.
*    >Pour tester cette requête on se place sur l'url /api/restaurants de notre projet : `Route::post('/restaurants', [RestaurantController::class, 'create']);`

*   Pour finir nous avons une requête qui permet de modifier un restaurant grâce à la fonction `update` dans notre `RestaurantController`.    
Ici il s'agit d'une route de type **PUT**, il est donc nécessaire de fournir les paramètres suivants `name, description, grade, localization, phone_number, website, hours` afin de modifier les informations contenues dans la base de données.   
Dans le cas où tout s'est bien passé, donc si l'on souhaite modifier un restaurant qui existe et que l'on a bien précisé tous les champs requis à modifier alors nous retournons le message suivant `Modified restaurant`.   
En revanche si l'on tente de modifier un restaurant alors que celui ci n'existe pas nous retournons un message d'erreur indiquant que le restaurant n'existe pas  `The restaurant could not be modified because it does not exist.` ainsi qu'un status 400.   
Dans le cas ou nous oublions de renseigner une des information requise un message d'erreur indiquant quels sont les paramètres manquants sera retourné ainsi qu'un status 400.   
Et enfin, si l'utilisateur rentre un phone_number ou un website déjà présent dans la base de donné on lui retourne le message : `"message": "The phone number has already been taken."`
*    >Pour tester cette requête on se place à l'url api/restaurant/{id} de notre site de projet : `Route::put('/restaurant/{id}', [RestaurantController::class, 'update']);`

###    3. Requêtes pour MenuController

*   Pour commencer, nous avons une requête pour récupérer la liste des menus existants grâce à la fonction `getAll` dans notre `MenuController`.    
Dans ce cas là il s'agit d'une route de type **GET**.   
Dans le cas où tout se passe bien soit lorsqu'il existe des menus dans la base de données, tous les menus connus sont retournés sous forme de tableau avec le message `Here are the menus` et nous avons un status `200`.   
En revanche dans le cas où il n'y a aucun menus existant nous retournons un message d'erreur disant `No menu` ainsi que le status 400.   
*    >Pour tester cette requête on se place à l'url api/menus de notre site de projet : `Route::get('/menus', [MenuController::class, 'getAll']);`

*   La requête suivante a pour objectif de récupérer tous les menus correspondant à l'id d'un restaurant grâce à la fonction `All` dans notre `MenuController`.    
Il s'agit encore une fois d'une route de type **GET**.   
Quand tout se passe bien soit lorsqu'il existe des menus pour le restaurant donné, tous les menus concernés sont retournés sous forme de tableau avec le message `Here are the menus of the restaurant` et nous avons un status `200`.   
En revanche dans le cas où l'on aurait demandé de renvoyer les menus d'un restaurant qui n'existe pas nous avons fait en sorte de renvoyer le message `Restaurant not existing` ainsi qu'un status 400.   
Et dans le cas où il n'y a aucun menus existant pour un restaurant qui est lui existant nous retournons le message d'erreur suivant `No menu in this restaurant` ainsi que le status 400. 
*    >Pour tester cette requête on se place à l'url api/restaurants/{id}/menus de notre site de projet : `Route::get('/restaurants/{id}/menus', [MenuController::class, 'All']);`

*   La requête suivante nous permet de récupérer un menu précis en passant par son id grâce à la fonction `getByID` dans notre `MenuController`.    
Il s'agit là aussi d'une route de type **GET**.   
Si tout se passe bien soit lorsqu'il y a bien un menu correspondant à l'id, alors le menu demandé est retourné sous forme de tableau avec le message `Retrieve the menu corresponding to the given id` et nous avons un status `200`.  
A partir du moment où il n'existe pas de menu correspondant à l'id renseigné dans la base de donnée nous avons fait en sorte de retourner un message d'erreur disant `Menu does not exist` ainsi que le status 400.
*    >Pour tester cette requête on se place sur l'url /api/menus/{id} de notre projet : `Route::get('/menus/{id}', [MenuController::class, 'getByID']);`

*   Cette nouvelle requête à pour but de créer un menu pour un restaurant précis grâce à la fonction `create` dans notre `MenuController`.    
Pour effectuer la requête qui passe par une route de type **POST**, il est nécessaire de donner les paramètres requis à la création d'un menu dans notre cas il faut renseigner `name, description, price	`.   
Si la création du menu s'est bien déroulée, les informations renseignées sont rentrées en base de données on retourne le message suivant `The menu has been created` et le status est alors un 201.   
En revanche si il manque une des information requise un message d'erreur indiquant quels sont les paramètres manquants tel que `"message": "The name field is required."` sera retourné ainsi qu'un status 400.   
Nous avons fait en sorte de verifier si le restaurant est bien existant avant de lui créer un nouveau menu, si le restaurant n'existe pas nous retournons le message d'erreur suivant `The menu could not be created because the restaurant does not exist.` 
*    >Pour tester cette requête on se place sur l'url /api/restaurants/{id}/menus de notre projet : `Route::post('restaurants/{id}/menus', [MenuController::class, 'create']);`

*   La requête suivante nous permet de supprimer un menu grâce à la fonction `destroy` dans notre `MenuController`.   
Il s'agit pour cette fois d'une route de type **DELETE**.   
Dans le cas où l'on souhaite supprimer un menu qui n'existe pas nous retournons le message d'erreur suivant `The menu could not be deleted because it does not exist.` ainsi qu'un status 400.   
Mais quand on demande de supprimer un menu qui existe en vérifiant son id nous renvoyons le message `Deleted menu` ainsi que le status 200.
*    >Pour tester cette requête on se place sur l'url /api/menus/{id} de notre projet : `Route::delete('/menus/{id}', [MenuController::class, 'destroy']);`

*   Et pour finir, notre dernière requête nous permet de modifier un menu grâce à la fonction `update` dans notre `MenuController`.    
Ici il s'agit d'une route de type **PUT**, il est donc nécessaire de fournir les paramètres suivant `name, description, price` afin de modifier les informations contenues dans la base de données.   
Dans le cas où tout s'est bien passé, donc si l'on souhaite modifier un menu qui existe et que l'on a bien précisé tous les champs requis à modifier alors nous retournons le message suivant `Modified menu`. et le status 200   
En revanche si l'on tente de modifier un menu alors que celui ci n'existe pas nous retournons un message d'erreur indiquant que le menu demandé n'existe pas  `The menu could not be modified because it does not exist.` ainsi qu'un status 400.   
Dans le cas où nous oublions de renseigner une des information requise un message d'erreur indiquant quels sont les paramètres manquants sera retourné ainsi qu'un status 400.       
   *    > Pour tester cette requête on se place à l'url api/menus/{id} de notre site de projet : `Route::put('/menus/{id}', [MenuController::class, 'update']);`