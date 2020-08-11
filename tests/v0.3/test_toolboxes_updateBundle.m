ambienteActual = toolboxes.getEnvironmentName();
toolboxes.setEnvironment('testing')

toolboxes.installToolbox('https://bitbucket.org/IslasGECI/ver');
versionEsperada = ver.Version("0.2.0");
toolboxes.updateBundle(versionEsperada)
repos = enumeration('Toolbox');
repos = repos(repos ~= Toolbox.toolboxes & repos ~= Toolbox.ver); % Elimina estas excepcones en futura v0.3.0
for repo = repos(:)'
    disp([repo.char() ':'])
    versionObtenida = toolboxes.getVersion(repo);
    disp(versionObtenida)
    esVersionCorrecta = contains(versionObtenida, versionEsperada.char());
    assert(esVersionCorrecta)
end

toolboxes.setEnvironment(ambienteActual);
toolboxes.rmEnvironment('testing')