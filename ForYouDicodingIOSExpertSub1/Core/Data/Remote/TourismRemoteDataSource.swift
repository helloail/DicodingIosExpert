//
//  RemoteDataSource.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 02/11/20.
//

import Foundation
import Alamofire
import Combine

protocol TourismRemoteDataSourceProtocol: class {
    
    func getPlaces() -> AnyPublisher<[PlaceResponse], Error>
  
}

final class TourismRemoteDataSource: NSObject {

  private override init() { }

  static let sharedInstance: TourismRemoteDataSource =  TourismRemoteDataSource()

}

extension TourismRemoteDataSource: TourismRemoteDataSourceProtocol {
    func getPlaces() -> AnyPublisher<[PlaceResponse], Error> {
        return Future<[PlaceResponse], Error> { completion in
            
            guard let url = URL(string: Endpoints.Gets.list.url) else { return }
            
            AF.request(url)
              .validate()
              .responseDecodable(of: TourismResponse.self) { response in
                switch response.result {
                case .success(let value):
                  completion(.success(value.places))
                case .failure:
                  completion(.failure(URLError.invalidResponse))
                }
              }
            
        }.eraseToAnyPublisher()
        
    }

}
