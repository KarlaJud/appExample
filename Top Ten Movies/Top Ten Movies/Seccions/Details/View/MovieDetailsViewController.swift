
import UIKit

class MovieDetailViewController: UIViewController, MovieDetailView {
    
    var eventHandler: MovieDetailEventHandler?
    
    var movieImage: UIImageView!
    var movieTittleLabel: UILabel!
    var movieReleaseDateLabel: UILabel!
    var movieDescriptionLabel: UILabel!
    var movieRatingLabel: UILabel!
    
    var moviePoster: String?
    var movieTitle: String?
    var movieScore: String?
    var movieDate: String?
    var movieDescription: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        setupMovieDetails()
        DispatchQueue.global(qos: .background).async {
            let urlString = String(format: "https://image.tmdb.org/t/p/w1280%@", self.moviePoster ?? "")
            let url = URL(string: urlString)
            if let data = try? Data(contentsOf: url!) {
                let image: UIImage = UIImage(data: data)!
                DispatchQueue.main.async {
                    self.movieImage.image = image
                }
            }
        }
        movieTittleLabel.text = movieTitle
        movieRatingLabel.text = String(format: "%@ %@", self.movieScore ?? "", "%")
        movieReleaseDateLabel.text = movieDate
        movieDescriptionLabel.text = movieDescription
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func setupMovieDetails() {
        movieImage = UIImageView()
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(movieImage)
        movieImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 220).isActive = true
        movieImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        movieImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        movieTittleLabel = UILabel()
        movieTittleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        movieTittleLabel.textAlignment = .left
        movieTittleLabel.numberOfLines = 0
        movieTittleLabel.lineBreakMode = .byWordWrapping
        movieTittleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(movieTittleLabel)
        movieTittleLabel.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: 10).isActive = true
        movieTittleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        movieTittleLabel.topAnchor.constraint(equalTo: movieImage.topAnchor).isActive = true
        
        movieReleaseDateLabel = UILabel()
        movieReleaseDateLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        movieReleaseDateLabel.textAlignment = .left
        movieReleaseDateLabel.numberOfLines = 0
        movieReleaseDateLabel.lineBreakMode = .byWordWrapping
        movieReleaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(movieReleaseDateLabel)
        movieReleaseDateLabel.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: 10).isActive = true
        movieReleaseDateLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        movieReleaseDateLabel.topAnchor.constraint(equalTo: movieTittleLabel.bottomAnchor, constant: 5).isActive = true
       
        movieRatingLabel = UILabel()
        movieRatingLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        movieRatingLabel.textAlignment = .left
        movieRatingLabel.textColor = .black
        movieRatingLabel.numberOfLines = 0
        movieRatingLabel.lineBreakMode = .byWordWrapping
        movieRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(movieRatingLabel)
        movieRatingLabel.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: 10).isActive = true
        movieRatingLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        movieRatingLabel.topAnchor.constraint(equalTo: movieReleaseDateLabel.bottomAnchor, constant: 5).isActive = true
        
        movieDescriptionLabel = UILabel()
        movieDescriptionLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        movieDescriptionLabel.textAlignment = .left
        movieDescriptionLabel.numberOfLines = 0
        movieDescriptionLabel.lineBreakMode = .byWordWrapping
        movieDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(movieDescriptionLabel)
        movieDescriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        movieDescriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        movieDescriptionLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 5).isActive = true
    }
}
