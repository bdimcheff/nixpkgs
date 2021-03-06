# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, cairo, gtk2hsBuildtools, libc, mtl, pkgconfig, text
, utf8String, zlib
}:

cabal.mkDerivation (self: {
  pname = "cairo";
  version = "0.13.0.4";
  sha256 = "0sj6c83md51qvjpp3dckv3hvg9dm2qkiw1wzlvdypdd1c09957n2";
  buildDepends = [ mtl text utf8String ];
  buildTools = [ gtk2hsBuildtools ];
  extraLibraries = [ cairo libc pkgconfig zlib ];
  pkgconfigDepends = [ cairo ];
  meta = {
    homepage = "http://projects.haskell.org/gtk2hs/";
    description = "Binding to the Cairo library";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
