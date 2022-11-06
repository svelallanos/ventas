<?php headerAdmin($data) ?>
<div id="layoutSidenav_content">
  <main>
    <header class="py-2 mb-4 bg-gray-400 sticky-top">
      <div class="container-xl px-4">
        <div class="row">
          <div class="col-md-6 align-self-center">
            <label for="" class="fw-500"><i class="fa-solid fa-house"></i>&nbsp <?= (isset($data['page_name'])) ? $data['page_name'] : 'Sin nombre de página.' ?></label>
          </div>
        </div>
      </div>
    </header>
    <!-- Main page content-->
    <div class="container-xl px-4">
      <div class="row">
        <?= print_r($_SESSION) ?>
      </div>
    </div>  
  </main>
  <?php footerAdmin($data) ?>