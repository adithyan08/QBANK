//
//  homeTableViewCell.swift
//  project
//
//  Created by Iroid on 09/03/23.
//  Copyright © 2023 Iroid. All rights reserved.
//

import UIKit

class homeTableViewCell: UITableViewCell {
   
    @IBOutlet weak var buybtn: UIButton!
    @IBOutlet weak var samplebtn: UIButton!
    @IBOutlet weak var prize: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var viewclr: UIView!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        buybtn.layer.cornerRadius=15
        samplebtn.layer.borderWidth=0.5
        samplebtn.layer.cornerRadius=15
        
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   
}
