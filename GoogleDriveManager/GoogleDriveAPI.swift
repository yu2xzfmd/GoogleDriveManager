//
//  GoogleDriveAPI.swift
//  GoogleDriveManager
//
//

import Foundation

/**
 * https://www.googleapis.com/drive/v3/about
 */
public protocol AboutProtcol {
    func get(result : ( (_ item: About) -> Void)?, failed: ((_ error: Error?) -> Void)? )
}

/**
 * https://www.googleapis.com/drive/v3/files
 */
public protocol FilesProtcol {
    func list(id: String?,nextPageToken : String?, result : ( (_ item: GDFiles) -> Void)?, failed: ((_ error: Error?) -> Void)?)
    func get(id: String, result : ( (_ file: GDFile) -> Void)?, failed: ((_ error: Error?) -> Void)?)
    func downloadUrl(file : GDFile) -> URL
    func download(file : GDFile, progress: @escaping (Progress) -> Void, finish: @escaping (URL) -> Void, failed: ((Error?) -> Void)? )
}
