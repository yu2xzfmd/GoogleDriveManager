//
//  GoogleDriveService.swift
//  GoogleDriveManager
//
//  Created 2018/08/12.
//  Copyright © 2018年 yu2xzfmd. All rights reserved.
//

import UIKit
import GoogleSignIn

public protocol GoogleDriveServiceDelegate {
    func sign(error: Error!)
    func sign(dismiss viewController: UIViewController!)
    func sign(present viewController: UIViewController!)
}

public class GoogleDriveService: NSObject, GoogleDriveManager {
    
    private var signIn : (() -> Void)?
    private var signOut : (() -> Void)?
    
    public var delegate : GoogleDriveServiceDelegate?
    
    public init(clientID : String) {
        super.init()
        GIDSignIn.sharedInstance().clientID = clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/drive")
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = false
        GIDSignIn.sharedInstance().signInSilently()
    }
    
    public func signOut(success: (() -> Void)?) {
        signOut = success
        GIDSignIn.sharedInstance().signOut()
        signOut?()
    }
    
    public func signIn(success: (() -> Void)?) {
        signIn = success
        GIDSignIn.sharedInstance().signIn()
    }
    
    public func isConnected() -> Bool {
        return GIDSignIn.sharedInstance().hasAuthInKeychain()
    }
    
}

extension GoogleDriveService : GIDSignInDelegate {
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            self.signIn?()
        } else {}
    }

    public func sign(_ signIn: GIDSignIn!, didDisconnectWith user:GIDGoogleUser!,
              withError error: Error!) {
        self.signOut?()
    }
}

extension GoogleDriveService : GIDSignInUIDelegate {
    public func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        delegate?.sign(error: error)
    }
    public func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        delegate?.sign(dismiss: viewController)
    }
    public func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        delegate?.sign(present: viewController)
    }
}
