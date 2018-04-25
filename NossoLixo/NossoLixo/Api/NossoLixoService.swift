//
//  ApiImplementation.swift
//  NossoLixo
//
//  Created by Diogo Ribeiro de Oliveira on 25/04/18.
//  Copyright © 2018 Diogo Ribeiro de Oliveira. All rights reserved.
//

import Foundation

class NossoLixoService: NossoLixoServiceInterface {
    let kUrl: String = "https://nossolixo-api.herokuapp.com/"
    let urlSessionConf: URLSessionConfiguration = URLSessionConfiguration()
    var urlSession: URLSession!
    
    init() {
        //urlSessionConf.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        //urlSessionConf.timeoutIntervalForRequest = 30
        urlSession = URLSession(configuration: .default)
    }
    
    func getCategories(completion: @escaping ReturnCategoriesRequests) {
        guard let url = URL(string: kUrl + "v1/categories") else {
            return
        }
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        
        guard let urlSession = self.urlSession else {
            return
        }
        
        let task = urlSession.dataTask(with: request) { (data, urlResponse, error) in
            guard let data = data else {
                completion(.error(GenericError()))
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let response = try jsonDecoder.decode([Category].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.error(error))
                }
            }
        }
        task.resume()
    }
    
    func getPlaces(completion: @escaping ReturnPlacesRequests) {
        guard let url = URL(string: kUrl + "v1/places") else {
            return
        }
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        
        guard let urlSession = self.urlSession else {
            return
        }
        
        let task = urlSession.dataTask(with: request) { (data, urlResponse, error) in
            guard let data = data else {
                completion(.error(GenericError()))
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let response = try jsonDecoder.decode([Place].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.error(error))
                }
            }
        }
        task.resume()
    }
    
}
