<?php

namespace App\Http\Controllers;

use App\Models\Distrito;
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
        $distrito_id = $request->distrito_id;

        $distritos = Distrito::select("distritos.*");

        if ($distrito_id && $distrito_id != 'todos') {
            $distritos->where("id", $distrito_id);
        }
        $distritos = $distritos->get();

        Log::debug($distritos);
        $data = [];
        foreach ($distritos as $distrito) {
            $total = PoblacionMujer::where("distrito_id", $distrito->id)->sum("cantidad");

            $data[] = [Distrito::getNameDistrito($distrito->distrito), (float)$total];
        }

        return response()->JSON([
            "data" => $data
        ]);
    }
}
