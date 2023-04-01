//
//  AddItemViewController.swift
//  Tasker
//
//  Created by Dinesh Sharma on 27/03/23.
//


import UIKit
import RealmSwift
import ChameleonFramework

protocol AddItemViewControllerDelegate {
    func getNewCategory(itemName: String)
}

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var itemText: UITextField!
    
    var delegate: AddItemViewControllerDelegate?
    
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    @IBAction func btnAddItem(_ sender: Any) {
        
        if !itemText.text!.isEmpty
        {
            delegate?.getNewCategory(itemName: itemText.text!)
//
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
}
