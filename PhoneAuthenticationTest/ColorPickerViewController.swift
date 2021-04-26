//
//  ColorPickerViewController.swift
//  PhoneAuthenticationTest
//
//  Created by Maruf Khan on 1/4/21.
//

import UIKit

class ColorPickerViewController: UIViewController {
    @IBOutlet var chatView: UIView!
    @IBOutlet var chatReply: UILabel!
    @IBOutlet var chatSend: UILabel!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

    
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false

    }
    @IBAction func whiteBtn(_ sender: Any) {
        chatView.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 0.25)
        chatSend.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        button.layer.cornerRadius = 25
        chatSend.layer.cornerRadius = 25
        chatReply.layer.cornerRadius = 25
        button.clipsToBounds = true
        
        NotificationCenter.default.post(name: .white, object: nil)
        
    }

    @IBAction func greenBtn(_ sender: Any) {
        chatView.backgroundColor = #colorLiteral(red: 0.3669196069, green: 0.7710189223, blue: 0.6353020072, alpha: 0.5075606795)
        chatSend.backgroundColor = #colorLiteral(red: 0.3669196069, green: 0.7710189223, blue: 0.6353020072, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.3669196069, green: 0.7710189223, blue: 0.6353020072, alpha: 1)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        chatSend.layer.cornerRadius = 25
        chatReply.layer.cornerRadius = 25
        
        NotificationCenter.default.post(name: .green, object: nil)

        
    }
    @IBAction func pinkBtn(_ sender: Any) {
        chatView.backgroundColor = #colorLiteral(red: 1, green: 0.5976218581, blue: 0.6312592626, alpha: 0.25)
        chatSend.backgroundColor = #colorLiteral(red: 1, green: 0.5976218581, blue: 0.6312592626, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.5976218581, blue: 0.6312592626, alpha: 1)
        button.layer.cornerRadius = 25
        chatSend.layer.cornerRadius = 25
        chatReply.layer.cornerRadius = 25
        button.clipsToBounds = true
        
        NotificationCenter.default.post(name: .pink, object: nil)
        

        
    }
    @IBAction func orangeBtn(_ sender: Any) {
        chatView.backgroundColor = #colorLiteral(red: 1, green: 0.5965796113, blue: 0.1587926447, alpha: 0.25)
        chatSend.backgroundColor = #colorLiteral(red: 1, green: 0.5965796113, blue: 0.1587926447, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.5965796113, blue: 0.1587926447, alpha: 1)
        button.layer.cornerRadius = 25
        chatSend.layer.cornerRadius = 25
        chatReply.layer.cornerRadius = 25
        button.clipsToBounds = true
        
        NotificationCenter.default.post(name: .orange, object: nil)

        
    }

    @IBAction func blueBtn(_ sender: Any) {
        chatView.backgroundColor = #colorLiteral(red: 0, green: 0.5461315513, blue: 0.8974441886, alpha: 0.25)
        chatSend.backgroundColor = #colorLiteral(red: 0, green: 0.5461315513, blue: 0.8974441886, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.5461315513, blue: 0.8974441886, alpha: 1)
        button.layer.cornerRadius = 25
        chatSend.layer.cornerRadius = 25
        chatReply.layer.cornerRadius = 25
        button.clipsToBounds = true
        
        NotificationCenter.default.post(name: .blue, object: nil)

        
    }
    @IBAction func violetBtn(_ sender: Any) {
        chatView.backgroundColor = #colorLiteral(red: 0.3570207357, green: 0.296844393, blue: 0.694029212, alpha: 0.25)
        chatSend.backgroundColor = #colorLiteral(red: 0.3570207357, green: 0.296844393, blue: 0.694029212, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.3570207357, green: 0.296844393, blue: 0.694029212, alpha: 1)
        button.layer.cornerRadius = 25
        chatSend.layer.cornerRadius = 25
        chatReply.layer.cornerRadius = 25
        button.clipsToBounds = true
        
        NotificationCenter.default.post(name: .violet, object: nil)

        
    }
    @IBAction func applyChange(_ sender: Any) {
        performSegue(withIdentifier: "tabView", sender: Any?.self)
    }
}
