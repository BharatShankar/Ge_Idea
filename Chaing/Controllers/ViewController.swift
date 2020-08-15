
import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var appsList : UITableView!
    
    var homevm = HomeVM()
    
   override func viewDidLoad() {
        super.viewDidLoad()
        self.homevm = HomeVM(vc: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.appDatas()
        self.config()
    }
   
}

extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func config(){
        self.appsList.delegate = self
        self.appsList.dataSource = self
        self.appsList.registerCell(withId: .AppsCell)
        self.appsList.animateTable()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.homevm.numberOfRows_apps ?? 0 > 0{
            return self.homevm.numberOfRows_apps ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID.AppsCell.rawValue, for: indexPath) as! AppsCell
        cell.appDateSetup(data: self.homevm.appsItem(at: indexPath.row))
        cell.contentView.addTap {
           
          let  vc = DetailVc.initVC(storyBoardName: .main, vc: DetailVc.self, viewConrollerID: .DetailVc)
            vc.result = self.homevm.appsItem(at: indexPath.row)
            self.push(from: self, ToViewContorller: vc)
        }
       
        return cell
    }
    
//
}


extension ViewController{
    func appDatas(){
        homevm.explicitItems()
        homevm.successOffer = { data in
            print("Data",data)
            self.appsList.reloadData()
        }
    }
}
