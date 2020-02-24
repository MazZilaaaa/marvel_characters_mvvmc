protocol CharactersViewModelProtocol: PaginableViewModel<Character> {
    var coordinatorDelegate: CharactersViewModelCoordinatorDelegate? { get }
    var service: CharactersServiceProtocol { get }
    func loadCharacters()
    func reloadCharacters()
    func showCharacter(index: Int)
    func addToFavorite(character: Character)
    func removeFromFavorite(character: Character)
}
