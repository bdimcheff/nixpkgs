{ stdenv, fetchurl, ... } @ args:

import ./generic.nix (args // rec {
  version = "3.12.32";
  extraMeta.branch = "3.12";

  src = fetchurl {
    url = "mirror://kernel/linux/kernel/v3.x/linux-${version}.tar.xz";
    sha256 = "1zqh7fza318yv04qssw9lkcxpw590vrigbdrswcr885iwk561cb8";
  };

  features.iwlwifi = true;
  features.efiBootStub = true;
  features.needsCifsUtils = true;
  features.canDisableNetfilterConntrackHelpers = true;
  features.netfilterRPFilter = true;
})
