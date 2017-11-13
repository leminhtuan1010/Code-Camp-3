//
//  CreatStudentViewController.swift
//  ListCoreData
//
//  Created by Minh Tuan on 11/11/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit
import CoreData

class CreatStudentViewController: UIViewController {
    @IBAction func btnCreateStudent(_ sender: Any) {
        createNewStudent()
        let popview = ListStudentsViewController(nibName: "ListStudentsViewController", bundle: nil)
        navigationController?.popToViewController(popview, animated: true)
    }
    @IBOutlet weak var btnIndexCreate: UIButton!
    @IBOutlet weak var txtCreateName: UITextField!
    @IBOutlet weak var txtCreateAddress: UITextField!
    var name = String()
    var adr = String()
    var createStudent = [Students]()
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    fileprivate func setupTxt(){
        
    }
    fileprivate func createNewStudent(){
        let studentEntity = NSEntityDescription.entity(forEntityName: "Students", in: appDelegate.managedObjectContext)
        name = txtCreateName.text!
        adr = txtCreateAddress.text!
        let newStudent = Students(studentEntity!, nameStudent: name, address: adr)
        createStudent.append(newStudent)
        saveContext()
    }
    fileprivate func saveContext(){
        do{
            try appDelegate.managedObjectContext.save()
            navigationController?.popViewController(animated: true)
        }catch{
            print(error.localizedDescription)
        }
    }
}
