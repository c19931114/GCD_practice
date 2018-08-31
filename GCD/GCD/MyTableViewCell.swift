//
//  MyTableViewCell.swift
//  GCD
//
//  Created by Crystal on 2018/8/31.
//  Copyright © 2018年 Crystal. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
