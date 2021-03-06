import Moya

class MoyaService<API: TargetType> {
    private let provider: MoyaProvider<API>
    
    init(provider: MoyaProvider<API>) {
        self.provider = provider
    }
    
    func fetch<T: Codable>(_ target: API, _ completion: @escaping (Result<T, ServiceError>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(DataWrapper<T>.self, from: response.data)
                    guard let data = response.data?.results else {
                        return completion(.failure(.emptyData))
                     }
                    completion(.success(data))
                } catch {
                    print(error)
                    completion(.failure(.decode))
                }
            case .failure(let error):
                print(error)
                completion(.failure(.loading))
            }
        }
    }
}
