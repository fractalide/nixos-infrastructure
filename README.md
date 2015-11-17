
WARNING: Do not play around with the hostname file by changing it's content.
You are in for a world of pain if you do. Instead experiment with services and
packages by adding them into your specific machine.


## *USAGE*:

setup on nixos

$ git clone git@bitbucket.org:fractalide/infrastructure
$ cd infrastructure
$ echo -n "name_corresponding_to_a_machine_dot_nix" > hostname
$ ./rebuild.sh test

... all okay?

$ ./rebuild

done


### Rebuilding

`rebuild.sh` will `rsync` your code in `./` to `/etc/nixos/*` protecting the `hardware-configuration.nix`,  and `private` files/folders, whilst excluding folders/files such as `.gitignore, .git, Session.vim` etc.

The default option fed to `nixos-rebuild` is `switch`..
Other options that can be passed to `rebuild.sh` are:
* `./rebuild.sh test` which changes your *current* environment to what you have just configured, this environment does not survive power cycles. (It's highly advised to run `./rebuild.sh test` until you're happy with your configuration. Then run `./rebuild.sh` without arguments to make your system bootable to the current checkout git revision of `deployment`.)
* `./rebuild.sh boot` which will persist through a single power cycle.
* please type `man nixos-rebuild` for more options.

#### ./update.sh

This command pulls the latest patches applied to `infrastructure`, then updates the current `nix-channel` and runs `rebuild.sh`.

This command should be run once you are happy with commited changes to localhost. Typically one ssh'es into the remote machine and runs this command which will update that machine to the HEAD of the git master branch.

#### ./local-rebuild.sh
This file is mainly used to assist in the development of nixpkgs and submitting them upstream to the nixos community. Typically it will **not** be used for our day-to-day operations.

----

## *Description of folders:*
### Machines:
Name a file in the `/path/to/deployment/machines/<hostname>.nix`. Then add profiles you want to the `imports = [...]` section constructing the machine.
Machine specific configuration, such as encrypted harddisks, machine specific users etc. should be placed in this file.

### Profiles:

Profiles are meant to construct generic features that can be plopped into a machine. Typical things that go in here are development environment configurations, vpn, database setups, etc.
Profiles will include and configure services and packages. Thus a single, standardized configuration will be propagated across every machine that includes that particular profile.

### Pkgs

These files are Fractalide's custom packages. They describe *how* to build the package and the dependencies needed for the build.

