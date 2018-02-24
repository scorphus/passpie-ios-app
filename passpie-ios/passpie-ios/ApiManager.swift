//
//  ApiManager.swift
//  passpie-ios
//
//  Created by Harjas Monga on 2/24/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import Foundation
import Alamofire

class ApiManager {
    static var sharedInstance = ApiManager()
    
    func loadRepos(userName: String, repoName: String, accessToken: String, completion: @escaping ([RepoItem]?, Error?) -> ()) {
        let urlString = "https://api.github.com/repos/\(userName)/\(repoName)/contents?access_token=\(accessToken)"
        request(urlString, method: .get, parameters: nil, encoding: URLEncoding.queryString).validate().responseJSON { (response) in
            if response.result.isSuccess {
                let itemsDictionary = response.result.value as! [[String : Any]]
                var items: [RepoItem] = []
                for itemDictionary in itemsDictionary {
                    let item = RepoItem(repoDicitonary: itemDictionary)
                    items.append(item)
                }
                completion(items, nil)
            } else {
                print("issue get repo")
                completion(nil, response.error)
            }
        }
    }
}
