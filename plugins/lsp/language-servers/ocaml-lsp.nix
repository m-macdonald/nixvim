{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.plugins.lsp.servers.ocaml-lsp;
in {
  options.plugins.lsp.servers.ocaml-lsp = {
    ocamlformatPackage = mkOption {
      type = types.package;
      default = pkgs.ocamlformat;
      description = "Which package to use for `ocamllformat`.";
    };
  };

  config = mkIf cfg.enable {
    extraPackages = [cfg.ocamlformatPackage];
  };
}
