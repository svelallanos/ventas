<?php

class Inicio extends Controllers
{
  public function __construct()
  {
    parent::__construct();
  }

  public function inicio()
  {
    parent::verificarLogin(true);
    
    $data['page_id'] = 2;
    $data['page_tag'] = "Biblioteca - IESP San Lucas";
    $data['page_title'] = "Biblioteca San Lucas";
    $data['page_name'] = "Inicio";
    $data['apex-chart'] = true;
    $data['chart-dashboard'] = true;
    $this->views->getView($this, "inicio", $data);
  }
}
