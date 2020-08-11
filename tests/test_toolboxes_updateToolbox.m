ambienteActual = toolboxes.getEnvironmentName();
ambientePrueba = 'test_toolboxes';
toolboxes.rmEnvironment(ambientePrueba)
toolboxes.setEnvironment(ambientePrueba)

toolboxBitbucketUrl = @(nombreToolbox) ['https://bitbucket.org/IslasGECI/' nombreToolbox];
repos = {'dist-dens', 'islas'};
if ~toolboxes.isToolboxInstalled('ver')
    toolboxes.installToolbox('https://bitbucket.org/IslasGECI/ver');
end
toolboxes.updateToolbox('ver')
versionEsperada = ver.Version("0.3.0");
for repo = repos
    nombreRepo = repo{:};
    rutaFileexchange = toolboxBitbucketUrl(nombreRepo);
    toolboxes.updateToolbox(nombreRepo, versionEsperada);
    versionObtenida = toolboxes.getRevisionId(nombreRepo);
    disp(versionObtenida)
    esVersionCorrecta = contains(versionObtenida, versionEsperada.char());
    assert(esVersionCorrecta)
end

toolboxes.setEnvironment(ambienteActual);
toolboxes.rmEnvironment(ambientePrueba)