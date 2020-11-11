//
//  FavouritePresenter.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 11/11/20.
//

import SwiftUI
import Combine

class FavouritePresenter: ObservableObject {
    
    private let favouriteUseCase: FavouriteUseCase
    private var cancellables: Set<AnyCancellable> = []
    private let router = FavouriteRouter()
    
    @Published var places = [PlaceModel]()
    @Published private(set) var state = LoadedStateHelper.idle
  
    init(favouriteUseCase: FavouriteUseCase) {
      self.favouriteUseCase = favouriteUseCase
        
    }
    
    func getPlace() {
        state = .loading
        favouriteUseCase.getFavoriteMeals()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.state = .error(error)
                    
                case .finished:
                    self.state = .loaded
                }
            }, receiveValue: { result in
                if result.count == 0 {
//
                self.state = .empty
                }
                self.places = result
                    print(self.state)
                
            })
            .store(in: &cancellables)
    }

    func linkBuilder<Content: View>(for place: PlaceModel, @ViewBuilder content: () -> Content) -> some View {
        
        NavigationLink(
            destination:
                    router.makeDetailView(for: place)
               
        ) { content() }
            
        }
}
