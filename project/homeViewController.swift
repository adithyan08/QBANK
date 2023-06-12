//
//  homeViewController.swift
//  project
//
//  Created by Iroid on 09/03/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class homeViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
   
    
  
    
    
    
    
    
    
    @IBOutlet weak var sampbtnn: UIButton!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
              
               
        
        let celll = tableView.dequeueReusableCell(withIdentifier: "home")as!homeTableViewCell
        
       
        celll.samplebtn.tag=indexPath.row
        celll.img.image=UIImage(named: "mechanical")
        celll.name.text=depp[indexPath.row]
        celll.prize.text="Rs.148.00"
        
        //bgcolor
       switch indexPath.row % 3 {
       case 0:
              celll.viewclr.backgroundColor =  UIColor(red: 225/255, green: 243/255, blue: 248/255, alpha: 1)
       case 1:
              celll.viewclr.backgroundColor =  UIColor(red: 252/255, green: 249/255, blue: 230/255, alpha: 1)
      default:
       celll.viewclr.backgroundColor =  UIColor(red: 251/255, green: 230/255, blue: 229/255, alpha: 1)
        }
        
        switch indexPath.row % 3 {
              case 0:
                     celll.buybtn.backgroundColor =  UIColor(red: 233/255, green: 112/255, blue: 34/255, alpha: 1)
              case 1:
                     celll.buybtn.backgroundColor =  UIColor(red: 3/255, green: 172/255, blue: 36/255, alpha: 1)
             default:
              celll.buybtn.backgroundColor =  UIColor(red: 0/255, green: 138/255, blue: 229/255, alpha: 1)
               }

        
        return celll
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
  
   
    
    
    
   
    
    
    var depp = ["Mechanical","Civil","Computer science"]
    
  
    
   
    
   
    
  
       
    @IBOutlet weak var btn: UIButton!
    
       
    @IBAction func viewsyllabus(_ sender: Any) {
       
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sys") as! syllabusViewController

        self.addChild(popOverVC)

        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
        
       
        
        
    }
    
    
        
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn.layer.borderWidth=0.5
        btn.layer.cornerRadius=17
        
   
        
        
        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func buy(_ sender: Any) {
        let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
        
        let r_view = r_strybrd.instantiateViewController(identifier: "pay")as!paymentViewController
        
        self.navigationController?.pushViewController(r_view, animated: true)
    }
    @IBAction func samp(_ sender: UIButton) {
        
        
       
        let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
               
               let r_view = r_strybrd.instantiateViewController(identifier: "sam")as!samViewController
            switch sender.tag {
                  case 0:
                    r_view.imgpas=UIImage(named: "mechh")!
                      case 1:
                        r_view.imgpas=UIImage(named: "civilpap")!
                      case 2:
                        r_view.imgpas=UIImage(named: "software")!
                  default:
                      print ("error")
                  }
               self.navigationController?.pushViewController(r_view, animated: true)
     
      
        
    }
    
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


