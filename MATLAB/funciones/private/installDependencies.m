function installDependencies(nombreToolbox)
    installToolboxFromBitbucket = @(x,~) toolboxes.installToolbox(['https://bitbucket.org/IslasGECI/' x]);
    solveDependencies(nombreToolbox, @toolboxes.isToolboxInstalled, installToolboxFromBitbucket)
end
