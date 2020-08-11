function installToolbox(fuente)
%installToolbox Reinstala una toolbox clonándolo desde la fuente
%
%   See also toolboxes.updateToolbox.

    %% Preámbulo
    rutaReposPrivados = toolboxes.getPrivateToolboxesPath();
    nombreToolbox = toolboxes.makeId(fuente);
    rutaFuentePrivada = [rutaReposPrivados filesep nombreToolbox];
    isPathThatExists = @(ruta) exist(ruta,'dir') == 7;
    esLocal = isLocal(fuente); % ¿Es copia *local* con cambios sin consignar o es repo sin cambios?

    %% Verifica que no trates de instalar desde repo privado
    esInstalacionDesdeRepoPrivado = string(fuente) == string(rutaFuentePrivada);
    assert(~esInstalacionDesdeRepoPrivado, ['No puedo istalar desde ' rutaFuentePrivada])

    %% Borra instalación anterior
    esRepoPrivadoRutaQueExiste = @() isPathThatExists(rutaFuentePrivada);
    if esRepoPrivadoRutaQueExiste()
        rmdir(rutaFuentePrivada, 's');
    end
    assert(~esRepoPrivadoRutaQueExiste(),['No pude borrar el directorio ' rutaFuentePrivada]);

    %% Clona fuente si es repo sin cambios o copia archivos de lo contrario
    esRepoSinCambios = ~esLocal;
    if esRepoSinCambios
        [~, resultado] = system(['hg clone ', fuente, ' ' rutaFuentePrivada]);
    else
        [~,resultado] = system(['powershell Copy-Item "', fuente, '" -Destination "', rutaFuentePrivada, '" -Recurse']);
    end
    installDependencies(nombreToolbox)
    disp(resultado)
end
