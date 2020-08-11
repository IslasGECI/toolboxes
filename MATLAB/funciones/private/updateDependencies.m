function updateDependencies(nombreToolbox)
    solveDependencies(nombreToolbox, @toolboxes.isToolboxOnEnvironment, @toolboxes.updateToolbox)
end
