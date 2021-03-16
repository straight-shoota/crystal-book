shards(1) Manual Page
=====================

NAME
----

shards - dependency manager for the Crystal Language

SYNOPSIS
--------

**shards** \[`<general_options>`…​\] \[`<command>`\]
\[`<command_options>`…​\]

DESCRIPTION
-----------

Manages dependencies for Crystal projects and libraries with
reproducible installs across computers and systems.

USAGE
-----

`shards` requires the presence of a `shard.yml` file in the project
folder (working directory). This file describes the project and lists
dependencies that are required to build it. See **shard.yml**(5) for
more information on its format. A default file can be created by running
`shards init`.

Running `shards install` resolves and installs the specified
dependencies. The installed versions are written into a **shard.lock**
file for using the exact same dependency versions when running
`shards install` again.

If your shard builds an application, both **shard.yml** and
**shard.lock** should be checked into version control to provide
reproducible dependency installs. If it is only a library for other
shards to depend on, **shard.lock** should `not` be checked in, only
**shard.yml**. It’s good advice to add it to **.gitignore**.

COMMANDS
--------

If no `command` is given, **install** command will be run by default.

To see the available options for a particular command, use `--help`
after the command.

**build** \[`<targets>`\] \[`<build_options>`…​\]  
Builds the specified `<targets>` in **bin** path. If no targets are
specified, all are built. This command ensures all dependencies are
installed, so it is not necessary to run **shards install** before.

All `<build_options>` following the command are delegated to **crystal
build**.

**check**  
Verifies that all dependencies are installed and requirements are
satisfied.

Exit status:

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>0</strong></td>
<td><p>Dependencies are satisfied.</p></td>
</tr>
<tr class="even">
<td><strong>1</strong></td>
<td><p>Dependencies are not satisfied.</p></td>
</tr>
</tbody>
</table>

**init**  
Initializes a default `shard.yml` in the current folder.

**install** \[--frozen\] \[--without-development\] \[--production\] \[--skip-postinstall\]  
Resolves and installs dependencies into the `lib` folder. If not already
present, generates a `shard.lock` file from resolved dependencies,
locking version numbers or Git commits.

Reads and enforces locked versions and commits if a `shard.lock` file is
present. The **install** command may fail if a locked version doesn’t
match a requirement, but may succeed if a new dependency was added, as
long as it doesn’t generate a conflict, thus generating a new
`shard.lock` file.

--frozen  
Strictly installs locked versions from `shard.lock`. Fails if
`shard.lock` is missing.

--without-development  
Does not install development dependencies.

--production  
same as `--frozen` and `--without-development`

--skip-postinstall  
Does not run postinstall of dependencies.

**list** \[--tree\]  
Lists the installed dependencies and their versions.

Specifying `--tree` arranges nested dependencies in a tree, instead of a
flattened list.

**lock** \[--update \[&lt;shards&gt;…​\]\]  
Resolves dependencies and creates or updates the `shard.lock` file as
per the **install** command, but never installs the dependencies.

Specifying `--update` follows the same semantics as the **update**
command.

**outdated** \[--pre\]  
Lists dependencies that are outdated.

When `--pre` is specified, pre-release versions are also considered.

**prune**  
Removes unused dependencies from `lib` folder.

**update** \[&lt;shards&gt;…​\]  
Resolves and updates all dependencies into the `lib` folder, whatever
the locked versions in the `shard.lock` file. Eventually generates a new
`shard.lock` file.

Specifying `shards` will update these dependencies only, trying to be as
conservative as possible with other dependencies, respecting the locked
versions in the `shard.lock` file.

**version** \[`<path>`\]  
Prints the current version of the shard located at `path` (defaults to
current directory).

To see the available options for a particular command, use **--help**
after a command.

GENERAL OPTIONS
---------------

--version  
Prints the version of `shards`.

-h, --help  
Prints usage synopsis.

--no-color  
Disables colored output.

--local  
Don’t update remote repositories, use the local cache only.

--ignore-crystal-version  
Do not enforce crystal version restrictions on shards.

-q, --quiet  
Decreases the log verbosity, printing only warnings and errors.

-v, --verbose  
Increases the log verbosity, printing all debug statements.

INSTALLATION
------------

Shards is usually distributed with Crystal itself. Alternatively, a
separate `shards` package may be available for your system.

To install from source, download or clone [the
repository](https://github.com/crystal-lang/shards) and run **make
CRFLAGS=--release**. The compiled binary is in `bin/shards` and should
be added to **PATH**.

Environment variables
---------------------

SHARDS\_OPTS  
Allows general options to be passed in as environment variable.
**Example**: `SHARDS_OPTS="--ignore-crystal-version" shards update`

SHARDS\_CACHE\_PATH  
Defines the cache location. In this folder, shards stores local copies
of remote repositories. Defaults to `.cache/shards` in the home
directory (`$XDG_CACHE_HOME` or `$HOME`) or the current directory.

SHARDS\_INSTALL\_PATH  
Defines the location where dependecies are installed. Defaults to `lib`.

SHARDS\_BIN\_PATH  
Defines the location where executables are installed. Defaults to `bin`.

CRYSTAL\_VERSION  
Defines the crystal version that dependencies should be resolved
against. Defaults to the output of `crystal env CRYSTAL_VERSION`.

SHARDS\_OVERRIDE  
Defines the location of `shard.override.yml`.

Files
-----

shard.yml  
Describes a shard project including its dependencies. See
**shard.yml**(5) for documentation.

shard.override.yml  
Local overrides to `shard.yml`.

shard.lock  
Lockfile that stores information about the installed versions.

If your shard builds an application, **shard.lock** should be checked
into version control to provide reproducible dependency installs.

If it is only a library for other shards to depend on, **shard.lock**
should `not` be checked in, only **shard.yml**. It’s good advice to add
it to **.gitignore**.

REPORTING BUGS
--------------

Report shards bugs to
<a href="https://github.com/crystal-lang/shards/issues" class="bare">https://github.com/crystal-lang/shards/issues</a>

Crystal Language home page:
<a href="https://crystal-lang.org" class="bare">https://crystal-lang.org</a>

COPYRIGHT
---------

Copyright © 2021 Julien Portalier.

[License Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0)

This is free software: you are free to change and redistribute it. There
is NO WARRANTY, to the extent permitted by law.

AUTHORS
-------

Written by Julien Portalier and the Crystal project.

SEE ALSO
--------

**shard.yml**(5)

Last updated 2021-03-15 15:52:09 +0100
