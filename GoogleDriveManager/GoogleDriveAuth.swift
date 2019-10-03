//
//  GoogleDriveAuth.swift
//  GoogleDriveManager
//
//  Created 2018/08/12.
//  Copyright © 2018年 yu2xzfmd. All rights reserved.
//

import UIKit
import GoogleSignIn

public class GoogleDriveAuth: NSObject, GoogleDriveAuthProtcol {
 
    public static let shared = GoogleDriveAuth()
    
    private var signIn : ((_ error: Error?) -> Void)?
    private var signOut : ((_ error: Error?) -> Void)?
    
    public enum Scope: String {
        case drive = "https://www.googleapis.com/auth/drive"
        case file = "https://www.googleapis.com/auth/drive.file"
        case metadata = "https://www.googleapis.com/auth/drive.metadata"
        case metadataReadOnly = "https://www.googleapis.com/auth/drive.readonly"
        case appdata = "https://www.googleapis.com/auth/drive.metadata.readonly"
        case photosReadonly = "https://www.googleapis.com/auth/drive.photos.readonly"
    }
    
    private override init() {
        super.init()
        Downloader.clearTmp()
    }
    
    public var currentUser: GIDGoogleUser? {
        return GIDSignIn.sharedInstance().currentUser
    }
    
    public func initalize(clientID: String, scopes: [Scope] = [.drive]) {
        GIDSignIn.sharedInstance().clientID = clientID
        GIDSignIn.sharedInstance().delegate = self
        scopes.forEach {
            GIDSignIn.sharedInstance().scopes.append($0.rawValue)
        }
        GIDSignIn.sharedInstance().restorePreviousSignIn()
    }
    
    public func signOut(success: @escaping (Error?) -> Void) {
        signOut = success
        GIDSignIn.sharedInstance()?.disconnect()
    }
    
    public func signIn(viewController: UIViewController, success: @escaping (Error?) -> Void) {
        GIDSignIn.sharedInstance().presentingViewController = viewController
        signIn = success
        GIDSignIn.sharedInstance().signIn()
    }
    
    public func isConnected() -> Bool {
        return GIDSignIn.sharedInstance().hasPreviousSignIn()
    }
    
    public func handle(url: URL) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
}

extension GoogleDriveAuth : GIDSignInDelegate {
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        self.signIn?(error)
    }

    public func sign(_ signIn: GIDSignIn!, didDisconnectWith user:GIDGoogleUser!,
              withError error: Error!) {
        self.signOut?(error)
    }
}
