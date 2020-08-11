function rutaNetcdf = getNetcdfPath
    nombreComputadora = getenv('COMPUTERNAME');
    rutaNetcdf = [filesep filesep nombreComputadora filesep 'datos-netcdf'];
end