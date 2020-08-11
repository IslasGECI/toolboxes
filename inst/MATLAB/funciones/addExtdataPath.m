function addExtdataPath
%ADDEXTDATAPATH Agrega al PATH la ruta del directorio: inst\extdata\
warning(['Usa <strong>toolboxes.' mfilename '</strong> en lugar de <strong>' mfilename '</strong>'])
objetivo = ['inst' filesep 'extdata'];
toolboxes.addDirPath(objetivo)
end
