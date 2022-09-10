# LostCity

Scripts that package UnCiv so it will only communicate with I2P Services.
Intended to make it easy to play with https://eyedeekay.github.io/soap/

[This is ENTIRELY a custom package of another piece of software, Unciv](https://github.com/yairm210/Unciv)
It is re-distributed without any changes to either the license or the source
code, which is available at the above URL. This project is SOLELY a packaging
enterprise, and a very simple one at that. It uses jpackage to bundle Unciv,
set defaults that work with I2P for the jpackaged JVM, then generates platform
specific packages out of the result.

Unciv is a really cool `Civilization V` reproduction with new assets which is
Free Software. I highly encourage you to check them out and support them in
any way you can.

There is virtually no work involved on my part and I deserve absolutely no credit.
But it is kind of fun. :) If you're interested in how I did it, visit [OneSimpleTrick](ONESIMPLETRICK.html)
for a tutorial.

This is a demo created from an application I believe to be basically harmless and
low-risk. It does not add any sophisticated key or identity management to Unciv. It
simply configures it to use a proxy and connect to hidden servers.

Building Packages
-----------------

To build the packages, use a PC running the OS you wish to package for. Cross-compilation
is not supported. Fedora package builds require Docker, and MSI package builds require
wixl. All builds require Java and jpackage.

Windows
-------

- MSI: `./windows.sh` untested, probably works
- EXE: `./windows-exe.sh` untested, probably works
- Portable ZIP: `./windows-portable.sh` - untested, probably works

Linux
-----

- Debian: `./debian.sh` - tested, works
- Fedora: `./fedora.sh` - untested, probably works though
- Portable TGZ: `./linux-portable.sh` - tested, works
