//
//  SelectPhotoVC.swift
//  assessment-3
//
//  Created by Orhan Erbas on 9.04.2021.
//

import UIKit
import NVActivityIndicatorView

class SelectPhotoVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    var imagePicker = UIImagePickerController()
    var selected_img = UIImage(named: "")
    var activityIndicator : NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstView.layer.cornerRadius = 20
        secondView.layer.cornerRadius = 20
        secondView.layer.borderWidth = 5
        secondView.layer.borderColor = UIColor(red: 0.422, green: 0.422, blue: 0.422, alpha: 1).cgColor
        let xAxis = self.view.bounds.size.width / 2;
        let yAxis = self.view.bounds.size.height / 2;

        let frame = CGRect(x: (xAxis), y: (yAxis), width: 45, height: 45)
        activityIndicator = NVActivityIndicatorView(frame: frame, type: .lineScale, color: .systemPink)
        self.view.addSubview(activityIndicator)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto" {
            let vc = segue.destination as! SeePhotoVC
            vc.selected_img = selected_img
        }
    }
    
    @IBAction func selectAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            activityIndicator.startAnimating()
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        
        if let image = info[.originalImage] as? UIImage {
            selected_img = image
         }
        performSegue(withIdentifier: "showPhoto", sender: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        activityIndicator.stopAnimating()
    }
}


