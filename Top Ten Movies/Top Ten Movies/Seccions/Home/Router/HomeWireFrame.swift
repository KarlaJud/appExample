import UIKit

class HomeWireFrame {
    private var view: HomeViewController?
    private let presenter: HomePresenter?
    private let interactor: HomeInteractor?
    private var window: UIWindow?
    
    init(in window: UIWindow?) {
        self.view = HomeViewController()
        self.presenter = HomePresenter()
        self.interactor = HomeInteractor()
        
        self.view?.eventHandler = self.presenter
        self.presenter?.view = self.view
        self.presenter?.provider = self.interactor
        self.interactor?.output = presenter
        self.presenter?.wireframe = self
        self.window = window
    }
    
    func pushMovieDetailView(movie: MyObject) {
        let frame = MovieDetailWireFrame(in: self.window)
        frame.pushHomeViewController(movie: movie)
    }
    func rootHomeViewController() {
        self.window?.rootViewController = UINavigationController(rootViewController: self.view!)
        self.window?.makeKeyAndVisible()
    }
}
