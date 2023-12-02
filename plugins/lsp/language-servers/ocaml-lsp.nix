{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.plugins.lsp.servers.ocamllsp;
in {
  options.plugins.lsp.servers.ocamllsp = {
    ocamlformatPackage = mkOption {
      type = types.package;
      default = pkgs.ocamlformat;
      description = "Which package to use for `ocamllformat`.";
    };
  };

  config = {
    extraPackages = [cfg.ocamlformatPackage];
  };
}
