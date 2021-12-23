import UIKit

class HomeViewController: UIViewController, HomeView {
    
    var movieTableView: UITableView!
    
    var eventHandler: HomeEventHandler?
    var movieTopRatedArray: [MyObject]?
    
    var indexCurrentSelected : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupMovieView()
        eventHandler?.getTopTenMovies()
    }
    
    func setupMovieView() {
        movieTableView = UITableView()
        movieTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.cellID)
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.rowHeight = 90
        movieTableView.separatorStyle = .none
        movieTableView.backgroundColor = .clear
        movieTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(movieTableView)
        movieTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        movieTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        movieTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        movieTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
    }
    func customErrorTopTenMovie(message: String) {
        let alert = UIAlertController(title: "Ocurrio un error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                break
            case .cancel:
                break
            case .destructive:
                break
            @unknown default:
                return
            }
        }))
        present(alert, animated: true, completion: nil)
    }
    func responseTopTenMovie(movieTopRatedArray: [MyObject]) {
        self.movieTopRatedArray = movieTopRatedArray
        DispatchQueue.main.async {
        self.movieTableView.reloadData()
    }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if movieTopRatedArray?.count ?? 0 >= 10 {
            return 10
        } else {
            return movieTopRatedArray?.count ?? 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(movieTopRatedArray?[indexPath.row].poster_path)
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.cellID, for: indexPath) as! MovieTableViewCell
        DispatchQueue.global(qos: .background).async {
            let urlString = String(format: "https://image.tmdb.org/t/p/w1280%@", self.movieTopRatedArray?[indexPath.row].poster_path ?? "")
            let url = URL(string: urlString)
            if let data = try? Data(contentsOf: url!) {
                let image: UIImage = UIImage(data: data)!
                DispatchQueue.main.async {
                    cell.movieImage.image = image
                }
            }
        }
        cell.movieTittleLabel.text = movieTopRatedArray?[indexPath.row].title
        cell.movieReleaseDateLabel.text = movieTopRatedArray?[indexPath.row].release_date
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventHandler?.pushDetailViewEvent(movie: movieTopRatedArray![indexPath.row])
    }
}


