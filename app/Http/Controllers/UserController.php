<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use App\Models\Egreso;
use App\Models\Ingreso;
use App\Models\Producto;
use App\Models\Proveedor;
use App\Models\Salida;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{


    public static $permisos = [
        "ADMINISTRADOR" => [
            "usuarios.index",
            "usuarios.create",
            "usuarios.edit",
            "usuarios.destroy",

            "importacions.index",
            "importacions.create",
            "importacions.edit",
            "importacions.destroy",

            "poblacion_mujers.index",

            "hmp_poblacions.index",

            "configuracions.index",
            "configuracions.create",
            "configuracions.edit",
            "configuracions.destroy",

            "reportes.usuarios",
        ],
        "ANALISTA DE DATOS" => [],
    ];

    public static function getPermisosUser()
    {
        $array_permisos = self::$permisos;
        if ($array_permisos[Auth::user()->tipo]) {
            return $array_permisos[Auth::user()->tipo];
        }
        return [];
    }


    public static function verificaPermiso($permiso)
    {
        if (in_array($permiso, self::$permisos[Auth::user()->tipo])) {
            return true;
        }
        return false;
    }

    public function permisos(Request $request)
    {
        return response()->JSON([
            "permisos" => $this->permisos[Auth::user()->tipo]
        ]);
    }

    public function getUser()
    {
        return response()->JSON([
            "user" => Auth::user()
        ]);
    }

    public static function getInfoBoxUser()
    {
        $tipo = Auth::user()->tipo;
        $array_infos = [];
        if (in_array('usuarios.index', self::$permisos[$tipo])) {
            $array_infos[] = [
                'label' => 'Usuarios',
                'cantidad' => count(User::where('id', '!=', 1)->get()),
                'color' => 'bg-principal text-white',
                'icon' => asset("imgs/icon_users.png"),
                "url" => "usuarios.index"
            ];
        }
        if (in_array('categorias.index', self::$permisos[$tipo])) {
            $array_infos[] = [
                'label' => 'Categorías',
                'cantidad' => count(Categoria::all()),
                'color' => 'bg-light-blue-lighten-4',
                'icon' => asset("imgs/checklist.png"),
                "url" => "categorias.index"
            ];
        }


        if (in_array('ingresos.index', self::$permisos[$tipo])) {
            $array_infos[] = [
                'label' => 'Ingresos Económicos',
                'cantidad' => count(Ingreso::all()),
                'color' => 'bg-green-lighten-4',
                'icon' => asset("imgs/documentos.png"),
                "url" => "ingresos.index"
            ];
        }


        if (in_array('egresos.index', self::$permisos[$tipo])) {
            $array_infos[] = [
                'label' => 'Egresos Económicos',
                'cantidad' => count(Egreso::all()),
                'color' => 'bg-red-lighten-4',
                'icon' => asset("imgs/documentos.png"),
                "url" => "egresos.index"
            ];
        }


        return $array_infos;
    }
}
