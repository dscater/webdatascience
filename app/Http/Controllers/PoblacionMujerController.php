<?php

namespace App\Http\Controllers;

use App\Models\Anio;
use App\Models\Distrito;
use App\Models\Mes;
use App\Models\PoblacionMujer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class PoblacionMujerController extends Controller
{
    public function index()
    {
        return Inertia::render("AnalisisDatos/PoblacionMujers");
    }

    public function grafico(Request $request)
    {
        $filtro = $request->filtro;
        $distrito_id = $request->distrito_id;
        $gestion = $request->gestion;
        $gestion1 = $request->gestion1;
        $gestion2 = $request->gestion2;
        $gestion = (int)$gestion;

        $distritos = Distrito::select("distritos.*");

        if ($distrito_id && $distrito_id != 'todos') {
            $distritos->where("id", $distrito_id);
        }
        $distritos = $distritos->get();

        $series = [];
        $categories = [];

        if ($filtro == 'todos') {
            $data = [];
            foreach ($distritos as $distrito) {
                $total = PoblacionMujer::where("distrito_id", $distrito->id)->sum("cantidad");

                $data[] = [Distrito::getNameDistrito($distrito->distrito), (float)$total];
            }
        } else {
            $data = [];
            switch ($filtro) {
                case 'comparargestion':
                    $gestion1 = (int)$gestion1;
                    $gestion2 = (int)$gestion2;
                    if ($gestion1 && $gestion2 && $gestion1 > 0 && $gestion2 > 0) {
                        $categories = [$gestion1, $gestion2];

                        $series = [];

                        foreach ($distritos as $item) {
                            $total1 = PoblacionMujer::select("poblacion_mujeres.cantidad")
                                ->join("anios", "anios.id", "=", "poblacion_mujeres.anio_id")
                                ->where("poblacion_mujeres.distrito_id", $item->id)
                                ->where("anios.anio", $categories[0])
                                ->sum("poblacion_mujeres.cantidad");

                            $total2 = PoblacionMujer::select("poblacion_mujeres.cantidad")
                                ->join("anios", "anios.id", "=", "poblacion_mujeres.anio_id")
                                ->where("poblacion_mujeres.distrito_id", $item->id)
                                ->where("anios.anio", $categories[1])
                                ->sum("poblacion_mujeres.cantidad");

                            $data = [(float)$total1, (float)$total2];

                            $series[] = [
                                "name" => $item->nombre_distrito,
                                "data" => $data
                            ];
                        }
                    }
                    break;
                case 'mensual':
                    if ($gestion > 0) {
                        $meses = Mes::all();

                        foreach ($distritos as $distritos_index => $item) {
                            $data = [];
                            foreach ($meses as $key_mes => $mes) {
                                if ($distritos_index == 0) {
                                    $categories[] = $mes->mes;
                                }
                                $total = PoblacionMujer::select("poblacion_mujeres.cantidad")
                                    ->join("anios", "anios.id", "=", "poblacion_mujeres.anio_id")
                                    ->where("poblacion_mujeres.distrito_id", $item->id)
                                    ->where("anios.anio", $gestion)
                                    ->where("poblacion_mujeres.mes_id", $mes->id)
                                    ->sum("poblacion_mujeres.cantidad");

                                $data[] = (float)$total;
                            }
                            $series[] = [
                                "name" => $item->nombre_distrito,
                                "data" => $data
                            ];
                        }
                    }
                    break;
                case 'trimestral':
                    if ($gestion > 0) {
                        $meses = Mes::all();
                        $categories = ["Trim. 1", "Trim. 2", "Trim. 3", "Trim. 4"];

                        $trimestre1 = [1, 2, 3];
                        $trimestre2 = [4, 5, 6];
                        $trimestre3 = [7, 8, 9];
                        $trimestre4 = [10, 11, 12];

                        foreach ($distritos as $distritos_index => $item) {
                            $data = [];
                            $total1 = PoblacionMujer::select("poblacion_mujeres.cantidad")
                                ->join("anios", "anios.id", "=", "poblacion_mujeres.anio_id")
                                ->where("poblacion_mujeres.distrito_id", $item->id)
                                ->where("anios.anio", $gestion)
                                ->whereIn("poblacion_mujeres.mes_id", $trimestre1)
                                ->sum("poblacion_mujeres.cantidad");
                            $total2 = PoblacionMujer::select("poblacion_mujeres.cantidad")
                                ->join("anios", "anios.id", "=", "poblacion_mujeres.anio_id")
                                ->where("poblacion_mujeres.distrito_id", $item->id)
                                ->where("anios.anio", $gestion)
                                ->whereIn("poblacion_mujeres.mes_id", $trimestre2)
                                ->sum("poblacion_mujeres.cantidad");
                            $total3 = PoblacionMujer::select("poblacion_mujeres.cantidad")
                                ->join("anios", "anios.id", "=", "poblacion_mujeres.anio_id")
                                ->where("poblacion_mujeres.distrito_id", $item->id)
                                ->where("anios.anio", $gestion)
                                ->whereIn("poblacion_mujeres.mes_id", $trimestre3)
                                ->sum("poblacion_mujeres.cantidad");
                            $total4 = PoblacionMujer::select("poblacion_mujeres.cantidad")
                                ->join("anios", "anios.id", "=", "poblacion_mujeres.anio_id")
                                ->where("poblacion_mujeres.distrito_id", $item->id)
                                ->where("anios.anio", $gestion)
                                ->whereIn("poblacion_mujeres.mes_id", $trimestre4)
                                ->sum("poblacion_mujeres.cantidad");

                            $data = [(float)$total1, (float)$total2, (float)$total3, (float)$total4];
                            $series[] = [
                                "name" => $item->nombre_distrito,
                                "data" => $data
                            ];
                        }
                    }
                    break;
                case 'anual':
                    $anios = Anio::orderBY("anio", "asc")->get();
                    foreach ($distritos as $distritos_index => $item) {
                        $data = [];
                        foreach ($anios as $key_anio => $anio) {
                            if ($distritos_index == 0) {
                                $categories[] = $anio->anio;
                            }
                            $total = PoblacionMujer::select("poblacion_mujeres.cantidad")
                                ->where("poblacion_mujeres.distrito_id", $item->id)
                                ->where("poblacion_mujeres.anio_id", $anio->id)
                                ->sum("poblacion_mujeres.cantidad");

                            $data[] = (float)$total;
                        }
                        $series[] = [
                            "name" => $item->nombre_distrito,
                            "data" => $data
                        ];
                    }
                    break;
            }
        }

        return response()->JSON([
            "data" => $data,
            "series" => $series,
            "categories" => $categories,
        ]);
    }
}
