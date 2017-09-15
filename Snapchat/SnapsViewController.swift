//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by user on 15/09/17.
//  Copyright © 2017 yangguozhang. All rights reserved.
//

import UIKit
import FirebaseAuth

class SnapsViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Outlets
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MAKR: - IBActions
    
    @IBAction func sair(_ sender: UIBarButtonItem) {
        
        let autenticacao = FIRAuth.auth()
        
        do {
            try autenticacao?.signOut()
            dismiss(animated: true, completion: nil)
        }catch{
            print("Erro ao deslogar usuario")
        }
        
    }
    
    

}
