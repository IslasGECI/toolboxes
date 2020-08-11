function addEnvironmentToMatlabPath()
%addEnvironmentPath  Agrega directorios del ambiente virtual actual al PATH de MATLAB
%
%   See also UPDATETOOLBOX, GETENVIRONMENTPATH.
rutaAmbiente = toolboxes.getEnvironmentPath();
rutaPaquetes = genpath(rutaAmbiente);
addpath(rutaPaquetes);
evalin('base', 'rehash')
