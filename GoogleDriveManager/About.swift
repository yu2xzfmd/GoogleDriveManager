//
//  About.swift
//  GoogleDriveManager
//
//

import Foundation

public struct About: Codable {
    public let kind: String
    public let user: User
}

public struct User: Codable {
    public let kind : String
    public let displayName: String
    public let photoLink: String
    public let me: Bool
    public let permissionId: String
    public let emailAddress: String
}
