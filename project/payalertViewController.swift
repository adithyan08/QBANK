//
//  payalertViewController.swift
//  project
//
//  Created by Iroid on 27/03/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class payalertViewController: UIViewController {
    
    

   
    @IBOutlet weak var viewbg: UIView!
    @IBOutlet weak var btndone: UIButton!
    @IBOutlet weak var vieww: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vieww.layer.cornerRadius=15
        btndone.layer.cornerRadius=15
        viewbg.layer.cornerRadius=25
        viewbg.layer.borderWidth=0.5
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

    @IBAction func done(_ sender: Any) {
       
      
        
       self.dismiss(animated: true, completion: nil)
    }
}
