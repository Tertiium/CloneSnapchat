//
//  EntrarViewController.swift
//  Snapchat
//
//  Created by user on 04/09/17.
//  Copyright © 2017 yangguozhang. All rights reserved.
//

import UIKit
import FirebaseAuth

class EntrarViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Outlets
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldSenha: UITextField!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    
    @IBAction func entrar(_ sender: UIButton) {
        
        // Recuperar dados digitados
        if let emailR = self.textFieldEmail.text {
            if let senhaR = self.textFieldSenha.text{
                
                // Autenticar usuário no Firebase
                let autenticacao = FIRAuth.auth()
                autenticacao?.signIn(withEmail: emailR, password: senhaR, completion: { (user, error) in
                    
                    if error == nil {
                        
                        if user == nil {
                            self.exibirMensagem(titulo: "Erro ao autenticar", mensagem: "Problema ao realizar autenticação, tente novamente.")
                        } else {
                            
                            // Redireciona usuario para tela principal
                            self.performSegue(withIdentifier: "loginSegue", sender: nil)
                            
                            
                        }
                        
                    }else {
                        self.exibirMensagem(titulo: "Dados incorretos", mensagem: "Verifique os dados digitados.")
                    }
                    
                })
                
            }
        }
        
    }
    
    // MARK: - Functions
    
    func exibirMensagem(titulo: String, mensagem: String) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(acaoCancelar)
        self.present(alerta, animated: true, completion: nil)
    }
    
    
    
}
