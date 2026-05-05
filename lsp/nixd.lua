local settings = {
    nixpkgs = {
        expr = '"import (builtins.getFlake \"/home/lyc/workspace/CS/OS/NixOS/flakes\").inputs.nixpkgs { }',
    },
    formatting = {
        command = { "alejandra" },
    },
}

return {
    settings = {
        nixd = settings,
    },
}
