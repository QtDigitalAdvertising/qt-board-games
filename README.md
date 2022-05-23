# Board Games written in Qt
This repository contains the source code of multiple board games showing off the integration with the Qt Digital Advertising library


TicTacToe           |   Sudoku                       |   RockPaperScissors
:-------------------------:|:-------------------------:|:-------------------------:
<img src="https://github.com/qt-io/qt-board-games/blob/main/screenshots/XO.png" width="256"/> | <img src="https://github.com/qt-io/qt-board-games/blob/main/screenshots/SDK.png" width="256"/> | <img src="https://github.com/qt-io/qt-board-games/blob/main/screenshots/RPS.png" width="256"/>


## Installation

Use the QtCreator and open the `QtBoardGames.pro` or open the `QtBoardGames.xcodeproj` directly if you want only ios,. 

**Preconditions: please have a [Qt](https://www.qt.io/download) version for android and|or ios installed, as well as the QtDigitalAdvertising library**


## Usage

Inside the *main.qml* we have the main configuration defined once:

```qml
MobileConfig {
    qdaApiKey: "<API KEY GOES HERE>"
    networkId: "4147"
    siteId: "<SITE ID GOES HERE>"
    appName: "Board Games"
    bundleId: "io.qt.boardgames"
}
```

Now navigate to each *Game* file and to the *IntertistialView* and modify the *formatId* and *pageId* with your own

```
pageId: "<PAGE ID GOES HERE>"
formatId: "<FORMAT ID GOES HERE>"
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


## License
[Apache License 2.0](https://choosealicense.com/licenses/apache-2.0/)
