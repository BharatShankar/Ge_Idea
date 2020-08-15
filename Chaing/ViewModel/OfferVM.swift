//
//  OfferVM.swift
//  Gron
//
//  Created by Bharat Shankar on 16/03/20.
//  Copyright © 2020 Bharat Shankar. All rights reserved.
//

import UIKit


class HomeVM {
    
    var vc : UIViewController!
      init(){}
      
      init(vc : UIViewController) {
          self.vc = vc
      }
    
    var successOffer: ((FeedItemEntity) -> Void)?
    
    var apps : FeedItemEntity?{
            didSet{
                self.successOffer?(apps!)
            }
        }

    var numberOfRows_apps: Int {
        return apps?.feed?.results?.count ?? 0
     }


     func appsItem(at index: Int) -> Results {
        return (apps?.feed?.results?[index])!
     }
    
}


extension HomeVM{
    
    func explicitItems(){
        let resource = Resource<FeedItemEntity>(vc: self.vc, url: Api.itemData.explicit, method: .get ,params : ["" : ""])

        WebService.shared.loadData(resource: resource,withAppURL: .yes) { (result , statusCode)  in
            switch result{
            case .success(let data) :
                if statusCode.isResponseOK() {
                    self.apps = data
                }else{
                  Log.er(url : Api.itemData.explicit,data)
                    showToast(msg: data.feed?.title ?? "")
                }
                break
            case .failure(let error) :
                Log.er(url : Api.itemData.explicit,error.localizedDescription)
                break
            }
        }
    }
    
    
}
