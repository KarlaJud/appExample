import UIKit

class HomePresenter: HomeOutput, HomeEventHandler{
    func pushDetailViewEvent(movie: MyObject) {
        wireframe?.pushMovieDetailView(movie: movie)
    }
    
    weak var view: HomeView?
    var provider: HomeProvider?
    var wireframe: HomeWireFrame?

    func getTopTenMovies() {
        provider?.getTopTenMovies()
    }
    
    func getTopTenMoviesResponse<T>(response: T) {
        switch response {
            case is MovieTopRatedObject:
            let object = response as! MovieTopRatedObject
            view?.responseTopTenMovie(movieTopRatedArray: object.results ?? [MyObject]())
            break
            case is Error:
            let error = response as! Error
            view?.customErrorTopTenMovie(message: error.localizedDescription)
            break
            case is String:
            view?.customErrorTopTenMovie(message: response as! String)
            default:
            break
        }
    }
}
