//
//  forgetViewController.swift
//  project
//
//  Created by Iroid on 09/03/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class forgetViewController: UIViewController {
    let line1 = CALayer()
    let line2 = CALayer()
    let line3 = CALayer()
    
    
    
    
    
    @IBOutlet weak var back: UIButton!
    
    @IBOutlet weak var changebtn: UIButton!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        passone()
        newpass()
        confirmpass()
        changebutton()
        
        
       
        
        
        

        // Do any additional setup after loading the view.
    }
    
    func passone(){
        
    line1.frame = CGRect(x: 0,y: txt1.frame.height - 2,
                                                   width: txt1.frame.width,
                                                   height: 2)
                         
                         line1.backgroundColor = UIColor.gray.cgColor
                         
                         txt1.borderStyle = .none
                         
                         txt1.layer.addSublayer(line1)
        
        txt1.attributedPlaceholder=NSAttributedString(string: "Current Password", attributes:[NSAttributedString.Key.foregroundColor :UIColor.gray])
               
             
    }
    func newpass(){
        line2.frame = CGRect(x: 0,
                                            y: txt2.frame.height - 2,
                                            width: txt2.frame.width,
                                            height: 2)
                  
                  line2.backgroundColor = UIColor.gray.cgColor
                  
                  txt2.borderStyle = .none
                  
                  txt2.layer.addSublayer(line2)
        
        txt2.attributedPlaceholder=NSAttributedString(string: "New Password", attributes:[NSAttributedString.Key.foregroundColor :UIColor.gray])
        
    }
    func confirmpass(){
        line3.frame = CGRect(x: 0,y: txt3.frame.height - 2,
                                                   width: txt3.frame.width,
                                                   height: 2)
                         
                         line3.backgroundColor = UIColor.gray.cgColor
                         
                         txt3.borderStyle = .none
                         
                         txt3.layer.addSublayer(line3)
        
        txt3.attributedPlaceholder=NSAttributedString(string: "Confirm New Password", attributes:[NSAttributedString.Key.foregroundColor :UIColor.gray])
       
        
    }
    func changebutton(){
       
        changebtn.layer.cornerRadius=15
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
