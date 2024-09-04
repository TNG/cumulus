<!--
© 2023 TNG Technology Consulting

SPDX-License-Identifier: CC-BY-4.0
-->

# OWASP Cumulus - *Threat modeling the clouds*[<img style="height:50px;cursor:pointer;float:right" src="docs/img/download.svg"/>](https://github.com/OWASP/cumulus/releases/latest)

![Cumulus Cards](docs/img/cards.svg)
  
Cumulus is the easy way to bring security into cloud and devOps teams.

As a variant of the card game Elevation of Privilege it follows the idea to threat model a system via gamification.
This lightweight and low-barrier approach helps you find threats to your devOps or cloud project and teaches the developers a security oriented mindset.

Find the latest release [here](https://github.com/OWASP/cumulus/releases/latest).

## Threat Modeling 
The idea of threat modeling via serious games goes back to the card game [Elevation of Privilege](https://shostack.org/games/elevation-of-privilege) by [Adam Shostack](https://github.com/adamshostack).
The basic idea is to bring the developers on a table and get them start discussing the security of their system.
For this, a card game serves as a guide through a catalogue of threats.
It is designed to be low-barrier and naturally embeddable within agile development processes.

While the original game approaches security in general and another variant, Cornucopia by the OWASP Foundation, targets (web) application security in particular, we had the feeling that the specific needs of devOps team working in cloud environments have been missing.
Cumulus seeks to fill this gap and provides a custom card deck with threats to cloud systems.

Threats are classified into the categories (which are also the suits in this game):
* Access & Secrets
* Delivery
* Recovery
* Monitoring
* Resources

This game does explicitly **not** try to replace Elevation of Privilege or Cornucopia.
It should rather be seen as part of a triplet of threat modeling card decks, reflecting different aspects of modern software development projects.

## Rules of the game
Cumulus ist trick-taking card game, similar to spades.

The objective is to collect as many points as possible, either by taking a trick or by finding threats.
At the end of the game the winner is the player with the most points.

In preparation of the game an architectural overview is generated.
Ideally, this is in the form of a data flow diagram, but in the end every overview which is understood by the players is fine.
Additionally, the players agree on a starting suit, i.e.
a threat category.

After distributing the cards amongst the players, the game starts.
The first dealer is the player holding the lowest card in the starting suit.
The dealer plays a card in the starting suit.Each other players has to follow the suit during that round.
If that is not possible, the player can choose any card on hand.
The winner of the round takes the trick and is the one who played the highest value card in the round's suit or the highest trump card.

Trumps are cards from the suit *Access & Secrets*.

The winner then receives a point, starts a new round and chooses the new suit.
Each time a new card is played, all players are asked to think about whether that particular threat, mentioned on the current card, applies to their system in some form.
If a threat is found (and the team agrees that this is a topic to look at),it is written down and the finder receives an extra point.
  
## Acknowledgements 
The original and wonderful idea of conducting threat modeling via serious games goes back to [Adam Shostack](https://github.com/adamshostack), working for Microsoft at that time.
He invented the game [Elevation of Privilege](https://shostack.org/games/elevation-of-privilege) which is the blue print for Cumulus.

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
Contributions to the card deck are very much appreciated.
In the end, this card deck is intended to be a community project.

Changes to the threat formulations are welcome as pull requests to [cards.tex](https://github.com/OWASP/cumulus/blob/main/cards.tex).
  
 ## Versioning 
The card deck follows [semantic versioning](https://semver.org/).
Version changes mean: 

- *patch version*: Non-semantic changes: layout, typos, minor re-wordings, ...
- *minor version*: Semantic changes: rephrasings, additional cards...
- *major version*: Substantial semantic changes: new categories, ...
  
## Licensing 
The card game (including the threat formulations and the released PDF files are distributed under [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/).
When distributing this game, mentioning [TNG Technology Consulting](https://www.tngtech.com/en/index.html) is highly appreciated.

All utils files (shell scripts, LaTeX code for layouting) are distributed under [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0).
