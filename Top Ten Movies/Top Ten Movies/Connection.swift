import UIKit

class Connection {
    static func request(parameters: [String : String], urlString: String, method: String, completation: @escaping (Data?, Error?) -> ()) {
        var urlRequest : String = urlString
        if parameters.count > 0 {
            for param in parameters {
                urlRequest += param.0 + "=" + param.1 + "&"
            }
            urlRequest = String(urlRequest.dropLast())
        }
        urlRequest = urlRequest.replacingOccurrences(of: " ", with: "%20")
        urlRequest = urlRequest.addingPercentEncoding(withAllowedCharacters: (CharacterSet.urlQueryAllowed))!
        var request = URLRequest(url: URL(string: urlRequest)!)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, resp, err) in
            DispatchQueue.global().async {
                if let httpResponse = resp as? HTTPURLResponse {
                    debugPrint(httpResponse)
                    switch httpResponse.statusCode {
                    case 200:
                        guard let data = data else { return }
                        completation(data, nil)
                    case 401, 404:
                        completation(nil, nil)
                    default:
                        break
                    }
                }
                if let err = err {
                    completation(nil, err)
                }
            }
        }.resume()
    }
}
