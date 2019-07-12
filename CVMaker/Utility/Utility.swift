//
//  Utility.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 06/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import Foundation
import UIKit

open class Utility {
    static let sharedInstance = Utility()
    
    func customizeTextField(textField : UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.gray.cgColor
    }
    
    //Func to get new file path created in document directory
    func getDocumentsDirectory() -> URL {
        
        //For retrieving from local disk
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let filename = paths[0].appendingPathComponent("Resume.txt")
        return filename
        
    }
    
    //Function to display Alert
    func showAlert(title:String,msg:String)  {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
            @unknown default:
                print("Error")
            }}))
        getRootViewController()?.present(alert, animated: true, completion: nil)
    }
    
    //Function to get topView Controller in Window
    func getRootViewController() -> UIViewController?{
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            if let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
                return topController
            }
            else{
                return  topController
            }
        }
        else
        {
            return nil
        }
    }

}

//To restrict the phone number to only integers
extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

