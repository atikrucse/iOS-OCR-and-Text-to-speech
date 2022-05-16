
import UIKit
import AVFoundation
import PDFKit

class ConvertedTextVC: UIViewController {

    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var donwloadButton: UIButton!
    @IBOutlet weak var convertedText: UILabel!
    @IBOutlet var opaqueView: UIView!
    @IBOutlet weak var speechButton: UIButton!
    let synth = AVSpeechSynthesizer()
    var converted = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedView.roundCorners([.topLeft], radius: 25)
        convertedText.text = converted
        popUpView.layer.cornerRadius = 20
        
        opaqueView.bounds = self.view.bounds
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func downloadPdf(_ sender: Any) {
        let activityViewController = UIActivityViewController(activityItems: ["Save as PDF", PDFCreator().prepareData(text: converted)], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        animateOut(popupView: opaqueView)
        animateOut(popupView: popUpView)
        synth.stopSpeaking(at: .immediate)
    }
    
    @IBAction func textToSpeechBtnAction(_ sender: Any) {
        animateBlur(view: opaqueView)
        animateIn(popupView: popUpView)
        speechIn(text: self.converted)
    }
    
    func animateIn(popupView : UIView) {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        popupView.alpha = 1
        popupView.transform = CGAffineTransform(scaleX: 0.8, y: 1.2)
        self.view.addSubview(popupView)
        popupView.center = self.view.center
        popupView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        popupView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.speechButton.isHidden = true
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [],  animations: {
          popupView.transform = .identity
        })
    }
    
    func animateOut(popupView: UIView) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
           popupView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        }) { (success) in
           popupView.removeFromSuperview()
        }
        self.speechButton.isHidden = false
    }
    
    //Method for text to speech
    func speechIn(text: String) {
   
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        synth.speak(utterance)
    }
    
    func animateBlur(view: UIView) {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.alpha = 0.72
        view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        self.view.addSubview(view)
        view.center = self.view.center
        view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [],  animations: {
             
        })
    }
}

extension UIView {
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    self.layer.mask = mask
  }
}
