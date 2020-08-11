function resultados = testToolbox(fuente, version)
    %% Convierte versión a string
    if nargin == 1
        version = "local";
    end
    if isa(version,'ver.Version')
        version = ['v' version.char()];
    end
    if ~isstring(version)
        version = string(version);
    end
    %%
    nombreToolbox = toolboxes.makeId(fuente);
    nombreEntorno = ['test_' nombreToolbox '_' toolboxes.makeId(version.char())];
    toolboxes.setEnvironment(nombreEntorno)
    toolboxes.updateToolbox(fuente, version)
    directorioActual = pwd();
    cd([toolboxes.getPrivateToolboxesPath() filesep nombreToolbox filesep 'tests'])
    resultados = runtests();
    cd(directorioActual)
end