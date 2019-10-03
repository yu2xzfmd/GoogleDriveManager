//
//  ViewController.swift
//  GoogleDriveManagerTest
//
//

import UIKit
import GoogleDriveManager

class ViewController: UIViewController {
    
    @IBOutlet weak var status: UILabel!
    let auth = GoogleDriveAuth.shared
    let api = GoogleDriveAPIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func signIn(_ sender: Any) {
        auth.signIn(viewController: self) { (error) in
            print(error?.localizedDescription ?? "")
            self.status.text = self.auth.isConnected().description
        }
    }
    
    @IBAction func signOut(_ sender: Any) {
        auth.signOut { _ in
            print("signOut")
            self.status.text = self.auth.isConnected().description
        }
    }
    
    @IBAction func api(_ sender: Any) {

//        api.about.get(result: {
//            dump($0)
//        })
        api.file.list(result: {
            dump($0)
            $0.files?.forEach({ (file) in
                print(file.mimeType)
            })
        })
//        api.file.get(id: "0B2eFETK6Di5OVEhBZ19ERU1FUGc", result: {
//            [weak self] in
//            dump($0)
//            self?.api.file.download(file: $0, progress: {
//                print("\($0.completedUnitCount*100/$0.totalUnitCount)%")
//            }, finish: {
//                print($0)
//            }, failed: {
//                print($0?.localizedDescription ?? "")
//            })
//        })
//
//        api.file.get(id: "1JyopVHGAzAc6kNvrOzmn6p4tOPIqLwB6", result: {
//            [weak self] in
//            dump($0)
//            self?.api.file.download(file: $0, progress: {
//                print("\($0.completedUnitCount*100/$0.totalUnitCount)%")
//            }, finish: {
//                print($0)
//            }, failed: {
//                print($0?.localizedDescription ?? "")
//            })
//        })

//        dump(auth.currentUser?.profile)
        
    }
    
}
