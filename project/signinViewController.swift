//
//  signinViewController.swift
//  project
//
//  Created by Iroid on 08/03/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class signinViewController: UIViewController {
    let bottomLine = CALayer()
    let bottom = CALayer()
    var jsondata = NSDictionary()
    var tokenvalue = String()
    var menu = String()
    
   
   
    var iconClick = true
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    
   
    
    var datadict = NSDictionary()
    
    @IBOutlet weak var eyebtn: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var sign: UIButton!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //password visiblbe
       self.txt2.isSecureTextEntry = true
        eyebtn.setImage(UIImage(named: "eyeinvisible"), for: .normal)

        //corner radius
        sign.layer.cornerRadius=15
        
        //placeholder
        txt1.attributedPlaceholder=NSAttributedString(string: "ENTER EMAIL ID", attributes:[NSAttributedString.Key.foregroundColor :UIColor.gray])
        
        txt2.attributedPlaceholder=NSAttributedString(string: "ENTER PASSWORD", attributes:[NSAttributedString.Key.foregroundColor :UIColor.gray])
        
        //bottomline txt1
        bottom.frame = CGRect(x: 0,y: txt1.frame.height - 2,width: txt1.frame.width,height: 2)
           
           bottom.backgroundColor = UIColor.gray.cgColor
           
           txt1.borderStyle = .none
           
           txt1.layer.addSublayer(bottom)
        
        // bottomline txt2
        bottomLine.frame = CGRect(x: 0,y: txt2.frame.height - 2,width: txt2.frame.width,height: 2)
           
           bottomLine.backgroundColor = UIColor.gray.cgColor
           
           txt2.borderStyle = .none
           
           txt2.layer.addSublayer(bottomLine)
        
        
       

        // Do any additional setup after loading the view.
    }
    

    @IBAction func forget(_ sender: Any) {
        let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
               
               let r_view = r_strybrd.instantiateViewController(identifier: "email")as!emailViewController
               
               self.navigationController?.pushViewController(r_view, animated: true)
    }
    @IBAction func create(_ sender: Any) {
        
        //navigation
        let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
        
        let r_view = r_strybrd.instantiateViewController(identifier: "REG")as!REGISTER
        
        self.navigationController?.pushViewController(r_view, animated: true)
        
       
        
            
    }
    @IBAction func back(_ sender: Any) {
         navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func signin(_ sender: Any) {
   
        
        
      //post login
        let urll = URL(string: "https://qsolve.iroidtechnologies.in/api/login")
                       
        var req = URLRequest(url: urll!)
                       
        req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
                       
        req.httpMethod = "post"
                               
        let poststring = "email=\(txt1.text!)&password=\(txt2.text!)&device_token=\("31cd4eb45b3aff17")"
                               
        print("poststring___>",poststring)
                               
        req.httpBody = poststring.data(using: .utf8)
                               
        let task = URLSession.shared.dataTask(with: req){(data,response,Error)in
        let mydata = data
                    do{
                    print("mydata___>",mydata!)
                    do{
                    self.jsondata = try
                    JSONSerialization.jsonObject(with: mydata!, options: []) as! NSDictionary
                                        
                  
                                        
                print("jsondata___>",self.jsondata)
                       
                        
                DispatchQueue.main.async {
                    if (self.txt1.text == "" || self.txt2.text == ""){
                        let alert = UIAlertController(title: "", message: "Please enter your email & password", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style:.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    
                    
                    }else if (self.jsondata["message"]as? String) == "Invalid login credentials"{
                        let alert = UIAlertController(title: "Alert", message: "Incorrect email or password ", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style:.destructive, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        
                    }
                    else if (self.jsondata["message"]as? String) == "Invalid email address."{
                        let alert = UIAlertController(title: "Alert", message: "Incorrect email  ", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style:.destructive, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        
                    }else {
                       self.tokenvalue=self.jsondata["access_token"]as!String
                        self.delegate.tokenvaluee = self.tokenvalue
                        
                        let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
                        let r_view = r_strybrd.instantiateViewController(identifier: "home")as!homeViewController
                        self.navigationController?.pushViewController(r_view, animated: true)
                        self.datadict=self.jsondata["data"]as!NSDictionary
                        self.delegate.fname=self.datadict["first_name"] as! String
                        self.delegate.lname=self.datadict["last_name"] as! String
                        self.delegate.email=self.datadict["email"] as! String
                    }
                   
                        }
                    } catch {
                        print("error",error.localizedDescription)
                                   }
            
                             
                       
                       
            }
        }
        task.resume()
    }
    
    @IBAction func eye(_ sender: Any) {
        if(iconClick == true) {
                   txt2.isSecureTextEntry = false
               eyebtn.setImage(UIImage(named: "eyevisible"), for: .normal)
               } else {
                   txt2.isSecureTextEntry = true
            eyebtn.setImage(UIImage(named: "eyeinvisible"), for: .normal)
               }

               iconClick = !iconClick
        
    
        
      
         
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    {
     }
     // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */




}
