//
//  ExistingContactViewController.swift
//  Contacts
//
//  Created by Eric Andersen on 7/12/18.
//  Copyright © 2018 BigNerdRanch. All rights reserved.
//

import UIKit

class ExistingContactViewController: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    var firstNameString: String = ""
    var lastNameString: String = ""
    var indexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.text = firstNameString
        lastNameTextField.text = lastNameString
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
