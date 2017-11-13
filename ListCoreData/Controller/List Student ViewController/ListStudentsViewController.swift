//
//  ListStudentsViewController.swift
//  ListCoreData
//
//  Created by Minh Tuan on 11/11/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit
import CoreData

class ListStudentsViewController: UIViewController {
    
    @IBOutlet weak var tableViewStudent: UITableView!
    var nameClas = String()
    var student = [Students]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupTableView()
//        self.navigationItem.title = nameClas
//        self.navigationItem.setHidesBackButton(true, animated: true)
//        leftNvg()
//        rightNvg()
    }
    override func viewWillAppear(_ animated: Bool) {
        setupTableView()
        self.navigationItem.title = nameClas
        self.navigationItem.setHidesBackButton(true, animated: true)
        leftNvg()
        rightNvg()
        tableViewStudent.reloadData()
    }
    fileprivate func leftNvg(){
        let item = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(backButton))
        navigationItem.leftBarButtonItem = item
    }
    @objc func backButton(){
        self.navigationController?.popViewController(animated: true)
    }
    fileprivate func rightNvg(){
        let item = UIBarButtonItem(image: #imageLiteral(resourceName: "add"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(createButton))
        navigationItem.rightBarButtonItem = item
    }
    @objc func createButton(){
        let secondViewController = CreatStudentViewController.init(nibName: "CreatStudentViewController", bundle: nil)
        self.navigationController?.pushViewController(secondViewController, animated: true)
//        creatNewStudent()
    }
    fileprivate func setupTableView(){
        tableViewStudent.dataSource = self
        tableViewStudent.delegate = self
        tableViewStudent.register(UINib.init(nibName: "ListStudentsTableViewCell", bundle: nil), forCellReuseIdentifier: "ListStudentsTableViewCell")
    }
    fileprivate func creatNewStudent(){
        let studentEntity = NSEntityDescription.entity(forEntityName: "Students", in: appDelegate.managedObjectContext)
        let newStudent = Students(studentEntity!, nameStudent: "MinhTuan", address: "ThaiBinh")
        student.append(newStudent)
        saveContext()
    }
    fileprivate func delete(_ student: Students) {
        appDelegate.managedObjectContext.delete(student)
        saveContext()
    }
    fileprivate func saveContext(){
        do{
            try appDelegate.managedObjectContext.save()
            tableViewStudent.reloadData()
        }catch{
            print(error.localizedDescription)
        }
    }
}

extension ListStudentsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let studentCell = tableView.dequeueReusableCell(withIdentifier: "ListStudentsTableViewCell", for: indexPath) as? ListStudentsTableViewCell else {return UITableViewCell()}
        studentCell.cofig(student[indexPath.row])
        return studentCell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            delete(student[indexPath.row])
            self.student.remove(at: indexPath.row)
            self.tableViewStudent.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewUpdate = UpdateStudentViewController(nibName: "UpdateStudentViewController", bundle: nil)
        let name = student[indexPath.row].nameStudent
        let address = student[indexPath.row].address
        viewUpdate.nameSTD = name!
        viewUpdate.addressSTD = address!
        navigationController?.pushViewController(viewUpdate, animated: true)
    }
}
extension ListStudentsViewController: UITableViewDelegate{
    
}
