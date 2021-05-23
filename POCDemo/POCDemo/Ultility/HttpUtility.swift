//
//  HttpUtility.swift
//  POCDemo
//
//  Created by iOS on 23/05/21.
//

import Foundation

struct HttpUtility
{
    static let shared = HttpUtility()
    private init(){}

    // API call
    func performDataTask<T:Decodable>(urlRequest: URLRequest,
                                      resultType: T.Type,
                                      success completionHandler:@escaping(_ result: T?)-> Void,
                                      failure failureBlock:@escaping ((Error) -> Void)){
        
        URLSession.shared.dataTask(with: urlRequest) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    completionHandler(result)
                }
                catch let error {
                    failureBlock(error)
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }else{
                failureBlock(error!)
            }

        }.resume()
    }
    
    
    /// Mock API function 
    func performMockDataTask<T:Decodable>(urlRequest: URLRequest,
                                          resultType: T.Type,
                                          completionHandler:@escaping(_ result: T?)-> Void,
                                          failure failureBlock:@escaping ((Error) -> Void)){
        
        let decoder = JSONDecoder()
        do {
            
            let responseData = Data("{ \"user\": { \"userid\": \"1234ABC\" , \"password\": \"1234ABC\" } }".utf8)
            let result = try decoder.decode(T.self, from: responseData)
            _=completionHandler(result)
        }
        catch let error{
            failureBlock(error)
        }
    }
}
