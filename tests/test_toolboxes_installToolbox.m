ambienteActual = toolboxes.getEnvironmentName();
ambientePrueba = 'test_toolboxes';
toolboxes.rmEnvironment(ambientePrueba)
toolboxes.setEnvironment(ambientePrueba)
isPathThatExists = @(ruta) exist(ruta,'dir') == 7;

toolboxBitbucketUrl = @(nombreToolbox) ['https://bitbucket.org/IslasGECI/' nombreToolbox];
repos = {'fileexchange', 'misctools'};
for repo = repos
    nombreRepo = repo{:};
    urlRepoBitbucket = toolboxBitbucketUrl(nombreRepo);
    rutaFuentePrivada = [toolboxes.getPrivateToolboxesPath() filesep nombreRepo];
    esInstalado = isPathThatExists(rutaFuentePrivada);
    if esInstalado
        rmdir(rutaFuentePrivada, 's')
    end
    esInstalado = isPathThatExists(rutaFuentePrivada);
    assert(~esInstalado)
    toolboxes.installToolbox(urlRepoBitbucket);
    esInstalado = isPathThatExists(rutaFuentePrivada);
    assert(esInstalado)
    toolboxes.updateToolbox(urlRepoBitbucket)
    esActualizado = ~isempty(toolboxes.getRevisionId(nombreRepo));
    assert(esActualizado)
end

toolboxes.setEnvironment(ambienteActual);
toolboxes.rmEnvironment(ambientePrueba)