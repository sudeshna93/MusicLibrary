//
//  MusicViewCell.swift
//  MusicLibrary
//
//  Created by Consultant on 11/18/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import UIKit

class MusicViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    var prevTag: Int? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        thumbnailImage.layer.cornerRadius = 5
        thumbnailImage.layer.masksToBounds = true
        thumbnailImage.layer.borderColor = UIColor.black.cgColor
        thumbnailImage.layer.borderWidth = 2
        
    }
    
}
