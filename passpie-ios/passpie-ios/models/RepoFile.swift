//
//  File.swift
//  passpie-ios
//
//  Created by Harjas Monga on 2/24/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import Foundation

class RepoFile {
    var name: String
    var downloadURL: URL?
    
    init(fileDicitonary: [String: Any]) {
        name = fileDicitonary["name"] as! String
        let downloadURLString = fileDicitonary["download_url"] as! String
        downloadURL = URL(string: downloadURLString)
    }
}
