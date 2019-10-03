//
//  GoogleDriveAuthProtcol.swift
//  GoogleDriveManager
//
//  Created 2018/08/12.
//  Copyright © 2018年 yu2xzfmd. All rights reserved.
//

public protocol GoogleDriveAuthProtcol {
    func signOut(success : @escaping (Error?) -> Void)
    func signIn(viewController: UIViewController, success : @escaping (Error?) -> Void)
    func isConnected() -> Bool
    func handle(url: URL) -> Bool
}

