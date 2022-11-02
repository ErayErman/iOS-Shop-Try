import Foundation
import Shop_Try_API

protocol ProductsViewModelDelegate: AnyObject {
    func didErrorOccurred(_ error: Error)
    func didFetchProducts()
}

protocol ProductsViewModelProtocol {
    var delegate: ProductsViewModelDelegate? {get set}
    func fetchProducts()
}

final class ProductsVM: ProductsViewModelProtocol {
    weak var delegate: ProductsViewModelDelegate?
    
    private var products = [Product]() {
        didSet {
            delegate?.didFetchProducts()
        }
    }

    func fetchProducts() {
        fakeStoreServiceProvider.request(.getProducts) { result in
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
  
}

