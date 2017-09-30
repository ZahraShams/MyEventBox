//
//  EventTableViewCell.swift
//  EventBox
//
//  Created by zahra  on 9/28/17.
//  Copyright © 2017 shams. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    @IBOutlet weak var StartTime: UILabel!

    @IBOutlet weak var EndTime: UILabel!
    
    @IBOutlet weak var Title: UILabel!
    
    @IBOutlet weak var Location: UILabel!
    
    
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var Detail: UILabel!

    @IBOutlet weak var DetailBoxHeight: NSLayoutConstraint!
      @IBOutlet weak var accessoryImage: UIImageView!
   
    var isExpanded:Bool = false
    {
        didSet
        {
            if !isExpanded {
                self.DetailBoxHeight.constant = 0.0

                self.accessoryImage.image = UIImage(named:"plus")
            } else {
                self.DetailBoxHeight.constant = 200
                self.accessoryImage.image = UIImage(named:"minus")

            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
