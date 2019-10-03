//
//  GDFiles.swift
//  GoogleDrive
//
//  Created 2018/08/12.
//  Copyright © 2018年 yu2xzfmd. All rights reserved.
//

public struct GDFile : Codable {
    public let id : String
    public let name : String
    public let createdTime : String
    public let modifiedTime : String
    public let fileExtension : String?
    public let iconLink : String?
    public let mimeType : String?
    public let parents : [String]?
    public let size : String?
    public let trashed : Bool?
    public let webContentLink : String?
    public let webViewLink : String?
    public let thumbnailLink: String?
}

public struct GDFiles : Codable {
    public let files : [GDFile]?
    public let nextPageToken : String?
    public let kind: String
}
