# Board Games written in Qt
This repository contains the source code of multiple board games showing off the integration with the Qt Digital Advertising library (it works with [Google Ad Manager](https://admanager.google.com/home/) under the hood)


TicTacToe           |   Sudoku                       |   RockPaperScissors
:-------------------------:|:-------------------------:|:-------------------------:
<img src="https://github.com/qt-io/qt-board-games/blob/main/screenshots/XO.png" width="256"/> | <img src="https://github.com/qt-io/qt-board-games/blob/main/screenshots/SDK.png" width="256"/> | <img src="https://github.com/qt-io/qt-board-games/blob/main/screenshots/RPS.png" width="256"/>


## Installation

Use the QtCreator and open the `qt-board-games.pro` or open the `qt-board-games.xcodeproj` directly if you want only ios,. 

**Preconditions: please have a [Qt](https://www.qt.io/download) version for android and|or ios installed, as well as the QtDigitalAdvertising library**


## Usage

1. Navigate to the AndroidManifest.xml and update the `com.google.android.gms.ads.APPLICATION_ID` with your real one. `ca-app-pub-3940256099942544~3347511713` is used for demo ads.
2. Navigate to `main.qml` and check the `BannerAd` and `InterstitialAd`. You can change here the `adUnitId` with your real one. In this example we are using the demo keys provided by google.
3. _ios only_: Don't forget that `iOS` requires the [google ads library](https://developers.google.com/admob/ios/download). Check the `3rdparty` folder and the `qt-board-games.pro` file to understand how we use those. Be careful which ones you use, because the ones for simulator is different than the one for real devices.
4. _ios only_: Don't forget to have your `PrivacyInfo.xcprivacy`. You'll find one in this example. (More details can be found here: [link1](https://developer.apple.com/news/?id=av1nevon), [link2](https://developer.apple.com/documentation/bundleresources/privacy_manifest_files/describing_data_use_in_privacy_manifests?language=objc), [link3](https://developer.apple.com/support/third-party-SDK-requirements/)


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


## License
[Apache License 2.0](https://choosealicense.com/licenses/apache-2.0/)
