//
//  Parameters.swift
//  GoogleDriveManager
//
//  Created 2018/08/12.
//  Copyright © 2018年 yu2xzfmd. All rights reserved.
//

import GoogleSignIn

class Parameters {
    
    private let currentUser = GIDSignIn.sharedInstance().currentUser
    private var token: String {
        return currentUser?.authentication.accessToken ?? ""
    }
    
    private func createParam(token : String, query : String? = nil, fields : String? = nil, orderBy : String? = nil, nextPageToken : String? = nil, pageSize : String? = nil) -> [String : String] {
        var parameters = [String : String]()
        parameters["access_token"] = token
        parameters["q"] = query
        parameters["fields"] = fields
        parameters["orderBy"] = orderBy
        parameters["pageSize"] = pageSize
        parameters["pageToken"] = nextPageToken
        
        return parameters
    }
    
    func filesListParam(id : String? = nil, nextPageToken : String? = nil, pageSize : String? = nil) -> [String : String] {
        let query = "'" + (id ?? "root" ) + "' in parents "
        + "and (not mimeType contains 'vnd.google-apps' or mimeType contains 'officedocument' or mimeType contains 'file' or mimeType contains 'folder') and trashed = false"
        let fields = "nextPageToken, kind , files(id, name, size, mimeType, fileExtension, createdTime, modifiedTime, trashed, iconLink, parents, properties, webContentLink, webViewLink, thumbnailLink)"
        let orderBy = "folder"
        return createParam(token: token, query : query, fields : fields, orderBy : orderBy, nextPageToken : nextPageToken, pageSize : pageSize)
    }
    
    func filesGetParam() -> [String : String] {
        let fields = "kind, id, name, size, mimeType, fileExtension, createdTime, modifiedTime, trashed, iconLink, parents, properties, webContentLink, webViewLink, thumbnailLink"
        return createParam(token: token, fields: fields)
    }
    
    func aboutParam() -> [String : String] {
        let fields = "kind, user(kind,displayName,photoLink,me,permissionId,emailAddress)"
        return createParam(token: token, fields: fields)
    }
    
}
