import Foundation
import Shop_Try_API

protocol SearchViewModelDelegate: AnyObject {
    func didErrorOccurred(_ error: Error)
    func didFetchProducts()
}

protocol SearchViewModelProtocol {
    var delegate: SearchViewModelDelegate? {get set}
    var numberOfRows: Int {get}
    func productForIndexPath(_ indexPath: IndexPath) -> Product?
    func fetchProducts()
}

final class SearchVM: SearchViewModelProtocol {
    
    weak var delegate: SearchViewModelDelegate?
    
    private var products = [Product]() {
        didSet {
            delegate?.didFetchProducts()
        }
    }
    var results = [Product]()
    
    var numberOfRows: Int {
        products.count
        
    }
    
// MARK: - FETCHING METHODS

    func fetchProducts() {
        fakeStoreServiceProvider.request(.getProducts) { result in
            switch result {
            case.failure(let error):
                self.delegate?.didErrorOccurred(error)
            case .success(let response):
                do {
                    let products = try JSONDecoder().decode([Product].self, from: response.data)
                    self.products = products
                    self.results = products
                } catch {
                    self.delegate?.didErrorOccurred(error)
                }
            }
        }
    }
    func fetchJewelery() {
        fakeStoreServiceProvider.request(.getJewelery) { result in
            switch result {
            case.failure(let error):
                self.delegate?.didErrorOccurred(error)
            case .success(let response):
                do {
                    let products = try JSONDecoder().decode([Product].self, from: response.data)
                    self.products = products
                } catch {
                    self.delegate?.didErrorOccurred(error)
                }
            }
        }
    }
    func fetchElectronics() {
        fakeStoreServiceProvider.request(.getElectronics) { result in
            switch result {
            case.failure(let error):
                self.delegate?.didErrorOccurred(error)
            case .success(let response):
                do {
                    let products = try JSONDecoder().decode([Product].self, from: response.data)
                    self.products = products
                } catch {
                    self.delegate?.didErrorOccurred(error)
                }
            }
        }
    }
    func fetchWomens() {
        fakeStoreServiceProvider.request(.womensC) { result in
            switch result {
            case.failure(let error):
                self.delegate?.didErrorOccurred(error)
            case .success(let response):
                do {
                    let products = try JSONDecoder().decode([Product].self, from: response.data)
                    self.products = products
                } catch {
                    self.delegate?.didErrorOccurred(error)
                }
            }
        }
    }
    func fetchMens() {
        fakeStoreServiceProvider.request(.mensC) { result in
            switch result {
            case.failure(let error):
                self.delegate?.didErrorOccurred(error)
            case .success(let response):
                do {
                    let products = try JSONDecoder().decode([Product].self, from: response.data)
                    self.products = products
                } catch {
                    self.delegate?.didErrorOccurred(error)
                }
            }
        }
    }
    
    func productForIndexPath(_ indexPath: IndexPath) -> Product? {
        products[indexPath.row]
        
    }
    
    


  
}

