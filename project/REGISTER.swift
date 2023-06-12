//
//  REGISTER.swift
//  project
//
//  Created by Iroid on 06/03/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit
import iOSDropDown
import SkyFloatingLabelTextField


class REGISTER: UIViewController ,UITextFieldDelegate{
    
    var deptarray = [""]
    @IBOutlet weak var privatebtn: UIButton!
    var colarray = [""]
    var str = String()
    
    
    var reg = String()
    
    let bottom = CALayer()
    var iconClick = true
    var jsondata=NSDictionary()
    var array = NSArray()
    var dict = NSDictionary()
    
    
    
    @IBOutlet weak var ticky: UIButton!
    @IBOutlet weak var pass: SkyFloatingLabelTextField!
    @IBOutlet weak var repass: SkyFloatingLabelTextField!
    
    @IBOutlet weak var emaill: SkyFloatingLabelTextField!
    @IBOutlet weak var fname: SkyFloatingLabelTextField!
    
    @IBOutlet weak var phone: SkyFloatingLabelTextField!
    @IBOutlet weak var Lname: SkyFloatingLabelTextField!
    
    @IBOutlet weak var college: DropDown!
    @IBOutlet weak var dep: DropDown!
    @IBOutlet weak var create: UIButton!
    @IBOutlet weak var others: UIButton!
    @IBOutlet weak var staff: UIButton!
    @IBOutlet weak var student: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //corner radius
        staff.layer.cornerRadius=15
        student.layer.cornerRadius=15
        others.layer.cornerRadius=15
        staff.layer.borderWidth=0.5
        others.layer.borderWidth=0.5
        create.layer.cornerRadius=15
        student.layer.borderWidth=0.5
        
        //bottom line
        bottom.frame = CGRect(x: 0,y: dep.frame.height - 1,width: dep.frame.width,height: 1)
        bottom.backgroundColor = UIColor.gray.cgColor
        dep.layer.addSublayer(bottom)
        
      
       
        
        
        //get api department
        
        let url_str = URL(string: "https://qsolve.iroidtechnologies.in/api/get_departments")
        
        let url_req = URLRequest(url: url_str!)
        
        let task = URLSession.shared.dataTask(with: url_req)
        
        {(data,request,Error)in
            if let mydata=data{
                print("mydata___>",mydata)
                do{
                    self.jsondata=try
                    JSONSerialization.jsonObject(with: mydata, options: [])as!NSDictionary
                    
                    self.array=self.jsondata["data"]as!NSArray
                    for i in 0..<self.array.count{
                        self.dict=self.array[i]as!NSDictionary
                        self.deptarray.append(self.dict["name"]as! String)
                    }
               
                    
                    
                    print("dict___>",self.dict)
                    DispatchQueue.main.async {
                        self.dep.optionArray=self.deptarray
                        
                    }
                    
                }catch{
                    print("error___>",error.localizedDescription)
                }
            }
        }
        task.resume()
        
        //get college
        let urll_str = URL(string: "https://qsolve.iroidtechnologies.in/api/colleges")
               
               let urll_req = URLRequest(url: urll_str!)
               
