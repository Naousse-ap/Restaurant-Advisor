<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Seeder;

class MenuSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('menu')->insert([
            'name' => "Line whiting of Saint-Gilles-Croix-De-Vie",
            'description' => "Crumb bread crust printed with almonds, semi-cooked tetragona spiced with curry oil and pequillos",
            'price' => 75,
            'restaurant_id' => 1,
            'picture' => "https://www.oetkercollection.com/media/34784/le-bristol-paris-114faubourg-artichokesoup.jpg?anchor=center&mode=crop&quality=85&width=1000&height=500&rnd=132576132780000000"
        ]);

        DB::table('menu')->insert([
            'name' => "Saddle of suckling lamb",
            'description' => "Nori-crusted roast, roast juice, herb gnocchi, colander purée",
            'price' => 95,
            'restaurant_id' => 1,
            'picture' => "https://www.oetkercollection.com/media/34783/le-bristol-paris-114faubourg-mille-feuilles.jpg?anchor=center&mode=crop&quality=85&width=1000&height=500&rnd=132576132780000000"
        ]);

        DB::table('menu')->insert([
            'name' => "Poularde de bresse cooked in bladder",
            'description' => "Supremes cooked in yellow wine, crayfish, giblets and chanterelles, legs cooked in wild mushroom broth",
            'price' => 290,
            'restaurant_id' => 1,
            'picture' => "https://www.oetkercollection.com/media/34785/le-bristol-paris-114faubourg-kingcrabs.jpg?anchor=center&mode=crop&quality=85&width=1000&height=500&rnd=132576132790000000"
        ]);

        DB::table('menu')->insert([
            'name' => "Lunch Menu",
            'description' => "Snails & octopus confit onion petals stuffed with herbs + green apple sorbet",
            'price' => 85,
            'restaurant_id' => 2,
            'picture' => "https://www.lameloise.fr/fichiers/plat-signature-lameloise-1.jpg"
        ]);

        DB::table('menu')->insert([
            'name' => "Instant menu",
            'description' => "Charolais beef, creamy foie gras and lentils from the Châtillonnais region + Golden scallops",
            'price' => 75,
            'restaurant_id' => 2,
            'picture' => "https://www.lameloise.fr/fichiers/restaurant-3-etoiles-lameloise-1.jpg"
        ]);

        DB::table('menu')->insert([
            'name' => "Breton Menu",
            'description' => "A Breton sausage + 1 Celtic pancake (potatoes, camembert, andouille de Guémené, salad) + 1 homemade hot chocolate and whipped cream pancake ",
            'price' => 20.5,
            'restaurant_id' => 3,
            'picture' => "https://cac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fcac.2F2020.2F10.2F26.2F6a10a3a0-f20f-49c3-b398-0fe1c4c5b569.2Ejpeg/750x562/quality/80/crop-from/center/cr/wqkgUGxvdG9uIC8gUGhvdG9jdWlzaW5lIC8gQ3Vpc2luZSBBY3R1ZWxsZQ%3D%3D/galette-a-la-saucisse-pomme-de-terre-et-oignons-de-roscoff.jpeg"
        ]);

        DB::table('menu')->insert([
            'name' => "Discovery Menu",
            'description' => "One egg and vegetable pancake + 1 Nordic pancake (smoked salmon, fresh cream, lemon slice) + 1 homemade caramel and salted butter pancake with whipped cream",
            'price' => 18.5,
            'restaurant_id' => 3,
            'picture' => "https://img.mesrecettesfaciles.fr/wp-content/uploads/2017/01/galettesaumon-1000x500.jpg"
        ]);
        
        DB::table('menu')->insert([
            'name' => "Beach Menu",
            'description' => "Caesar salad or Rillettes of saithe with lime + Moules marinières, home fries, pan-fried vegetables + Two scoops of ice cream",
            'price' => 22,
            'restaurant_id' => 4,
            'picture' => "https://static.750g.com/images/640-420/54460e06fcc6df3028d638129913d7a0/moules-frites.jpg"
        ]);

        DB::table('menu')->insert([
            'name' => "100% homemade children's menu",
            'description' => "Hamburger and home fries + Ice cream + Water syrup : Strawberry, Grenadine, Mint, Lemon",
            'price' => 9,
            'restaurant_id' => 4,
            'picture' => "https://i.notrefamille.com/1600x0/smart/2016/12/09/330487-original.jpg"
        ]);

        DB::table('menu')->insert([
            'name' => "Pasta menu",
            'description' => "Linguine alla carrettiera(Homemade linguine, garlic, peppers, olive oil)",
            'price' => 14,
            'restaurant_id' => 5,
            'picture' => "https://www.cucchiaio.it/content/cucchiaio/it/ricette/2019/10/pasta-alla-carrettiera/jcr:content/imagePreview.img10.jpg/1574417792694.jpg"
        ]);

        DB::table('menu')->insert([
            'name' => "Menu day",
            'description' => "Caprese (Tomates, mozzarella, basilic) + Escalope de poulet alla parmigiana",
            'price' => 17,
            'restaurant_id' => 5,
            'picture' => "https://www.boblechef.com/wp-content/uploads/2013/02/bob-le-chef-recette-escalope-porc-parmigiana.jpg"
        ]);

        DB::table('menu')->insert([
            'name' => "Lunch menu",
            'description' => "Butternut squash soup with cumin + Duck confit, homemade purée",
            'price' => 17.5,
            'restaurant_id' => 6,
            'picture' => "https://wordpress.potagercity.fr/wp-content/uploads/2019/01/butternut-58adaba82eb93.png"
        ]);

        DB::table('menu')->insert([
            'name' => "Garden menu",
            'description' => "Goat's cheese salad (warm goat's cheese and honey toast, mushroom, tomato, cucumber, raw ham, crunchy salad)",
            'price' => 13,
            'restaurant_id' => 6,
            'picture' => "https://cdn.pratico-pratiques.com/app/uploads/sites/4/2018/08/30183057/salade-de-chevre-chaud.jpeg"
        ]);

        DB::table('menu')->insert([
            'name' => "3-step menu",
            'description' => "Assorted cold cuts + fish with rice + tiramisu",
            'price' => 39,
            'restaurant_id' => 7,
            'picture' => "https://www.galbani.fr/wp-content/uploads/2017/07/le_veritable_tiramisu_par_il_gusto_italiano_0.png"
        ]);

        DB::table('menu')->insert([
            'name' => "5-step menu",
            'description' => "Foie gras, vegetables, fish, first dessert, second dessert",
            'price' => 59,
            'restaurant_id' => 7,
            'picture' => "https://www.bosto.be/wp-content/uploads/2015/04/Lassie_RECEPT225-Vietnamese_vis_knoflookrijst-1068x800.jpg"
        ]);

        DB::table('menu')->insert([
            'name' => "Buffalina Pizza Menu",
            'description' => "Tomato, margot base (grated emmental and mazzarella), DOP mozzarella, black olives, oregano",
            'price' => 12,
            'restaurant_id' => 8,
            'picture' => "https://media-cdn.tripadvisor.com/media/photo-s/0e/8a/d2/82/pizza-bufalina-tomates.jpg"
        ]);


        DB::table('menu')->insert([
            'name' => "Menu Pizza la Plouki",
            'description' => "Cream, margot base (grated emmental and mazzarella), lardons, talaggio DOP, caramelized onions, arugula",
            'price' => 14,
            'restaurant_id' => 8,
            'picture' => "https://cac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fcac.2F2018.2F09.2F25.2F053d7c0f-ac87-4796-a3ee-efee425dfe23.2Ejpeg/750x562/quality/80/crop-from/center/cr/wqkgUm91bGllci1UdXJpb3QvIFN1Y3LDqSBTYWzDqSAvIEN1aXNpbmUgQWN0dWVsbGU%3D/pizza-blanche-aux-oignons-et-lardons.jpeg"
        ]);
        
        DB::table('menu')->insert([
            'name' => "Nikkei menu",
            'description' => "8 Samba Lima / 8 Samba Acho",
            'price' => 13.9,
            'restaurant_id' => 9,
            'picture' => "https://i2.wp.com/tarpin-bien.com/wp-content/uploads/2020/10/cotesushi2.jpg?ssl=1"
        ]);

        DB::table('menu')->insert([
            'name' => "Salmon Dream Menu",
            'description' => "4 sushi salmon / 8 garden salmon / 8 california salmon avocado",
            'price' => 15.5,
            'restaurant_id' => 9,
            'picture' => "https://lh3.googleusercontent.com/proxy/B7UTp0mYvMl-wdkslsUIOEO6RxPXHwMZI7YOWmlvKTzDqxSK0NK1iK7Kc0wk0jpz-T3sTXNIpEOc5mQbE7NpcSgicu471sSpVMHm4nPsd3sG9GVGHT5dc0tR"
        ]);

        DB::table('menu')->insert([
            'name' => "Salty Pancakes Menu",
            'description' => "Ham and Emmental sandwich",
            'price' => 16.5,
            'restaurant_id' => 10,
            'picture' => "https://www.schaer.com/sites/default/files/styles/header/public/2017-07/1827_Panquecas%20de%20queijo%20e%20presunto.jpg?itok=68I7NBQM"
        ]);

        DB::table('menu')->insert([
            'name' => "Brunch Menu",
            'description' => "Assortment of 2 salted pancakes + 2 plain pancakes, 1 topping of your choice + A hot drink + A fresh fruit juice or a frappé",
            'price' => 21,
            'restaurant_id' => 10,
            'picture' => "https://www.auxdelicesdupalais.net/wp-content/uploads/2020/06/pancakes-fluffy-2.jpg"
        ]);

        DB::table('menu')->insert([
            'name' => "Best Of Menu",
            'description' => "6 nuggets + Frites + Boisson",
            'price' => 7.5,
            'restaurant_id' => 11,
            'picture' => "https://i.ytimg.com/vi/sMWNPqAUaBc/maxresdefault.jpg"
        ]);

        DB::table('menu')->insert([
            'name' => "Maxi Best Of Menu",
            'description' => "Big Mac + Frites + Boisson",
            'price' => 11,
            'restaurant_id' => 11,
            'picture' => "https://www.sohealthy.fr/wp-content/uploads/2017/06/mcdo-calories-menu-770x560.jpg"
        ]);
    }
}

