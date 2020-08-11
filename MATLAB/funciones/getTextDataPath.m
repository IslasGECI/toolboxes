function rutaDatosTexto = getTextDataPath
    nombreComputadora = getenv('COMPUTERNAME');
    rutaDatosTexto = [filesep filesep nombreComputadora filesep 'datos-texto'];
end