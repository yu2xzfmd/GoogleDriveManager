//
//  GoogleDriveAPIRepository.swift
//  GoogleDriveManager
//
//  Created 2018/08/12.
//  Copyright © 2018年 yu2xzfmd. All rights reserved.
//

import UIKit

class GoogleDriveAPIRepository {

    func doRequest(urlStr : String, parameters: [String : String], result : ((_ data : Data) -> Void)?, failed: ((_ error: Error?) -> Void)? ) {
        var url = URL(string: urlStr)!
        url.appendParameters(parameters)
        let req = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        URLSession.shared.dataTask(with: req) { (data, responce, error) in
            if data == nil || error != nil {
                DispatchQueue.main.async {
                    failed?(error)
                }
                return
            }
            DispatchQueue.main.async {
                result?(data!)
            }
        }.resume()
    }
    
}
