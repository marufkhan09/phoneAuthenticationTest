//
//  ViewController.swift
//  PhoneAuthenticationTest
//
//  Created by Maruf Khan on 4/3/21.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class ViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var titleView: UIView!
    @IBOutlet var titleImageView: UIImageView!
    @IBOutlet var chattingView: UIView!
    @IBOutlet var chattingImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @IBAction func termsAgreed(_ sender: Any) {
        performSegue(withIdentifier: "termsAccepted", sender: nil)
    }
    
}

