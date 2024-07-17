import axios from "axios";
import { onMounted, ref } from "vue";
import { usePage } from "@inertiajs/vue3";

const oImportacion = ref({
    id: 0,
    nombre: "",
    paterno: "",
    materno: "",
    ci: "",
    ci_exp: "",
    dir: "",
    email: "",
    fono: "",
    tipo: "",
    foto: "",
    acceso: 0 + "",
    _method: "POST",
});

export const useImportacions = () => {
    const { flash } = usePage().props;
    const getImportacions = async () => {
        try {
            const response = await axios.get(route("importacions.listado"), {
                headers: { Accept: "application/json" },
            });
            return response.data.importacions;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const getImportacionsByTipo = async (data) => {
        try {
            const response = await axios.get(route("importacions.byTipo"), {
                headers: { Accept: "application/json" },
                params: data,
            });
            return response.data.importacions;
        } catch (error) {
            console.error("Error:", error);
            throw error; // Puedes manejar el error según tus necesidades
        }
    };

    const getImportacionsApi = async (data) => {
        try {
            const response = await axios.get(route("importacions.paginado", data), {
                headers: { Accept: "application/json" },
            });
            return response.data.importacions;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };
    const saveImportacion = async (data) => {
        try {
            const response = await axios.post(route("importacions.store", data), {
                headers: { Accept: "application/json" },
            });
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            return response.data;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const deleteImportacion = async (id) => {
        try {
            const response = await axios.delete(route("importacions.destroy", id), {
                headers: { Accept: "application/json" },
            });
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            return response.data;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const setImportacion = (item = null) => {
        if (item) {
            oImportacion.value.id = item.id;
            oImportacion.value.nombre = item.nombre;
            oImportacion.value.paterno = item.paterno;
            oImportacion.value.materno = item.materno;
            oImportacion.value.ci = item.ci;
            oImportacion.value.ci_exp = item.ci_exp;
            oImportacion.value.dir = item.dir;
            oImportacion.value.email = item.email;
            oImportacion.value.fono = item.fono;
            oImportacion.value.tipo = item.tipo;
            oImportacion.value.foto = item.foto;
            oImportacion.value.acceso = item.acceso + "";
            oImportacion.value._method = "PUT";
            return oImportacion;
        }
        return false;
    };

    const limpiarImportacion = () => {
        oImportacion.value.id = 0;
        oImportacion.value.nombre = "";
        oImportacion.value.paterno = "";
        oImportacion.value.materno = "";
        oImportacion.value.ci = "";
        oImportacion.value.ci_exp = "";
        oImportacion.value.dir = "";
        oImportacion.value.email = "";
        oImportacion.value.fono = "";
        oImportacion.value.tipo = "";
        oImportacion.value.foto = "";
        oImportacion.value.acceso = 0 + "";
        oImportacion.value._method = "POST";
    };

    onMounted(() => {});

    return {
        oImportacion,
        getImportacions,
        getImportacionsApi,
        saveImportacion,
        deleteImportacion,
        setImportacion,
        limpiarImportacion,
        getImportacionsByTipo,
    };
};
