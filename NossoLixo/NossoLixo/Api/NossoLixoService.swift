//
//  ApiImplementation.swift
//  NossoLixo
//
//  Created by Diogo Ribeiro de Oliveira on 25/04/18.
//  Copyright © 2018 Diogo Ribeiro de Oliveira. All rights reserved.
//

import Foundation

class ApiImplentation: ApiNossoLixo {
    let kUrl: String = "https//nossolixo-api.herokuapp.com/"
    let urlSessionConf: URLSessionConfiguration = URLSessionConfiguration()
    var urlSession: URLSession!
    
    init() {
        urlSessionConf.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        urlSessionConf.timeoutIntervalForRequest = 30
        urlSession = URLSession(configuration: urlSessionConf)
    }
    
    func getCategories(completion: @escaping ReturnCategoriesRequests) {
        guard let url = URL(string: kUrl+"v1/categories") else {
            return
        }
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        
        guard let urlSession = self.urlSession else {
            return
        }
        
        let task = urlSession.dataTask(with: request) { (data, urlResponse, error) in
            if error == nill && data != nill {
                
            }
        }
        task.resume()
    }
    
    func getPlaces(completion: @escaping ReturnPlacesRequests) {
        
    }
    
}

/*/* Configure session, choose between:
 * defaultSessionConfiguration
 * ephemeralSessionConfiguration
 * backgroundSessionConfigurationWithIdentifier:
 And set session-wide properties, such as: HTTPAdditionalHeaders,
 HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
 */
 let sessionConfig = URLSessionConfiguration.default
 
 /* Create session, and optionally set a URLSessionDelegate. */
 let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
 
 /* Create the Request:
 Consultar Categorias (GET https://nossolixo-api.herokuapp.com/v1/categories)
 */
 
 guard var URL = URL(string: "https://nossolixo-api.herokuapp.com/v1/categories") else {return}
 var request = URLRequest(url: URL)
 request.httpMethod = "GET"
 
 // Headers
 
 request.addValue("text/plain; charset=utf-8", forHTTPHeaderField: "Content-Type")
 
 // Body
 
 let bodyString = "{\n  \"name\": \"Thiago Guimarães\",\n  \"email\": \"thiagogsr@gmail.com\",\n  \"password\": \"12345678\",\n  \"password_confirmation\": \"12345678\"\n}"
 request.httpBody = bodyString.data(using: .utf8, allowLossyConversion: true)
 
 /* Start a new Task */
 let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
 if (error == nil) {
 // Success
 let statusCode = (response as! HTTPURLResponse).statusCode
 print("URL Session Task Succeeded: HTTP \(statusCode)")
 }
 else {
 // Failure
 print("URL Session Task Failed: %@", error!.localizedDescription);
 }
 })
 task.resume()
 session.finishTasksAndInvalidate()
 }
 }
 
 
*/
