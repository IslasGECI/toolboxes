function ruta = getPrivateToolboxesPath()
%getPrivateToolboxesPath  Devuelve la ruta de directorio local `.toolboxes`
%
%   See also getEnvironmentPath.
userprofile = getenv('USERPROFILE');
ruta = [userprofile filesep 'Documents\MATLAB\.toolboxes'];
