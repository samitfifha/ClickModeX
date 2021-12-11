//
//  RegisterViewController.swift
//  Cickmode1
//
//  Created by Apple Esprit on 23/11/2021.
//  Copyright © 2021 macbook. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    var currentPhoto :UIImage?

    @IBOutlet weak var firstnTF: UITextField!
    @IBOutlet weak var lastnTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var addressTF: UITextField!
    
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var confirmpasswordTF: UITextField!
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var selectphoto: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
    
    @IBAction func signup(_ sender: Any) {
        if (currentPhoto == nil){
            self.present(Alert.makeAlert(titre: "Avertissement", message: "Choisir une image"), animated: true)
            return
        }
        
        let user = userModel(  firstname: firstnTF.text, lastname: lastnTF.text, email: emailTF.text, password: passwordTF.text, phone: phoneTF.text,adress: addressTF.text)
        Apicalls.shareInstence.adduser(user: user, uiImage: currentPhoto!) { success in
            if success {
                self.present(Alert.makeAlert(titre: "Success", message: "user ajouté"),animated: true)
            }else{
                self.present(Alert.makeAlert(titre: "failer", message: "Please try again "), animated: true)
            }
        }
    }
    @IBAction func changePhoto(_ sender: Any) {
    showActionSheet()
}
    func camera()
    {
        let myPickerControllerCamera = UIImagePickerController()
        myPickerControllerCamera.delegate = self
        myPickerControllerCamera.sourceType = UIImagePickerController.SourceType.camera
        myPickerControllerCamera.allowsEditing = true
        self.present(myPickerControllerCamera, animated: true, completion: nil)

    }
  
  
  func gallery()
  {

      let myPickerControllerGallery = UIImagePickerController()
      myPickerControllerGallery.delegate = self
      myPickerControllerGallery.sourceType = UIImagePickerController.SourceType.photoLibrary
      myPickerControllerGallery.allowsEditing = true
      self.present(myPickerControllerGallery, animated: true, completion: nil)

  }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else {
            
            return
        }
        
        currentPhoto = selectedImage
        photo.image = selectedImage
        selectphoto.isHidden = true
        
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func showActionSheet(){

        let actionSheetController: UIAlertController = UIAlertController(title: NSLocalizedString("Upload Image", comment: ""), message: nil, preferredStyle: .actionSheet)
        actionSheetController.view.tintColor = UIColor.black
        let cancelActionButton: UIAlertAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel) { action -> Void in
            print("Cancel")
        }
        actionSheetController.addAction(cancelActionButton)

        let saveActionButton: UIAlertAction = UIAlertAction(title: NSLocalizedString("Take Photo", comment: ""), style: .default)
        { action -> Void in
            self.camera()
        }
        actionSheetController.addAction(saveActionButton)

        let deleteActionButton: UIAlertAction = UIAlertAction(title: NSLocalizedString("Choose From Gallery", comment: ""), style: .default)
        { action -> Void in
            self.gallery()
        }
        
        actionSheetController.addAction(deleteActionButton)
        self.present(actionSheetController, animated: true, completion: nil)
    }

}
