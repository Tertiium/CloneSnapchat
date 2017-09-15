//
//  ViewController.swift
//  Snapchat
//
//  Created by user on 31/08/17.
//  Copyright © 2017 yangguozhang. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Outlets
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let autenticacao = FIRAuth.auth()
        
        
        /*do{
            try autenticacao?.signOut()
        }catch{
            print("Erro ao deslogar usuario!")
        }*/
        
        // Redirecionar para tela principal caso o usuario está logado
        autenticacao?.addStateDidChangeListener({ (autenticacao, usuario) in
            if usuario != nil {
                self.performSegue(withIdentifier: "loginAutomaticoSegue", sender: nil)
            }
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    


}

