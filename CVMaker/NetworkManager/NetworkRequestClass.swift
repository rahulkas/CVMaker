//
//  NetworkRequestClass.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 10/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import Foundation
import UIKit
class NetworkRequestClass
{
    typealias CompletionHandler = (_ data: [String:Any]?,_ response: URLResponse?,_ error: Error?)->()
    static let sharedInstance = NetworkRequestClass()
    //Saving data
    func saveData(url:URL,dataDict:[String:Any],completionHandler:@escaping(CompletionHandler)) {

        var jsonData:Data;
        do{
            jsonData = try JSONSerialization.data(withJSONObject: dataDict, options: .init(rawValue:0)) as Data
            writeToURL(url: url,data: jsonData,completionHandler: completionHandler)
        }
        catch
        {
            print("Error while saving!!")
        }
    }
    //Writing data to URL
    fileprivate func writeToURL(url:URL,data:Data,completionHandler:@escaping(CompletionHandler)) {

         //To write to local file

        do {
            try data.write(to: url)
            completionHandler(nil,nil,nil)
        } catch {

            let error = NSError()
            print("Error while writing!!")

            completionHandler(nil,nil,error)
        }

        //To write to URL Path
//        writeNow(arg: url, data: data,completionHandler:completionHandler)
    }



    //Retrieving data from URL
    func retrieveData(url:URL,completionHandler: @escaping(CompletionHandler)) {

        //Retrieve from local disk
        let request = NSURLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) {(data, response, error) in
            if let dataObj = data{
                //Parsing the retrieved Data
                self.parsing(data: dataObj,response:response,error: error,completionHandler: completionHandler)
            }
            else{
                //If no data
                 completionHandler(nil,nil,error)
            }
        }
        task.resume()


        //Retrieve from Gist
//        var urlSs = "https://api.github.com/gists/644c200f79200eae66a15f2f3aab0695/"
//        retrieveUsingSession(url: URL(string: urlSs)!, completionHandler: completionHandler)
        return
    }

    //Parsing the data after retrieving
    fileprivate func parsing(data:Data,response:URLResponse?,error:Error?,completionHandler:@escaping(CompletionHandler)) {
        var dict:[String:Any] = [:]
        do{
            dict = try JSONSerialization.jsonObject(with: data) as! Dictionary
            completionHandler(dict,nil,nil)
        }
        catch{
            print("Error in parsing")
            completionHandler(nil,nil,error)
        }

    }

    //Write to path url
    func writeNow(arg:URL,data:Data,completionHandler:CompletionHandler)  {
        // does the URL exist? ask to create it
        let url: NSURL! = arg as NSURL
        if !url.checkResourceIsReachableAndReturnError(nil) {
            print("File doesn't exist: \(arg)\n Create it now? [y/N] ")
            do{
//                try "asdassda".write(to: arg, atomically:true, encoding:String.Encoding.utf8)
                try data.write(to:arg)
                print("File Created \(url.path!)")
                completionHandler(nil,nil,nil)
            }
            catch{
                print("Error creating")
                completionHandler(nil,nil,NSError())
            }
        }
    }

    //Retrieve using session & URL request
    func retrieveUsingSession(url:URL,completionHandler:@escaping (CompletionHandler)) {
        // Set up the URL request

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            //Parse the received data
            self.parsing(data: responseData, response: response, error: error, completionHandler: completionHandler)
        }
        task.resume()
    }


}
