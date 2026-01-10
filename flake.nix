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
			programs.nvf = {
				enable = true;
				settings.vim = {
					theme = {
						enable = true;
						name = "tokyonight";
						style = "dark";
					};
				};
			};
		};
	};
}
