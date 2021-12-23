import UIKit

class MovieTableViewCell: UITableViewCell {
    static let cellID = "MovieTableViewCell"

    var movieImage: UIImageView!
    var movieTittleLabel: UILabel!
    var movieReleaseDateLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            backgroundColor = .clear
            selectionStyle = .none
        movieImage = UIImageView()
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(movieImage)
        movieImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        movieImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        movieImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        movieTittleLabel = UILabel()
        movieTittleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTittleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        movieTittleLabel.textAlignment = .left
        movieTittleLabel.numberOfLines = 0
        movieTittleLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(movieTittleLabel)
        movieTittleLabel.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: 10).isActive = true
        movieTittleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        movieTittleLabel.topAnchor.constraint(equalTo: movieImage.topAnchor).isActive = true
        
        movieReleaseDateLabel = UILabel()
        movieReleaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        movieReleaseDateLabel.font = UIFont(name: "HelveticaNeue", size: 15)
        movieReleaseDateLabel.textAlignment = .left
        movieReleaseDateLabel.numberOfLines = 0
        movieReleaseDateLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(movieReleaseDateLabel)
        movieReleaseDateLabel.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: 10).isActive = true
        movieReleaseDateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        movieReleaseDateLabel.topAnchor.constraint(equalTo: movieTittleLabel.bottomAnchor, constant: 5).isActive = true
    }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

}
