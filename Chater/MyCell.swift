//
//  MyCell.swift
//  Chater
//
//  Created by 董思言 on 15/5/7.
//  Copyright (c) 2015年 董思言. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet var iconView: UIImageView!
    @IBOutlet var msgLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
