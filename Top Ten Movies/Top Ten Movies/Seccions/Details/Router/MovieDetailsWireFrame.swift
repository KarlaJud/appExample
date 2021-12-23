import UIKit

class MovieDetailWireFrame {
    private var view: MovieDetailViewController?
    private var presenter: MovieDetailPresenter?
    private var interactor: MovieDetailInteractor?
    private var window: UIWindow?
    
    init(in window: UIWindow?) {
        self.view = MovieDetailViewController()
        self.presenter = MovieDetailPresenter()
        self.interactor = MovieDetailInteractor()
        
        self.view?.eventHandler = self.presenter
        self.presenter?.view = self.view
        self.presenter?.provider = self.interactor
        self.interactor?.output = presenter
        self.presenter?.wireframe = self
        self.window = window
    }
    func pushHomeViewController(movie: MyObject) {
        let navigation = window?.rootViewController as! UINavigationController
        view?.modalPresentationStyle = .overCurrentContext
        view!.moviePoster = movie.poster_path
        view!.movieTitle = movie.title
        view!.movieDate = movie.release_date
        view!.movieDescription = movie.overview
        let score = String(movie.vote_average! * 10).split(separator: ".")
        view!.movieScore = String(score.first ?? "")
        navigation.pushViewController(view!, animated: true)
    }
}
