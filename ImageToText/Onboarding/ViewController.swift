//
//  ViewController.swift
//  assessment-3
//
//  Created by Orhan Erbas on 8.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func nextAction(_ sender: Any) {
        
        performSegue(withIdentifier: "nextFifth", sender: nil)
    }
    
    
}

