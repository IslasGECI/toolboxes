function solveDependencies(nombreToolbox, isToolbox, installOrUpdateToolbox)
    archivo = fopen([toolboxes.getPrivateToolboxesPath() filesep nombreToolbox filesep 'toolbox.json'],'r');
    if archivo ~= -1
        configuracionJSON = fread(archivo,'*char')';
        fclose(archivo);
        configuracion = jsondecode(configuracionJSON);
        esDependiente = ismember('dependencias',fields(configuracion));
        if esDependiente
            dependencias = configuracion.dependencias;
            for dependencia = dependencias(:)'
                if iscell(dependencia)
                    dependencia = dependencia{:};
                end
                modulo = dependencia.modulo;
                esDependenciaDisponible = isToolbox(modulo);
                esDependenciaFaltante = ~esDependenciaDisponible;
                if esDependenciaFaltante
                    if ismember('version',fields(dependencia))
                        version = dependencia.version;
                    else
                        version = 'stable';
                    end
                    installOrUpdateToolbox(modulo, version);
                end
            end
        end
    end
end
