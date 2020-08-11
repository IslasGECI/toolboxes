function varargout = lsToolboxes()
    rutaAmbiente = toolboxes.getEnvironmentPath();
    toolboxIds = dir([rutaAmbiente filesep '**' filesep 'toolbox.ver']);
    iToolbox = 1;
    for toolbox = toolboxIds(:)'
        nombre = toolboxes.makeId(toolbox.folder);
        version = toolboxes.getRevisionId(nombre);
        [~,resultado] = system(['powershell Select-String -Path ''' toolboxes.getPrivateToolboxesPath() filesep nombre filesep '.hg/hgrc'' -Pattern ''default =''']);
        fuente = getSourceFromGrep(resultado);
        estadoToolbox(iToolbox).nombre = nombre;
        estadoToolbox(iToolbox).version = version;
        estadoToolbox(iToolbox).fuente = fuente;
        iToolbox = iToolbox + 1;
    end
    esAlgunToolbox = iToolbox > 1;
    if esAlgunToolbox
        if nargout == 0
            for estado = estadoToolbox(:)'
                disp([estado.nombre ': ' estado.version])
                disp(['fuente: ' estado.fuente])
                disp(' ')
            end
        elseif nargout == 1
            varargout{1} = estadoToolbox;
        end
    else
        warning('En este ambiente no hay alg�n m�dulo instalado con <strong>installToolboxes</strong>')
        if nargout == 0
            disp('')
        elseif nargout == 1
            varargout{1} = struct();
        end
    end
end

function fuente = getSourceFromGrep(resultado)
        fuente = split(resultado,' ');
        fuente = fuente(end);
        fuente = fuente{:};
        fuente = fuente(fuente~=10);
end