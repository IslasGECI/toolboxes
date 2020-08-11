function varargout = lsEnvironments
    lista = dir([toolboxes.getPrivateToolboxesPath filesep '..']);
    esDir = [lista.isdir];
    esPrivado = cellfun(@(x) x(1) == ".", {lista.name});
    esPublico = ~esPrivado;
    esAmbiente = esDir & esPublico;
    ambientes = lista(esAmbiente);
    if nargout == 0
        nombreAmbientes = string({ambientes.name});
        disp(nombreAmbientes(:))
    elseif nargout == 1
        varargout{:} = ambientes;
    end
end
