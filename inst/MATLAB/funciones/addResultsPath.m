function addResultsPath
%ADDRESULTSPATH Agrega al PATH la ruta del directorio: resultados\
warning(['Usa <strong>toolboxes.' mfilename '</strong> en lugar de <strong>' mfilename '</strong>'])
objetivo = 'resultados';
toolboxes.addDirPath(objetivo)
end
