//
//  ViewController.swift
//  NetworkLibrary
//
//  Created by kavitathorat on 12/23/2020.
//  Copyright (c) 2020 kavitathorat. All rights reserved.
//

import UIKit
import NetworkLibrary

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        APIHelper.callPostWebservice(headers: [:]) { (success) in
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

