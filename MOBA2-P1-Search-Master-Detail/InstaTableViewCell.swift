//
//  InstaTableViewCell.swift
//  MOBA2-P1-Search-Master-Detail
//
//  Created by Andreas Plüss on 22.02.16.
//  Copyright © 2016 devkitchen. All rights reserved.
//

import UIKit

class InstaTableViewCell: UITableViewCell {

    @IBOutlet weak var instaImage: UIImageView!
    @IBOutlet weak var instaDescription: UILabel!
    @IBOutlet weak var instaUserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
