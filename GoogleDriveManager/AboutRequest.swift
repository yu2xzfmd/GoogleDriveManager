//
//  AboutRequest.swift
//  GoogleDriveManager
//
//

import Foundation

public class AboutRequest: AboutProtcol {
    
    private let aboutUrl = "https://www.googleapis.com/drive/v3/about"
    private let repository = GoogleDriveAPIRepository()
    
    public func get(result : ( (_ item: About) -> Void)?, failed: ((_ error: Error?) -> Void)? = nil) {
        repository.doRequest(urlStr: aboutUrl, parameters: Parameters().aboutParam(), result: {
            do {
                let about = try JSONDecoder().decode(About.self, from: $0)
                result?(about)
            } catch {
                failed?(error)
            }
        }) {
            failed?($0)
        }
    }
    
}
