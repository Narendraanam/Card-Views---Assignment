//
//  DetailsCell.swift
//  CardViews
//
//  Created by Narendra Anam on 21/05/20.
//  Copyright © 2020 NarendraAnam. All rights reserved.
//

import UIKit




class DetailsCell: UITableViewCell {
    
    @IBOutlet weak var nameTxt_Label: UILabel!
    @IBOutlet weak var ageText_Label: UILabel!
    @IBOutlet weak var imagesView: UIImageView!
    @IBOutlet weak var locationText_Label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        imagesView.layer.cornerRadius = 40
        imagesView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
