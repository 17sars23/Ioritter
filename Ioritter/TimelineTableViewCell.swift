//
//  TimelineTableViewCell.swift
//  Ioritter
//
//  Created by 川岸樹奈 on 2019/02/19.
//  Copyright © 2019年 juna.Kawagishi. All rights reserved.
//

import UIKit

class TimelineTableViewCell: UITableViewCell {
    
    @IBOutlet var UserIDLabel: UILabel!
    @IBOutlet var TweetTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
