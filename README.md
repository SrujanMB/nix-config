# This is my NixOS config!
This repository contains my nix configuration files created for personal use.

Current available profiles:
* srujan
* dev-vm
* dev-vm-nogui

**Check `nix-config/hosts/{hostname-or-profile}/configuration.nix` > `networking.hostname` attribute to figure out the profile names**

More details about the configurations are stated below the usage instructions.

# Steps to recreate this config:
###### **NOTE: Replace `{hostname-or-profile}` with your desired hostname / profile name.**

> These instructions are made for myself but if you wish to try this config out for yourself then please consider forking this repo and changing the `nix-config/modules/home-manager/base/git.nix` config file **with your git details before executing any git commands!**.

**Step 1:** Clone this repo to the home directory then cd into it:
```sh
git clone https://github.com/SrujanMB/nix-config.git
```
```sh
cd ~/nix-config
```

**Step 2:** Overwrite the `hardware-configuration.nix` file for the hostname of interest.
```sh
cp /etc/nixos/hardware-configuration.nix \
   ./hosts/{hostname-or-profile}/hardware-configuration.nix
```

**Step 3:** Build / Test nix configuration:
```sh
sudo nixos-rebuild --flake ".#{hostname-or-profile}*" switch
```

**Step 4:** Commit & push changes to the hardware-configuration.nix.
```sh
git commit -am "Changed the hardware-configuration.nix for {hostname-or-profile}."
&& git push
```

# Additional details about the configuration.
The configuration files are seperated based on whether:
* They are configurations for `nix` or `home-manager`
* They contain configurations for base CLI applications or GUI applications.

The intention behind all this is to allow for easy creation and management of `nogui` hosts / profiles. (which I needed)

As mentioned above, the profiles are managed by the configuration's `networking.hostname` attribute as it can be used to refer to a particular profile using the `.#{hostname}` syntax in the nix rebuild flake command.

The `nix` and `home-manager` modules are made to seperate system configuration with user configuration.
