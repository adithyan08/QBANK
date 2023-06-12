//
//  engiViewController.swift
//  project
//
//  Created by Iroid on 21/03/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class engiViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var num = ["01","02","03","04","05","06","07"]
    var mech = ["Probability Distribution,Transform and Numerical Methods","Business Economics","Life Skills","Advanced Mechchanics of Solids","Thermal Engineering","Fluid Machinery","Manufactoring Technology"]
    var civil = ["Design","construction","Maintenance of infrasture","Water supply systems","roads","Bridge","Dams"]
    var comp = ["Computer Architecture","Data mining","Computer network","Artificial intelligence","Information storage management","Software engineering"]
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "engii")as! engiTableViewCell
        
        cell.lbl1.text=num[indexPath.row]
        if txtpas == "Mechanical Engineering" {
            cell.lbl2.text=mech[indexPath.row]
        }else if txtpas == "Civil Engineering"{
          cell.lbl2.text=civil[indexPath.row]
        }else if txtpas == "Computer science Engineering"{
          cell.lbl2.text=comp[indexPath.row]
        }
        cell.lbl1.layer.cornerRadius = cell.lbl1.frame.size.width/2;
        cell.lbl1.layer.borderWidth = 2
        cell.lbl1.layer.borderColor=UIColor.black.cgColor
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    var txtpas = String()
    

    @IBOutlet weak var hesd: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hesd.text=txtpas
        
        

        // Do any additional setup after loading the view.
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
