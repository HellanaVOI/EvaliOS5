import Foundation
import Alamofire

class NetworkService{
    
    static let shared = {
        NetworkService()
    }()
    
    let baseUrl = "https://store.steampowered.com/api/featured"
    
    
    func getTopTenWin(completionHandler: @escaping (_ list: listGame?) -> Void) {
        
        AF.request(baseUrl).response { dataResponse in
            
            switch dataResponse.result {
                
            case .success(let data):
                guard let data else { return }
                let decoder = JSONDecoder()
                do{
                    let list = try decoder.decode(listGame.self, from: data)
                    completionHandler(list)
                }catch{
                    print("Don't decode: \(error)")
                }
            case .failure(let error):
                print("ERROR: \(error)")
            }
            
        }
    }
}
