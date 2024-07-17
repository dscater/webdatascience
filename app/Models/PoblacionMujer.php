<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PoblacionMujer extends Model
{
    use HasFactory;

    protected $table = "poblacion_mujeres";

    protected $fillable = [
        "cantidad",
        "distrito_id",
        "importacion_id",
        "mes_id",
        "anio_id"
    ];
}
