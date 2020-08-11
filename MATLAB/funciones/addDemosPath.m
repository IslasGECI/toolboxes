function addDemosPath
%ADDDEMOSPATH Agrega al PATH la ruta del directorio: MATLAB\demostraciones
objetivo = ['MATLAB' filesep 'demostraciones'];
toolboxes.addDirPath(objetivo)
