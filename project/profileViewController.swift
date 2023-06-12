//
//  profileViewController.swift
//  project
//
//  Created by Iroid on 23/03/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBOutlet weak var fname: UITextField!
    
    @IBOutlet weak var hname: UILabel!
    @IBOutlet weak var dep: UITextField!
    @IBOutlet weak var college: UITextField!
    @IBOutlet weak var category: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var lname: UITextField!
   
    var jsondata = NSDictionary()
    var dict = String()
    
    override func viewWillAppear(_ animated: Bool) {
        update((Any).self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func update(_ sender: Any) {
        let urll = URL(string: "https://qsolve.iroidtechnologies.in/api/auth/update_profile")
        let token = delegate.tokenvaluee
        
               var req = URLRequest(url: urll!)
                              
               req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
                              
               req.httpMethod = "post"
        req.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
               
        let poststring = "first_name=\(fname.text!)&last_name=\(lname.text!)&email=\(email.text!)&mobile=\(phone.text!)&category=\(category.text!)&department=\(dep.text!)&college=\(college.text!)"
                                      
               print("poststring___>",poststring)
                                      
               req.httpBody = poststring.data(using: .utf8)
                                      
               let task = URLSession.shared.dataTask(with: req){(data,response,Error)in
               let mydata = data
                           do{
                           print("mydata___>",mydata!)
                           do{
                           self.jsondata = try
                           JSONSerialization.jsonObject(with: mydata!, options: []) as! NSDictionary
                                               
                       self.dict=self.jsondata["message"]as!String
                                               
                       print("dict___>",self.dict)
                                                  
                       DispatchQueue.main.async {
                        self.hname.text=self.delegate.fname + " " + self.delegate.lname
                        if (self.jsondata["message"]as? String) == "Profile has been updated"{
                            //alert
                            let alert = UIAlertController(title: "", message: "Profile has been updated ", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style:.default, handler: { (actionSheetController) -> Void in
                                //navigation
                                 let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
                                       
                                let r_view = r_strybrd.instantiateViewController(identifier: "sign")as!signinViewController
                                       
                                self.navigationController?.pushViewController(r_view, animated: true)
                            }))

                            self.present(alert, animated: true, completion: nil)
                            
                        }else{
                            
                            let alert = UIAlertController(title: "", message: "ENTER ALL FIELDS ", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style:.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                           
                    }
                                                  
                                              }
                                          }catch{
                                              print("error",error.localizedDescription)
                                          }
                                          
                                      }
                                      task.resume()
                              
        
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
