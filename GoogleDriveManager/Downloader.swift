//
//  Downloader.swift
//  GoogleDriveManager
//
//

import Foundation


class Downloader: NSObject {
    
    private var progress: ((Progress) -> Void)?
    private var finish: ((URL) -> Void)?
    private var failed: ((Error?) -> Void)?
    private var downloadTask: URLSessionDownloadTask?
    
    private let file: GDFile
    
    init(file: GDFile) {
        self.file = file
        super.init()
        
        if !FileManager.default.fileExists(atPath: Downloader.tmpDirectory) {
            try? FileManager.default.createDirectory(atPath: Downloader.tmpDirectory, withIntermediateDirectories: true, attributes: nil)
        }
        
    }
    
    static func clearTmp() {
        try? FileManager.default.removeItem(atPath: tmpDirectory)
        try? FileManager.default.createDirectory(atPath: tmpDirectory, withIntermediateDirectories: true, attributes: nil)
    }
    
    func download(url: URL, progress: @escaping (Progress) -> Void, finish: @escaping (URL) -> Void, failed: ((Error?) -> Void)? = nil) {
        self.progress = progress
        self.finish = finish
        self.failed = failed
        
        if fileExists {
            finish(URL(fileURLWithPath: tmpPath))
            return
        }
        
        let sessionConfig = URLSessionConfiguration.background(withIdentifier: file.id)
        let session = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 30)
        request.addValue("", forHTTPHeaderField: "Accept-Encoding")
        downloadTask = session.downloadTask(with: request)
        downloadTask?.resume()
    }
    
    func cancel() {
        downloadTask?.cancel()
    }
    
    private static var tmpDirectory: String {
        return NSTemporaryDirectory() + "GoogleDriveManager"
    }
    
    private var tmpPath: String {
        return "\(Downloader.tmpDirectory)/\(file.id).\(file.fileExtension ?? "")"
    }
    
    private var fileExists: Bool {
        return FileManager.default.fileExists(atPath: tmpPath)
    }
    
}

extension Downloader: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        session.invalidateAndCancel()
        do {
            try FileManager.default.moveItem(atPath: location.path, toPath: tmpPath)
            DispatchQueue.main.async {
                self.finish?(URL(fileURLWithPath: self.tmpPath))
            }
        } catch {
            DispatchQueue.main.async {
                self.failed?(error)
            }
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let p = Progress(totalUnitCount: totalBytesExpectedToWrite)
        p.completedUnitCount = totalBytesWritten
        DispatchQueue.main.async {
            self.progress?(p)
        }
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        session.invalidateAndCancel()
        DispatchQueue.main.async {
            self.failed?(error)
        }
    }
    
}
