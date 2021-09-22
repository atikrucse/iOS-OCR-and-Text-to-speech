//
//  ThirtViewController.swift
//  assessment-3
//
//  Created by Orhan Erbas on 10.04.2021.
//

import UIKit
import NVActivityIndicatorView


class ThirtViewController: UIViewController {
    var activityIndicator : NVActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let xAxis = self.view.bounds.size.width / 2;
        let yAxis = self.view.bounds.size.height / 2;

        let frame = CGRect(x: (xAxis), y: (yAxis), width: 45, height: 45)
        activityIndicator = NVActivityIndicatorView(frame: frame, type: .lineScale, color: .systemPink)
        self.view.addSubview(activityIndicator)
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
        performSegue(withIdentifier: "nextThree", sender: nil)
    }
    
    
    @IBAction func nextButtonAction(_ sender: Any) {
        hapticFeedBack()
        activityIndicator.startAnimating()
        performSegue(withIdentifier: "nextThree", sender: nil)
    }
}
