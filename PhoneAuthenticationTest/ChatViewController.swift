//
//  ChatViewController.swift
//  PhoneAuthenticationTest
//
//  Created by Maruf Khan on 2/4/21.
//

import UIKit

class ChatViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var chatButton: UIButton!

    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.visibleViewController?.title = "Chat"

        chatButton.layer.cornerRadius = chatButton.frame.height / 2
        
        NotificationCenter.default.addObserver(self, selector: #selector(white(notification:)), name: .white, object: nil)
        
        //green
        NotificationCenter.default.addObserver(self, selector: #selector(green(notification:)), name: .green, object: nil)
        //pink
        NotificationCenter.default.addObserver(self, selector: #selector(pink(notification:)), name: .pink, object: nil)
        //orange
        NotificationCenter.default.addObserver(self, selector: #selector(orange(notification:)), name: .orange, object: nil)
        //blue
        NotificationCenter.default.addObserver(self, selector: #selector(blue(notification:)), name: .blue, object: nil)
        //violet
        NotificationCenter.default.addObserver(self, selector: #selector(violet(notification:)), name: .violet, object: nil)
    }
    
    @objc func white(notification: NSNotification){
            print("white block working")
            view.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 0.25)
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            tableView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    @objc func green(notification: NSNotification) {
            view.backgroundColor = #colorLiteral(red: 0.3669196069, green: 0.7710189223, blue: 0.6353020072, alpha: 0.5075606795)
            tableView.backgroundColor = #colorLiteral(red: 0.3669196069, green: 0.7710189223, blue: 0.6353020072, alpha: 1)
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3669196069, green: 0.7710189223, blue: 0.6353020072, alpha: 1)
        }
    @objc func pink(notification: NSNotification) {
            view.backgroundColor = #colorLiteral(red: 1, green: 0.5976218581, blue: 0.6312592626, alpha: 0.25)

            tableView.backgroundColor = #colorLiteral(red: 1, green: 0.5976218581, blue: 0.6312592626, alpha: 1)
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 0.5976218581, blue: 0.6312592626, alpha: 1)
        }
    @objc func orange(notification: NSNotification) {
        view.backgroundColor = #colorLiteral(red: 1, green: 0.5965796113, blue: 0.1587926447, alpha: 0.25)
            tableView.backgroundColor = #colorLiteral(red: 1, green: 0.5965796113, blue: 0.1587926447, alpha: 1)
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 0.5965796113, blue: 0.1587926447, alpha: 1)
        }
    @objc func blue(notification: NSNotification) {
            view.backgroundColor = #colorLiteral(red: 0, green: 0.5461315513, blue: 0.8974441886, alpha: 0.25)
            tableView.backgroundColor = #colorLiteral(red: 0, green: 0.5461315513, blue: 0.8974441886, alpha: 1)
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.5461315513, blue: 0.8974441886, alpha: 1)
        }
    @objc func violet(notification: NSNotification) {
        view.backgroundColor = #colorLiteral(red: 0.3570207357, green: 0.296844393, blue: 0.694029212, alpha: 0.25)
            tableView.backgroundColor = #colorLiteral(red: 0.3570207357, green: 0.296844393, blue: 0.694029212, alpha: 1)
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3570207357, green: 0.296844393, blue: 0.694029212, alpha: 1)
        }

    
    @IBAction func chatButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "chatToContact", sender: Any?.self)
    }
}

extension Notification.Name{
    static let white = Notification.Name("white")
    static let green = Notification.Name("green")
    static let pink = Notification.Name("pink")
    static let orange = Notification.Name("orange")
    static let blue = Notification.Name("blue")
    static let violet = Notification.Name("violet")
}
