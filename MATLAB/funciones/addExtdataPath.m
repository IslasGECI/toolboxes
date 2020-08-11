function addExtdataPath
%ADDEXTDATAPATH Agrega al PATH la ruta del directorio: inst\extdata\
objetivo = ['inst' filesep 'extdata'];
toolboxes.addDirPath(objetivo)
end
