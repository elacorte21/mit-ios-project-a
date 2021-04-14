//
//  PhotoTableViewCell.swift
//  UserDefaultDemo
//
//  Created by Eddril Lacorte on 8/11/20.
//  Copyright © 2020 EL. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var PhotoImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
