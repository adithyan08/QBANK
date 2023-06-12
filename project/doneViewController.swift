//
//  doneViewController.swift
//  project
//
//  Created by iroid on 10/04/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class doneViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //btn
        btn.layer.cornerRadius=25

        // Do any additional setup after loading the view.
    }
    

    @IBAction func continuelogin(_ sender: Any) {
        let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
        
        let r_view = r_strybrd.instantiateViewController(identifier: "sign")as!signinViewController
        
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
