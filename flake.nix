{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        sqlite
        nodejs
      ];
    };
  };
}
