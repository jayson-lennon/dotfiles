# Custom bin dump
export PATH=$PATH:$HOME/.bin

# Rust
export RUST_SRC_PATH=$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export CARGO_HOME=$HOME/.cargo
export PATH=$PATH:$HOME/.cargo/bin

# Needed for rustfmt
export LD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$LD_LIBRARY_PATH

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

# Ruby gems
export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin
export PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin

# Go
#export GOPATH=$HOME/dev/go
#export PATH=$PATH:$(go env GOPATH)/bin

# Python
export PATH=$PATH:$HOME/.local/bin

# .NET
export PATH=$PATH:$HOME/.dotnet/tools

# Temporary use xterm-color to fix rust build logging
#export TERM="xterm-color"
export TERM="xterm-256color"

# Vim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export EDITOR=vim
export VISUAL=vim

export BROWSER=/usr/bin/firefox

# Custom scripts
export PATH=$PATH:$HOME/.scripts

# Custom binaries
export PATH=$PATH:$HOME/.bin

# Web dev
export NPM_CONFIG_PREFIX=$HOME/.npmglobal
export PATH=$PATH:$NPM_CONFIG_PREFIX/bin

# Custom cheats
export NAVI_PATH=$HOME/.cheats/
