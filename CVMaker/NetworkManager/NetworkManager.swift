//
//  NetworkManager.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 10/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import Foundation
import UIKit
open class NetworkManager
{
    static let sharedInstance = NetworkManager()

    typealias CompletionHandler = (_ data: [String:Any]?,_ response: URLResponse?,_ error: Error?)->()

    func requestForWriting(url:URL,dataDict:[String:Any],completionHandlers:@escaping(CompletionHandler)){
        NetworkRequestClass.sharedInstance.saveData(url: url, dataDict: dataDict, completionHandler: completionHandlers)
    }

    func initialLoadForCV(url:URL,completionHandlers:@escaping(CompletionHandler)) {
        NetworkRequestClass.sharedInstance.retrieveData(url: url, completionHandler: completionHandlers)
    }
    
}
