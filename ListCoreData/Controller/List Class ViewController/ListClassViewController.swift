//
//  ListClassViewController.swift
//  ListCoreData
//
//  Created by Minh Tuan on 11/11/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit
import CoreData

class ListClassViewController: UIViewController {
    var classs = [Class]()
    @IBOutlet weak var classCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        cearteClass()
        setupCollection()
        fetchClass()
//        delete()
    }
    fileprivate func cearteClass(){
        let classEntity = NSEntityDescription.entity(forEntityName: "Class", in: appDelegate.managedObjectContext)!
        let newIOS = Class(classEntity, nameClass: "IOS", ImageClass: "swift")
        let newNodeJS = Class(classEntity,nameClass: "Node js", ImageClass: "nodejs")
        let newArduino = Class(classEntity, nameClass: "Arduino",ImageClass: "arduino")
        let newJava = Class(classEntity,nameClass: "Java", ImageClass:"java")
        let newWebsite = Class(classEntity, nameClass: "WebSite", ImageClass: "website")
        let newHtml = Class(classEntity,nameClass: "HTML", ImageClass: "Html")
        classs.append(newIOS)
        classs.append(newNodeJS)
        classs.append(newArduino)
        classs.append(newJava)
        classs.append(newWebsite)
        classs.append(newHtml)
        saveCoreData()
    }
        fileprivate func delete(){
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
            let entityDescription = NSEntityDescription.entity(forEntityName: "Class", in: appDelegate.managedObjectContext)
            fetchRequest.entity = entityDescription
            do{
                let result = try appDelegate.managedObjectContext.fetch(fetchRequest) as [AnyObject]
                for a in result as! [NSManagedObject] {
                    if let userName = a.value(forKey: "nameClass") as? String {
                        if userName == "HTML" {
                            a.managedObjectContext?.delete(a)
                            do{
                                try a.managedObjectContext?.save()
                            }catch{
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    func setupCollection(){
        classCollection.dataSource = self
        classCollection.delegate = self
        self.navigationItem.title = "List Class"
        classCollection.register(UINib.init(nibName: "ListClassCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListClassCollectionViewCell")
        if let flowLayOut = classCollection.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayOut.minimumLineSpacing = 5
            flowLayOut.itemSize = CGSize(width: view.bounds.size.width / 2, height: view.bounds.size.height / 3)
            //            flowLayOut.itemSize = CGSize(width: 155, height: 180)
        }
    }
    fileprivate func fetchClass(){
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Class")
        do{
            classs = try appDelegate.managedObjectContext.fetch(fetchRequest) as! [Class]
            classCollection.reloadData()
        }catch{
            print(error.localizedDescription)
        }
    }
    fileprivate func saveCoreData(){
        do{
            try appDelegate.managedObjectContext.save()
            classCollection.reloadData()
        }catch{
            print(error.localizedDescription)
        }
    }
}
extension ListClassViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return classs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let classList = collectionView.dequeueReusableCell(withReuseIdentifier: "ListClassCollectionViewCell", for: indexPath) as? ListClassCollectionViewCell else {return UICollectionViewCell()}
        let imge = classs[indexPath.item].image
        let nam = classs[indexPath.item].nameClass
        classList.configureCell(imge!, name: nam!)
        return classList
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewCollection = ListStudentsViewController(nibName: "ListStudentsViewController", bundle: nil)
        let nameCl = classs[indexPath.row].nameClass
        viewCollection.nameClas = nameCl!
        navigationController?.pushViewController(viewCollection, animated: true)
    }
    
    
}
extension ListClassViewController: UICollectionViewDelegateFlowLayout{
    
}
extension ListClassViewController: UICollectionViewDelegate{
    
}
