//
//  OfferCell.swift
//  Gron
//
//  Created by Bharat Shankar on 08/03/20.
//  Copyright © 2020 Bharat Shankar. All rights reserved.
//

import UIKit
class AppsCell : UITableViewCell{
    
    
    @IBOutlet weak var appsBG : UIView!
    @IBOutlet weak var appsName : UILabel!
    @IBOutlet weak var appsType : UILabel!
    @IBOutlet weak var appsreleaseDate : UILabel!
    
    @IBOutlet weak var appImage : UIImageView!

    var genres : [String] = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
         self.selectionStyle = .none
        self.appImage.setCorneredElevation(shadow: 5, corner: 20, color: .gray)
        
    }
    
    func appDateSetup(data : Results){
        if(self.genres.count > 0){
            self.genres.removeAll()
        }
        self.appImage.setURLImage(data.artworkUrl100 ?? "")
        self.appsName.setText(data.name ?? "")
        for  i in 0...(data.genres?.count ?? 0)-1{
            self.genres.append(data.genres?[i].name ?? "")
        }
        let genresStr = self.genres.joined(separator: "\n")
        self.appsType.setText(genresStr)
        self.appsreleaseDate.setText(data.releaseDate ?? "")
    }
}
