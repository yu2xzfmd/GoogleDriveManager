//
//  Parameters.swift
//  GoogleDriveManager
//
//  Created 2018/08/12.
//  Copyright © 2018年 yu2xzfmd. All rights reserved.
//

class Parameters {
    
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
    
    func createFilesParam(token : String, id : String, nextPageToken : String? = nil, pageSize : String? = nil) -> [String : String] {
        let query = "'" + id + "' in parents"
        let fields = "nextPageToken, files(id, name, size, mimeType, fileExtension, createdTime, modifiedTime, trashed, iconLink, parents, properties, webContentLink, webViewLink)"
        let orderBy = "folder"
        return createParam(token: token, query : query, fields : fields, orderBy : orderBy, nextPageToken : nextPageToken, pageSize : pageSize)
    }
    
    func createAboutParam(token : String) -> [String : String] {
        return createParam(token: token)
    }
    
}
