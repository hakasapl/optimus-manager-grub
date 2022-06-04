# Optimus Manager GRUB Generator

GRUB2 mkconfig script for creating [optimus-manager](https://github.com/Askannz/optimus-manager) boot entires

## Usage

1. Clone this repository and cd into it: `git clone https://github.com/hakasapl/optimus-manager-grub.git && cd optimus-manager-grub`
1. Run the install script as root: `sudo ./install.sh`
1. Update your grub configuration using `grub-mkconfig` or `update-grub` if your distribution has that

### Install Script Arguments

| Argument               | Description                                                                              |
| ---------------------- | ---------------------------------------------------------------------------------------- |
| `--disable-integrated` | Don't create a boot option for integrated mode                                           |
| `--disable-hybrid`     | Don't create a boot option for hybrid mode                                               |
| `--disable-nvidia`     | Don't create a boot option for nvidia mode                                               |
| `--uninstall`          | Uninstall this generator script (You still need to update grub configuration afterwards) |

## Icons for Optimus Boot Options

Additional classes are added to each boot option so that you can configure different icons for them, if your grub theme supports this. In the theme folder, there should be an `icons` folder. Please place custom png icons of your choice in there with the following names according to each boot option:

| Boot Option | Icon File Name           |
| ----------- | ------------------------ |
| Integrated  | `optimus-integrated.png` |
| Hybrid      | `optimus-hybrid.png`     |
| NVIDIA      | `optimus-nvidia.png`     |

Your custom icons should then show up when you boot once again.
