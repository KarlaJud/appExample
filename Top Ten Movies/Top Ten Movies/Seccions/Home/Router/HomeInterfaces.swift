import UIKit


protocol HomeView: class {
    func responseTopTenMovie(movieTopRatedArray: [MyObject])
    func customErrorTopTenMovie(message: String)
}
    
protocol HomeEventHandler {
    func getTopTenMovies()
    func pushDetailViewEvent(movie: MyObject)
}

protocol HomeOutput: class {
    func getTopTenMoviesResponse<T>(response: T)
}

protocol HomeProvider {
    func getTopTenMovies()
}
