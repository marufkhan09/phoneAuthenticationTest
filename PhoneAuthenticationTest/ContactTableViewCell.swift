//
//  ContactTableViewCell.swift
//  PhoneAuthenticationTest
//
//  Created by Maruf Khan on 12/4/21.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var fullName: UILabel!
    @IBOutlet var messeges: UILabel!
    @IBOutlet var chatBtn: UIButton!
    @IBOutlet var videoBtn: UIButton!
    @IBOutlet var audioBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
