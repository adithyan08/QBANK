//
//  OTPViewController.swift
//  project
//
//  Created by Iroid on 10/04/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController {
    
    var txtpassotp = String()
    
  
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //btn corner
        btn.layer.cornerRadius=25
        //email
        lblemail.text=txtpassotp
        
    }
    

    @IBAction func back(_ sender: Any) {
          navigationController?.popViewController(animated: true)
    }
    @IBAction func `continue`(_ sender: Any) {
        let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
                      
        let r_view = r_strybrd.instantiateViewController(identifier: "reset")as!RESETViewController
                      
        self.navigationController?.pushViewController(r_view, animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
