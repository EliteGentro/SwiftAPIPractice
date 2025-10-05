# PokeDex App

## Overview
The PokeDex App is a quick way for getting all the information you may want or need in order to complete your search for the strongest Pokemon o fall. 
It features a summarized general view of the Pokemon with their height and weight so that you can be sure you can carry them in your bag. If you like a specific Pokemon, you click on them
to see their TCG-like statistics, including their abilities and their different type.

## API Endpoint
GET request via [<https://pokeapi.co/api/v2/pokemon/>](https://pokeapi.co/api/v2/pokemon/) + i. Where i is the PokeDex Id of the Pokemon you want to search for. This implementation of the app looks for the first 20
Pokemon of the PokeDex, but the number can be modified in the CharacterViewModel.

## How to Run the App
* Xcode version: 26.0.1
* iOS target: 26.0
* Steps:
  * Select an iOS simulator or device to run the app in.
  * Ensure you have an internet connection on your device to test the app's full functionality.
  * Click the Build & Run "Play Button" in xCode to launch the simulator and test the app.
