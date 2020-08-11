perfilUsuario = getenv('USERPROFILE');
ambiente = 'library';
setenv('MATLAB_ENVIRONMENT',ambiente);
ambiente = getenv('MATLAB_ENVIRONMENT');
dirLibrary = [perfilUsuario filesep 'Documents' filesep 'MATLAB' filesep ambiente];
if exist(dirLibrary,'dir') == 0
  mkdir(dirLibrary)
end
rutaPaquetes = genpath(dirLibrary);
addpath(rutaPaquetes);
cd([perfilUsuario filesep 'Documents'])
clear
