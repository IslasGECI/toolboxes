function nombreAmbiente = getEnvironmentName()
    nombreAmbiente = getenv('MATLAB_ENVIRONMENT');
    esSinAmbiente = isempty(nombreAmbiente);
    if esSinAmbiente
        nombreAmbiente = toolboxes.getDefaultEnvironmentName();
        setEnvironmentName(nombreAmbiente);
    end
end
