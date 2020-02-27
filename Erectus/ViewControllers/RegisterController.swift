//
//  RegisterController.swift
//  Erectus
//
//  Created by Alexey on 19/01/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit
import Firebase

class RegisterController: UIViewController {

    @IBOutlet weak var nickNameField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registUser(_ sender: Any) {
        print("start work")
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!){(result, error) in
            if error == nil{
                print(result?.user.uid ?? "228")
            }
            else{
                let alert = UIAlertController(title: "Какие-то неполадки...", message: "Даныый email уже занят!", preferredStyle: .actionSheet)
                self.present(alert, animated: true, completion: nil)
                let action = UIAlertAction(title: "вы чмо", style: .default, handler: nil)
                alert.addAction(action)
            }
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
