//
//  SeePhotoVC.swift
//  assessment-3
//
//  Created by Orhan Erbas on 9.04.2021.
//

import UIKit
import Vision
import MobileCoreServices

class SeePhotoVC: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageToTextButton: UIButton!
    var selected_img = UIImage(named: "")
    var converted : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer.cornerRadius = 25
        firstView.layer.cornerRadius = 20
        firstView.layer.borderWidth = 5
        firstView.layer.borderColor = UIColor(red: 0.422, green: 0.422, blue: 0.422, alpha: 1).cgColor
        
        imageView.image = selected_img
        
        recognizeText(Image: imageView.image!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "textToSpeechVC" {
            let vc = segue.destination as! ConvertedTextVC
            vc.converted = converted
        }
    }

    @IBAction func toTextButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "textToSpeechVC", sender: nil)
    }
    
    func recognizeText(Image : UIImage) {
       guard let cgImage = Image.cgImage else {
           fatalError("could not get cgimage")
       }
       
       let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
       
       let request = VNRecognizeTextRequest { (request, error) in
           guard let observations = request.results as? [VNRecognizedTextObservation],
           error == nil else {
               return
           }
           
           let text = observations.compactMap({
               $0.topCandidates(1).first?.string
           }).joined(separator: ",")
           DispatchQueue.main.async {
            self.converted = text
           }
          
       }
       
       do {
           try handler.perform([request])
       } catch let err {
           print("ann error occured : \(err.localizedDescription)")
       }
   }
}

