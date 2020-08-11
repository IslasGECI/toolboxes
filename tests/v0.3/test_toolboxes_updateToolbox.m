ambienteActual = toolboxes.getEnvironmentName();
toolboxes.setEnvironment('testing')

toolboxBitbucketUrl = @(nombreToolbox) ['https://bitbucket.org/IslasGECI/' nombreToolbox];
repos = {'dist-dens', 'toolboxes'};
toolboxes.installToolbox('https://bitbucket.org/IslasGECI/ver');
versionEsperada = ver.Version("0.2.0");
for repo = repos
    nombreRepo = repo{:};
    rutaFileexchange = toolboxBitbucketUrl(nombreRepo);
    toolboxes.updateToolbox(nombreRepo, versionEsperada);
    versionObtenida = toolboxes.getVersion(nombreRepo);
    disp(versionObtenida)
    esVersionCorrecta = contains(versionObtenida, versionEsperada.char());
    assert(esVersionCorrecta)
end

toolboxes.setEnvironment(ambienteActual);
toolboxes.rmEnvironment('testing')