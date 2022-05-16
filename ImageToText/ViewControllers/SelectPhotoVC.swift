
import UIKit
import NVActivityIndicatorView
import VisionKit

class SelectPhotoVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, VNDocumentCameraViewControllerDelegate {

    var imagePicker = UIImagePickerController()
    var selected_img = UIImage(named: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    //Adding scanner
    @IBAction func scannerPressed(_ sender: UIButton) {
        configureDocumentView()
    }
    
    //End scanner
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        
        if let image = info[.originalImage] as? UIImage {
            selected_img = image
            print("Image 444= \(image)")
         }
        performSegue(withIdentifier: "showPhoto", sender: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //Function for scanner
    private func configureDocumentView(){
        let scanningDocumentVC = VNDocumentCameraViewController()
        scanningDocumentVC.delegate = self
        present(scanningDocumentVC, animated: true, completion: nil)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        for pageNumber in 0..<scan.pageCount{
            let image = scan.imageOfPage(at: pageNumber)
            //print("Image 3333 = \(image)")
            
            selected_img = image
        }
        controller.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "showPhoto", sender: nil)
    }
    //Scanner function end
}
