<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Ganancias Netas</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin-top: 1.5cm;
            margin-bottom: 1.5cm;
            margin-left: 2cm;
            margin-right: 1.5cm;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            margin-top: 20px;
            page-break-before: avoid;
        }

        table thead tr th,
        tbody tr td {
            padding: 3px;
            word-wrap: break-word;
        }

        table thead tr th {
            font-size: 8pt;
        }

        table tbody tr td {
            font-size: 7.6pt;
        }


        .encabezado {
            width: 100%;
        }

        .logo img {
            position: absolute;
            height: 100px;
            top: -20px;
            left: 0px;
        }

        h2.titulo {
            width: 450px;
            margin: auto;
            margin-top: 0PX;
            margin-bottom: 15px;
            text-align: center;
            font-size: 14pt;
        }

        .texto {
            width: 250px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: bold;
            font-size: 1.1em;
        }

        .fecha {
            width: 250px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: normal;
            font-size: 0.85em;
        }

        .total {
            text-align: right;
            padding-right: 15px;
            font-weight: bold;
        }

        table {
            width: 100%;
        }

        table thead {
            background: rgb(236, 236, 236)
        }

        tr {
            page-break-inside: avoid !important;
        }

        .centreado {
            padding-left: 0px;
            text-align: center;
        }

        .datos {
            margin-left: 15px;
            border-top: solid 1px;
            border-collapse: collapse;
            width: 250px;
        }

        .txt {
            font-weight: bold;
            text-align: right;
            padding-right: 5px;
        }

        .txt_center {
            font-weight: bold;
            text-align: center;
        }

        .cumplimiento {
            position: absolute;
            width: 150px;
            right: 0px;
            top: 86px;
        }

        .b_top {
            border-top: solid 1px black;
        }

        .gray {
            background: rgb(202, 202, 202);
        }

        .bg-principal {
            background: #1867C0;
            color: white;
        }

        .bold {
            font-weight: bold;
        }

        .img_celda img {
            width: 45px;
        }

        .text-md {
            font-size: 10pt;
        }

        .derecha {
            text-align: right;
        }

        .subtitle {
            background: rgb(241, 241, 241);
            font-weight: bold;
        }

        .ingreso {
            background: rgb(198, 236, 198);
        }

        .egreso {
            background: rgb(235, 192, 192);
        }
    </style>
</head>

<body>
    @inject('configuracion', 'App\Models\Configuracion')
    <div class="encabezado">
        <div class="logo">
            <img src="{{ $configuracion->first()->url_logo }}">
        </div>
        <h2 class="titulo">
            {{ $configuracion->first()->razon_social }}
        </h2>
        <h4 class="texto">GANANCIAS NETAS</h4>
        <div class="fecha">Del {{ date('d/m/Y', strtotime($fecha_ini)) }} al {{ date('d/m/Y', strtotime($fecha_fin)) }}
        </div>
    </div>

    <table border="1">
        <thead>
            <tr>
                <th>Categoría <br /> Concepto</th>
                <th>Descripción</th>
                <th>Fecha</th>
                <th>Cantidad</th>
                <th>Ingreso/Egreso</th>
            </tr>
        </thead>
        <tbody>
            @php
                $total_final_c = 0;
                $total_final_m = 0;
            @endphp
            @foreach ($registros as $item)
                <tr>
                    @if ($item->tipo == 'ingreso')
                        @php
                            $ingreso = App\Models\Ingreso::find($item->ingreso_id);
                        @endphp
                        <td>{{ $ingreso->categoria->nombre }} <br /> {{ $item->concepto->nombre }}</td>
                    @else
                        @php
                            $egreso = App\Models\Egreso::find($item->ingreso_id);
                        @endphp
                        <td>{{ $egreso->categoria->nombre }}<br />{{ $item->concepto->nombre }} </td>
                    @endif
                    <td>{{ $item->descripcion }}</td>
                    <td>{{ $item->fecha }}</td>
                    <td class="{{ $item->tipo }} centreado">{{ $item->cantidad }}</td>
                    <td class="{{ $item->tipo }} centreado">{{ $item->monto_txt }}</td>
                </tr>
                @php
                    if ($item->tipo == 'ingreso') {
                        $total_final_c += (float) $item->cantidad;
                        $total_final_m += (float) $item->monto;
                    } else {
                        $total_final_c -= (float) $item->cantidad;
                        $total_final_m -= (float) $item->monto;
                    }
                @endphp
            @endforeach
            <tr>
                <td colspan="3" class="derecha bold text-md {{ $total_final_m < 0 ? 'egreso' : 'ingreso' }}">TOTAL
                    {{ $total_final_m < 0 ? 'PERDIDAS' : 'GANANCIA NETA' }}</td>
                <td class="bold centreado text-md {{ $total_final_m < 0 ? 'egreso' : 'ingreso' }}">
                    {{ $total_final_c }}</td>
                <td class="bold centreado text-md {{ $total_final_m < 0 ? 'egreso' : 'ingreso' }}">
                    {{ number_format($total_final_m, 2, '.', ',') }}</td>
            </tr>
        </tbody>
    </table>
</body>

</html>
