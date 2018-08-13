//
//  GoogleDriveManager.swift
//  GoogleDriveManager
//
//  Created 2018/08/12.
//  Copyright © 2018年 yu2xzfmd. All rights reserved.
//

public protocol GoogleDriveManager {
    func signOut(success : (() -> Void)?)
    func signIn(success : (() -> Void)?)
    func isConnected() -> Bool
}

