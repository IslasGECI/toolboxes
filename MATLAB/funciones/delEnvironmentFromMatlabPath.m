function delEnvironmentFromMatlabPath()
    %
    rutaAmbienteDefault =  toolboxes.getDefaultEnvironmentPath();
    %
    rutaAmbienteActual = toolboxes.getEnvironmentPath();
    rutaModulosActual = genpath(rutaAmbienteActual);
    rmpath(rutaModulosActual);
    %
    rutaToolboxesDefault = genpath([rutaAmbienteDefault filesep 'toolboxes']);
    addpath(rutaToolboxesDefault);
    %    
    evalin('base', 'rehash')
end