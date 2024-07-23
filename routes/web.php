<?php

use App\Http\Controllers\AfLugaresPublicoController;
use App\Http\Controllers\AtencionMedicaPsicologicaController;
use App\Http\Controllers\AtiscLugaresPublicoController;
use App\Http\Controllers\AvcsLugaresPublicoController;
use App\Http\Controllers\AyudaAmigaController;
use App\Http\Controllers\AyudaAmigoController;
use App\Http\Controllers\AyudaDnaController;
use App\Http\Controllers\AyudaFamiliarController;
use App\Http\Controllers\AyudaFelcvController;
use App\Http\Controllers\AyudaOiController;
use App\Http\Controllers\AyudaPaController;
use App\Http\Controllers\AyudaSlimController;
use App\Http\Controllers\ConfiguracionController;
use App\Http\Controllers\DenunciaAgrecionController;
use App\Http\Controllers\DistritoController;
use App\Http\Controllers\HmpActorController;
use App\Http\Controllers\HmpPoblacionController;
use App\Http\Controllers\ImportacionController;
use App\Http\Controllers\InicioController;
use App\Http\Controllers\NoAyudaAmenazaController;
use App\Http\Controllers\NoAyudaController;
use App\Http\Controllers\NoAyudaMiedoController;
use App\Http\Controllers\NoAyudaNoCreeJusticiaController;
use App\Http\Controllers\NoAyudaNoSabiaController;
use App\Http\Controllers\NoAyudaOtroMotivoController;
use App\Http\Controllers\NoAyudaPorFamiliaController;
use App\Http\Controllers\NoAyudaSepaController;
use App\Http\Controllers\NoAyudaSinImportanciaController;
use App\Http\Controllers\NoAyudaVerguenzaController;
use App\Http\Controllers\NpdfAmenazaController;
use App\Http\Controllers\NpdfMiedoController;
use App\Http\Controllers\NpdfNoCreeJusticiaController;
use App\Http\Controllers\NpdfNoSabiaController;
use App\Http\Controllers\NpdfOtroMotivoController;
use App\Http\Controllers\NpdfPorFamiliaController;
use App\Http\Controllers\NpdfSepaController;
use App\Http\Controllers\NpdfSinImportanciaController;
use App\Http\Controllers\NpdfVerguenzaController;
use App\Http\Controllers\OtrsActorController;
use App\Http\Controllers\PoblacionMujerController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ReporteController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UsuarioController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return Inertia::render('Welcome', [
//         'canLogin' => Route::has('login'),
//         'canRegister' => Route::has('register'),
//         'laravelVersion' => Application::VERSION,
//         'phpVersion' => PHP_VERSION,
//     ]);
// });

Route::get('/', function () {
    if (Auth::check()) {
        return redirect()->route('inicio');
    }
    return Inertia::render('Auth/Login');
});

Route::get("configuracions/getConfiguracion", [ConfiguracionController::class, 'getConfiguracion'])->name("configuracions.getConfiguracion");

Route::middleware('auth')->group(function () {
    // INICIO
    // INICIO
    Route::get('/inicio', [InicioController::class, 'inicio'])->name('inicio');
    Route::get("/inicio/getMaximoImagenes", [InicioController::class, 'getMaximoImagenes'])->name("entrenamientos.getMaximoImagenes");

    // INSTITUCION
    Route::resource("configuracions", ConfiguracionController::class)->only(
        ["index", "show", "update"]
    );

    // USUARIO
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::patch('/profile/update_foto', [ProfileController::class, 'update_foto'])->name('profile.update_foto');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::get("/getUser", [UserController::class, 'getUser'])->name('users.getUser');
    Route::get("/permisos", [UserController::class, 'permisos']);
    Route::get("/menu_user", [UserController::class, 'permisos']);

    // USUARIOS
    Route::put("/usuarios/password/{user}", [UsuarioController::class, 'actualizaPassword'])->name("usuarios.password");
    Route::get("/usuarios/paginado", [UsuarioController::class, 'paginado'])->name("usuarios.paginado");
    Route::get("/usuarios/listado", [UsuarioController::class, 'listado'])->name("usuarios.listado");
    Route::get("/usuarios/listado/byTipo", [UsuarioController::class, 'byTipo'])->name("usuarios.byTipo");
    Route::get("/usuarios/show/{user}", [UsuarioController::class, 'show'])->name("usuarios.show");
    Route::put("/usuarios/update/{user}", [UsuarioController::class, 'update'])->name("usuarios.update");
    Route::delete("/usuarios/{user}", [UsuarioController::class, 'destroy'])->name("usuarios.destroy");
    Route::resource("usuarios", UsuarioController::class)->only(
        ["index", "store"]
    );

    // CATEGORIAS
    // Route::get("/categorias/paginado", [CategoriaController::class, 'paginado'])->name("categorias.paginado");
    // Route::get("/categorias/listado", [CategoriaController::class, 'listado'])->name("categorias.listado");
    // Route::resource("categorias", CategoriaController::class)->only(
    //     ["index", "store", "update", "show", "destroy"]
    // );

    // DISTRITOS
    Route::get("/distritos/listado", [DistritoController::class, 'listado'])->name("distritos.listado");
    Route::resource("distritos", DistritoController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // IMPORTACIÓN
    Route::get("/importacions/paginado", [ImportacionController::class, 'paginado'])->name("importacions.paginado");
    Route::get("/importacions/listado", [ImportacionController::class, 'listado'])->name("importacions.listado");
    Route::post("/importacions/importar_archivo", [ImportacionController::class, 'importar_archivo'])->name("importacions.importar_archivo");
    Route::resource("importacions", ImportacionController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // POBLACION MUJERES
    Route::get("/poblacion_mujers/grafico", [PoblacionMujerController::class, 'grafico'])->name("poblacion_mujers.grafico");
    Route::resource("poblacion_mujers", PoblacionMujerController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // HMP POBLACION
    Route::get("/hmp_poblacions/grafico", [HmpPoblacionController::class, 'grafico'])->name("hmp_poblacions.grafico");
    Route::resource("hmp_poblacions", HmpPoblacionController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // HMP ACTOR
    Route::get("/hmp_actors/grafico", [HmpActorController::class, 'grafico'])->name("hmp_actors.grafico");
    Route::resource("hmp_actors", HmpActorController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // HMP ACTOR
    Route::get("/af_lugares_publicos/grafico", [AfLugaresPublicoController::class, 'grafico'])->name("af_lugares_publicos.grafico");
    Route::resource("af_lugares_publicos", AfLugaresPublicoController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // HMP ACTOR
    Route::get("/avcs_lugares_publicos/grafico", [AvcsLugaresPublicoController::class, 'grafico'])->name("avcs_lugares_publicos.grafico");
    Route::resource("avcs_lugares_publicos", AvcsLugaresPublicoController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // ATISC LUGARES PUBLICOS
    Route::get("/atisc_lugares_publicos/grafico", [AtiscLugaresPublicoController::class, 'grafico'])->name("atisc_lugares_publicos.grafico");
    Route::resource("atisc_lugares_publicos", AtiscLugaresPublicoController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );


    // OTRS ACTORES
    Route::get("/otrs_actors/grafico", [OtrsActorController::class, 'grafico'])->name("otrs_actors.grafico");
    Route::resource("otrs_actors", OtrsActorController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // AYUDA FELCV
    Route::get("/ayuda_felcv/grafico", [AyudaFelcvController::class, 'grafico'])->name("ayuda_felcv.grafico");
    Route::resource("ayuda_felcv", AyudaFelcvController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // AYUDA SLIM
    Route::get("/ayuda_slim/grafico", [AyudaSlimController::class, 'grafico'])->name("ayuda_slim.grafico");
    Route::resource("ayuda_slim", AyudaSlimController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // AYUDA DNA
    Route::get("/ayuda_dna/grafico", [AyudaDnaController::class, 'grafico'])->name("ayuda_dna.grafico");
    Route::resource("ayuda_dna", AyudaDnaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // AYUDA OI
    Route::get("/ayuda_oi/grafico", [AyudaOiController::class, 'grafico'])->name("ayuda_oi.grafico");
    Route::resource("ayuda_oi", AyudaOiController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // AYUDA FAMILIAR
    Route::get("/ayuda_familiar/grafico", [AyudaFamiliarController::class, 'grafico'])->name("ayuda_familiar.grafico");
    Route::resource("ayuda_familiar", AyudaFamiliarController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // AYUDA AMIGA
    Route::get("/ayuda_amiga/grafico", [AyudaAmigaController::class, 'grafico'])->name("ayuda_amiga.grafico");
    Route::resource("ayuda_amiga", AyudaAmigaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // AYUDA AMIGA
    Route::get("/ayuda_amigo/grafico", [AyudaAmigoController::class, 'grafico'])->name("ayuda_amigo.grafico");
    Route::resource("ayuda_amigo", AyudaAmigoController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NO AYUDA
    Route::get("/no_ayuda/grafico", [NoAyudaController::class, 'grafico'])->name("no_ayuda.grafico");
    Route::resource("no_ayuda", NoAyudaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // AYUDA PA
    Route::get("/ayuda_pa/grafico", [AyudaPaController::class, 'grafico'])->name("ayuda_pa.grafico");
    Route::resource("ayuda_pa", AyudaPaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NO AYUDA VERGUENZA
    Route::get("/no_ayuda_verguenza/grafico", [NoAyudaVerguenzaController::class, 'grafico'])->name("no_ayuda_verguenza.grafico");
    Route::resource("no_ayuda_verguenza", NoAyudaVerguenzaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NO AYUDA SEPA
    Route::get("/no_ayuda_sepa/grafico", [NoAyudaSepaController::class, 'grafico'])->name("no_ayuda_sepa.grafico");
    Route::resource("no_ayuda_sepa", NoAyudaSepaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NO AYUDA MIEDO
    Route::get("/no_ayuda_miedo/grafico", [NoAyudaMiedoController::class, 'grafico'])->name("no_ayuda_miedo.grafico");
    Route::resource("no_ayuda_miedo", NoAyudaMiedoController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NO AYUDA AMENAZA
    Route::get("/no_ayuda_amenaza/grafico", [NoAyudaAmenazaController::class, 'grafico'])->name("no_ayuda_amenaza.grafico");
    Route::resource("no_ayuda_amenaza", NoAyudaAmenazaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NO AYUDA POR FAMILIA
    Route::get("/no_ayuda_porfamilia/grafico", [NoAyudaPorFamiliaController::class, 'grafico'])->name("no_ayuda_porfamilia.grafico");
    Route::resource("no_ayuda_porfamilia", NoAyudaPorFamiliaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NO AYUDA SIN IMPORTANCIA
    Route::get("/no_ayuda_sinimportancia/grafico", [NoAyudaSinImportanciaController::class, 'grafico'])->name("no_ayuda_sinimportancia.grafico");
    Route::resource("no_ayuda_sinimportancia", NoAyudaSinImportanciaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NO AYUDA NO SABIA
    Route::get("/no_ayuda_nosabia/grafico", [NoAyudaNoSabiaController::class, 'grafico'])->name("no_ayuda_nosabia.grafico");
    Route::resource("no_ayuda_nosabia", NoAyudaNoSabiaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NO AYUDA NO CREE JUSTICIA
    Route::get("/no_ayuda_nocreejusticia/grafico", [NoAyudaNoCreeJusticiaController::class, 'grafico'])->name("no_ayuda_nocreejusticia.grafico");
    Route::resource("no_ayuda_nocreejusticia", NoAyudaNoCreeJusticiaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NO AYUDA OTRO MOTIVO
    Route::get("/no_ayuda_otromotivo/grafico", [NoAyudaOtroMotivoController::class, 'grafico'])->name("no_ayuda_otromotivo.grafico");
    Route::resource("no_ayuda_otromotivo", NoAyudaOtroMotivoController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // DENUNCIA AGRESIONES
    Route::get("/denuncia_agresiones/grafico", [DenunciaAgrecionController::class, 'grafico'])->name("denuncia_agresiones.grafico");
    Route::resource("denuncia_agresiones", DenunciaAgrecionController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NPDF VERGUENZA
    Route::get("/npdf_verguenza/grafico", [NpdfVerguenzaController::class, 'grafico'])->name("npdf_verguenza.grafico");
    Route::resource("npdf_verguenza", NpdfVerguenzaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NPDF SEPA
    Route::get("/npdf_sepa/grafico", [NpdfSepaController::class, 'grafico'])->name("npdf_sepa.grafico");
    Route::resource("npdf_sepa", NpdfSepaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NPDF MIEDO
    Route::get("/npdf_miedo/grafico", [NpdfMiedoController::class, 'grafico'])->name("npdf_miedo.grafico");
    Route::resource("npdf_miedo", NpdfMiedoController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NPDF AMENAZA
    Route::get("/npdf_amenaza/grafico", [NpdfAmenazaController::class, 'grafico'])->name("npdf_amenaza.grafico");
    Route::resource("npdf_amenaza", NpdfAmenazaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NPDF AMENAZA
    Route::get("/npdf_porfamilia/grafico", [NpdfPorFamiliaController::class, 'grafico'])->name("npdf_porfamilia.grafico");
    Route::resource("npdf_porfamilia", NpdfPorFamiliaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NPDF SIN IMPORTANCIA
    Route::get("/npdf_sinimportancia/grafico", [NpdfSinImportanciaController::class, 'grafico'])->name("npdf_sinimportancia.grafico");
    Route::resource("npdf_sinimportancia", NpdfSinImportanciaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NPDF NO SABIA
    Route::get("/npdf_nosabia/grafico", [NpdfNoSabiaController::class, 'grafico'])->name("npdf_nosabia.grafico");
    Route::resource("npdf_nosabia", NpdfNoSabiaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NPDF NO CREE JUSTICIA
    Route::get("/npdf_nocreejusticia/grafico", [NpdfNoCreeJusticiaController::class, 'grafico'])->name("npdf_nocreejusticia.grafico");
    Route::resource("npdf_nocreejusticia", NpdfNoCreeJusticiaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // NPDF OTRO MOTIVO
    Route::get("/npdf_otromotivo/grafico", [NpdfOtroMotivoController::class, 'grafico'])->name("npdf_otromotivo.grafico");
    Route::resource("npdf_otromotivo", NpdfOtroMotivoController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // ATENCION MEDICA PSICOLOGICA
    Route::get("/atencion_medica_psicologica/grafico", [AtencionMedicaPsicologicaController::class, 'grafico'])->name("atencion_medica_psicologica.grafico");
    Route::resource("atencion_medica_psicologica", AtencionMedicaPsicologicaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // REPORTES
    Route::get('reportes/usuarios', [ReporteController::class, 'usuarios'])->name("reportes.usuarios");
    Route::get('reportes/r_usuarios', [ReporteController::class, 'r_usuarios'])->name("reportes.r_usuarios");
});

require __DIR__ . '/auth.php';
