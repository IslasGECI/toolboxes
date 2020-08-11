%% v0.1.0
rutaFileexchangeInstalado = [getenv('userProfile') '\Documents\MATLAB\library\fileexchange'];
isFileexchangePathThatExists = @() exist(rutaFileexchangeInstalado,'dir') == 7;
if isFileexchangePathThatExists()
    rmdir(rutaFileexchangeInstalado, 's');
end
assert(~isFileexchangePathThatExists())
rutaFileexchangeFuente = ['\\' getenv('computerName') '\fileexchange'];
toolboxes.updateToolbox(rutaFileexchangeFuente);
assert(isFileexchangePathThatExists())