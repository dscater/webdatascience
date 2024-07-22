<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AyudaDna extends Model
{
    use HasFactory;
    protected $table = "ayuda_dna";

    protected $fillable = [
        "cantidad",
        "distrito_id",
        "importacion_id",
        "mes_id",
        "anio_id"
    ];
}
