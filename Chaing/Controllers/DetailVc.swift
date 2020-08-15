//
//  DetailVc.swift
//  Chaing
//
//  Created by AppleMac on 15/08/20.
//  Copyright © 2020 AppleMac. All rights reserved.
//

import UIKit

class DetailVc: UIViewController {

    
    @IBOutlet weak var appsName : UILabel!
    @IBOutlet weak var appsAuthor : UILabel!
    @IBOutlet weak var appsAuthordetail : UILabel!
    @IBOutlet weak var appsstore : UILabel!
    @IBOutlet weak var appsreleaseDate : UILabel!
    @IBOutlet weak var appsType : UILabel!
    @IBOutlet weak var copyrights : UILabel!
    
    @IBOutlet weak var appImage : UIImageView!
    
    var genres : [String] = [String]()
    var result : Results?
    var authorUrl = ""
    var appUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appDateSetup(data: self.result!)
        let tapAuthor = UITapGestureRecognizer(target: self, action: #selector(DetailVc.tapAuthorDetail))
        appsAuthordetail.isUserInteractionEnabled = true
        appsAuthordetail.addGestureRecognizer(tapAuthor)
        
        let tapUrl = UITapGestureRecognizer(target: self, action: #selector(DetailVc.tapAppUrl))
               appsstore.isUserInteractionEnabled = true
               appsstore.addGestureRecognizer(tapUrl)
         
    }
    
    @objc
    func tapAuthorDetail(sender:UITapGestureRecognizer) {
      guard let url = URL(string:authorUrl) else { return }
        UIApplication.shared.open(url)
    }
    
    @objc
    func tapAppUrl(sender:UITapGestureRecognizer) {
      guard let url = URL(string:appUrl) else { return }
        UIApplication.shared.open(url)
    }
    
    func appDateSetup(data : Results){
        
        self.appImage.setURLImage(data.artworkUrl100 ?? "")
        self.appsName.setText(data.name ?? "")
        for  i in 0...(data.genres?.count ?? 0)-1{
            self.genres.append(data.genres?[i].name ?? "")
        }
        let genresStr = self.genres.joined(separator: "\n")
        self.appsType.setText(genresStr, 20, fontStyle: .bold, isTitle: .no, textColor: .black)
        self.appsreleaseDate.setText(data.releaseDate ?? "", 18, fontStyle: .regular, isTitle: .no, textColor: .black)
        self.appsAuthor.setText(data.artistName ?? "",20, fontStyle: .bold, isTitle: .yes, textColor: .black)
        self.appsAuthordetail.setText(data.artistUrl ?? "")
        authorUrl = data.artistUrl ?? ""
        self.copyrights.setText(data.copyright ?? "")
        self.appsstore.setText(data.url ?? "")
        appUrl = data.url ?? ""
//        self.hyperLink(label: self.appsstore, url: data.url ?? "")
//        self.hyperLink(label: self.copyrights, url: data.artistUrl ?? "")
    }
    func hyperLink(label : UILabel,url : String) {
        let attributedString = NSMutableAttributedString(string: "")
        attributedString.addAttribute(.link, value: "https://www.hackingwithswift.com", range: NSRange(location: 19, length: 55))
        
        label.attributedText = attributedString
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }

}
