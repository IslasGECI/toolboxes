function directorioAmbiente = getDefaultEnvironmentPath()
%getDefaultEnvironmentPath  Devuelve la ruta del ambiente virtual por defecto
%
%    See also setEnvironmentPath.
userprofile = getenv('USERPROFILE');
nombreAmbienteDefecto = toolboxes.getDefaultEnvironmentName();
directorioAmbiente = [userprofile filesep 'Documents' filesep 'MATLAB' filesep nombreAmbienteDefecto];

