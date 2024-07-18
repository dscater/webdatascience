<?php

namespace App\Http\Controllers;

use App\Models\Distrito;
use Illuminate\Http\Request;

class DistritoController extends Controller
{
    public function listado(Request $request)
    {
        $distritos = Distrito::select("distritos.*");

        if ($request->order && $request->order == "desc") {
            $distritos->orderBy("distritos.id", $request->order);
        }

        $distritos = $distritos->get();

        return response()->JSON([
            "distritos" => $distritos
        ]);
    }
}