               let task1 = URLSession.shared.dataTask(with: urll_req){(data,request,Error)in
                   if let mydata=data{
                       print("mydata___>",mydata)
                       do{
                           self.jsondata=try
                           JSONSerialization.jsonObject(with: mydata, options: [])as!NSDictionary
                           
                           self.array=self.jsondata["data"]as!NSArray
                           for i in 0..<self.array.count{
                               self.dict=self.array[i]as!NSDictionary
                               self.colarray.append(self.dict["name"]as! String)
                           }
                      
                           
                           
                           print("dict___>",self.dict)
                           DispatchQueue.main.async {
                               self.college.optionArray=self.colarray
                               
                           }
                           
                       }catch{
                           print("error___>",error.localizedDescription)
                       }
                   }
               }
               task1.resume()
               
        
        

       
    }
    @objc func textFieldDidChange(_ textfield: UITextField){
        if (self.pass.text != self.repass.text) {
            let alert = UIAlertController(title: "Alert", message: "Incorrect email or password ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style:.destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else {
            
        }
    }
   
        
       
 
    
    
    
    
    @IBAction func login(_ sender: Any) {
        let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
        
        let r_view = r_strybrd.instantiateViewController(identifier: "sign")as!signinViewController
        
        self.navigationController?.pushViewController(r_view, animated: true)
    }
    @IBAction func back(_ sender: Any) {
        
        
         navigationController?.popViewController(animated: true)
    }
 
    @IBAction func register(_ sender: Any) {
        let urll = URL(string: "https://qsolve.iroidtechnologies.in/api/register_user")
        
        var req = URLRequest(url: urll!)
        
        req.setValue("application/x-www-fprm-urlencoded", forHTTPHeaderField: "content_type")
        
          req.httpMethod = "post"
                
        let poststring = "first_name=\(fname.text!)&last_name=\(Lname.text!)&email=\(emaill.text!)&mobile=\(phone.text!)&department=\(dep.text!)&password=\(pass.text!)&college=\(college.text!)&category=\(str)"
                
                print("poststring___>",poststring)
                
                req.httpBody = poststring.data(using: .utf8)
                
                let task = URLSession.shared.dataTask(with: req){(data,response,Error)in
                    let mydata = data
                    do{
                        print("mydata___>",mydata)
                        do{
                            self.jsondata = try
                            JSONSerialization.jsonObject(with: mydata!, options: [])as! NSDictionary
                            
                            print("jsondata___>",self.jsondata)
                            DispatchQueue.main.async {
                                if self.jsondata["message"]as! String == "Your account has been created"{
                                    let alert = UIAlertController(title: "", message: "Your account has been created ", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style:.destructive, handler: { (actionSheetController) -> Void in
                                      let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
                                        
                                        let r_view = r_strybrd.instantiateViewController(identifier: "sign")as!signinViewController
                                        
                                        self.navigationController?.pushViewController(r_view, animated: true)
                                    }))

                                    self.present(alert, animated: true, completion: nil)
                                }else{
                                    let alert = UIAlertController(title: "", message: "ENTER ALL FIELDS ", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style:.destructive, handler: nil))
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
    
    @IBAction func studends(_ sender: UIButton) {
       studentcolor()
     str="STUDENT"
        
        
        
        
    }
    
    @IBAction func staff(_ sender: UIButton) {
       staffcolor()
   str="STAFF"
        
    }
    @IBAction func other(_ sender: Any) {
       othercolor()
        str="OTHERS"
     
    }
    func studentcolor(){
        self.student.backgroundColor = UIColor(red: 243/255, green: 66/255, blue: 35/255, alpha: 1.0)
               student.setTitleColor(.white, for: .normal)
                self.staff.backgroundColor = UIColor.white
               self.others.backgroundColor = UIColor.white
                staff.setTitleColor(.black, for: .normal)
                others.setTitleColor(.black, for: .normal)
    }
    func staffcolor(){
        self.staff.backgroundColor = UIColor(red: 243/255, green: 66/255, blue: 35/255, alpha: 1.0)
        staff.setTitleColor(.white, for: .normal)
        student.setTitleColor(.black, for: .normal)
        others.setTitleColor(.black, for: .normal)
        
        self.student.backgroundColor = UIColor.white
        self.others.backgroundColor = UIColor.white
    }
    func othercolor(){
        self.others.backgroundColor = UIColor(red: 243/255, green: 66/255, blue: 35/255, alpha: 1.0)
              others.setTitleColor(.white, for: .normal)
               student.setTitleColor(.black, for: .normal)
               staff.setTitleColor(.black, for: .normal)

               self.staff.backgroundColor = UIColor.white
               self.student.backgroundColor = UIColor.white
    }
    
    @IBAction func tick(_ sender: Any) {
        if(iconClick == true) {
                   
               ticky.setImage(UIImage(named: "tick"), for: .normal)
               } else {
                   
            ticky.setImage(UIImage(named: "untick"), for: .normal)
               }

               iconClick = !iconClick
        
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


