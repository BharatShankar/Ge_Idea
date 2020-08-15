

import Foundation
import UIKit

public enum navigateFrom : String{
    case login
    case signup
    case none
}

public enum storyboardName : String{
    case main = "Main"
    
}

public enum VCID : String{
    case viewcontroller = "ViewController"
    case DetailVc = "DetailVc"
    
}


public enum cellID : String {
    case AppsCell = "AppsCell"
}

public enum NavigationOption : String{
    case onboard
    case launcher
    case home
    case login
    case logout
    case payment
    case forceLogout
}

extension UIResponder {
    public var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}

extension UIViewController{
    
    
    var identifiers : String{
        return "\(self)"
    }
    
   static func getStoryBoard(withName name : storyboardName) -> UIStoryboard{
        return UIStoryboard.init(name: name.rawValue, bundle: Bundle.main)
    }
    
   static func initVC<T : UIViewController>(storyBoardName name : storyboardName , vc : T.Type , viewConrollerID id : VCID) -> T{
        return getStoryBoard(withName: name).instantiateViewController(withIdentifier: id.rawValue) as! T
    }
    
    func push<T : UIViewController>(from vc : T ,ToViewContorller contoller : UIViewController ){
        vc.navigationController?.pushViewController(contoller, animated: true)
    }
    
    func pop<T:UIViewController>(from vc : T){
        vc.navigationController?.popViewController(animated: true)
    }
    
  
    func present<T : UIViewController>(vc : T, _ isFullyPresent : YesNoType = .no){
        let vcl = vc
        if isFullyPresent == .no{
            vcl.modalPresentationStyle = .custom
        }else{
            vcl.modalPresentationStyle = .fullScreen
        }
        self.present(vc, animated: false, completion: nil)
    }
    func popMultipleVC(popViews: Int) {
        if self.navigationController!.viewControllers.count > popViews
        {
            let vc = self.navigationController!.viewControllers[self.navigationController!.viewControllers.count - popViews - 1]
             self.navigationController?.popToViewController(vc, animated: false)
        }
    }
    
   
    
}

struct Navigation {
    
    static func navigateTo(screen name : String){
         print("AppState" , name)
        var rootVC : UIViewController?
        switch name {
        case NavigationOption.onboard.rawValue:
            rootVC = ViewController.initVC(storyBoardName: .main, vc: ViewController.self, viewConrollerID: .viewcontroller)
           
        default:
              rootVC = ViewController.initVC(storyBoardName: .main, vc: ViewController.self, viewConrollerID: .viewcontroller)
        }
        let navigationController = UINavigationController(rootViewController: rootVC!)
//        navigationController.navigationBar.isHidden = true
//        navigationController.navigationBar.tintColor = UIColor.whiteColor
        if #available(iOS 13.0,*){
            UIApplication.shared.windows.first?.rootViewController = navigationController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }else{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = navigationController
            appDelegate.window?.makeKeyAndVisible()
        }
    }
    
   
}
