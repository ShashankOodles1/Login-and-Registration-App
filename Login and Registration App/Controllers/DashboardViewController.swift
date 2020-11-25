//
//  DashboardViewController.swift
//  Login and Registration App
//
//  Created by Shashank Mishra on 24/11/20.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   // 
//
    @IBAction func onsendClick(_ sender: Any) {
        var errorString = ""
        
        if let text = txtEmail.text{
            do{
                _ = try ValidationManager.validate(value: text, validationType: .name, required: true)
                
            }catch{
                errorString.append("\u{2022} Please enter a vaild email.\n")
            }
        }

        
        self.txtEmail.text = nil
        let alert = UIAlertController(
            title: "Email Sent",
        message: "Please check the  password",
         preferredStyle: UIAlertController.Style.alert)

        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
// do something when user press OK button, like deleting text in both fields or do nothing
            self.performSegue(withIdentifier: SegueIdentifer.navigateToLogin, sender: nil)
         }
            alert.addAction(OKAction)

       present(alert, animated: true, completion: nil)
        
        
         return
        
            
            }

     
    
    }
    
    

