class CharacterSeriesVM: PaginableVM<Series>, CharacterSeriesVMP {
    var sectionType = CharacterSectionType.series
    var character: Character
    var service: SeriesServiceP?
    var sectionTitle: String? {
        "series"
    }
    
    init(character: Character) {
        self.character = character
        super.init()
        self.totalSize = character.series?.available
    }
    
    func loadSeries() {
        loadMoreItems(clear: false)
    }
    
    override func loadItems(offset: Int, limit: Int, _ completion: @escaping (Result<[Series], ServiceError>) -> Void) {
        service?.fetchSeries(characterId: character.id, offset: offset, limit: limit, completion)
    }
}
