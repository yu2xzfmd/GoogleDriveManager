//
//  GoogleDriveAPIService.swift
//  GoogleDriveManager
//
//  Created 2018/08/12.
//  Copyright © 2018年 yu2xzfmd. All rights reserved.
//

import UIKit

public class GoogleDriveAPIService {
    
    private let repository = GoogleDriveAPIRepository()
    public init() {}
    
    public var about: AboutRequest {
        return AboutRequest()
    }
    
    public var file: FilesRequest {
        return FilesRequest()
    }
    
}
