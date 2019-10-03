//
//  FilesRequest.swift
//  GoogleDriveManager
//
//

import Foundation

public class FilesRequest: FilesProtcol {
    
    private let filesUrl = "https://www.googleapis.com/drive/v3/files"
    
    public func list(id: String? = nil, nextPageToken : String? = nil, result : ( (_ item: GDFiles) -> Void)?, failed: ((_ error: Error?) -> Void)? = nil) {
        GoogleDriveAPIRepository().doRequest(urlStr: filesUrl, parameters: Parameters().filesListParam(id: id, nextPageToken: nextPageToken), result: {
            do {
                let item = try JSONDecoder().decode(GDFiles.self, from: $0)
                result?(item)
            } catch {
                failed?(error)
            }
        }, failed: failed)
    }
    
    public func get(id: String, result : ( (_ file: GDFile) -> Void)?, failed: ((_ error: Error?) -> Void)? = nil) {
        GoogleDriveAPIRepository().doRequest(urlStr: "\(filesUrl)/\(id)", parameters: Parameters().filesGetParam(), result: {
            do {
                let file = try JSONDecoder().decode(GDFile.self, from: $0)
                result?(file)
            } catch {
                failed?(error)
            }
        }, failed: failed)
    }
    
    public func downloadUrl(file : GDFile) -> URL {
        var url = URL(string: filesUrl)!
        url.appendPathComponent(file.id)
        url.appendParameters(["access_token": GoogleDriveAuth.shared.currentUser?.authentication.accessToken ?? "", "alt": "media"])
        return url
    }
    
    public func download(file: GDFile, progress: @escaping (Progress) -> Void, finish: @escaping (URL) -> Void, failed: ((Error?) -> Void)? = nil) {
        Downloader(file: file)
            .download(url: downloadUrl(file: file), progress: progress, finish: finish, failed: failed)
    }

}
