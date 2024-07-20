<?php

namespace App\Http\Controllers;

use App\Models\AfLugaresPublico;
use App\Models\Anio;
use App\Models\Distrito;
use App\Models\Mes;
use Illuminate\Http\Request;
use Inertia\Inertia;

class AfLugaresPublicoController extends Controller
{
    public function index()
    {
        return Inertia::render("AnalisisDatos/AfLugaresPublicos");
    }

    public function grafico(Request $request)
    {
        $filtro = $request->filtro;
        $distrito_id = $request->distrito_id;
        $gestion = $request->gestion;
        $gestion1 = $request->gestion1;
        $gestion2 = $request->gestion2;
        $gestion = (int)$gestion;


        $informacionArray = [];

        $distritos = Distrito::select("distritos.*");

        if ($distrito_id && $distrito_id != 'todos') {
            $distritos->where("id", $distrito_id);
        }
        $distritos = $distritos->get();

        $series = [];
        $categories = [];
        $array_info = [
            "hombres" => "Hombres",
            "conocidos" => "Conocidos",
            "desconocidos" => "Desconocidos",
            "mujeres" => "Mujeres",
        ];

        if ($filtro == 'todos') {

            $informacionArray = [
                [
                    "categories" => [],
                    "series" => [],
                    "titulo" => "Agresiones Físicas en lugares Públicos",
                    "subtitulo" => "Gestión " . $gestion,
                    "yText" => "Total",
                ]
            ];

            foreach ($array_info as $key_info => $info) {
                $data = [];
                foreach ($distritos as $distrito) {
                    if ($key_info == 'hombres') {
                        $informacionArray[0]["categories"][] = $distrito->nombre_distrito;
                    }

                    $total = AfLugaresPublico::select("af_lugares_publicos.*")
                        ->join("anios", "anios.id", "=", "af_lugares_publicos.anio_id")
                        ->where("anios.anio", $gestion)
                        ->where("distrito_id", $distrito->id)->sum($key_info);
                    $data[] = (float)$total;
                }
                $informacionArray[0]["series"][] = [
                    "name" => $info,
                    "data" => $data
                ];
            }
        } else {
            $data = [];
            switch ($filtro) {
                case 'comparargestion':
                    $gestion1 = (int)$gestion1;
                    $gestion2 = (int)$gestion2;
                    if ($gestion1 && $gestion2 && $gestion1 > 0 && $gestion2 > 0) {


                        $informacionArray = [
                            [
                                "categories" => [],
                                "series" => [],
                                "titulo" => "Agresiones Físicas en lugares Públicos",
                                "subtitulo" => "Gestión " . $gestion1,
                                "yText" => "Total",
                            ],
                            [
                                "categories" => [],
                                "series" => [],
                                "titulo" => "Agresiones Físicas en lugares Públicos",
                                "subtitulo" => "Gestión " . $gestion2,
                                "yText" => "Total",
                            ]
                        ];

                        foreach ($array_info as $key_info => $info) {
                            $data1 = [];
                            $data2 = [];
                            foreach ($distritos as $distrito) {
                                if ($key_info == 'hombres') {
                                    $informacionArray[0]["categories"][] = $distrito->nombre_distrito;
                                    $informacionArray[1]["categories"][] = $distrito->nombre_distrito;
                                }

                                $total1 = AfLugaresPublico::select("af_lugares_publicos.*")
                                    ->join("anios", "anios.id", "=", "af_lugares_publicos.anio_id")
                                    ->where("anios.anio", $gestion1)
                                    ->where("distrito_id", $distrito->id)->sum($key_info);
                                $data1[] = (float)$total1;
                                $total2 = AfLugaresPublico::select("af_lugares_publicos.*")
                                    ->join("anios", "anios.id", "=", "af_lugares_publicos.anio_id")
                                    ->where("anios.anio", $gestion2)
                                    ->where("distrito_id", $distrito->id)->sum($key_info);
                                $data2[] = (float)$total2;
                            }
                            $informacionArray[0]["series"][] = [
                                "name" => $info,
                                "data" => $data1
                            ];
                            $informacionArray[1]["series"][] = [
                                "name" => $info,
                                "data" => $data2
                            ];
                        }
                    }
                    break;
                case 'mensual':
                    if ($gestion > 0) {
                        $meses = Mes::all();

                        $informacionArray = [];
                        foreach ($meses as $key_registro => $mes) {
                            $informacionArray[] = [
                                "categories" => [],
                                "series" => [],
                                "titulo" => "Agresiones Físicas en lugares Públicos",
                                "subtitulo" => $mes->mes . " - " . $gestion,
                                "yText" => "Total",
                            ];
                            foreach ($array_info as $key_info => $info) {
                                $data = [];
                                foreach ($distritos as $distrito) {
                                    if ($key_info == 'hombres') {
                                        $informacionArray[$key_registro]["categories"][] = $distrito->nombre_distrito;
                                    }

                                    $total = AfLugaresPublico::select("af_lugares_publicos.*")
                                        ->join("anios", "anios.id", "=", "af_lugares_publicos.anio_id")
                                        ->where("af_lugares_publicos.mes_id", $mes->id)
                                        ->where("anios.anio", $gestion)
                                        ->where("distrito_id", $distrito->id)->sum($key_info);
                                    $data[] = (float)$total;
                                }
                                $informacionArray[$key_registro]["series"][] = [
                                    "name" => $info,
                                    "data" => $data
                                ];
                            }
                        }
                    }
                    break;
                case 'trimestral':
                    if ($gestion > 0) {
                        $meses = Mes::all();
                        $categories = ["Trim. 1", "Trim. 2", "Trim. 3", "Trim. 4"];

                        $trimestres = [
                            [1, 2, 3],
                            [4, 5, 6],
                            [7, 8, 9],
                            [10, 11, 12],
                        ];
                        $informacionArray = [];

                        foreach ($categories as $key_registro => $trim) {
                            $informacionArray[] = [
                                "categories" => [],
                                "series" => [],
                                "titulo" => "Agresiones Físicas en lugares Públicos",
                                "subtitulo" => $trim . " - " . $gestion,
                                "yText" => "Total",
                            ];

                            foreach ($array_info as $key_info => $info) {
                                $data = [];
                                foreach ($distritos as $distrito) {
                                    if ($key_info == 'hombres') {
                                        $informacionArray[$key_registro]["categories"][] = $distrito->nombre_distrito;
                                    }

                                    $total = AfLugaresPublico::select("af_lugares_publicos.*")
                                        ->join("anios", "anios.id", "=", "af_lugares_publicos.anio_id")
                                        ->whereIn("af_lugares_publicos.mes_id", $trimestres[$key_registro])
                                        ->where("anios.anio", $gestion)
                                        ->where("distrito_id", $distrito->id)->sum($key_info);
                                    $data[] = (float)$total;
                                }
                                $informacionArray[$key_registro]["series"][] = [
                                    "name" => $info,
                                    "data" => $data
                                ];
                            }
                        }
                    }
                    break;
                case 'anual':
                    $anios = Anio::orderBY("anio", "asc")->get();
                    $informacionArray = [];
                    foreach ($anios as $key_registro => $anio) {
                        $informacionArray[] = [
                            "categories" => [],
                            "series" => [],
                            "titulo" => "Agresiones Físicas en lugares Públicos",
                            "subtitulo" => "Gestión " . $gestion,
                            "yText" => "Total",
                        ];
                        foreach ($array_info as $key_info => $info) {
                            $data = [];
                            foreach ($distritos as $distrito) {
                                if ($key_info == 'hombres') {
                                    $informacionArray[$key_registro]["categories"][] = $distrito->nombre_distrito;
                                }

                                $total = AfLugaresPublico::select("af_lugares_publicos.*")
                                    ->where("af_lugares_publicos.anio_id", $anio->id)
                                    ->where("distrito_id", $distrito->id)->sum($key_info);
                                $data[] = (float)$total;
                            }
                            $informacionArray[$key_registro]["series"][] = [
                                "name" => $info,
                                "data" => $data
                            ];
                        }
                    }
                    break;
            }
        }

        return response()->JSON([
            "informacionArray" => $informacionArray,
        ]);
    }
}
