%UPDATETOOLBOX  Actualiza módulo a versión especificada
% Descripción:
%    Actualiza un módulo (repo clase 1) instalado el ambiente virtual
%    actual a la versión especificada. Si no se especifica la versión
%    deseada se actualza la versión instalada con el contenido de la fuente
%    aunque no se haya consignado.
function updateToolbox(fuente, version)
    %% Preámbulo
    rutaAmbiente = toolboxes.getEnvironmentPath();
    nombreModulo = toolboxes.makeId(char(fuente));
    if string(fuente) == string(nombreModulo)
        fuente = toolboxes.getDefaultSource(fuente);
    end
    rutaRepoPrivado = [toolboxes.getPrivateToolboxesPath filesep nombreModulo];
    isPathThatExists = @(x) exist(x,'dir') == 7;
    
    %% Convierte versión a string
    if nargin == 1
        version = "local";
    end
    if isa(version,'ver.Version')
        version = ['v' version.char()];
    end
    if ~isstring(version)
        version = string(version);
    end
    %%
    esVersionConsignada = version ~= "local";
    if esVersionConsignada
        directorioActual = pwd();
        cd(rutaRepoPrivado)
        esInstalado = isPathThatExists([rutaRepoPrivado filesep '.hg']);
        estado = -1;
        if esInstalado
            toolboxes.fetchToolbox(fuente)
            disp(['Instalando actualizaciones de <strong>' upper(nombreModulo) '</strong>...'])
            [estado, ~] = system(['hg update --clean ', version.char()]);
            [~, resultado] = system('hg summary');
            disp(resultado)
        end
        esActualizacionExitosa = estado == 0;
        assert(esActualizacionExitosa, ['No pude actualizar <strong>' nombreModulo '</strong> a la versión ' version.char()])
        [~, idRepo] = system('hg identify');
        fuente = rutaRepoPrivado;
        cd(directorioActual)
    else
        idRepo = version.char();
    end    
    %% Lee archivo de configuración común para todas las toolboxes
    nombreArchivoConfiguracionGlobalSinRutaDeEntorno = 'toolboxes\datos\configuracion_global.json';
    archivoConfiguracionGlobalEnEntornoDefecto = [toolboxes.getDefaultEnvironmentPath() filesep nombreArchivoConfiguracionGlobalSinRutaDeEntorno];
    archivoConfiguracionGlobalEnEntornoActual = [rutaAmbiente filesep nombreArchivoConfiguracionGlobalSinRutaDeEntorno];
    esArchivoConfiguracionGlobalEnEntornoActual = exist(archivoConfiguracionGlobalEnEntornoActual,'file') == 2;
    if esArchivoConfiguracionGlobalEnEntornoActual
        archivo = fopen(archivoConfiguracionGlobalEnEntornoActual,'r');
    else
        archivo = fopen(archivoConfiguracionGlobalEnEntornoDefecto,'r');
    end
    textoJSON = fread(archivo,'*char')';
    fclose(archivo);
    toolboxComun = jsondecode(textoJSON);
    ComponenteComun = toolboxComun.Componente;

    %% Lee archivo de configuración particular de la fuente
    archivoConfiguracionParticular = [fuente filesep 'toolbox.json'];
    if exist(archivoConfiguracionParticular,'file') == 2
        archivo = fopen(archivoConfiguracionParticular,'r');
        textoJSON = fread(archivo,'*char')';
        fclose(archivo);
        toolbox = jsondecode(textoJSON);
        esComponente = ismember('Componente',fields(toolbox));
        if esComponente
            ComponenteParticular = toolbox.Componente;
            Componente = [ComponenteComun(:); ComponenteParticular(:)];
        else
            Componente = ComponenteComun(:);
        end
    else
        Componente = ComponenteComun(:);
    end

    %% Crea ruta de la toolbox en la biblioteca de MATLAB
    esDestinoEspacioDeNombres = {Componente.destino} == "+";
    [Componente(esDestinoEspacioDeNombres).destino] = deal(['+' nombreModulo]);

    %% Crea ruta de funciones privadas
    esDestinoPrivado = {Componente.destino} == "private";
    [Componente(esDestinoPrivado).destino] = deal(['+' nombreModulo filesep 'private']);

    %% Modifica la estructura `Componentes` para que tenga rutas y nombres de archivos válidos
    rutaModuloInstalado = [rutaAmbiente filesep nombreModulo];
    nComponentes = length(Componente);
    for iComponente = 1:nComponentes
        Componente(iComponente).ruta    = strrep(Componente(iComponente).ruta, '/', filesep);
        Componente(iComponente).destino = strrep(Componente(iComponente).destino, '/', filesep);
        Componente(iComponente).ruta    = [fuente filesep Componente(iComponente).ruta];
        Componente(iComponente).destino = [rutaModuloInstalado filesep Componente(iComponente).destino];
    end

    %% Borrar toolbox anterior para descartar contenido obsoleto
    rmDirectory(rutaModuloInstalado);
        function rmDirectory(ruta)
            esToolboxRutaQueExiste = isPathThatExists(ruta);
            if esToolboxRutaQueExiste
                warning off
                disp(['Removiendo el contenido de ' ruta])
                rmdir(ruta, 's');
                warning on
            end
        end

    %% Crea el directorio de la biblioteca de toolboxes si no existe
    esBibliotecaRutaQueExiste = isPathThatExists(rutaAmbiente);
    if ~esBibliotecaRutaQueExiste
        mkdir(rutaAmbiente)
    end

    %% Copia los archivos de la fuente a la biblioteca de MATLAB
    esExito = false(nComponentes,1);
    for iComponente=1:nComponentes
        try
            [esExito(iComponente),~,~] = copyfile([Componente(iComponente).ruta filesep Componente(iComponente).archivos], Componente(iComponente).destino);
        end
        if esExito(iComponente)
            nombreComponente = Componente(iComponente).nombre;
            largoNombre = length(nombreComponente);
            disp(['Actualizando' repmat('.', 1, max(80-(13)-largoNombre,1)) ' ' nombreComponente])
        end
    end
    %% Guarda información sobre versión instalada
    archivoId = [rutaModuloInstalado filesep 'toolbox.ver'];
    archivo = fopen(archivoId,'w');
    fprintf(archivo, idRepo);
    fclose(archivo);
    type(archivoId)

    %% Despliega mensaje si se pudo actualizar la toolbox o regresa error de lo contrario
    esAlgunExito = any(esExito);
    if esAlgunExito
        addpath(genpath(rutaModuloInstalado));
        disp(' ');
        disp(['ÉXITO: Se actualizó ' nombreModulo ' desde ' fuente])
        disp(' ');
    else
        error(['ERROR: No pude actualizar ' nombreModulo ' desde ' fuente])
    end
    updateDependencies(nombreModulo)
    evalin('base', 'rehash')
end