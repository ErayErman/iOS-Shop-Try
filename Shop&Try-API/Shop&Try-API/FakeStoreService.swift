
import Foundation
import Moya

public let fakeStoreServiceProvider = MoyaProvider<FakeStoreService>()

public enum FakeStoreService {
    case getProducts
    case getElectronics
    case getJewelery
    case mensC
    case womensC
}

extension FakeStoreService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://fakestoreapi.com")!
    }
    
    public var path: String {
        switch self {
        case .getProducts:
            return "/products"
        case .getElectronics:
            return "/products/category/electronics"
        case .getJewelery:
            return "/products/category/jewelery"
        case .mensC:
            return "/products"
        case .womensC:
            return "/products"
        }
    }
    
    public var method: Moya.Method {
        .get
    }
    
    public var task: Moya.Task {
        switch self {
        case .getProducts:
            return .requestPlain
        case .getElectronics:
            return .requestPlain
        case .getJewelery:
            return .requestPlain
        case .mensC:
            return .requestPlain
        case .womensC:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        nil
    }
}

