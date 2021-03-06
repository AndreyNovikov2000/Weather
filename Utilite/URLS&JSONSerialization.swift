/*

let urlString = URL(string: url)!
    
    let session = URLSession.shared
    session.downloadTask(with: urlString) { (location, response, error) in
        if let error = error {
            print(error.localizedDescription)
        }
        
        let weatherData = try! Data.init(contentsOf: urlString)
        let weatherJSON = try! JSONSerialization.jsonObject(with: weatherData, options: [])
        let jsonDictinary = weatherJSON as! NSDictionary
        
        let weather = OpenWeatherMap(weatherJson: jsonDictinary)
        print("let nameCity = ", weather.nameCity)
        print("let temp = ", weather.temp)
        print("let description = ", weather.description)
        print("let currentTime =", weather.currentTime)
        print("let icon = ", weather.icon)
        
        DispatchQueue.main.async {
            self.imageView.image = weather.getWetherIcon(stringIcon: weather.icon)
        }
        
        
    }.resume()
}
 
 
 struct OpenWeatherMap {
 let nameCity: String
 let temp: Double
 let description: String
 let currentTime: Int
 let icon: String
 
 var delegate: OpenWeatherMapDelegate!
 
 init(weatherJson: NSDictionary) {
     nameCity = weatherJson["name"] as? String ?? ""
     
     let mainWeatherJSON = weatherJson["main"] as? [String: AnyObject]
     temp = mainWeatherJSON?["temp"] as? Double ?? 1.0
     
     let weather = weatherJson["weather"] as? [[String: AnyObject]]
     let firstIndexOfWeather = weather?[0]
     description = firstIndexOfWeather?["description"] as? String ?? ""
     
     currentTime = weatherJson["dt"] as? Int ?? 0
     
     icon = firstIndexOfWeather?["icon"] as? String ?? ""
 }

 */


// MARK: - Final URL and request

/*
let url = "https://api.openweathermap.org/data/2.5/weather?q=Almaty,forecast?id=524901&appid=5ad2283b07a684c9b4541b10d1739494"
override func viewDidLoad() {
    super.viewDidLoad()
    
   
    URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
        if let error = error {
            print(error)
        }
    
        
        let JSON = try! JSONSerialization.jsonObject(with: data!, options: [])
        let dictionaryJSON = JSON as! NSDictionary
        
        if let cityName = dictionaryJSON["name"] as? String {
            print("city -> ", cityName)
        }
        
        if let weather = dictionaryJSON["weather"] as? [[String: AnyObject]] {
            if let main = weather[0]["main"] as? String {
                print("main -> ", main)
            }
        }
    }.resume()
*/




/*
 //    func fetchDataWithObject<T>(urlString: String, complitionHeandler: @escaping ((T?) -> Void)) -> Void where T: OpenWeatherMap {
 //        guard let url = URL(string: urlString) else { return }
 //
 //        networkService.request(url: url) { (data, error) in
 //            if let error = error {
 //                print(error.localizedDescription)
 //                complitionHeandler(nil)
 //                return
 //            }
 //
 //            guard let data = data else { return }
 //
 //            do {
 //                let weather = try JSONDecoder().decode(T.self, from: data)
 //                complitionHeandler(weather)
 //
 //            } catch let error {
 //                print(error.localizedDescription)
 //            }
 //        }
 //    }
 */



/*
https://api.openweathermap.org/data/2.5/weather?q=Almaty,forecast?id=524901&appid=5ad2283b07a684c9b4541b10d1739494 //requesting name
https://api.openweathermap.org/data/2.5/weather?lat=76.95&lon=43.25&appid=5ad2283b07a684c9b4541b10d1739494 // requesting lat lon

https://api.openweathermap.org/data/2.5/forecast?q=Almaty&appid=5ad2283b07a684c9b4541b10d1739494 // requesting name for 5 days every 3 hour
https://api.openweathermap.org/data/2.5/forecast?lat=76.95&lon=43.25&appid=5ad2283b07a684c9b4541b10d1739494 // requesting lat lon for 5 days every 3 hour
*/
