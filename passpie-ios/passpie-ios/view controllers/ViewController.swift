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
        User.userName = userField.text!
        User.repoName = repoField.text!
        User.accessToken = accessTokenField.text!
        User.saveUser()
        performSegue(withIdentifier: "showRepo", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showRepo" {
//            let navigationController = segue.destination as! UINavigationController
//            let repoViewController = navigationController.childViewControllers[0] as! RepoViewController
//            repoViewController.items = self.items
//        }
    }

}

