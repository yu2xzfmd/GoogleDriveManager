//
//  GoogleDriveAPI.swift
//  GoogleDriveManager
//
//  Created 2018/08/12.
//  Copyright © 2018年 yu2xzfmd. All rights reserved.
//

import UIKit
import GoogleSignIn

public class GoogleDriveAPI {
    
    private let googleDriveAPIService = GoogleDriveAPIService()
    private let current = GIDSignIn.sharedInstance().currentUser
    
    public init() {}
    
    public func getAbout(accessToken : String? = nil, results : ( (_ item: About) -> Void)? ) {
        if let token = accessToken {
            googleDriveAPIService.getAboutRequest(token: token, results: results)
            return
        }
        guard let token = current?.authentication.accessToken else { return }
        googleDriveAPIService.getAboutRequest(token: token, results: results)
    }

    public func getFileList(accessToken : String? = nil, id : String ,results : ((_ item : GDItem) -> Void)? ) {
        if let token = accessToken {
            googleDriveAPIService.getFileListRequest(token: token, id: id, results: results)
            return
        }
        guard let token = current?.authentication.accessToken else { return }
        googleDriveAPIService.getFileListRequest(token: token, id: id, results: results)
    }
    
    public func downloadFileUrl(file : GDFile ) -> String {
        return googleDriveAPIService.downloadFileUrlRequest(file: file)
    }
}
