//
//  ViewController.swift
//  ImagePickerDemo
//
//  Created by Administrator on 07/04/17.
//  Copyright © 2017 Zerones. All rights reserved.
//

import UIKit

/*

 1. Create UIImagePickerController
 2. Requiers two delegates: UIImagePickerControllerDelegate and UINavigationControllerDelegate
 3. Implement UIImagePickerControllerDelegate delegate methods: didFinishPickingMediaWithInfo and imagePickerControllerDidCancel
 4. set image to view using info[String: Any], get Original or Edited image using respective key from "info" dictionary.
 
 Needs to add "Privacy - Photo Library Usage Description" permission in pList file
 
 */

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var imagePickerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Delegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("\(info)")
        
        if let userImage = (info[UIImagePickerControllerEditedImage]) as? UIImage {
            imagePickerButton.setImage(userImage, for: UIControlState.normal)
        } else if let image : UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imagePickerButton.setImage(image, for: UIControlState.normal)
        }
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("did cancel called")
         picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func imagePickerButtonPressed(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
}

