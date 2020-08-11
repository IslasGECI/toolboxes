function version = getRevisionId(toolbox)
    toolbox = toolboxes.makeId(char(toolbox));
    rutaToolbox = [toolboxes.getEnvironmentPath() filesep toolbox];
    archivoId = [rutaToolbox filesep 'toolbox.ver'];
    archivo = fopen(archivoId,'rt');
    esErrorLectura = archivo < 0;
    if ~esErrorLectura
        version = fread(archivo,'*char')';
        fclose(archivo);
        SALTO_DE_LINEA = 10;
        version = version(version ~= SALTO_DE_LINEA); % Elimina salto de línea al final
    else
        warning(['No encontré ' archivoId]);
        version = '';
    end
    fclose('all');
end

