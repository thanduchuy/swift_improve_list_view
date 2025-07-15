//
//  DefaultListViewModel.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 14/7/25.
//

import Combine
import Factory
import UIKit

struct DefaultListViewModel {
    let navigator: DefaultListNavigatorType
    @Injected(\.listUseCase) var listUseCase
}

extension DefaultListViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    final class Output: ObservableObject {
        @Published var alertErrorMessage = ""
        @Published var isLoading = false
        @Published var companies = [Company]()
        @Published var users = [User]()
        @Published var customers = [Customer]()
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let loadingTracker = ActivityTracker()
        let errorTracker = ErrorTracker()
        
        input.loadTrigger
            .map {
                listUseCase.getCompanies()
                    .trackError(errorTracker)
                    .trackActivity(loadingTracker)
                    .asDriver()
            }
            .switchToLatest()
            .assign(to: \.companies, on: output)
            .store(in: cancelBag)
        
        input.loadTrigger
            .map {
                listUseCase.getUsers()
                    .trackError(errorTracker)
                    .trackActivity(loadingTracker)
                    .asDriver()
            }
            .switchToLatest()
            .assign(to: \.users, on: output)
            .store(in: cancelBag)
        
        input.loadTrigger
            .map {
                listUseCase.getCustomers()
                    .trackError(errorTracker)
                    .trackActivity(loadingTracker)
                    .asDriver()
            }
            .switchToLatest()
            .assign(to: \.customers, on: output)
            .store(in: cancelBag)
        
        loadingTracker.loading
            .receive(on: DispatchQueue.main)
            .assign(to: \.isLoading, on: output)
            .store(in: cancelBag)
        
        errorTracker
            .receive(on: DispatchQueue.main)
            .map { $0.localizedDescription }
            .assign(to: \.alertErrorMessage, on: output)
            .store(in: cancelBag)
        
        return output
    }
}

