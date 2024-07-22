<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AtiscLugaresPublico extends Model
{
    use HasFactory;

    protected $table = "atisc_lugares_publicos";

    protected $fillable = [
        "hombres",
        "conocidos",
        "desconocidos",
        "mujeres",
        "distrito_id",
        "importacion_id",
        "mes_id",
        "anio_id"
    ];
}
