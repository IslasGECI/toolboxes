function rmEnvironment(nombreAmbienteBorrar)
    if nargin == 0
        nombreAmbienteBorrar = toolboxes.getEnvironmentName();
    end
    nombreAmbienteActual = toolboxes.getEnvironmentName();
    esAmbienteDefault = string(nombreAmbienteBorrar) == string(toolboxes.getDefaultEnvironmentName);
    assert(~esAmbienteDefault, ['No puedo borrar el ambiente por defecto ' nombreAmbienteBorrar])
    esAmbienteActualElQueSeQuiereBorrar = string(nombreAmbienteBorrar) == string(nombreAmbienteActual);
    if esAmbienteActualElQueSeQuiereBorrar
        rutaAmbiente = toolboxes.getEnvironmentPath();
        toolboxes.setDefaultEnvironment()
    else
        toolboxes.setEnvironment(nombreAmbienteBorrar);
        rutaAmbiente = toolboxes.getEnvironmentPath();
        toolboxes.setEnvironment(nombreAmbienteActual);
    end
    rmDirectory(rutaAmbiente);
        function rmDirectory(ruta)
            esToolboxRutaQueExiste = exist(ruta,'dir') == 7;
            if esToolboxRutaQueExiste
                warning off
                disp(['Removiendo el contenido de ' ruta])
                rmdir(ruta, 's');
                warning on
            end
        end
end