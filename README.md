## Neovim Development Environment Setup Guide for Arch Linux

---

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Installing Dependencies](#installing-dependencies)
- [Installing Language Servers](#installing-language-servers)
- [Setting Up Neovim](#setting-up-neovim)

---

## Introduction

This document provides a step-by-step guide to setting up a Neovim development environment on Arch Linux. It includes the installation of essential dependencies, language servers, and additional tools to enhance your coding experience.

## Prerequisites

- **Operating System**: [Arch Linux](https://archlinux.org)
- **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim)

## Installing Dependencies

To ensure all plugins function correctly, you will need to install the following dependencies:

```bash
# Install Node.js and npm for coc.nvim
sudo pacman -S nodejs
yay -S nodejs-neovim

# Install Lua-Penlight for code_runner.nvim
sudo pacman -S lua-penlight

# Install Universal Ctags for vista.vim
sudo pacman -S ctags
```

## Installing Language Servers

Next, install the language servers required for various programming languages:

```bash
# Install Bash Language Server
sudo pacman -S bash-language-server

# Install Clangd for C/C++ language support
sudo pacman -S clang

# Install CMake Language Server
yay -S cmake-language-server

# Install Lua Language Server
sudo pacman -S lua-language-server

# Install SystemVerilog Language Server (svlangserver)
yay -S svlangserver
```

## Setting Up Neovim

First, install Neovim:

```bash
sudo pacman -S neovim
```

Then, clone the Neovim configuration repository:


```bash
git clone https://github.com/cybaol/nvim.git ~/.config/nvim
```

After opening neovim, it will automatically install the required plugins and configure them without manual intervention.
Finally run the command `:checkhealth` in Neovim to ensure all dependencies are correctly installed. If not, please fix them. I trust you.
