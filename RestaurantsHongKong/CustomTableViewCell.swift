//
//  CustomTableViewCell.swift
//  RestaurantsHongKong
//
//  Created by xszhao on 2016-03-21.
//  Copyright © 2016 xszhao. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var imagesView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
