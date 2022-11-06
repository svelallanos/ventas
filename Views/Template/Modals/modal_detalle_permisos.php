<!-- Modal -->
<div class="modal fade" id="modal_detalle_permisos" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <h1 class="modal-title text-white fs-5" id="exampleModalLabel">PERMISOS PERS0NALIZADOS</h1>
        <button type="button" class="btn-close bg-white" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="mensaje_permiso"></div>
          <div class="col-md-12">
            <div class="mb-3">
              <label class="fw-bold" for="exampleFormControlInput1">Nombre :</label>
              <input class="form-control" disabled id="permiso_nombre" type="text">
            </div>
          </div>
          <div class="col-md-6">
            <div class="mb-3">
              <label class="fw-bold" for="exampleFormControlInput1">Dni :</label>
              <input class="form-control" disabled id="permiso_dni" type="text">
            </div>
          </div>
          <div class="col-md-12">
            <div class="card card-collapsable">
              <a class="card-header" href="#lista_permisos_usuario" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="lista_permisos_usuario">
                Lista de Permisos
                <div class="card-collapsable-arrow">
                  <i class="fas fa-chevron-down"></i>
                </div>
              </a>
              <div class="collapse" id="lista_permisos_usuario">
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table display">
                      <thead>
                        <tr>
                          <th class="text-center">N°</th>
                          <th>PERMISO</th>
                          <th>ACCIONES</th>
                        </tr>
                      </thead>
                      <tbody id="tb_permiso_personzalizados">
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modal_list_usuarios" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <h1 class="fw-bold modal-title fs-5 text-white">LISTA DE USUARIOS</h1>
        <button type="button" class="btn-close bg-white" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="table-responsive">
          <table id="tb_usuarios" class="display compact w-100">
            <thead>
              <tr>
                <th>N°</th>
                <th>NOMBRES</th>
                <th>APELLIDOS</th>
                <th>DNI</th>
                <th>ACCIONES</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
        </div>
      </div>
      <div class="modal-footer p-2">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fa-regular fa-circle-xmark"></i> &nbsp Cerrar</button>
      </div>
    </div>
  </div>
</div>