function esDependenciaInstalada = isToolboxOnEnvironment(nombreToolbox)
    version = toolboxes.getRevisionId(nombreToolbox);
    esDependenciaInstalada = ~isempty(version);
end