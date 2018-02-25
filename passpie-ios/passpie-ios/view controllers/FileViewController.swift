//
//  FileViewControlelr.swift
//  passpie-ios
//
//  Created by Harjas Monga on 2/24/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit

class FileViewController: UIViewController {

    var file: RepoItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load is runnning in file view controller")
        ApiManager.sharedInstance.downloadFile(item: file!) { (yaml, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let yaml = yaml {
                print(yaml)
                let newYaml = yaml.replacingOccurrences(of: "\n", with: "")
                let decodedData = Data(base64Encoded: newYaml)
                let dString = String(data: decodedData!, encoding: .utf8)!
                print("\n\n encoded data \(dString)")
            }
        }
    }
    
    private func base64PaddingWithEqual(encoded64: String) -> String {
        let remainder = encoded64.characters.count % 4
        if remainder == 0 {
            return encoded64
        } else {
            // padding with equal
            let newLength = encoded64.characters.count + (4 - remainder)
            return encoded64.padding(toLength: newLength, withPad: "=", startingAt: 0)
        }
    }

}
