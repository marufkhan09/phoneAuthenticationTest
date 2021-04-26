//
//  NumberViewController.swift
//  PhoneAuthenticationTest
//
//  Created by Maruf Khan on 9/3/21.
//

import UIKit
//import Contacts
import FirebaseAuth


class NumberViewController: UIViewController {

  
    @IBOutlet var phoneNumberTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        phoneNumberTf.becomeFirstResponder()
        self.navigationController?.isNavigationBarHidden = false

    }
    
    @IBAction func Numberconfirmed(_ sender: Any) {
        UserDefaults.standard.setValue(phoneNumberTf.text, forKey: "phnNum")
        let alert = UIAlertController(title: "Phone Number", message: "Is this your Phone Number?\n \(phoneNumberTf.text!)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Yes", style: .default) { (UIAlertAction) in
            Auth.auth().languageCode = "en"
            Auth.auth().settings?.isAppVerificationDisabledForTesting = false
            PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneNumberTf.text!, uiDelegate: nil) { (verificationID, error) in
                if error != nil {
                    print("error : \(String(describing: error?.localizedDescription))")
                }
                else {
                    let defaults = UserDefaults.standard
                    defaults.setValue(verificationID, forKey: "authVID")
                    print("verification id is : \(String(describing: verificationID))")
                    self.performSegue(withIdentifier: "numberConfirmed", sender: Any?.self)

                       

                }
            }
        }
        let cancel = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        

        
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if  segue.identifier == "pushData" {
//            let verificationVC = segue.destination as! VerificationViewController
//
//            verificationVC.number = phoneNumberTf.text!
//            Auth.auth().languageCode = "en"
//            Auth.auth().settings?.isAppVerificationDisabledForTesting = false
//            PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumberTf.text!, uiDelegate: nil) { (verificationID, error) in
//                if error != nil {
//                    print("verification method failed")
//                        let alert = UIAlertController(title: "Failed", message: "Enter a Valid Phone Number", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
//                        print("Okay")
//                    }))
//                        self.present(alert, animated: true)
//                    UserDefaults.standard.setValue(verificationID, forKey: "authVerificationID")
//                    return
//                }
//                else {
//                    print("verification id is : \(String(describing: verificationID))")
//                    verificationVC.verificationID = verificationID!
//                }
//            }
//        }
//        else {
//            print("ERROR DETECTED")
//        }
//    }

}
