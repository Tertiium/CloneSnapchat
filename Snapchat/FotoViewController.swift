//
//  FotoViewController.swift
//  Snapchat
//
//  Created by user on 15/09/17.
//  Copyright © 2017 yangguozhang. All rights reserved.
//

import UIKit

class FotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Properties

    var imagePicker = UIImagePickerController()
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageViewFoto: UIImageView!
    
    @IBOutlet weak var textFieldDescricao: UITextField!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    
    @IBAction func selecionarFoto(_ sender: UIBarButtonItem) {
        
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    
    // MARK: - Functions
    
    func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let imagemRecuperada = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageViewFoto.image = imagemRecuperada
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

}
