//
//  ApiInterface.swift
//  NossoLixo
//
//  Created by Diogo Ribeiro de Oliveira on 25/04/18.
//  Copyright © 2018 Diogo Ribeiro de Oliveira. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(Error)
}

typealias ReturnCategoriesRequests = (Result<[Category]>) -> Void
typealias ReturnPlacesRequests = (Result<[Place]>) -> Void

protocol NossoLixoServiceInterface {
    func getCategories(completion: @escaping ReturnCategoriesRequests)
    func getPlaces(completion: @escaping ReturnPlacesRequests)
}

struct GenericError: Error {
    
}
