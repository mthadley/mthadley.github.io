import (fetchTarball {
  # Taken from https://nixos.org/channels/
  url =  https://releases.nixos.org/nixpkgs/19.09-darwin/nixpkgs-darwin-19.09pre193404.9bbad4c6254/nixexprs.tar.xz;
  # Generate with nix-prefetch-url --unpack --type sha256 [url]
  sha256 = "1hjbn17s33w7zkmd69n26zgjk671rw41frgf6bzfvp1qaq5y74zl";
}) {}
