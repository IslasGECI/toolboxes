function esModuloInstalado = isToolboxInstalled(nombreRepo)
    rutaRepoPrivado = [toolboxes.getPrivateToolboxesPath() filesep nombreRepo];
    esModuloInstalado = exist([rutaRepoPrivado filesep '.hg'],'dir') == 7;
end