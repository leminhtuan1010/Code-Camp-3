//
//  ListClassCollectionViewCell.swift
//  ListCoreData
//
//  Created by Minh Tuan on 11/11/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit

class ListClassCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblNameClass: UILabel!
    @IBOutlet weak var imageClass: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageClass.layer.cornerRadius = 8
        imageClass.clipsToBounds = true
    }
    func configureCell(_ image: String, name: String){
        imageClass.image = UIImage(named: image)
        lblNameClass.text = name
    }
    
}
