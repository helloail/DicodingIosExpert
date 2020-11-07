//
//  HomePresenter.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 03/11/20.
//

import SwiftUI
import RxSwift
import Combine

class HomePresenter: ObservableObject {
    
    private let homeUseCase: HomeUseCase
    private let disposeBag = DisposeBag()

    private let router = HomeRouter()
    
    @Published var places = [PlaceModel]()
    @Published private(set) var state = LoadedStateHelper.idle
  
    init(homeUseCase: HomeUseCase) {
      self.homeUseCase = homeUseCase
    }
    
    func getPlace() {
        state = .loading
        homeUseCase.getPlaces()
        .observeOn(MainScheduler.instance)
        .subscribe { result in
            self.places = result
        } onError: { error in
          self.state = .error(error)
        } onCompleted: {
            self.state = .loaded
        }.disposed(by: disposeBag)
    }

    func linkBuilder<Content: View>(for place: PlaceModel, @ViewBuilder content: () -> Content) -> some View {
        
        NavigationLink(
            destination:
                    router.makeDetailView(for: place)
               
        ) { content() }
            
        }
    
}
