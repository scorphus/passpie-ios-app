//
//  RepoItem.swift
//  passpie-ios
//
//  Created by Harjas Monga on 2/24/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import Foundation

class RepoItem {
    var fileName: String
    var type: String
    var downloadURL: URL?
    
    init(repoDicitonary: [String: Any]) {
        fileName = repoDicitonary["name"] as! String
        type = repoDicitonary["type"] as! String
        let downloadURLString = repoDicitonary["download_url"] as? String ?? ""
        downloadURL = URL(string: downloadURLString)
    }
}
