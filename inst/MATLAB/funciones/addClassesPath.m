function addClassesPath
%ADDCLASSESPATH Agrega al PATH la ruta del directorio: MATLAB\clases\
warning(['Usa <strong>toolboxes.' mfilename '</strong> en lugar de <strong>' mfilename '</strong>'])
objetivo = ['MATLAB' filesep 'clases'];
toolboxes.addDirPath(objetivo)

