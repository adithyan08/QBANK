//
//  samViewController.swift
//  project
//
//  Created by Iroid on 24/03/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class samViewController: UIViewController {
      var imgpas = UIImage()
    var txtpasam = String()
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var imgg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgg.image=imgpas
        lbl.text=txtpasam
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
