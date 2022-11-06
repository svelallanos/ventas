var libro_id = $("#form_add_concepto").attr("data-libro_id");
var listaTitulos;
var listaTerminologias;

$(document).ready(function () {
  cargarTitulos();
  agregarConceptoTitulo();
  cargarTerminologias();
});

function cargarTitulos() {
  listaTitulos = $("#tb_titulos_conceptos").DataTable({
    aProcessing: true,
    aServerSide: true,
    language: languajeDefault,
    ajax: {
      url: "selectTitulosConcepto",
      data: { libro_id: libro_id },
      type: "POST",
      dataSrc: "",
    },
    columns: [
      { data: "numero" },
      { data: "detalle_niveles_titulo" },
      { data: "niveles_orden" },
      { data: "options" },
    ],
    resonsieve: "true",
    bDestroy: true,
    iDisplayLength: 10,
    Order: [[0, "desc"]],
    columnDefs: [
      {
        class: "col-1 text-center",
        targets: 0,
      },
      {
        class: "col-9",
        targets: 1,
      },
      {
        class: "col-1 text-center",
        targets: 2,
      },
      {
        class: "col-1 text-center",
        targets: 3,
      },
    ],
  });
}

function cargarTerminologias() {
  listaTerminologias = $("#tb_terminologias").DataTable({
    aProcessing: true,
    aServerSide: true,
    language: languajeDefault,
    ajax: {
      url: "selectTerminologiasConcepto",
      dataSrc: "",
    },
    columns: [
      { data: "numero" },
      { data: "terminologias_nombre" },
      { data: "options" },
    ],
    resonsieve: "true",
    bDestroy: true,
    iDisplayLength: 10,
    Order: [[0, "desc"]],
    columnDefs: [
      {
        class: "col-1 text-center",
        targets: 0,
      },
      {
        class: "col-10",
        targets: 1,
      },
      {
        class: "col-1 text-center",
        targets: 2,
      },
    ],
  });
}

function agregarConceptoTitulo() {
  $("#form_add_concepto").submit(function (e) {
    e.preventDefault();

    let form = document.getElementById("form_add_concepto");
    const formData = new FormData(form);

    formData.append("libro_id", libro_id);

    const request = axios.post("agregarConceptoTitulo", formData);

    request.then((res) => {
      if (res.data.status) {
        Swal.fire("CORRECTO", res.data.msg, res.data.value);
        uploadPage("#close_page", true);
        $('#conocimiento_descripcion').val('');
      } else {
        Swal.fire("ALERTA", res.data.msg, res.data.value);
      }
    });

    request.catch((error) => {
      console.log(error);
    });
  });
}
