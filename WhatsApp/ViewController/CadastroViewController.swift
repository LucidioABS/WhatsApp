//
//  CadastroViewController.swift
//  WhatsApp
//
//  Created by Lucídio Andrade Barbosa de Souza on 23/03/20.
//  Copyright © 2020 Lucídio Andrade Barbosa de Souza. All rights reserved.
//

import UIKit
import FirebaseAuth

class CadastroViewController: UIViewController {
    
    @IBOutlet weak var campoNome: UITextField!
    @IBOutlet weak var campoEmail: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    
    var auth: Auth!

    override func viewDidLoad() {
        super.viewDidLoad()
        auth = Auth.auth()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func cadastrar(_ sender: Any) {
        if let nome = campoNome.text {
            if let email = campoEmail.text {
                if let senha = campoSenha.text {
                    
                    auth.createUser(withEmail: email, password: senha) { (usuario, erro) in
                        if erro == nil {
                            print("sucesso ao cadastrar usuario!")
                        } else {
                           print("erro ao cadastrar usuario!")
                        }
                    }
                    
                } else {
                    print("digite sua senha")
                }
            } else {
                print("digite seu email")
            }
            
        } else {
            print("digite seu nome")
        }
        
        
    }
    
    

}
