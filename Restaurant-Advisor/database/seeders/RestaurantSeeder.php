<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RestaurantSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
    
        DB::table('restaurant')->insert([
            'name' => "Le Bristol",
            'description' => "This chic brasserie within the Bristol premises has a sumptuous interior with gilded columns, floral motifs and a grand staircase. Enjoy dishes from the classic brasserie menu cooked with care and great taste.",
            'grade' => "4.5",
            'localization' => "114 rue du Faubourg Saint Honore, 75008 Paris France",
            'phone_number' => "01 53 43 43 00",
            'website' => "https://www.oetkercollection.com/fr/hotels/le-bristol-paris/restaurants-et-bar/114-faubourg/",
            'hours' => "Monday to Friday from 12:00 to 14:00. Monday to Saturday from 6:30 pm to 9:00 pm. Last order at 8:00 pm",
            'picture' => "https://u.tfstatic.com/restaurant_photos/345/291345/169/612/le-114-faubourg-le-bristol-paris-suggestion-d-entree-dd9b9.jpg"
        ]);

        DB::table('restaurant')->insert([
            'name' => "Maison Lameloise",
            'description' => "Supported by a talented team, Éric Pras creates subtle dishes and revisits the basic classics with which this illustrious establishment has become known. A great name in French gastronomy that never ceases to amaze. The perfect place for a truly memorable dining experience.",
            'grade' => "5",
            'localization' => "36 place d'Armes, 71150, Chagny France",
            'phone_number' => "03 85 87 65 65",
            'website' => "https://www.lameloise.fr/",
            'hours' => "Thursday to Monday 12:00-13:00, 19:30-21:00. Closed Tuesday and Wednesday",
            'picture' => "https://www.lameloise.fr/fichiers/grandesalle4contenu.2018.png"
        ]);

        DB::table('restaurant')->insert([
            'name' => "Crêperie Le Tournesol",
            'description' => "In Saint-Malo, in the heart of the corsair city, Intra-Muros, near the Mont Saint Michel, the creperie Le Tournesol welcomes you in its traditional restaurant or on its sunny terrace.the creperie Le Tournesol invites you to taste its crepes and pancakes of Brittany, its artisanal and farm products",
            'grade' => "4.5",
            'localization' => "4 rue des marins, 35400, Saint-Malo France",
            'phone_number' => "02 99 40 36 23",
            'website' => "https://www.creperie-saint-malo.com/",
            'hours' => "Tuesday-Sunday 11AM–10PM, Monday Closed",
            'picture' => "https://media-cdn.tripadvisor.com/media/photo-s/01/f1/87/3e/terrasse-de-la-creperie.jpg"
        ]);

        DB::table('restaurant')->insert([
            'name' => "Paparazzo",
            'description' => "Popular summer canteen where friends from all walks of life meet in a joyfully welcoming atmosphere, where we serve products selected from our fishermen friends, producers, wine growers, giving preference to organic, as soon as possible, to local, as far as possible.",
            'grade' => "4.5",
            'localization' => "Pôle Nautique des Chalets, 11430 Gruissan France",
            'phone_number' => "04 68 65 25 10",
            'website' => "http://www.lepaparazzo.fr/",
            'hours' => "From April to October, every day from 10 am to 1:30 am",
            'picture' => "https://media-cdn.tripadvisor.com/media/photo-o/0f/51/62/96/emplacement-privilegie.jpg"
        ]);

        DB::table('restaurant')->insert([
            'name' => "L'Oliveto Paris",
            'description' => "Discover the best of Italian cuisine in the heart of Saint-Germain des Prés, at 38 rue de Buci in the 6th arrondissement. You will taste a typical southern Italian cuisine, generous, based on fresh products and full of sun and flavors. Vegetables, meat and fish, pasta and pizzas are prepared with care and love, just like at home.",
            'grade' => "4.5",
            'localization' => "38 rue de Buci Boulevard Saint Germain/Rue de Buci, 75006 Paris France",
            'phone_number' => "01 46 33 91 15",
            'website' => "http://loliveto-paris.fr/",
            'hours' => "Sunday to Thursday: 12 to 2:30 pm - 7 to 11 pm. Friday and Saturday 12:00 to 2:30 pm - 7:00 to 11:30 pm",
            'picture' => "https://res.cloudinary.com/tf-lab/image/upload/w_600,h_337,c_fill,g_auto:subject,q_auto,f_auto/restaurant/4aef66f2-259e-4c46-9b43-093091ec93c0/61ecfcc9-5c65-450c-895c-4b8d456bf450.jpg"
        ]);

        DB::table('restaurant')->insert([
            'name' => "Il Etait Un Square",
            'description' => "Our bistro is a friendly place in the Corvisart district where a peaceful and curious atmosphere prevails. Located in front of the square René Le Gall and on the place de la bergère d'Ivry; the countryside in Paris.",
            'grade' => "5",
            'localization' => "54, Rue Corvisart, 75013 Paris France",
            'phone_number' => "01 43 37 68 07",
            'website' => "http://www.iletaitunsquare.com/accueil.html",
            'hours' => "MONDAY to SATURDAY 12:00 to 14:00. WEDNESDAY to SATURDAY 7:00 pm to 9:30 pm",
            'picture' => "https://lh3.googleusercontent.com/proxy/U7PzOZCi_16mJkq5fFlolSCwanFjt50l5wHW8-i2trYUfjwAC-3W_6lT1TGBy4fmvymhAhtjpHyQpmTM31u9acTmFdRQqb8OSZ2z7ykp2oGyHg"
        ]);

        DB::table('restaurant')->insert([
            'name' => "La Table de Colette",
            'description' => "Near the Pantheon, an eco-responsible restaurant run by Josselin Marie, a chef of Breton origin. He honors seasonal products - many vegetables, little meat, fish from 'passive' fishing - in the form of surprise menus, with their carbon footprint displayed. A young and pleasant team in charge of the service.",
            'grade' => "5",
            'localization' => "17 rue Laplace, 75005 Paris France",
            'phone_number' => "01 46 33 18 59",
            'website' => "https://www.latabledecolette.fr/",
            'hours' => "Monday-Friday 12h00 - 14h00 et 19h30 - 21h15, Saturday and Sunday Closed",
            'picture' => "https://media-cdn.tripadvisor.com/media/photo-s/1c/1c/08/98/notre-salle-de-restaurant.jpg"
        ]);

        DB::table('restaurant')->insert([
            'name' => "Les Cancres",
            'description' => "Two former dunces who set up their restaurant in front of a high school, the story is mischievous... And two brothers who freely pay homage to their Italian roots in the plate, the story is delicious! With enthusiasm, the two brothers will take the time to make you taste their pizzas. In this new adventure, they hope to become the best in the class to delight you...",
            'grade' => "5",
            'localization' => "3 rue David Johnston, 33000, Bordeaux France",
            'phone_number' => "05 57 22 06 63",
            'website' => "https://restolescancres.fr/",
            'hours' => "Tuesday-Sunday 12h00 - 22h00, Monday Closed",
            'picture' => "https://res.cloudinary.com/tf-lab/image/upload/restaurant/b4e28f91-ad1f-458c-b632-dcec9795914a/553d25c9-aef5-4fb3-b7de-37f76b6ff3f0.jpg"
        ]);

        DB::table('restaurant')->insert([
            'name' => "Côté Sushi Bordeaux",
            'description' => "Laissez-vous surprendre par les saveurs d’un sushi à Bordeaux que vous croyez connaître par cœur. Entrez dans un univers culinaire original, véritable lien entre deux cultures. Côté Sushi Bordeaux vous propose de découvrir la cuisine Nikkei, une gastronomie étonnante née de la rencontre du Japon et du Pérou.",
            'grade' => "4",
            'localization' => "2 Place Fernand Lafargue, 33000, Bordeaux France",
            'phone_number' => "05 33 06 04 44",
            'website' => "https://cotesushi.com/carte",
            'hours' => "Monday-Sunday 6AM–10PM",
            'picture' => "https://www.toute-la-franchise.com/images/zoom/franchise-cote-sushi-bordeaux.jpg"
        ]);

        DB::table('restaurant')->insert([
            'name' => "La Collation",
            'description' => "Juste derrière la célèbre Grosse Cloche de Bordeaux, La Collation vous propose un brunch autour des pancakes !",
            'grade' => "4.5",
            'localization' => "5 rue de Guienne, 33000, Bordeaux France",
            'phone_number' => "09 73 56 46 20",
            'website' => "https://lacollation.fr/",
            'hours' => "Du lundi au samedi 11h00 - 18h00, Le dimanche 10h30 - 15h00 et Fermé le Jeudi",
            'picture' => "https://media-cdn.tripadvisor.com/media/photo-w/14/f9/d5/5c/la-collation.jpg"
        ]);

        DB::table('restaurant')->insert([
            'name' => "MacDonald's",
            'description' => "Classic, long-running fast-food chain known for its burgers, fries & shakes.",
            'grade' => "3.2",
            'localization' => "Centre Commercial Grand Ciel, 30 Boulevard Paul Vaillant Couturier, 94200 Ivry-sur-Seine",
            'phone_number' => "01 49 60 62 60",
            'website' => "https://www.mcdonalds.fr/",
            'hours' => "Monday-Saturday 9AM–9PM, Sunday Closed",
            'picture' => "https://pbs.twimg.com/profile_images/879963999034634240/1nivJg7U.jpg"
        ]);

    }
}
