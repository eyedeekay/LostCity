# People who predatorily monetize basic human interaction don't want you to know this one simple trick

Are you the developer of a Java application? Do you want to enable the users of your application to
communicate anonymously? Have I got news for you!

OK I can't keep up this clickbait bit anymore. "They(in the title)" probably aren't aware of this at all
and probably wouldn't care much if they were. Nobody never going to make money off of Unciv players.
However, Unciv makes a neat example of how Java applications can easily be packaged for I2P without
requiring any code on the part of the packager. All it requires is that you are using the **`jpackage`**
packaging tool to generate a package bundled with a JVM.

## Proxifying Java Applications

While it's possible to proxy Java connections programmatically by creating and using `Proxy` objects,
it's also possible to globally apply proxy settings to a JVM by passing options on the command line.
For instance, to configure an `HTTP` proxy and use it for both `HTTP` and `HTTPS` connections, use the
following options:

```sh
-Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=4444 -Dhttps.proxyHost=127.0.0.1 -Dhttps.proxyPort=4444
```

Or if you have a `SOCKS5` proxy(on `127.0.0.1:4447` in the example), you can proxy all TCP connections
using:

```sh
-DsocksProxyHost=127.0.0.1 -DsocksProxyPort=4447
```

Or, if you want to use different proxies for `HTTP`, `HTTPS`, and "everything not `HTTP` or `HTTPS`,
you can set each one differently.

```sh
    -Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=4444 \
    -Dhttps.proxyHost=127.0.0.1 -Dhttps.proxyPort=4445 \
    -DsocksProxyHost=127.0.0.1 -DsocksProxyPort=4447
```

That's it, that is all that it takes to proxify a JVM.

- [For more information on Java and Proxies, see the documentation from Oracle](https://docs.oracle.com/javase/8/docs/technotes/guides/net/proxies.html)

## So `jpackage` enters the picture

Java distributions sometimes come with a tool, **`jpackage`**. Jpackage is a tool for bundling
a JVM and if necessary, package resources for Java applications so they can be distributed easily
without requiring the user to install Java separately as a dependency. At I2P, we use it to package
the [Windows](https://geti2p.net/en/download/easyinstall) and [Mac](https://geti2p.net/en/download/mac)
easy-install bundles and make I2P installation much easier for end-users.

**`jpackage`** is pretty easy to use, especially if your software bundles all the resources it needs
into the jar it distributes. By a wonderful coincidence, one of my favorite games falls into this
category, Unciv.

But what's most important is that `jpackage` also encapsulate the ability to pass **default options to**
**the bundled Java Virtual Machine** meaning that you can create I2P-enabled versions of Java packages
simply by re-`jpackaging` them and passing the correct JVM options. In the code block below, the command
on the left creates a `jpackage` for Unciv without modification, and the one on the right creates a
`jpackage` which automatically configures Unciv for I2P and packages it with the name `lostcity` so we
can avoid a name conflict if we want to have both installed.

```sh
#! /usr/bin/env sh                                        #! /usr/bin/env sh
jpackage \                                                jpackage \
    --verbose \                                               --verbose \
    --type exe \                                              --type exe \
    --win-dir-chooser \                                       --win-dir-chooser \
    --win-help-url "https://github.com/eyedeekay/LostCity" \  --win-help-url "https://github.com/eyedeekay/LostCity" \
    --win-menu \                                              --win-menu \
    --win-menu-group "Unciv-Over-Clearnet Jpackage" \         --win-menu-group "Unciv-Over-I2P(LostCity) Configurer" \
    --win-shortcut \                                          --win-shortcut \
    --win-shortcut-prompt \                                   --win-shortcut-prompt \
    --win-per-user-install \                                  --win-per-user-install \
    --license-file LICENSE.md \                               --license-file LICENSE.md \
    --name unciv \                                            --name lostcity \
    --app-version "$GITHUB_TAG" \                             --app-version "$GITHUB_TAG" \
    --input src/build \                                       --input src/build \
                                                          >   --java-options "-Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=4444 -Dhttps.proxyHost=127.0.0.1 -Dhttps.proxyPort=4444"
    --main-jar Unciv.jar \                                    --main-jar Unciv.jar \
    --main-class com.unciv.app.desktop.DesktopLauncher        --main-class com.unciv.app.desktop.DesktopLauncher
```

That's it. Packaging simple applications which pass only essential information over the network
in such a way that they work with I2P and don't require any configuration on the part of the user.
