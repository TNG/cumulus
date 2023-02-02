# Cumulus - *Threat modeling the clouds*[<img style="height:50px;cursor:pointer;float:right" src="docs/img/download.svg"/>](https://github.com/TNG/cumulus/releases/latest)

Find the latest release [here](https://github.com/TNG/cumulus/releases/latest)

## Introduction
EoP Cornucopia

## Rules

## Acknowledgementse

The original and wonderful idea conducting threat modeling via serious games goes back to [Adam Shostack](https://github.com/adamshostack), working for Microsoft at that time.
He invented the game [Elevation of privilege](https://shostack.org/games/elevation-of-privilege) which is the blue print for Cumulus.

Another great game following Elevation of Privilege's approach to threat modeling is [Cornucopia](https://owasp.org/www-project-cornucopia/) developed by the [OWASP Foundation](https://owasp.org/).

Both card games are great tools to help development teams increase the security of the system they are building.
However, we felt the need for a threat modeling card game targeting devOps/cloud projects in particular.
Out of this idea, Cumulus arose. 

## Online Version

There exists an [online version](https://github.com/tng/elevation-of-privilege) of this card game (and also Elevation of Privilege and Cornucopia) for remote or geographically distributed teams.
This can easily be self-hosted.
You can find it under:

[https://github.com/tng/elevation-of-privilege](https://github.com/tng/elevation-of-privilege)

## Contributing

Contributions to the card deck very much appreciated.
In the end, this card deck is intended to be a community project.
Changes to the threat formulations are welcome as pull requests to [cards.tex](https://github.com/TNG/cumulus/blob/main/cards.tex).

## Versioning

The card deck follows [semantic versioning](https://semver.org/).
Version changes mean:
* *patch version*: Non-semantic changes: layout, typos, minor re-wordings, ...
* *minor version*: Semantic changes: rephrasings, additional cards, ...
* *major version*: Substantial semantic changes: new categories, ...

## Licensing

The card game (including the threat formulations and the released PDF files) are distributed under [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/).
All utils files (shell scripts, LaTeX code for layouting) are distributed under [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0).
