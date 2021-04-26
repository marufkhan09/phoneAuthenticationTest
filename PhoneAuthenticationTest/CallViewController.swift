//
//  CallViewController.swift
//  PhoneAuthenticationTest
//
//  Created by Maruf Khan on 2/4/21.
//

import UIKit

class CallViewController: UIViewController {

    @IBOutlet var chatButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.visibleViewController?.title = "Call"
        chatButton.layer.cornerRadius = chatButton.frame.height / 2

    }
    @IBAction func chatButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "chatToContact", sender: Any?.self)
    }


}
