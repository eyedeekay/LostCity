How to Play Unciv over I2P
==========================

Make sure your I2P router is started and that client tunnels are ready.

To play Unciv over I2P, you'll need a server which is capable of recieving
and distributing sync data which keeps the game state in sync between
multiple players. I wrote one expressly for I2P called [soap(because soap is necessary for civilization)](/soap/)
or you can use any Unciv Server and forward it to I2P using the Hidden Services Manager.

After installing the appropriate jpackage for your platform, run the application. LostCity is
set up to add launchers to your application menu on Windows and Linuxes where Freedesktop
standards are in use.

After launching, pick your language and enter the "Options" menu. Open the "Multiplayer"
submenu and enter the base32 address of your Unciv server in the "`Server Address`" field.
Click "Check connection to Server" and when it confirms the server is reachable, close the
options menu. You are now configure to play Unciv on a private server over I2P and can
continue playing Unciv as you would on clearnet.

```md
TODO: screenshots and stuff.
```