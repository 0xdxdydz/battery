# Battery charge limiter for M1 Mac devices

This tool it possible to keep a chronically plugged in M1 Macbook at `80%` battery, since that will prolong the longevity of the battery. It is free and open-source and will remain that way.

![Tray icon](./screenshots/tray.png)

### Requirements

This is an app for M1 Macs. It will not work on non-M1 macs. Do you have an older Mac? Consider the free version of the [Al Dente](https://apphousekitchen.com/) software package. It is a good alternative and has a premium version with many more features.

### Installation

[🌐 You can download the latest app version here]( https://github.com/actuallymentor/battery/releases/ ).

Then you download the app, install it by:

1. Opening the `.dmg` file
2. Dragging the `battery.app` icon to the `Applications` folder
3. Double clicking the `battery.app` icon in the `Applications` folder

The first time you open the app, it will ask for your administator password to it can install the needed components. Please note that the app:

- Disables charging when your battery is above 80% charged
- Enabled charging when your battery is under 80% charged
- Keeps the limit engaged even after rebooting
- Keeps the limit engaged even after closing the tray app
- Also automatically installs the `battery` command line tool. If you want a custom charging percentage, the CLI the only way to do that.

Do you have questions, comments, or feature requests? [Open an issue here](https://github.com/actuallymentor/battery/issues) or [Tweet at me](https://twitter.com/actuallymentor).

---


## 🖥 Command-line version

> If you don't know what a "command line" is, ignore this section. You don't need it.

The GUI app uses a command line tool under the hood. Installing the GUI automatically installs the CLI as well, you can also separately install the CLI.

The CLI is used for managing the battery charging status for M1 Macs. Can be used to enable/disable the Macbook from charging the battery when plugged into power.

### Installation

One-line installation:

```bash
curl -s https://raw.githubusercontent.com/actuallymentor/battery/main/setup.sh | bash
```

This will:

1. Compile the `smc` tool from the [hholtmann/smcFanControl]( https://github.com/hholtmann/smcFanControl.git ) repository
2. Install `smc` to `/usr/local/bin`
3. Install `battery` to `/usr/local/bin`

### Usage

Example usage:

```shell
# This will enable charging when your battery dips under 80, and disable it when it exceeds 80
battery maintain 80
```

After running a command like `battery charging off` you can verify the change visually by looking at the battery icon:

![Battery not charging](./screenshots/not-charging-screenshot.png)

After running `battery charging on` you will see it change to this:

![Battery charging](./screenshots/charging-screenshot.png)


For help, run `battery` without parameters:

```
Battery CLI utility v0.0.5.

Usage:

  battery status
    output battery SMC status, % and time remaining

  battery maintain LEVEL[1-100]
    turn off charging above, and off below a certain value
    eg: battery maintain 80

  battery charging SETTING[on/off]
    manually set the battery to (not) charge
    eg: battery charging on

  battery charge LEVEL[1-100]
    charge the battery to a certain percentage, and disable charging when that percentage is reached
    eg: battery charge 90

  battery visudo
    instructions on how to make which utility exempt from sudo, highly recommended

  battery update
    update the battery utility to the latest version (reruns the installation script)

  battery uninstall
    enable charging and remove the smc tool and the battery script
```

## Why does this exist?

I was looking at the Al Dente software package for battery limiting, but I found the [license too limiting](https://github.com/davidwernhart/AlDente/discussions/558) for a poweruser like myself.

I would actually have preferred using Al Dente, but decided to create a command-line utility to replace it as a side-project on holiday. A colleague mentioned they would like a GUI, so I spend a few evenings setting up an Electron app. And voila, here we are.