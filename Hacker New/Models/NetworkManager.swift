import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]() // watch by other object is changing data!
    
    func fetchData () {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            print(safeData)
                            let decodedData = try decoder.decode(PostData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = decodedData.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
