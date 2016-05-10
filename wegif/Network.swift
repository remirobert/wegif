//
//  Network.swift
//  wegif
//
//  Created by Remi Robert on 10/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import Alamofire

typealias JSON = [String: AnyObject]
typealias BlockSuccessCompletion = (JSON?) -> ()
typealias BlockErrorCompletion = (NSError?) -> ()

public enum NetworkMethod: String {
    case GET, POST, PUT, DELETE
    
    func alamofireMethod() -> Alamofire.Method {
        switch self {
        case .GET: return Alamofire.Method.GET
        case .POST: return Alamofire.Method.POST
        case .PUT: return Alamofire.Method.PUT
        case .DELETE: return Alamofire.Method.DELETE
        }
    }
}

protocol NetworkRequest {
    func parameters() -> [String: AnyObject]?
    func path() -> String
    func method() -> NetworkMethod
}

extension NetworkRequest {
    func parameters() -> [String: AnyObject]? { return nil }
}

class Network {
    
    private class var sharedInstance: Network {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: Network? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = Network()
        }
        return Static.instance!
    }
    
    private static func handleJSONResponse(request: Request,
                                           blockSuccess: BlockSuccessCompletion,
                                           blockError: BlockErrorCompletion) {
        request.validate().responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
            switch response.result {
            case .Success(let value):
                blockSuccess(value as? [String: AnyObject])
            case .Failure(let err):
                blockError(err)
            }
        })
    }
    
    static func send(request request: NetworkRequest,
                             blockSuccess: BlockSuccessCompletion,
                             blockError: BlockErrorCompletion) {
        let method = request.method().alamofireMethod()
        let path = request.path()
        let parameters = request.parameters()
        
        let request = Alamofire.request(method, path, parameters: parameters, encoding: .JSON, headers: nil)
        self.handleJSONResponse(request, blockSuccess: blockSuccess, blockError: blockError)
    }
    
    static func send<A>(request request: NetworkRequest,
                     parse: JSON -> A?,
                     blockSuccess: A? -> (),
                     blockError: BlockErrorCompletion)  {
        self.send(request: request, blockSuccess: { (response: JSON?) in
            guard let response = response else {
                blockSuccess(nil)
                return
            }
            blockSuccess(parse(response))
        }, blockError: blockError)
    }
}