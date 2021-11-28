//
//  UserTableViewCell.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 28/11/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with viewParam: UserCellViewParam) {
        nameLabel.text = viewParam.name
        emailLabel.text = viewParam.email
        avatarImageView.image = viewParam.avatar
        contentView.backgroundColor = viewParam.statusColor
    }
}
