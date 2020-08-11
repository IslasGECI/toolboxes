function rutaDatos = getDataPath
nombreComputadora = getenv('COMPUTERNAME');
rutaDatos = [filesep filesep nombreComputadora filesep 'datos'];