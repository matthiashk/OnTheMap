//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by Matthias Ko on 3/27/17.
//  Copyright © 2017 Matthias Ko. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpLabel: UILabel! // should this be label?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBAction func login(_ sender: AnyObject) {
        
        //print("email = \(userEmail.text), password = \(userPassword.text)")
        
        // check for empty textfield, either user or password -> alert user
        
        // check username and pasword
        
        // if credentials are ok, launch tabbed view
        
        // use mock credentials for testing
        
        if ((userEmail.text?.contains("matthias"))! && (userPassword.text?.contains("1234"))!) {
            print("credentials OK")
            
            // launch tabbarcontroller
            
            // how do we get ref to tabbarcontroller?
            completeLogin()
            
            
            
        } else {
            print("incorrect user or password")
        }
        
        
        

    }
    
    private func completeLogin() {
        performUIUpdatesOnMain {
            //self.debugTextLabel.text = ""
            //self.setUIEnabled(true)
            let controller = self.storyboard!.instantiateViewController(withIdentifier: "MapsTabBarController") as! UITabBarController
            self.present(controller, animated: true, completion: nil)
        }
    }

}
