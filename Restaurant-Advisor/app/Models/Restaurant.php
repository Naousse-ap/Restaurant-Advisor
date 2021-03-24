<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Restaurant extends Model
{
    use HasFactory;
    protected $table = 'Restaurant';
    protected $fillable = [
        'id',
        'name',
        'description',
        'grade',
        'localization',
        'phone_number',
        'website',
        'hours',
        'picture',
    ];

    protected $hidden = [
    ];
}
