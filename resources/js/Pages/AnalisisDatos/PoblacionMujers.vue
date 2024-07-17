<script>
const breadbrums = [
    {
        title: "Inicio",
        disabled: false,
        url: route("inicio"),
        name_url: "inicio",
    },
    {
        title: "Cantidad de Población de Mujeres por Distrito",
        disabled: false,
        url: "",
        name_url: "",
    },
];
</script>
<script setup>
import BreadBrums from "@/Components/BreadBrums.vue";
import { useApp } from "@/composables/useApp";
import { Head } from "@inertiajs/vue3";
import { useImportacions } from "@/composables/importacions/useImportacions";
import { ref, onMounted } from "vue";
import { useMenu } from "@/composables/useMenu";
import Highcharts from "highcharts";
import exporting from "highcharts/modules/exporting";

exporting(Highcharts);
Highcharts.setOptions({
    lang: {
        downloadPNG: "Descargar PNG",
        downloadJPEG: "Descargar JPEG",
        downloadPDF: "Descargar PDF",
        downloadSVG: "Descargar SVG",
        printChart: "Imprimir gráfico",
        contextButtonTitle: "Menú de exportación",
        viewFullscreen: "Pantalla completa",
        exitFullscreen: "Salir de pantalla completa",
    },
});

const { mobile, identificaDispositivo } = useMenu();
const { setLoading } = useApp();
const { setImportacion } = useImportacions();

const getGrafico = () => {
    axios.get(route("poblacion_mujers.grafico")).then((response) => {
        Highcharts.chart("container", {
            chart: {
                type: "column",
            },
            title: {
                align: "center",
                text: "Cantidad de Población de Mujeres por Distrito",
            },
            subtitle: {
                align: "left",
                text: "",
            },
            accessibility: {
                announceNewData: {
                    enabled: true,
                },
            },
            xAxis: {
                type: "category",
            },
            yAxis: {
                title: {
                    text: "Total",
                },
            },
            legend: {
                enabled: false,
            },
            plotOptions: {
                series: {
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                    },
                    colorByPoint: true, // Esta opción asigna colores diferentes a cada punto
                },
            },
            series: [{ name: "Total", data: response.data.data }],
        });
    });
};

onMounted(() => {
    identificaDispositivo();
    setTimeout(() => {
        setLoading(false);
    }, 300);

    getGrafico();
});
</script>
<template>
    <Head title="Cantidad de Población de Mujeres por Distrito"></Head>
    <v-container>
        <BreadBrums :breadbrums="breadbrums"></BreadBrums>
        <v-row class="mt-0">
            <v-col cols="12">
                <v-card flat>
                    <v-card-title>
                        <v-row class="bg-principal d-flex align-center pa-3">
                            <v-col cols="12" sm="6" md="4">
                                Cantidad de Población de Mujeres por Distrito
                            </v-col>
                        </v-row>
                    </v-card-title>
                    <v-card-text>
                        <v-row>
                            <v-col cols="12">
                                <div id="container"></div>
                            </v-col>
                        </v-row>
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>
