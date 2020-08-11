ambienteActual = toolboxes.getEnvironmentName();
ambientePrueba = 'test_toolboxes';
toolboxes.rmEnvironment(ambientePrueba)
toolboxes.setEnvironment(ambientePrueba)

if ~toolboxes.isToolboxInstalled('ver')
    toolboxes.installToolbox('https://bitbucket.org/IslasGECI/ver');
end
toolboxes.updateToolbox('ver')
versionEsperada = ver.Version("0.3.0");
toolboxes.updateBundle(versionEsperada)
repos = enumeration('Toolbox');
repos = repos(repos ~= Toolbox.toolboxes & repos ~= Toolbox.ver); % Elimina estas excepcones en futura v0.5.0
for repo = repos(:)'
    disp([repo.char() ':'])
    versionObtenida = toolboxes.getRevisionId(repo);
    disp(versionObtenida)
    esVersionCorrecta = contains(versionObtenida, versionEsperada.char());
    assert(esVersionCorrecta)
end

toolboxes.setEnvironment(ambienteActual);
toolboxes.rmEnvironment(ambientePrueba)