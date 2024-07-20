<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HmpActor extends Model
{
    use HasFactory;

    protected $table = "hmp_actores";

    protected $fillable = [
        "esposo",
        "conyugue",
        "pareja",
        "desconocidos",
        "exnovio",
        "distrito_id",
        "importacion_id",
        "mes_id",
        "anio_id"
    ];
}
