import UIKit
import Moya

class CharacterCoordinator: BaseCoordinator {
    let apiProvider: MoyaProvider<API>
    let character: Character
    
    init(apiProvider: MoyaProvider<API>, character: Character) {
        self.apiProvider = apiProvider
        self.character = character
    }
    
    override func start() {
        showCharacter()
    }
    
    private func showCharacter() {
        let comicsService = CharacterComicsService(provider: apiProvider)
        let seriesService = CharacterSeriesService(provider: apiProvider)
        let charactersService = RemoteCharactersStore(provider: apiProvider)
        let viewModel = CharacterViewModel(
            character: character,
            charactersService: charactersService,
            comicsService: comicsService,
            seriesService: seriesService,
            favorites: Favorites.shared)
        
        let characterVC = CharacterVC(viewModel: viewModel)
        viewModel.viewDelegate = characterVC
        viewModel.characterCoordinatorDelegate = self
        navigationController.delegate = self
        navigationController.pushViewController(characterVC, animated: true)
    }
}

extension CharacterCoordinator: CharacterViewModelCoordinatorDelegate {
}

extension CharacterCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if fromViewController is CharacterVC {
            parentCoordinator?.didFinish(coordinator: self)
        }
    }
}
