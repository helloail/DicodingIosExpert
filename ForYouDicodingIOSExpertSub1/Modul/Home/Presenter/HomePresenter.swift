//
//  HomePresenter.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 03/11/20.
//

import SwiftUI
import RxSwift

class HomePresenter: ObservableObject {
    
    private let homeUseCase: HomeUseCase
    private let disposeBag = DisposeBag()

    private let router = HomeRouter()
    
    @Published var places: [PlaceModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(homeUseCase: HomeUseCase) {
      self.homeUseCase = homeUseCase
    }
    
    func getPlace() {
      loadingState = true
        homeUseCase.getPlaces()
        .observeOn(MainScheduler.instance)
        .subscribe { result in
            self.places = result
        } onError: { error in
          self.errorMessage = error.localizedDescription
        } onCompleted: {
          self.loadingState = false
        }.disposed(by: disposeBag)
    }
    
    func linkBuilder<Content: View>(for place: PlaceModel, @ViewBuilder content: () -> Content) -> some View {

        NavigationLink(
            destination:
                router.makeDetailView(for: place) ) { content() }
    }

}
