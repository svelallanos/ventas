<?php
class BusquedaInteligente extends Controllers
{
  public function __construct()
  {
    parent::__construct();
  }

  public function motorBusqueda()
  {
    parent::verificarLogin(true);
    parent::verificarPermiso(21, true);

    $data['page_id'] = 100;
    $data['page_tag'] = "Biblioteca - IESP San Lucas";
    $data['page_title'] = "Biblioteca San Lucas";
    $data['page_name'] = "Motor de busqueda";
    // $data['page_css'] = "configuracionlibros/libros";
    // $data['page_function_js'] = "configuracionlibros/functions_libros";
    $this->views->getView($this, "buscador", $data);
  }
}
