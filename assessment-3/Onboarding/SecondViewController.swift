//
//  SecondViewController.swift
//  assessment-3
//
//  Created by Orhan Erbas on 10.04.2021.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func hapticFeedBack(){
        // Haptic FeedBack
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        let generator2 = UIImpactFeedbackGenerator(style: .medium)
        generator2.impactOccurred()
        // Haptic FeedBack End
    }

    @IBAction func backButtonAction(_ sender: Any) {
        hapticFeedBack()
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func skipButtonAction(_ sender: Any) {
        hapticFeedBack()
        performSegue(withIdentifier: "nextFour", sender: nil)
    }
    
    
    @IBAction func nextButtonAction(_ sender: Any) {
        hapticFeedBack()
        performSegue(withIdentifier: "nextTwo", sender: nil)
    }
}
