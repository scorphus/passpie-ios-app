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
    func loadRepos(userName: String, repoName: String, accessToken: String) {
        let urlString = "https://api.github.com/repos/\(userName)/\(repoName)/contents?access_token=\(accessToken)"
        request(urlString, method: .get, parameters: nil, encoding: URLEncoding.queryString).validate().responseJSON { (response) in
            if response.result.isSuccess {
                print(response.result.value!)
            } else {
                print("issue get repo")
            }
        }
    }
}
