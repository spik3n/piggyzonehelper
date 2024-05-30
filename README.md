# PiggyZone GUI Helper

This Lua script is designed to assist with zone selection in PiggyZone using a graphical user interface (GUI). It parses an INI file containing zone connections and provides a user-friendly interface for selecting zones and executing commands.
Support searching for zones located inside your (`MQ2PiggyZone.ini`) file.

![guipiggy](https://github.com/spik3n/piggyzonehelper/assets/55240182/edc5fcaf-6998-4218-924f-15792f44f735)

![searchpiggy](https://github.com/spik3n/piggyzonehelper/assets/55240182/c1d07ab7-7598-4bcd-97bd-b7196598f32e)

## Features

- Parses an INI file (`MQ2PiggyZone.ini`) to obtain zone connections.
- Displays a GUI window for selecting zones.
- Supports searching for specific zones.
- Provides options for solo and group commands.

## Prerequisites

- MacroQuest framework installed.
- Lua scripting support enabled in MacroQuest.
- Require MQ2Dannet loaded

## Installation

1. Ensure MacroQuest is installed and Lua scripting is enabled.
2. Copy the Lua script folder `Piggyhelper` into your MacroQuest lua scripts directory.(MacroQuest/lua)
3. Ensure the INI file (`MQ2PiggyZone.ini`) containing zone connections is present in the MacroQuest configuration directory.

## Usage

1. Launch EverQuest and MacroQuest.
2. Load the Lua script using the command `/lua run Piggyhelper`.
3. The GUI window titled "Zone Selector" should appear.
4. Use the search input to filter zones.
5. Click on a zone to select it.
6. Choose either "Solo" or "Group" mode and click the corresponding button to execute the command.

## Configuration

The script relies on the presence of an INI file (`MQ2PiggyZone.ini`) in the MacroQuest configuration directory. Ensure this file contains the necessary zone connections.

## Contributing
Feel free to fork this repository and submit pull requests with your enhancements. You can also open issues if you find bugs or have feature suggestions.

## License

Distribute and modify this script as you need according to the terms of your MacroQuest's licensing agreement. Be sure to comply with all community guidelines and legal restrictions associated with script usage within MacroQuest.

## Disclaimer
This script is provided as-is, and while it has been tested to ensure reliability, the user assumes all responsibility for its use. Always ensure your scripting activities comply with the rules and terms of service for MacroQuest and the games it interacts with.
