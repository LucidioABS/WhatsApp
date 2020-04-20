//
//  AjustesViewController.swift
//  WhatsApp
//
//  Created by Lucídio Andrade Barbosa de Souza on 20/04/20.
//  Copyright © 2020 Lucídio Andrade Barbosa de Souza. All rights reserved.
//

import UIKit
import FirebaseAuth

class AjustesViewController: UIViewController {
    
    var auth: Auth!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        auth = Auth.auth()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func deslogar(_ sender: Any) {
        
        do {
            try auth.signOut()
        } catch  {
            print("erro ao deslogar")
        }
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
