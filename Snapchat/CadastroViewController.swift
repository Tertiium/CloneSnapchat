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
                                
                                if user == nil {
                                    self.exibirMensagem(titulo: "Erro ao autenticar", mensagem: "Problema ao realizar autenticação, tente novamente.")
                                }else {
                                    // Redireciona usuario para tela principal
                                    self.performSegue(withIdentifier: "cadastroLoginSegue", sender: nil)
                                }
                                
                            }else {
                                
                                let erroR = error! as NSError
                                if let codigoErro = erroR.userInfo["error_name"] {
                                    
                                    let erroTexto = codigoErro as! String
                                    var mensagemErro = ""
                                    switch erroTexto {
                                        case "ERROR_INVALID_EMAIL" :
                                            mensagemErro = "E-mail inválidom digite um e-mail váido!"
                                            break
                                        
                                        case "ERROR_WEAK_PASSWORD" :
                                            mensagemErro = "Senha precisa ter no mínimo 6 caracteres, com letras e números."
                                            break
                                        
                                        case "ERROR_EMAIL_ALREADY_IN_USE" :
                                            mensagemErro = "Esse e-mail já está sendo utilizado, crie sua conta com outro e-mail."
                                            break
                                        
                                        default :
                                            mensagemErro = "Dados digitados estão incorreto."
                                    }
                                    self.exibirMensagem(titulo: "Dados Inválidos", mensagem: mensagemErro)
                                    
                                }
                                
                            }/*Fim validação erro Firebase*/
                        })
                        
                    }else{
                        self.exibirMensagem(titulo: "Dados incorretos.", mensagem: "As senhas não estão iguais, digite novamente.")
                    }/* Fim Validação senha*/
                    
                }
            }
        }
        
    }
    
    

}
