struct Character: Codable {
    let id: Int
    let name: String?
    let description: String?
    let thumbnail: Image?
    let comics: ComicList?
    let series: SeriesList?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, description, thumbnail, comics, series
    }
}
