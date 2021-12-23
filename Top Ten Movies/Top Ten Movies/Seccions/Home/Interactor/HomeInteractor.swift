import UIKit

class HomeInteractor: HomeProvider {
    
    weak var output: HomeOutput?
    
    func getTopTenMovies() {
        let baseUrl = "https://api.themoviedb.org/3/movie/top_rated?"
        let parameters = ["api_key":"cb978be47c6488782919178000e1573e", "language":"en-US", "page":"1"]
        Connection.request(parameters: parameters, urlString: baseUrl, method: "GET") {data,error in
            if data == nil {
                self.output?.getTopTenMoviesResponse(response: "Network Error")
                print("error")
            } else{
                print("success")
                do {
                    let responseArray = try JSONDecoder().decode(MovieTopRatedObject.self, from: data!)
                    self.output?.getTopTenMoviesResponse(response: responseArray)
                    print("mapeo exitoso")
                } catch let err {
                    self.output?.getTopTenMoviesResponse(response: err)
                    print(err)
                }
            }
        }
    }
}
