nombreAmbiente = 'borrame';
toolboxes.setEnvironment(nombreAmbiente);
rutaAmbiente = toolboxes.getEnvironmentPath();
isEnvironmentDeleted = @() ~(exist(rutaAmbiente,'dir') == 7);
toolboxBitbucketUrl = @(nombreToolbox) ['https://bitbucket.org/IslasGECI/' nombreToolbox];
repos = {'fileexchange', 'misctools'};
for repo = repos
    nombreRepo = repo{:};
    rutaFileexchange = toolboxBitbucketUrl(nombreRepo);
    toolboxes.installToolbox(rutaFileexchange);
end
assert(~isEnvironmentDeleted())
%% Sin argumento
toolboxes.rmEnvironment();
assert(isEnvironmentDeleted())

%% Con argumento
toolboxes.setDefaultEnvironment()
toolboxes.rmEnvironment(nombreAmbiente);
assert(isEnvironmentDeleted())