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

          globals = {
            mapleader = " ";
          };

          lineNumberMode = "number";

          telescope = {
            enable = true;
          };

          ui = {
            noice.enable = true;
          };

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

          binds.whichKey = {
            enable = true;
          };
          keymaps = [
            {
              key = "jk";
              mode = "i";
              action = "<Esc>";
            }

            {
              key = "<leader>e";
              mode = "n";
              action = ":Neotree toggle<CR>";
              desc = "Toggle neotree";
            }
            {
              key = "gd";
              mode = "n";
              action = ":lua vim.diagnostic.open_float(nil, {focus = false, scope='cursor'})<CR>";
              desc = "show diagnostic under cursor";
            }
          ];

          autocomplete.blink-cmp = {
            enable = true;
            friendly-snippets.enable = true;
            setupOpts = {
              signature.enabled = true;
            };
            mappings = {
              close = "<Esc>";
              confirm = "<CR>";
              next = "<Tab>";
              previous = "<S-Tab>";
            };
          };

          lsp = {
            enable = true;
            formatOnSave = true;
            # inlayHints.enable = true;
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

            rust = {
              enable = true;
              format.enable = true;
              lsp.enable = true;
            };

            java = {
              enable = true;
              lsp.enable = true;
            };

            # Javascript / Typescript
            ts = {
              enable = true;
              format.enable = true;
              lsp.enable = true;
            };

            css = {
              enable = true;
              format.enable = true;
              lsp.enable = true;
            };

            html = {
              enable = true;
              format.enable = true;
              lsp.enable = true;
            };
          };

          filetree.neo-tree = {
            enable = true;
            setupOpts = {
              window = {
                position = "float";
              };
              enable_cursor_hijack = true;
              enable_git_status = true;
              enable_modified_markers = true;
              enable_opened_markers = true;
              enable_git_status_async = true;
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
