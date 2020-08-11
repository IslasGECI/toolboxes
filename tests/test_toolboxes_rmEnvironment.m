ambienteActual = toolboxes.getEnvironmentName();
nombreAmbiente = 'borrame';
toolboxes.rmEnvironment(nombreAmbiente)
toolboxes.setEnvironment(nombreAmbiente);
rutaAmbiente = toolboxes.getEnvironmentPath();
isEnvironmentDeleted = @() ~(exist(rutaAmbiente,'dir') == 7);
toolboxBitbucketUrl = @(nombreToolbox) ['https://bitbucket.org/IslasGECI/' nombreToolbox];
repos = {'fileexchange', 'misctools'};
for repo = repos
    nombreModulo = repo{:};
    rutaModulo = toolboxBitbucketUrl(nombreModulo);
    if ~toolboxes.isToolboxInstalled(nombreModulo)
        toolboxes.installToolbox(rutaModulo);
    end
    toolboxes.updateToolbox(nombreModulo);
end
assert(~isEnvironmentDeleted())
%% Sin argumento
toolboxes.rmEnvironment();
assert(isEnvironmentDeleted())
toolboxes.setEnvironment(ambienteActual);

%% Con argumento
toolboxes.rmEnvironment(nombreAmbiente);
assert(isEnvironmentDeleted())