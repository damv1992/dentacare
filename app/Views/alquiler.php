<?php
    use App\Models\GenerosAlquilerModel;
    use App\Models\GenerosModel;
    use App\Models\PlataformaModel;

    $generosAlquileres = new GenerosAlquilerModel();
    $generos = new GenerosModel();
    $plataformas = new PlataformaModel();
    $mensaje = 'Saludos, solicito alquilar la cuenta con todos los juegos.';
    $mensaje = str_replace(' ', '%20', $mensaje);
?>
<?= $this->extend('plantilla/index') ?>

<?= $this->section('estilos') ?>
    <title><?=$configuracion['NombrePagina'].' | '.$titulo?></title>
<?= $this->endSection() ?>

<?= $this->section('contenido') ?>
    <h3 class="nk-decorated-h-2">
        <span><span class="text-main-1">Juegos valorados por</span> Bs. <?=$total?></span>
    </h3>
    <h4 class="text-white">
        Para solicitar el alquiler de la cuenta por
        <span class="text-main-1">100 Bs/mes</span>
        con todos los juegos mostrados haz clic
        <a href="https://api.whatsapp.com/send?phone=59173354006&text=<?=$mensaje?>">aquí</a>.
    </h4>
    <div class="nk-blog-grid">
        <div class="row">
            <?php foreach ($alquileres as $alquiler) {
                $generosAlquiler = $generosAlquileres->where('Producto', $alquiler['CodigoProducto'])->findAll();
                $plataforma = $plataformas->where('CodigoPlataforma', $alquiler['Plataforma'])->first();
                $enlace = site_url('alquiler/detalle/'.$alquiler['CodigoProducto']);
            ?>
                <div class="col-md-6 col-lg-3">
                    <div class="nk-blog-post">
                        <a href="<?=$enlace?>" class="nk-post-img">
                            <img src="<?=$alquiler['FotoProducto']?>">
                            <span class="nk-post-comments-count"><?=$plataforma['NombrePlataforma']?></span>
                            <span class="nk-post-categories">
                                <?php foreach ($generosAlquiler as $generoAlquiler) {
                                    $genero = $generos->where('CodigoGenero', $generoAlquiler['Genero'])->first();
                                ?>
                                    <span class="bg-main-5"><?=$genero['NombreGenero']?></span>
                                <?php } ?>
                            </span>

                        </a>
                        <div class="nk-gap"></div>
                        <h2 class="nk-post-title h4"><a href="<?=$enlace?>"><?=$alquiler['NombreProducto']?></a></h2>
                        <div class="nk-post-text"><!--<?=$alquiler['Descripcion']?>--></div>
                        <div class="nk-gap"></div>
                        <a href="<?=$enlace?>"
                            class="nk-btn nk-btn-rounded nk-btn-color-dark-3 nk-btn-hover-color-main-1">Leer Más</a>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
<?= $this->endSection() ?>