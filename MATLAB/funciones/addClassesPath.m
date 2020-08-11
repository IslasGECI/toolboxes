function addClassesPath
%ADDCLASSESPATH Agrega al PATH la ruta del directorio: MATLAB\clases\
objetivo = ['MATLAB' filesep 'clases'];
toolboxes.addDirPath(objetivo)

