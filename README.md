<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
<div align="left">

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]

</div>

<a href="https://github.com/Kaweees/zsh">
  <img alt="ZSH Logo" src="assets/img/zsh.png" align="right" width="150">
</a>

<div align="left">
  <h1><em><a href="https://miguelvf.dev/blog/dotfiles/compendium">~zsh</a></em></h1>
</div>

<!-- ABOUT THE PROJECT -->

My custom configurations for zsh (Z shell) with an emphasis on speed and an efficient display of information

### Built With

[![Python][Python-shield]][Python-url]
[![GitHub Actions][github-actions-shield]][github-actions-url]
[![Docker][Docker-shield]][Docker-url]

<!-- GETTING STARTED -->

## Getting Started

### Prerequisites

Before attempting to build this project, make sure you have [git](https://git-scm.com/downloads), [zsh](https://zsh.sourceforge.io/FAQ/zshfaq01.html#l1), and [direnv](https://direnv.net/#basic-installation) installed on your machine.

### Installation

To get a local copy of the project up and running on your machine, follow these simple steps:

1. Clone the project repository

   ```sh
   git clone https://github.com/Kaweees/zsh.git ~/zsh
   cd ~/zsh
   ```

2. Install the [Gitstatus](https://github.com/romkatv/gitstatus) extension

   ```sh
   git clone --depth=1 https://github.com/romkatv/gitstatus.git ~/gitstatus
   ```

3. Install the dependencies

   ```sh
   sudo apt install zsh stow direnv fzf tmux git libnotify-bin zoxide
   ```

4. Set zsh as default shell

   ```sh
   sudo chsh -s $(which zsh)
   ```

5. Stow the dotfiles

   ```sh
   stow -t ~ .
   ```

6. Verify the installation

   ```sh
   getent passwd $USER # The last field should show zsh
   ```

7. Log out and log back in to apply the changes and verify the installation.

   ```sh
   echo $0 # Should show zsh or -zsh
   ```

<!-- PROJECT FILE STRUCTURE -->

## Project Structure

```sh
.zsh/
├── .zshrc                          - ZSH configuration
├── aliases.zsh                     - Program aliases
├── functions.zsh                   - Functions
├── keybinds.zsh                    - Keybinds
├── plugins.zsh                     - Zinit plugins
├── prompt.zsh                      - Shell prompt
├── LICENSE                         - Project license
└── README.md                       - You are here
```

## License

The source code for this project is distributed under the terms of the GNU General Public License v3.0, as I firmly believe that collaborating on free and open-source software fosters innovations that mutually and equitably beneficial to both collaborators and users alike. See [`LICENSE`](./LICENSE) for details and more information.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/Kaweees/zsh.svg?style=for-the-badge
[contributors-url]: https://github.com/Kaweees/zsh/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Kaweees/zsh.svg?style=for-the-badge
[forks-url]: https://github.com/Kaweees/zsh/network/members
[stars-shield]: https://img.shields.io/github/stars/Kaweees/zsh.svg?style=for-the-badge
[stars-url]: https://github.com/Kaweees/zsh/stargazers

<!-- MARKDOWN SHIELD BAGDES & LINKS -->
<!-- https://github.com/Ileriayo/markdown-badges -->

[Python-shield]: https://img.shields.io/badge/Python-%23008080.svg?style=for-the-badge&logo=python&logoColor=306998&labelColor=222222&color=306998
[Python-url]: https://www.python.org/
[github-actions-shield]: https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=2671E5&labelColor=222222&color=2671E5
[github-actions-url]: https://github.com/features/actions
[Docker-shield]: https://img.shields.io/badge/docker-%232671E5.svg?style=for-the-badge&logo=docker&logoColor=1D63ED&labelColor=222222&color=1D63ED
[Docker-url]: https://www.docker.com/
