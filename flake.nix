{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
  }: {
    nixosModules.default = {
      config,
      pkgs,
      lib,
      ...
    }: {
      imports = [nvf.nixosModules.default];
      programs.nvf = {
        enable = true;
        settings.vim = {
          vimAlias = false; # for now

          lineNumberMode = "number";

          clipboard = {
            enable = true;
            registers = "unnamedplus";
            providers.wl-copy.enable = true;
          };

          options = {
            tabstop = 4;
            shiftwidth = 4;
            expandtab = true;
          };

          keymaps = [
            {
              key = "jk";
              mode = "i";
              action = "<Esc>";
            }
          ];

          lsp = {
            enable = true;
            formatOnSave = true;
          };

          languages = {
            nix = {
              enable = true;
              format.enable = true;
              lsp.enable = true;
            };

            python = {
              enable = true;
              format.enable = true;
              lsp.enable = true;
            };
          };

          treesitter = {
            enable = true;
            grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
              c
              python
              rust
              java
              javascript
              html
              css
              nix
            ];
          };

          autocmds = [
            {
              desc = "set tabstop and tabwidth to 2 for nix files";
              event = ["FileType"];
              pattern = ["nix"];
              callback = lib.generators.mkLuaInline ''
                function()
                		vim.opt.tabstop = 2
                		vim.opt.shiftwidth = 2
                end
              '';
            }
            {
              desc = "disable indentation for nix files (the indenter is broken)";
              event = ["FileType"];
              pattern = ["nix"];
              callback = lib.generators.mkLuaInline ''
                              function()
                                vim.opt.indentexpr = ""
                                vim.opt.autoindent = true
                                vim.opt.smartindent = true
                end
              '';
            }
          ];

          theme = {
            enable = true;
            name = "tokyonight";
            style = "night";
          };
        };
      };
    };
  };
}
