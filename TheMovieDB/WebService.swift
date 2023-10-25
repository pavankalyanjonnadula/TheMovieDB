//
//  WebService.swift
//  MovieFlix
//

import Foundation

class WebService  {
    static let shared = WebService()
    
    func getRequest<T:Codable>(urlString : String ,handler: @escaping (T?,Error?) -> ()) {
        
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                handler(nil,error)
                return
            }
            if let jsonData = data{
                let jsonDecoder = JSONDecoder()
                do{
                    let modelJson : T = try jsonDecoder.decode(T.self, from: jsonData)
                    handler(modelJson,nil)
                }catch{
                    handler(nil,error)
                }
            }
        }
        task.resume()
    }
}

