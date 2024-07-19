<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HmpPoblacion extends Model
{
    use HasFactory;

    protected $table = "hmp_poblacion";

    protected $fillable = [
        "hombres",
        "conocidos",
        "mujeres",
        "distrito_id",
        "importacion_id",
        "mes_id",
        "anio_id"
    ];
}
