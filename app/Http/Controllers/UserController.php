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

            "hmp_actors.index",

            "af_lugares_publicos.index",

            "avcs_lugares_publicos.index",

            "atisc_lugares_publicos.index",

            "otrs_actors.index",

            "ayuda_felcv.index",

            "ayuda_slim.index",

            "ayuda_dna.index",

            "ayuda_oi.index",

            "ayuda_familiar.index",

            "ayuda_amiga.index",

            "ayuda_amigo.index",

            "no_ayuda.index",

            "ayuda_pa.index",

            "no_ayuda_verguenza.index",

            "no_ayuda_sepa.index",

            "no_ayuda_miedo.index",

            "no_ayuda_amenaza.index",

            "no_ayuda_porfamilia.index",

            "no_ayuda_sinimportancia.index",

            "no_ayuda_nosabia.index",

            "no_ayuda_nocreejusticia.index",

            "no_ayuda_otromotivo.index",

            "denuncia_agresiones.index",

            "npdf_verguenza.index",

            "npdf_sepa.index",

            "npdf_miedo.index",

            "npdf_amenaza.index",

            "npdf_porfamilia.index",

            "npdf_sinimportancia.index",

            "npdf_nosabia.index",

            "npdf_nocreejusticia.index",

            "npdf_otromotivo.index",

            "atencion_medica_psicologica.index",

            "configuracions.index",
            "configuracions.create",
            "configuracions.edit",
            "configuracions.destroy",

            "reportes.usuarios",
        ],
        "ANALISTA DE DATOS" => [
            "importacions.index",
            "importacions.create",
            "importacions.edit",
            "importacions.destroy",

            "poblacion_mujers.index",

            "hmp_poblacions.index",

            "hmp_actors.index",

            "af_lugares_publicos.index",

            "avcs_lugares_publicos.index",

            "atisc_lugares_publicos.index",

            "otrs_actors.index",

            "ayuda_felcv.index",

            "ayuda_slim.index",

            "ayuda_dna.index",

            "ayuda_oi.index",

            "ayuda_familiar.index",

            "ayuda_amiga.index",

            "ayuda_amigo.index",

            "no_ayuda.index",

            "ayuda_pa.index",

            "no_ayuda_verguenza.index",

            "no_ayuda_sepa.index",

            "no_ayuda_miedo.index",

            "no_ayuda_amenaza.index",

            "no_ayuda_porfamilia.index",

            "no_ayuda_sinimportancia.index",

            "no_ayuda_nosabia.index",

            "no_ayuda_nocreejusticia.index",

            "no_ayuda_otromotivo.index",

            "denuncia_agresiones.index",

            "npdf_verguenza.index",

            "npdf_sepa.index",

            "npdf_miedo.index",

            "npdf_amenaza.index",

            "npdf_porfamilia.index",

            "npdf_sinimportancia.index",

            "npdf_nosabia.index",

            "npdf_nocreejusticia.index",

            "npdf_otromotivo.index",

            "atencion_medica_psicologica.index",
        ],
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
