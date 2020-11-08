//
//  FavouritesPresenter.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 08/11/20.
//

import SwiftUI
import RxSwift
import Combine
//
class FavouritesPresenter: ObservableObject {
    
    private let favoritesUseCase: FavouritesUseCase
    private let disposeBag = DisposeBag()
    
    private let router = FavouritesRouter()
    
    @Published var places = [PlaceModel]()
    @Published private(set) var state = LoadedStateHelper.idle
    
    init(favoritesUseCase: FavouritesUseCase) {
        self.favoritesUseCase = favoritesUseCase
    }
    
    func getPlace() {
        state = .loading
        favoritesUseCase.getFavourites()
            .observeOn(MainScheduler.instance)
            .subscribe { result in
                self.places = result
            } onError: { error in
                self.state = .error(error)
            } onCompleted: {
                self.state = .loaded
            }.disposed(by: disposeBag)
        print(state)
    }
    
    func linkBuilder<Content: View>(for place: PlaceModel, @ViewBuilder content: () -> Content) -> some View {
        
        NavigationLink(
            destination:
                router.makeDetailView(for: place)
            
        ) { content() }
        
    }
}
