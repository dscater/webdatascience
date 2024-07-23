<?php

namespace App\Http\Controllers;

use App\Models\Anio;
use App\Models\Distrito;
use App\Models\HistorialAccion;
use App\Models\Importacion;
use App\Models\Mes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class ImportacionController extends Controller
{
    public function index()
    {
        return Inertia::render("Importacions/Index");
    }

    public function importar_archivo(Request $request)
    {
        $request->validate([
            'archivo' => 'required|mimes:xlsx,xls',
        ], [
            'archivo.required' => 'El campo archivo es requerido',
            'archivo.mimes' => 'Debes seleccionar un archivo valido :values',
        ]);

        DB::beginTransaction();
        try {
            $archivo = $request->file('archivo');
            $extension = '.' . $archivo->getClientOriginalExtension();

            if ($extension == '.xlsx') {
                $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
            } else {
                $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
            }
            $spreadsheet = $reader->load($archivo);

            // registrar importacion
            $fecha_actual = date("Y-m-d");
            $nueva_importacion = Importacion::create([
                "archivo" => $archivo->getClientOriginalName(),
                "fecha" => $fecha_actual
            ]);
            $importacion_id = $nueva_importacion->id;

            $fila = 3;
            // recorrer las filas del archivo
            $fecha_actual = date("Y-m-d");
            while (trim($spreadsheet->getSheet(0)->getCell('A' . $fila)->getValue()) != "") {
                // realizar el registro
                $anio = trim($spreadsheet->getSheet(0)->getCell('BF' . $fila)->getValue());
                $mes = trim($spreadsheet->getSheet(0)->getCell('BE' . $fila)->getValue());
                $distrito = trim($spreadsheet->getSheet(0)->getCell('B' . $fila)->getValue());
                $mes_id = self::verifica_mes($mes);
                $anio_id = self::verifica_anio($anio);
                $distrito_id = self::obtiene_distrito_id($distrito);
                $datos_comun = "$distrito_id,$importacion_id,$mes_id,$anio_id";

                $current_sheet = $spreadsheet->getSheet(0);

                //tabla 1
                $cantidad = trim($current_sheet->getCell("A" . $fila)->getValue());
                $datos = "$cantidad,$datos_comun";
                $values = "cantidad";
                self::registrar_tabla(1, $values, $datos);
                //tabla 2
                $hombres = trim($current_sheet->getCell("C" . $fila)->getValue());
                $conocidos = trim($current_sheet->getCell("D" . $fila)->getValue());
                $desconocidos = trim($current_sheet->getCell("E" . $fila)->getValue());
                $mujeres = trim($current_sheet->getCell("F" . $fila)->getValue());
                $values = "hombres,conocidos,desconocidos,mujeres";
                $datos = "$hombres,$conocidos,$desconocidos,$mujeres,$datos_comun";
                self::registrar_tabla(2, $values, $datos);
                //tabla 3
                $esposo = trim($current_sheet->getCell("G" . $fila)->getValue());
                $conyugue = trim($current_sheet->getCell("H" . $fila)->getValue());
                $pareja = trim($current_sheet->getCell("I" . $fila)->getValue());
                $desconocidos = trim($current_sheet->getCell("J" . $fila)->getValue());
                $exnovio = trim($current_sheet->getCell("K" . $fila)->getValue());
                $values = "esposo,conyugue,pareja,desconocidos,exnovio";
                $datos = "$esposo,$conyugue,$pareja,$desconocidos,$exnovio,$datos_comun";
                self::registrar_tabla(3, $values, $datos);
                //tabla 4
                $hombres = trim($current_sheet->getCell("L" . $fila)->getValue());
                $desconocidos = trim($current_sheet->getCell("M" . $fila)->getValue());
                $mujeres = trim($current_sheet->getCell("N" . $fila)->getValue());
                $conocidos = trim($current_sheet->getCell("O" . $fila)->getValue());
                $values = "hombres,desconocidos,mujeres,conocidos";
                $datos = "$hombres,$desconocidos,$mujeres,$conocidos,$datos_comun";
                self::registrar_tabla(4, $values, $datos);
                //tabla 5
                $hombres = trim($current_sheet->getCell("P" . $fila)->getValue());
                $desconocidos = trim($current_sheet->getCell("Q" . $fila)->getValue());
                $mujeres = trim($current_sheet->getCell("R" . $fila)->getValue());
                $conocidos = trim($current_sheet->getCell("S" . $fila)->getValue());
                $values = "hombres,desconocidos,mujeres,conocidos";
                $datos = "$hombres,$desconocidos,$mujeres,$conocidos,$datos_comun";
                self::registrar_tabla(5, $values, $datos);
                //tabla 6
                $hombres = trim($current_sheet->getCell("T" . $fila)->getValue());
                $desconocidos = trim($current_sheet->getCell("U" . $fila)->getValue());
                $mujeres = trim($current_sheet->getCell("V" . $fila)->getValue());
                $conocidos = trim($current_sheet->getCell("W" . $fila)->getValue());
                $values = "hombres,desconocidos,mujeres,conocidos";
                $datos = "$hombres,$desconocidos,$mujeres,$conocidos,$datos_comun";
                self::registrar_tabla(6, $values, $datos);
                //tabla 7
                $hombres = trim($current_sheet->getCell("X" . $fila)->getValue());
                $desconocidos = trim($current_sheet->getCell("Y" . $fila)->getValue());
                $mujeres = trim($current_sheet->getCell("Z" . $fila)->getValue());
                $conocidos = trim($current_sheet->getCell("AA" . $fila)->getValue());
                $values = "hombres,desconocidos,mujeres,conocidos";
                $datos = "$hombres,$desconocidos,$mujeres,$conocidos,$datos_comun";
                self::registrar_tabla(7, $values, $datos);
                //tabla 8
                $cantidad = trim($current_sheet->getCell("AB" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(8, $values, $datos);
                //tabla 9
                $cantidad = trim($current_sheet->getCell("AC" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(9, $values, $datos);
                //tabla 10
                $cantidad = trim($current_sheet->getCell("AD" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(10, $values, $datos);
                //tabla 11
                $cantidad = trim($current_sheet->getCell("AE" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(11, $values, $datos);
                //tabla 12
                $cantidad = trim($current_sheet->getCell("AF" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(12, $values, $datos);
                //tabla 13
                $cantidad = trim($current_sheet->getCell("AG" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(13, $values, $datos);
                //tabla 14
                $cantidad = trim($current_sheet->getCell("AH" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(14, $values, $datos);
                //tabla 15
                $cantidad = trim($current_sheet->getCell("AI" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(15, $values, $datos);
                //tabla 16
                $cantidad = trim($current_sheet->getCell("AJ" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(16, $values, $datos);
                //tabla 17
                $cantidad = trim($current_sheet->getCell("AK" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(17, $values, $datos);
                //tabla 18
                $cantidad = trim($current_sheet->getCell("AL" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(18, $values, $datos);
                //tabla 19
                $cantidad = trim($current_sheet->getCell("AM" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(19, $values, $datos);
                //tabla 20
                $cantidad = trim($current_sheet->getCell("AN" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(20, $values, $datos);
                //tabla 21
                $cantidad = trim($current_sheet->getCell("AO" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(21, $values, $datos);
                //tabla 22
                $cantidad = trim($current_sheet->getCell("AP" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(22, $values, $datos);
                //tabla 23
                $cantidad = trim($current_sheet->getCell("AQ" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(23, $values, $datos);
                //tabla 24
                $cantidad = trim($current_sheet->getCell("AR" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(24, $values, $datos);
                //tabla 25
                $cantidad = trim($current_sheet->getCell("AS" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(25, $values, $datos);
                //tabla 26
                $cantidad = trim($current_sheet->getCell("AT" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(26, $values, $datos);
                //tabla 27
                $cantidad = trim($current_sheet->getCell("AU" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(27, $values, $datos);
                //tabla 28
                $cantidad = trim($current_sheet->getCell("AV" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(28, $values, $datos);
                //tabla 29
                $cantidad = trim($current_sheet->getCell("AW" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(29, $values, $datos);
                //tabla 30
                $cantidad = trim($current_sheet->getCell("AX" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(30, $values, $datos);
                //tabla 31
                $cantidad = trim($current_sheet->getCell("AY" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(31, $values, $datos);
                //tabla 32
                $cantidad = trim($current_sheet->getCell("AZ" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(32, $values, $datos);
                //tabla 33
                $cantidad = trim($current_sheet->getCell("BA" . $fila)->getValue());
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(33, $values, $datos);
                //tabla 34
                $cantidad = trim($current_sheet->getCell("BB" . $fila)->getValue());;;
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(34, $values, $datos);
                //tabla 35
                $cantidad = trim($current_sheet->getCell("BC" . $fila)->getValue());;;
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(35, $values, $datos);
                //tabla 36
                $cantidad = trim($current_sheet->getCell("BD" . $fila)->getValue());;;
                $values = "cantidad";
                $datos = "$cantidad,$datos_comun";
                self::registrar_tabla(36, $values, $datos);
                $fila++;
            }

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'IMPORTACIÓN DE ARCHIVO',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . 'IMPORTO UN ARCHIVO',
                'datos_original' => $fila-- . ' REGISTROS IMPORTADOS',
                'modulo' => 'IMPORTACIÓN DE ARCHIVO',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'msj' => 'El archivo se cargo correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public static function registrar_tabla($nro_tabla, $values, $datos)
    {
        $tabla = "";
        switch ($nro_tabla) {
            case 1:
                $tabla = "poblacion_mujeres";
                break;
            case 2:
                $tabla = "hmp_poblacion";
                break;
            case 3:
                $tabla = "hmp_actores";
                break;
            case 4:
                $tabla = "af_lugares_publicos";
                break;
            case 5:
                $tabla = "avcs_lugares_publicos";
                break;
            case 6:
                $tabla = "atisc_lugares_publicos";
                break;
            case 7:
                $tabla = "otrs_actores";
                break;
            case 8:
                $tabla = "ayuda_felcv";
                break;
            case 9:
                $tabla = "ayuda_slim";
                break;
            case 10:
                $tabla = "ayuda_dna";
                break;
            case 11:
                $tabla = "ayuda_oi";
                break;
            case 12:
                $tabla = "ayuda_familiar";
                break;
            case 13:
                $tabla = "ayuda_amiga";
                break;
            case 14:
                $tabla = "ayuda_amigo";
                break;
            case 15:
                $tabla = "no_ayuda";
                break;
            case 16:
                $tabla = "ayuda_pa";
                break;
            case 17:
                $tabla = "no_ayuda_verguenza";
                break;
            case 18:
                $tabla = "no_ayuda_sepa";
                break;
            case 19:
                $tabla = "no_ayuda_miedo";
                break;
            case 20:
                $tabla = "no_ayuda_amenaza";
                break;
            case 21:
                $tabla = "no_ayuda_porfamilia";
                break;
            case 22:
                $tabla = "no_ayuda_sinimportancia";
                break;
            case 23:
                $tabla = "no_ayuda_nosabia";
                break;
            case 24:
                $tabla = "no_ayuda_nocreejusticia";
                break;
            case 25:
                $tabla = "no_ayuda_otromotivo";
                break;
            case 26:
                $tabla = "denuncia_agresiones";
                break;
            case 27:
                $tabla = "npdf_verguenza";
                break;
            case 28:
                $tabla = "npdf_sepa";
                break;
            case 29:
                $tabla = "npdf_miedo";
                break;
            case 30:
                $tabla = "npdf_amenaza";
                break;
            case 31:
                $tabla = "npdf_porfamilia";
                break;
            case 32:
                $tabla = "npdf_sinimportancia";
                break;
            case 33:
                $tabla = "npdf_nosabia";
                break;
            case 34:
                $tabla = "npdf_nocreejusticia";
                break;
            case 35:
                $tabla = "npdf_otromotivo";
                break;
            case 36:
                $tabla = "atencion_medica_psicologica";
                break;
        }


        DB::insert("INSERT INTO $tabla ($values,distrito_id,importacion_id,mes_id,anio_id) VALUES ($datos)");

        return true;
    }


    public static function obtiene_distrito_id($nro_distrito)
    {
        $distrito = Distrito::where("distrito", $nro_distrito)->get()->first();
        if (!$distrito) {
            $distrito = Distrito::create([
                "distrito" => $nro_distrito
            ]);
        }
        return $distrito->id;
    }

    public static function verifica_mes($nro_mes)
    {
        $mes = Mes::where("mes", $nro_mes)->get()->first();
        if (!$mes) {
            $mes = Mes::create([
                "mes" => $nro_mes
            ]);
        }
        return $mes->id;
    }

    public static function verifica_anio($nro_anio)
    {
        $anio = Anio::where("anio", $nro_anio)->get()->first();
        if (!$anio) {
            $anio = Anio::create([
                "anio" => $nro_anio
            ]);
        }

        return $anio->id;
    }
}
