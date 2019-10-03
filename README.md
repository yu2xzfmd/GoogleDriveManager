# GoogleDriveManager
**Insert Cartfile
```
github "https://granks.backlog.jp/git/ENGINEER/GoogleDriveManager.git" "master"
```

**Update carthage
```
carthage update --platform iOS
```

**Initialize
GoogleCloudPlatformからDrive APIを有効にしてClientIDとURLスキームを取得してください
Info.plistに取得URLスキームを設定

AppDelegateで初期化を行う
```
GoogleDriveAuth.shared.initalize(clientID: "hage")
```


