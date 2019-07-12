//
//  HomeViewController.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 06/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet weak var homeTableView: UITableView!
    
    var homeViewArray : [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Dashboard"
        setRightNavigationItem(title: "Save")
        homeTableView.delegate = self
        homeTableView.dataSource = self
        saveDelegate = self
        
        homeViewArray = ["Personal Details", "Education", "Project Details","Current Company/ Past Company", "Expertise Skills"]
        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func navigateToViewController(at index: IndexPath){
    
        switch index.row {
        case 0:
            performSegue(withIdentifier: Segue.personalInfoSegue, sender: nil)
        case 1:
            performSegue(withIdentifier: Segue.educationalSegue, sender: nil)
        case 2:
            performSegue(withIdentifier: Segue.experienceSegue, sender: nil)
        case 3:
            performSegue(withIdentifier: Segue.companySegue, sender: nil)
        case 4:
            performSegue(withIdentifier: Segue.skillSegue, sender: nil)
        default:
            print("Default")
        }
    }
    //Saving data to server
    private func finalSave()
    {
        var url:URL
        
        url = Utility.sharedInstance.getDocumentsDirectory()
        
        //Calling network methods for save
        NetworkManager.sharedInstance.requestForWriting(url: url, dataDict: ResumeDataModel.sharedInstance.getResumeDataDictionary(), completionHandlers:({(data:[String:Any]?,url:URLResponse?,error:Error?) in
            
            if let _ = error{
                print("Error while Saving")
                Utility.sharedInstance.showAlert(title: "Error", msg: "Error while Saving")
            }
            else{
                Utility.sharedInstance.showAlert(title: "Success", msg: "Data Saved Successfully")
                
            }
        }))
    }
}

extension HomeViewController : saveProtocol{
    func saveObject() {
        
    }
    
    func writeToUrl() {
        finalSave()
    }
    
    
}

extension HomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell
//        cell?.accessoryType = .detailButton
        cell?.homeCategoryLabel.text = homeViewArray?[indexPath.row]
        return cell!
    }
    
    
}

extension HomeViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        navigateToViewController(at: indexPath)
    }
}
