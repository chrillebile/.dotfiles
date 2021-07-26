# My .files

[![CI - Setup - Linting](https://github.com/chrillebile/.dotfiles/actions/workflows/setup.yml/badge.svg?branch=main)](https://github.com/chrillebile/.dotfiles/actions/workflows/setup.yml)

## MacOS setup
### Requirements
This requires the following;
* git - *should be installed by default on MacOS*
* xcode-select - Needed for building some of the packages

To install *xcode-select* run and follow the guide:

`xcode-select --install`


### Setup

- If you want to clone this repository with "yadm": ***\*recommended\****

  - First you need to install [brew](https://brew.sh) 
  - Then install [yadm](https://yadm.io) with: 
    
    `brew install yadm`

- Clone repository:

  `yadm clone https://github.com/chrillebile/.dotfiles.git`

### Run

- chmod setup script

  `chmod u+x setup.sh`

- Run setup

  `./setup.sh`


#### Selective way

If you only want to run one of the setup scripts (see in *.setup_scripts/* for scripts)

- chmod script

  `chmod u+x <script>`

- Run scripts

  `./<name>`

### Manually setting up iTerm2

- Open iTerm2
- Select iTerm2 -> Preferences
- Under the General tab -> Preferences, check the box labeled "Load Preferences from custom folder or URL"
- Press "Browse" and point it to `~/.config/iTerm2`
- Restart iTerm2

