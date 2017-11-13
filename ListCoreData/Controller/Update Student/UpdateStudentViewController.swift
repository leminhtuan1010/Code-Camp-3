//
//  UpdateStudentViewController.swift
//  ListCoreData
//
//  Created by Minh Tuan on 11/11/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit

class UpdateStudentViewController: UIViewController {

    @IBAction func btnUpdateStudent(_ sender: Any) {
    }
    @IBOutlet weak var btnIndexUpdate: UIButton!
    @IBOutlet weak var txtAddressStudent: UITextField!
    @IBOutlet weak var txtNameStudent: UITextField!
    var nameSTD = String()
    var addressSTD = String()
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationItem.title = "Theresa Cooper"
        txtNameStudent.placeholder = nameSTD
        txtAddressStudent.placeholder = addressSTD
    }
    
    

}
