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
					theme = {
						enable = true;
						name = "tokyonight";
						# style = "dark"; # I dont thikn this does what I think it does
					};
				};
			};
		};
	};
}
