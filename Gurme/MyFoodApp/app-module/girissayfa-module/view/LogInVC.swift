//
//  LogInVC.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 17.12.2021.
//

import UIKit

class LogInVC: UIViewController {
    
    @IBOutlet weak var logInButtonGırıs: UIButton!
    @IBOutlet weak var kullanıcıAdıTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(kullanıcıAdıTextField.text, forKey: "username")
        
        if kullanıcıAdıTextField.text != "" {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarControllerId") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Login Failed", message: "Please, enter username.", preferredStyle: .alert)
            self.present(alert, animated: true)
            let tamamAction = UIAlertAction(title: "Okey", style: .cancel) { action in
            }
            alert.addAction(tamamAction)
            
        }
    }
}


