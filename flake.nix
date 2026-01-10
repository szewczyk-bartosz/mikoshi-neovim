{
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		

		nvf = {
			url = "github:NotAShelf/nvf";
			inputs.nixpkgs.follows = "nixpkgs";
		};

	};

	outputs = { self, nixpkgs, nvf }: 
	{
		nixosModules.default = { config, pkgs, lib, ... }: {
			imports = [ nvf.nixosModules.default ];
			programs.nvf = {
				enable = true;
				settings.vim = {
					vimAlias = false; # for now

					lineNumberMode = "number";

					clipboard.enable = true;
					clipboard.registers = "unnamedplus";

					options = {
						tabstop = 4;
						shiftwidth = 4;
						expandtab = true;
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
