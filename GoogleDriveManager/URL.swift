//
//  URL.swift
//  GoogleDriveManager
//
//

import Foundation

extension URL {
    
    public mutating func appendParameters(_ params: [String: String]) {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: nil != self.baseURL) else { return }
        var queryItems = [URLQueryItem]()
        for key in params.keys {
            queryItems.append(URLQueryItem(name: key, value: params[key]))
        }
        components.queryItems = queryItems + (components.queryItems ?? [])
        if let url = components.url {
            self = url
        }
    }
    
}
