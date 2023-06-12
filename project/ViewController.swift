//
//  ViewController.swift
//  project
//
//  Created by Iroid on 06/03/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var txt = ""
    

    @IBOutlet weak var register: UIButton!
    
    @IBOutlet weak var signin: UIButton!
   
    @IBAction func reg(_ sender: Any) {
        let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
        
        let r_view = r_strybrd.instantiateViewController(identifier: "REG")as!REGISTER
        
        self.navigationController?.pushViewController(r_view, animated: true)
        
        
    }
    
    @IBAction func sign(_ sender: Any) {
        let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
        
        let r_view = r_strybrd.instantiateViewController(identifier: "sign")as!signinViewController
        
        self.navigationController?.pushViewController(r_view, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        signin.layer.cornerRadius=15
        register.layer.cornerRadius=15
    }


}

