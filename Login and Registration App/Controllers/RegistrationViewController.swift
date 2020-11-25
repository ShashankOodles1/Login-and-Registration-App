//
//  RegistrationViewController.swift
//  Login and Registration App
//
//  Created by Shashank Mishra on 24/11/20.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmailid: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    let manager : PersonManager = PersonManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])
        
       
        
    }

    @IBAction func onTapCreate(_ sender: Any) {
        var person = Person(firstname: txtFirstName.text, lastname: txtLastName.text, emailid: txtEmailid.text, password: txtPassword.text, confirmPassword: txtConfirmPassword.text)
         manager.createPerson(person: person)
        var registrationModel =  person
        var errorString = ""
        
        if let text = txtFirstName.text{
            do{
                _ = try ValidationManager.validate(value: text, validationType: .name, required: true)
                registrationModel.firstname = text
            }catch{
                errorString.append("\u{2022} Please enter a vaild first name.\n")
            }
        
        if let text = txtLastName.text{
            do{
                _ = try ValidationManager.validate(value: text, validationType: .name, required: true)
                registrationModel.lastname = text
            }catch{
                errorString.append("\u{2022} Please enter a vaild last name.\n")
            }
        }
                if let text = txtEmailid.text{
                    do{
                        _ = try ValidationManager.validate(value: text, validationType: .email, required: true)
                        registrationModel.emailid = text
                    }catch{
                        errorString.append("\u{2022} Please enter a vaild first name.\n")
                    }
                
                
                }
                
                
        }
                
       // if let text = txtEmailid.text{
         //   do{
          //      _ = try ValidationManager.validate(value: text, validationType: .email, required: true)
           //     registrationModel.emailid = text
           // }catch{
            //    errorString.append("\u{2022} Please enter a vaild email.\n")
           // }
       // }
        
        if let text = txtPassword.text, let confirmPassword = txtConfirmPassword.text{
            do{
                _ = try ValidationManager.validate(value: text, validationType: .password, required: true)
                 _ = try ValidationManager.validate(value: confirmPassword, validationType: .password, required: true)
                if text == confirmPassword{
                    registrationModel.password = text
                }else{
                    errorString.append("\u{2022} Please enter a vaild password.\n")
                }
                
            }catch{
                errorString.append("\u{2022} Please enter a vaild password.\n")
            }
        }
        
    
      
        if errorString != ""{
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.left
            
            let messageText = NSMutableAttributedString(
                string: errorString,
                attributes: [
                      NSAttributedString.Key.paragraphStyle: paragraphStyle,
                      NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body),
                    NSAttributedString.Key.foregroundColor: UIColor.black
                ]
            )
            
            let alertController = UIAlertController(title: "DemoApp", message: nil, preferredStyle: .alert)
             alertController.setValue(messageText, forKey: "attributedMessage")
            if #available(iOS 13.0, *) {
                                         alertController.overrideUserInterfaceStyle = .light
                                     }
            let alertAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(alertAction)
            //self.show(alertController, sender: nil)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
     
        self.performSegue(withIdentifier: SegueIdentifer.navigateToLogin, sender: nil)
        
        
        
        
        
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
