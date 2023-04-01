//
//  AddCategoryViewController.swift
//  Tasker
//
//  Created by Dinesh Sharma on 27/03/23.
//

import UIKit
import RealmSwift
import ChameleonFramework

protocol AddCategoryViewControllerDelegate {
    func getNewCategory(categoryName: String)
}

class AddCategoryViewController: UIViewController {
    
    var delegate: AddCategoryViewControllerDelegate!
    
    let realm = try! Realm()
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving category \(error)")
        }
    }
    
    
    
    @IBAction func btnAddCategoryTapped(_ sender: Any) {
        
        
        if !textField.text!.isEmpty
        {
            delegate?.getNewCategory(categoryName: textField.text!)
//            
            self.navigationController?.popViewController(animated: true)
        }
        
        
        
        
        
    }
}
