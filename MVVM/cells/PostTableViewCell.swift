//
//  PostTableViewCell.swift
//  MVVM
//
//  Created by Apple user on 28/09/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var bodyLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
