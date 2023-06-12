//
//  menuuViewController.swift
//  project
//
//  Created by Iroid on 14/03/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class menuuViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var jsondata = NSDictionary()
 
    var dict = String()
    
      let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var emaill: UILabel!
    
    
    var menuu = ["Home","My Profile","About Qbank","Privacy Policy","Change Password","Log Out"]
    
    var imgg = ["home","user1","star","doc","lock","logout"]
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sidee")as!mennTableViewCell
        
        cell.lbl1.text=menuu[indexPath.row]
       
        cell.imgmenu.image=UIImage(named: imgg[indexPath.row])
        
      tableView.backgroundView = UIImageView(image: UIImage(named: "Group 351"))


        
        
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         if indexPath.row == 0 {
            let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
                   
                   let r_view = r_strybrd.instantiateViewController(identifier: "home")as!homeViewController
                   
                   navigationController?.pushViewController(r_view, animated: true)
        
         }else if indexPath.row == 1 {
            let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
             
             let r_view = r_strybrd.instantiateViewController(identifier: "pro")as!profileViewController
             
             navigationController?.pushViewController(r_view, animated: true)
            
        }else if indexPath.row == 2 {
            let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
             
             let r_view = r_strybrd.instantiateViewController(identifier: "about")as!aboutViewController
             navigationController?.pushViewController(r_view, animated: true)
            
        }else if indexPath.row == 4 {
            let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
             
             let r_view = r_strybrd.instantiateViewController(identifier: "for")as!forgetViewController
             navigationController?.pushViewController(r_view, animated: true)
            
        }else if indexPath.row == 5 {
            let alert = UIAlertController(title: "logout", message: "Are you sure?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "yes", style: .default, handler: ((UIAlertAction) -> Void)?{_ in
                
                
                //getapilogout
                
                
                let url_str = URL(string: "https://qsolve.iroidtechnologies.in/api/auth/logout")
                let token = self.delegate.tokenvaluee
                
                var url_req = URLRequest(url: url_str!)
                
                url_req.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                
                
                let task = URLSession.shared.dataTask(with: url_req){(data,request,Error)in
                    if let mydata=data{
                        print("mydata___>",mydata)
                        do{
                            self.jsondata=try
                            JSONSerialization.jsonObject(with: mydata, options: [])as!NSDictionary
                           
                            self.dict=self.jsondata["message"]as!String
                            
                           
                       
                            
                            
                            print("dict___>",self.dict)
                            DispatchQueue.main.async {
                                
                                let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
                                
                                let r_view = r_strybrd.instantiateViewController(identifier: "view")as!ViewController
                                
                                self.navigationController?.pushViewController(r_view, animated: true)
                             
                                
                            }
                            
                    } catch{
                        print("error___>",error.localizedDescription)
                                               }
                }
                   
                
                
                }
                task.resume()
                }))
            
            alert.addAction(UIAlertAction(title: "no", style: .destructive, handler: nil))
            
         present(alert, animated: true, completion: nil)
        }
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.name.text = delegate.fname + " " + delegate.lname
        self.emaill.text = delegate.email as? String
       

        // Do any additional setup after loading the view.
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
