//
//  UserMessageCell.swift
//  AmeiurusTest
//
//  Created by Cédric NANTEAU Dev on 23/02/2019.
//  Copyright © 2019 Cedric NANTEAU Dev. All rights reserved.
//

import UIKit

class UserMessageCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var messageContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.containerView.clipsToBounds = true
        self.containerView.layer.cornerRadius = 15
        self.containerView.layer.borderWidth = 1
        setUI(botUI: BotUI())
    }
    
    public func setMessage(content: String) {
        self.messageContent.text = content
    }

    public func setUI(botUI: BotUI) {
        self.containerView.layer.borderColor = botUI.userBorderColors.cgColor
        self.containerView.backgroundColor = botUI.userColor
        self.messageContent.textColor = botUI.userFontColor
        self.userImage.image = botUI.userImage
    }
    
}
