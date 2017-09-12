//
//  CadastroViewController.swift
//  Snapchat
//
//  Created by user on 04/09/17.
//  Copyright © 2017 yangguozhang. All rights reserved.
//

import UIKit
import FirebaseAuth

class CadastroViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Outlets
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldSenha: UITextField!
    
    @IBOutlet weak var textFieldConfirmarSenha: UITextField!
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
    
    // MARK: - IBAction
    
    func exibirMensagem(titulo: String, mensagem: String) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(acaoCancelar)
        self.present(alerta, animated: true, completion: nil)
    }
    
    @IBAction func criarConta(_ sender: UIButton) {
        
        // Recuperar dados digitados
        if let emailR = self.textFieldEmail.text {
            if let senhaR = self.textFieldSenha.text {
                if let senhaConfirmacaoR = self.textFieldConfirmarSenha.text {
                    
                    // Validar senha
                    if senhaR == senhaConfirmacaoR {
                        
                        // Criar conta no Firebase
                        let autenticacao = FIRAuth.auth()
                        autenticacao?.createUser(withEmail: emailR, password: senhaR, completion: { (user, error) in
                            if error == nil {
                                print("Sucesso ao cadastrar usuário.")
                            }else {
                                print("Erro ao cadastrar usuário")
                            }
                        })
                        
                    }else{
                        self.exibirMensagem(titulo: "Dados incorretos.", mensagem: "As senhas não estão iguais, digite novamente.")
                    }/* Fim Validação senha*/
                    
                }
            }
        }
        
    }
    
    

}
