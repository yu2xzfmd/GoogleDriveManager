//
//  GoogleDriveAPIService.swift
//  GoogleDriveManager
//
//  Created 2018/08/12.
//  Copyright © 2018年 yu2xzfmd. All rights reserved.
//

import UIKit
import Alamofire

class GoogleDriveAPIService: NSObject {

    private let filesUrl = "https://www.googleapis.com/drive/v3/files"
    private let aboutUrl = "https://www.googleapis.com/drive/v2/about"
    
    func getAboutRequest(token: String, results : ( (_ item: About) -> Void)? ) {
        let method = Alamofire.HTTPMethod.get
        let parameters = Parameters().createAboutParam(token: token)
        doRequest(url: aboutUrl, method: method, parameters: parameters, result: {
            guard let about = try? JSONDecoder().decode(About.self, from: $0) else { return }
            results?(about)
        })
    }
    func getFileListRequest(token: String, id: String, results : ( (_ item: GDItem) -> Void)? ) {
        let method = Alamofire.HTTPMethod.get
        let parameters = Parameters().createFilesParam(token: token, id: id)
        doRequest(url: filesUrl, method: method, parameters: parameters, result: {
            guard let item = try? JSONDecoder().decode(GDItem.self, from: $0) else { return }
            results?(item)
        })
    }
    
    func downloadFileUrlRequest( file : GDFile ) -> String {
        return filesUrl + file.id + "?alt=media"
    }
    
    func doRequest(url : String, method : HTTPMethod, parameters: [String : String], result : ((_ data : Data) -> Void)? ) {
        Alamofire.request(url, method: method, parameters: parameters)
            .responseJSON { response in
                guard let data = response.data else { return }
                result?(data)
        }
    }
}
