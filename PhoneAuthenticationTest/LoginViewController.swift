//
//  LoginViewController.swift
//  PhoneAuthenticationTest
//
//  Created by Maruf Khan on 15/3/21.
//

import UIKit


class LoginViewController: UIViewController {
    
    @IBOutlet var profilePhoto: UIButton!
    @IBOutlet var userName: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false

            
        }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false

    }
    @IBAction func profileSubmit(_ sender: Any) {
        
        performSegue(withIdentifier: "profile", sender: Any?.self)
    }
}



