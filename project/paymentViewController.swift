//
//  paymentViewController.swift
//  project
//
//  Created by Iroid on 24/03/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class paymentViewController: UIViewController {
    
    var iconClick = true
    
    @IBOutlet weak var txt: UITextField!
    @IBOutlet weak var cardview: UIView!
    @IBOutlet weak var paybtn: UIButton!
    @IBOutlet weak var visabtn: UIButton!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var vieww: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vieww.layer.cornerRadius=25
        cardview.layer.cornerRadius=25
        cardview.layer.borderWidth=0.5
        
        btn.layer.cornerRadius=20

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pay(_ sender: Any) {
        if (self.txt.text == "") {
            let alert = UIAlertController(title: "Alert", message: "Incomplete card details  ", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style:.destructive, handler: nil))
                self.present(alert, animated: true, completion: nil)
            
        }else{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let myAlert = storyboard.instantiateViewController(withIdentifier: "payy")as!payalertViewController
               myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
               myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
       
               self.present(myAlert, animated: true, completion: nil)
        }
    }
    @IBAction func VISA(_ sender: Any) {
        if(iconClick == true) {
                          
            visabtn.setImage(UIImage(named: "select"), for: .normal)
            paybtn.setImage(UIImage(named: "unselect"), for: .normal)
                      } else {
                          
                   visabtn.setImage(UIImage(named: "unselect"), for: .normal)
           
          
                      }

                      iconClick = !iconClick
    }
    @IBAction func paypal(_ sender: Any) {
        if(iconClick == true) {
                                
    paybtn.setImage(UIImage(named: "select"), for: .normal)
    visabtn.setImage(UIImage(named: "unselect"), for: .normal)
            } else {
                                
    paybtn.setImage(UIImage(named: "unselect"), for: .normal)
    
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
