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
    
    @IBAction func skipAction(_ sender: Any) {
        // Haptic FeedBack
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        let generator2 = UIImpactFeedbackGenerator(style: .medium)
        generator2.impactOccurred()
        // Haptic FeedBack End
        
        performSegue(withIdentifier: "nextFifth", sender: nil)
    }
    
    
    @IBAction func nextAction(_ sender: Any) {
        // Haptic FeedBack
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        let generator2 = UIImpactFeedbackGenerator(style: .medium)
        generator2.impactOccurred()
        // Haptic FeedBack End
        
        performSegue(withIdentifier: "nexOne", sender: nil)
    }
    
    
}

