function directorioAmbiente = getEnvironmentPath()
%getEnvironmentPath  Devuelve la ruta del ambiente virtual actual
%
%    See also setEnvironmentPath.
userprofile = getenv('USERPROFILE');
nombreAmbiente = toolboxes.getEnvironmentName();
directorioAmbiente = [userprofile filesep 'Documents' filesep 'MATLAB' filesep nombreAmbiente];