import UIKit

class MovieDetailPresenter: MovieDetailOutput, MovieDetailEventHandler{
    
    weak var view: MovieDetailView?
    var provider: MovieDetailProvider?
    var wireframe: MovieDetailWireFrame?
}
