# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, cairo, gio, glib, gtk, gtk2hsBuildtools, libc, mtl, pango
, pkgconfig, text
}:

cabal.mkDerivation (self: {
  pname = "gtk";
  version = "0.12.5.7";
  sha256 = "0hax4ixdz523753rc774c8g76bjlj56lsabyl5nwkpnppffpa73w";
  buildDepends = [ cairo gio glib mtl pango text ];
  buildTools = [ gtk2hsBuildtools ];
  extraLibraries = [ libc pkgconfig ];
  pkgconfigDepends = [ glib gtk ];
  patches = self.stdenv.lib.optionals self.stdenv.isDarwin [ ./gtk.patch ];
  meta = {
    homepage = "http://projects.haskell.org/gtk2hs/";
    description = "Binding to the Gtk+ graphical user interface library";
    license = self.stdenv.lib.licenses.lgpl21;
    platforms = self.ghc.meta.platforms;
  };
})
