//
//  HomePresenter.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 03/11/20.
//

import SwiftUI
//import RxSwift
import Combine

class HomePresenter: ObservableObject {
    
    private let homeUseCase: HomeUseCase
//    private let disposeBag = DisposeBag()

    private var cancellables: Set<AnyCancellable> = []
    private let router = HomeRouter()
    
    @Published var places = [PlaceModel]()
    @Published private(set) var state = LoadedStateHelper.idle
  
    init(homeUseCase: HomeUseCase) {
      self.homeUseCase = homeUseCase
    }
    
    func getPlace() {
        state = .loading
        homeUseCase.getPlaces()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    //              self.errorMessage = String(describing: completion)
                    self.state = .error(error)
                case .finished:
//                    loadingState = false
                    self.state = .loaded
                }
            }, receiveValue: { result in
                self.places = result
            })
            .store(in: &cancellables)
    }

//    func getPlace() {
//        state = .loading
//        homeUseCase.getPlaces()
//        .observeOn(MainScheduler.instance)
//        .subscribe { result in
//            self.places = result
//        } onError: { error in
//          self.state = .error(error)
//        } onCompleted: {
//            self.state = .loaded
//        }.disposed(by: disposeBag)
//    }

    func linkBuilder<Content: View>(for place: PlaceModel, @ViewBuilder content: () -> Content) -> some View {
        
        NavigationLink(
            destination:
                    router.makeDetailView(for: place)
               
        ) { content() }
            
        }
    
}
