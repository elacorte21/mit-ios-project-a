//
//  ShowCompletePhotoViewController.swift
//  UserDefaultDemo
//
//  Created by Eddril Lacorte on 8/11/20.
//  Copyright © 2020 EL. All rights reserved.
//

import UIKit

class ShowCompletePhotoViewController: UIViewController {

    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        titleLabel.text = photo.title
        descLabel.text = photo.desc
        picView.image = photo.pic
        dateLabel.text = photo.date
    }

}
