//
//  LoginViewController.swift
//  WhatsApp
//
//  Created by Lucídio Andrade Barbosa de Souza on 23/03/20.
//  Copyright © 2020 Lucídio Andrade Barbosa de Souza. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var campoEmail: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    var auth: Auth!
    var handler: AuthStateDidChangeListenerHandle!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        auth = Auth.auth()
        
        handler = auth.addStateDidChangeListener { (autenticacao, usuario) in
            if usuario != nil {
                self.performSegue(withIdentifier: "segueLoginAutomatico", sender: nil)
            }
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func logar(_ sender: Any) {
        
                   if let email = campoEmail.text {
                       if let senha = campoSenha.text {
                           
                        auth.signIn(withEmail: email, password: senha) { (usuario, error) in
                            if error == nil{
                                if usuario == nil {
                                    print("usuario nao existe")
                                } else {
                                    print("login suceful")
                                    self.performSegue(withIdentifier: "segueLoginAutomatico", sender: nil)
                                }
                                
                                
                            } else {
                                print("login errado")
                            }
                        }
                           
                       }
                   }
                   
              
    }
    
    @IBAction func unwindToLogin(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
