ambienteActual = toolboxes.getEnvironmentName();
toolboxes.setEnvironment('testing')

toolboxBitbucketUrl = @(nombreToolbox) ['https://bitbucket.org/IslasGECI/' nombreToolbox];
repos = {'fileexchange', 'misctools', 'toolboxes'};
for repo = repos
    nombreRepo = repo{:};
    rutaRepo = toolboxBitbucketUrl(nombreRepo);
    toolboxes.installToolbox(rutaRepo);
    esInstalado = ~isempty(toolboxes.getVersion(nombreRepo));
    assert(esInstalado)
end

toolboxes.setEnvironment(ambienteActual);
toolboxes.rmEnvironment('testing')