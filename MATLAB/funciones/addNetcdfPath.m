function addNetcdfPath
%ADDNETCDFPATH Agrega al PATH la ruta del directorio: $(computerName)\datos-netcdf\
    addpath(genpath(toolboxes.getNetcdfPath()));
end
