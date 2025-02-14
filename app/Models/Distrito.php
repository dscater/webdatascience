<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Distrito extends Model
{
    use HasFactory;

    protected $fillable = ["distrito"];


    protected $appends = ["nombre_distrito"];

    public function getNombreDistritoAttribute()
    {
        return self::getNameDistrito($this->distrito);
    }

    public static function getNameDistrito($distrito)
    {
        $listDistritos = [
            "3" => "DISTRITO 3",
            "4" => "DISTRITO 4",
            "5" => "DISTRITO 5",
            "6" => "DISTRITO 6",
        ];

        if ($listDistritos[$distrito]) {
            return $listDistritos[$distrito];
        };
        return "";
    }
}
