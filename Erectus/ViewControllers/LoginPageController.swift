//
//  LoginPageController.swift
//  Erectus
//
//  Created by Alexey on 19/01/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit
import Firebase
class LoginPageController: UIViewController {

    
   
    @IBOutlet weak var email_field: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func toRegister(_ sender: Any) {
        let registerController = storyboard?.instantiateViewController(withIdentifier: "RegistrPage") as! RegisterController
        registerController.modalPresentationStyle = .fullScreen
        present(registerController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    

}
