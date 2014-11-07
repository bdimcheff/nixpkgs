{ stdenv, fetchurl, openssl, python, zlib, utillinux }:

stdenv.mkDerivation rec {
  version = "0.8.28";
  name = "nodejs08-${version}";

  src = fetchurl {
    url = "http://nodejs.org/dist/v${version}/node-v${version}.tar.gz";
    sha256 = "50e9a4282a741c923bd41c3ebb76698edbd7b1324024fe70cedc1e34b782d44f";
  };

  configureFlags = [
    "--openssl-includes=${openssl}/include"
    "--openssl-libpath=${openssl}/lib"
  ];

  prePatch = ''
    sed -e 's|^#!/usr/bin/env python$|#!${python}/bin/python|g' -i tools/{*.py,waf-light,node-waf} configure
  '';

  postInstall = stdenv.lib.optionalString stdenv.isDarwin ''
    export PATH=$OLDPATH
  '' + ''
    sed -e 's|^#!/usr/bin/env node$|#!'$out'/bin/node|' -i $out/lib/node_modules/npm/bin/npm-cli.js
  '' /*+ stdenv.lib.optionalString stdenv.isDarwin ''
    install_name_tool -change libv8.dylib ${v8}/lib/libv8.dylib $out/bin/node
  ''*/;

  buildInputs = [ python openssl zlib ]
    ++ stdenv.lib.optional stdenv.isLinux utillinux;
  setupHook = ./setup-hook.sh;

  meta = with stdenv.lib; {
    description = "Event-driven I/O framework for the V8 JavaScript engine";
    homepage = http://nodejs.org;
    license = licenses.mit;
    maintainers = [ maintainers.goibhniu ];
    platforms = platforms.linux;
  };
}
