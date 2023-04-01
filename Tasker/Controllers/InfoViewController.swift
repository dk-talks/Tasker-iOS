//
//  InfoViewController.swift
//  Tasker
//
//  Created by Dinesh Sharma on 27/03/23.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var lblInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        lblInfo.text = """

        Tasker is a wonderful mobile application which allows its user to note down their tasks neatly because human mind is not build to remember things, So leave all the remembering task on Tasker.
        This lets you make categories of your task and save your task inside particular catetgory.
        You can tap on any category to see all its tasks.
        You can even tick mark the task which have been completed and swipe it to delete.
        Check it out!
        
        """
    }
    


}
