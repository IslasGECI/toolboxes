function esLocal = isLocal(fuente)
    esFuenteQueExiste = exist(fuente,'dir') == 7;
    if esFuenteQueExiste
        rutaActual = pwd();
        cd(fuente)
        [~, resultado] = system('hg status');
        cd(rutaActual);
        esLocal = ~isempty(resultado);
    else
        esLocal = false; % Supongo que la fuente es la _default_ (probalemente Bitbucket)
    end
end