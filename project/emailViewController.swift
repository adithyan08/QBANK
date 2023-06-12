//
//  emailViewController.swift
//  project
//
//  Created by Iroid on 10/04/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class emailViewController: UIViewController {
    let bottom = CALayer()

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var lbl: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //lbl
        lbl.attributedPlaceholder=NSAttributedString(string: "Enter your  email id", attributes:[NSAttributedString.Key.foregroundColor :UIColor.gray])
       //btn
        btn.layer.cornerRadius=25
        
        //lbl line
        bottom.frame = CGRect(x: 0,
        y: lbl.frame.height - 2,width: lbl.frame.width,height: 2)
                 
        bottom.backgroundColor = UIColor.gray.cgColor
                 
        lbl.borderStyle = .none
                 
        lbl.layer.addSublayer(bottom)
        
        
       
    }
    
    @IBAction func BACK(_ sender: Any) {
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction func reset(_ sender: Any) {
        let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
               
               let r_view = r_strybrd.instantiateViewController(identifier: "OTP")as!OTPViewController
        r_view.txtpassotp=lbl.text!
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
