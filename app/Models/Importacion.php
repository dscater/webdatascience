<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Importacion extends Model
{
    use HasFactory;

    protected $table = "importaciones";
    public $timestamps = false;
    protected $fillable = [
        "archivo",
        "fecha"
    ];
}
