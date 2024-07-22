<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NoAyudaSepa extends Model
{
    use HasFactory;

    protected $table = "no_ayuda_sepa";

    protected $fillable = [
        "cantidad",
        "distrito_id",
        "importacion_id",
        "mes_id",
        "anio_id"
    ];
}
