//
//  VerificationViewController.swift
//  PhoneAuthenticationTest
//
//  Created by Maruf Khan on 9/3/21.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class VerificationViewController: UIViewController, UITextFieldDelegate{

 
    var verificationID = ""
    
    @IBOutlet var confirmationLbl: UILabel!
    @IBOutlet var numberLbl: UILabel!
    @IBOutlet var stalkView: UIStackView!
    @IBOutlet var tf1: UITextField!
    @IBOutlet var tf2: UITextField!
    @IBOutlet var tf3: UITextField!
    @IBOutlet var tf4: UITextField!
    @IBOutlet var tf5: UITextField!
    @IBOutlet var tf6: UITextField!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    var otpFields: [UITextField]{
        return [tf1!,tf2!,tf3!,tf4!,tf5!,tf6!]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let phoneNumber = UserDefaults.standard.string(forKey: "phnNum")
        numberLbl.text = "Logged in with \(phoneNumber!)"
        self.navigationController?.isNavigationBarHidden = false
        activityIndicator.isHidden = true
        tf1.delegate = self
        tf2.delegate = self
        tf3.delegate = self
        tf4.delegate = self
        tf5.delegate = self
        tf6.delegate = self
        print(otpFields.compactMap { $0.text }.joined())
        
    
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        tf1.becomeFirstResponder()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text!.count < 1) && (string.count > 0) {
                    if textField == tf1 {
                        tf2.becomeFirstResponder()
                    }
                    if textField == tf2 {
                        tf3.becomeFirstResponder()
                    }
                    if textField == tf3 {
                        tf4.becomeFirstResponder()
                    }
                    if textField == tf4 {
                        tf5.becomeFirstResponder()
                    }
                    if textField == tf5 {
                        tf6.becomeFirstResponder()
                    }
                    if textField == tf6 {
                        tf6.resignFirstResponder()
                    }

                    textField.text = string
                    return false

                }else if (textField.text!.count >= 1) && (string.count == 0) {

                    if textField == tf2 {
                        tf1.becomeFirstResponder()
                    }
                    if textField == tf3 {
                        tf2.becomeFirstResponder()
                    }
                    if textField == tf4 {
                        tf3.becomeFirstResponder()
                    }
                    if textField == tf5 {
                        tf4.becomeFirstResponder()
                    }
                    if textField == tf6 {
                        tf5.becomeFirstResponder()
                    }
                    if textField == tf1 {
                        tf1.resignFirstResponder()
                    }

                    textField.text = ""
                    return false

                } else if (textField.text!.count) >= 1 {
                    textField.text = string
                    return false
                }
                return true
    }

    @IBAction func submit(_ sender: Any) {
        
        let otpCode = self.otpFields.compactMap { $0.text}.joined()
        print("this is my otpcode: \(otpCode)")
        let defaults = UserDefaults.standard
        let credential: PhoneAuthCredential = PhoneAuthProvider.provider().credential(withVerificationID: defaults.string(forKey: "authVID")!, verificationCode: otpCode)
        Auth.auth().signIn(with: credential) { (user, error) in
      if let error = error {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
            print(error.localizedDescription)
            
        } else {
           // self.numberLbl.text = "SMS sent to: \(user!.user.phoneNumber ?? "0")"
            
            let userInfo = user?.user.providerData[0]
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
            print("this is userinfo : \(String(describing: userInfo))")
            print("provider id : \(String(describing: user?.user.providerID))")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [unowned self] in
                
                self.performSegue(withIdentifier: "logged", sender: Any?.self)
                   }
         }
      }
        
    }


}
