# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, matrix, parsec, QuickCheck, tasty, tastyQuickcheck, text
, transformers, wlPprintExtras
}:

cabal.mkDerivation (self: {
  pname = "HaTeX";
  version = "3.14.0.0";
  sha256 = "0vbwhj031ny2vkp5hjxihlmpxaqy1far2nmxfzl1bv6rx0sqfjbg";
  buildDepends = [
    matrix parsec QuickCheck text transformers wlPprintExtras
  ];
  testDepends = [ QuickCheck tasty tastyQuickcheck text ];
  meta = {
    homepage = "http://daniel-diaz.github.io/projects/hatex";
    description = "The Haskell LaTeX library";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
