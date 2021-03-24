<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    use HasFactory;
    protected $table = 'Menu';

    protected $fillable = [
        'id',
        'name',
        'description',
        'price',
        'picture',
        'restaurant_id'
    ];

}
