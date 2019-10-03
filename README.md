# GoogleDriveManager
Insert Cartfile
```
github "https://github.com/yu2xzfmd/GoogleDriveManager.git" "2.0.0"
```

Insert Pod
```
pod 'GoogleDriveManager', :git => 'https://github.com/yu2xzfmd/GoogleDriveManager.git', :tag => '2.0.0'
```

Update carthage
```
carthage update --platform iOS
```

Initialize
GoogleCloudPlatformからDrive APIを有効にしてClientIDとURLスキームを取得してください
Info.plistに取得URLスキームを設定

AppDelegateで初期化を行う
```
GoogleDriveAuth.shared.initalize(clientID: "hage")
```


