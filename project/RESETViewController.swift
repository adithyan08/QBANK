//
//  RESETViewController.swift
//  project
//
//  Created by iroid on 10/04/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class RESETViewController: UIViewController {
    let bottom = CALayer()
    let bottomline = CALayer()

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var lbl1: UITextField!
    @IBOutlet weak var lbl2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //btn
        btn.layer.cornerRadius=25
        //lbl1
          lbl1.attributedPlaceholder=NSAttributedString(string: "New Password", attributes:[NSAttributedString.Key.foregroundColor :UIColor.gray])
        
        //lblbottom
        bottom.frame = CGRect(x: 0,y: lbl1.frame.height - 2,width: lbl1.frame.width,height: 2)
                 
        bottom.backgroundColor = UIColor.gray.cgColor
                 
        lbl1.borderStyle = .none
                 
        lbl1.layer.addSublayer(bottom)
        
        //lbl2
         lbl2.attributedPlaceholder=NSAttributedString(string: "Confirm New Password", attributes:[NSAttributedString.Key.foregroundColor :UIColor.gray])
        
        //lbl2bottom
        bottomline.frame = CGRect(x: 0,y: lbl2.frame.height - 2,width: lbl2.frame.width,height: 2)
                        
               bottomline.backgroundColor = UIColor.gray.cgColor
                        
               lbl2.borderStyle = .none
                        
               lbl2.layer.addSublayer(bottomline)
        
        
        
    }
    

    @IBAction func back(_ sender: Any) {
           navigationController?.popViewController(animated: true)
    }
    @IBAction func reset(_ sender: Any) {
        let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
                     
        let r_view = r_strybrd.instantiateViewController(identifier: "done")as!doneViewController
                     
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
