//
//  ListStudentsTableViewCell.swift
//  ListCoreData
//
//  Created by Minh Tuan on 11/11/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit

class ListStudentsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNameAddress: UILabel!
    @IBOutlet weak var lblNameStudent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }
   public func cofig(_ student: Students){
        lblNameStudent.text = student.nameStudent
        lblNameAddress.text = student.address
    }
 
    
}
