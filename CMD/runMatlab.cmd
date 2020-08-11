@echo off
set programa=%~1
copy NUL matlab.log /Y > NUL
set MATLAB_command=^
  try,^
    diary('matlab.log');^
    userprofile = getenv('USERPROFILE');^
    dirLibrary = [userprofile filesep 'Documents\MATLAB\library'];^
    rutaPaquetes = genpath(dirLibrary);^
    addpath(rutaPaquetes);^
    run('%programa%');^
    exit;^
  catch ME,^
    log = fopen('matlab.log','w');^
    fprintf(log, [ME.message,'\n']);^
    for k=1:length(ME.stack),^
      fprintf(log, ['Archivo : %%s\n'],ME.stack(k).file);^
      fprintf(log, ['Nombre  : %%s\n'],ME.stack(k).name);^
      fprintf(log, ['Linea   : %%u\n'],ME.stack(k).line);^
      fprintf(log, ['\n\n']);^
    end,^
    fclose(log);^
    exit(1);^
  end
matlab -nodesktop -nodisplay -nosplash -wait -r "%MATLAB_command%"
set esMatlabError=%errorlevel%
echo.
type matlab.log
echo.
if %esMatlabError% neq 0 exit /b %esMatlabError%
