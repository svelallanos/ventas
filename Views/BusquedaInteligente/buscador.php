<?php headerAdmin($data) ?>
<div id="layoutSidenav_content">
  <main>
    <header class="page-header page-header-dark bg-white pb-10">
      <div class="container-xl px-4">
        <div class="page-header-content pt-4">
          <div class="row align-items-center justify-content-between">
            <div class="col-auto mt-4">
              <h1 class="page-header-title text-body">
                <div class=""><i class="fa-brands fa-meta"></i>&nbsp</div>
                BÚSQUEDA AVANZADA
              </h1>
              <div class="page-header-subtitle text-teal">
                Concepto ......
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- Main page content-->
    <div class="container-xl px-4 mt-n10">
      <div class="row">
        <div class="col-md-3">
          <div class="row">
            <div class="col-md-12">
              <div class="card card-collapsable">
                <a class="card-header bg-success text-white" href="#terminologias_lista" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="terminologias_lista">
                  TERMINOLOGÍAS :
                  <div class="card-collapsable-arrow">
                    <i class="feather-arrow-down-circle"></i>
                  </div>
                </a>
                <div class="collapse show" id="terminologias_lista">
                  <div class="card-body">
                    <p>example .....</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-9">
          <div class="row">
            <div class="col-md-12">
              <div class="card card-collapsable mb-4">
                <div class="card-header bg-teal text-white">
                  BUSCADOR :
                </div>
                <div class="card-body">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Ingrese texto">
                    <button class="btn btn-primary" type="button" id="button-addon2"><i class="feather-search"></i></button>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-12">
              <div class="card card-collapsable">
                <div class="card-header bg-gray-600 text-white">
                  RESULTADOS DE LA BÚSQUEDA :
                </div>
                <div class="card-body">
                  <p class="m-0"><i>Sin sesultados ...</i></p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- <div class="text-center text-muted font-italic small">
        Scroll down to see example...
        <div class="mt-2"><i class="far fa-arrow-alt-circle-down fa-3x text-gray-400"></i></div>
      </div>
      <div style="height: 100vh"></div> -->
    </div>
  </main>
  <?php footerAdmin($data) ?>