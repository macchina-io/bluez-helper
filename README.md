# bluez-helper

This is a command-line interface to the [BlueZ](http://www.bluez.org) protocol stack for Linux.
The resulting program (`bluez-helper`) is used by the macchina.io EDGE BtLE protocol implementation 
to interface with the BlueZ stack. 

While the main purpose of `bluez-helper` is to be used by BtLE, sending
commands and reading responses, it can also be used interactively to
explore peripheral devices. 

For a list of available commands, run `bluez-helper` and enter the `help` command.

# Prerequisites

This program requires a Linux system with `glib-2.0` and `pkg-config` installed, 
as well as GNU Make and GCC.
To install the prerequisites on Debian/Ubuntu:

```
$ sudo apt-get install build-essential libglib2.0-dev
```

# Building

```
$ make
```

# Installing

It's recommended to copy the resulting file to `/usr/local/bin`.
Note that `bluez-helper` requires certain capabilities to access
the BlueZ stack. If you don't want to run the program as `root`,
run the following commands to assign the required capabilities
to `bluez-helper`:

```
$ sudo setcap 'cap_net_raw,cap_net_admin+eip' bluez-helper
```

You can do the installation steps, including setting the capabilities, with:

```
$ sudo make install
```

# Acknowledgements

This project uses source code from the [bluez project](http://www.bluez.org), which is 
made available under Version 2 of the GNU Public License. 
See file [`COPYING`](bluez/COPYING) in the [`bluez`](bluez) directory for the full text of this license.

Furthermore, this project includes code (`bluepy-helper.c`) from the 
[bluepy project](https://github.com/IanHarvey/bluepy) by Ian Harvey, 
which is a derivative work of BlueZ and therefore also licensed under 
Version 2 of the GNU Public License.

# License

The source code in the project is licensed under the terms and conditions
of the GNU General Public License Version 2, the text of which can be
found in [`bluez/COPYING`](bluez/COPYING).
