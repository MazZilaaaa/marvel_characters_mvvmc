class CharacterSeriesService: MoyaService<API>, CharacterSeriesServiceProtocol {
    func fetchSeries(characterId: Int, offset: Int, limit: Int, _ completion: @escaping (Result<[Series], ServiceError>) -> Void) {
        fetch(.series(chracterId: characterId, offset: offset, limit: limit), completion)
    }
}
