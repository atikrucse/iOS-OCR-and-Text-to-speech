//
//  ThirtViewController.swift
//  assessment-3
//
//  Created by Orhan Erbas on 10.04.2021.
//

import UIKit

class ThirtViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        let generator2 = UIImpactFeedbackGenerator(style: .medium)
        generator2.impactOccurred()
        // Haptic FeedBack End
        
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func skipButtonAction(_ sender: Any) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        let generator2 = UIImpactFeedbackGenerator(style: .medium)
        generator2.impactOccurred()
        // Haptic FeedBack End
        
        performSegue(withIdentifier: "nextThree", sender: nil)
    }
    
    
    @IBAction func nextButtonAction(_ sender: Any) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        let generator2 = UIImpactFeedbackGenerator(style: .medium)
        generator2.impactOccurred()
        // Haptic FeedBack End
        
        performSegue(withIdentifier: "nextThree", sender: nil)
    }
}
