//
//  ViewController.swift
//  passpie-ios
//
//  Created by Harjas Monga on 2/24/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var accessTokenField: UITextField!
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var repoField: UITextField!
    var items: [RepoItem]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func getRepo(_ sender: Any) {
        ApiManager.sharedInstance.loadRepos(userName: userField.text!, repoName: repoField.text!, accessToken: accessTokenField.text!) { (items, error) in
            if let items = items {
                self.items = items
                self.performSegue(withIdentifier: "showRepo", sender: nil)
            } else if let error = error {
                print(error)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let repoViewController = segue.destination as! RepoViewController
        repoViewController.items = self.items
    }

}
