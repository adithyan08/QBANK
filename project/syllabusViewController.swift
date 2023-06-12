//
//  syllabusViewController.swift
//  project
//
//  Created by Iroid on 20/03/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class syllabusViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var vieww: UIView!
    var depp = ["Mechanical Engineering","Civil Engineering","Computer science Engineering"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sys")as!sysllabusTableViewCell
        
          cell.img?.image=UIImage(named: "mechanical")
        
        cell.lbl.text=depp[indexPath.row]
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
        
        let r_view = r_strybrd.instantiateViewController(identifier: "engi")as!engiViewController
        
        
        r_view.txtpas=depp[indexPath.row]
        
        self.navigationController?.pushViewController(r_view, animated: true)
    }
   
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       blurr()
    vieww.layer.cornerRadius=20
        
        
               

        

        // Do any additional setup after loading the view.
    }
    
    /*func popup(){
    let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))

           vieww.addGestureRecognizer(tap)

        vieww.isUserInteractionEnabled = true
    
    }
     
    */
    func blurr (){
    let blurFx = UIBlurEffect(style: UIBlurEffect.Style.dark)
    let blurFxView = UIVisualEffectView(effect: blurFx)
    blurFxView.frame = view.bounds; blurFxView.autoresizingMask = [.flexibleWidth, .flexibleHeight]; view.insertSubview(blurFxView, at: 0)
    }

    @IBAction func back(_ sender: Any) {
                 let r_strybrd = UIStoryboard(name: "Main", bundle: nil)
                     
                     let r_view = r_strybrd.instantiateViewController(identifier: "home")as!homeViewController
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
