//
//  ViewController.swift
//  Task of Image Api 1
//
//  Created by Naved Khan on 12/05/23.
//

import UIKit
import Alamofire
//import AlamofireImage
import Kingfisher
//import SDWebImage


class ViewController: UIViewController {
    
    @IBOutlet weak var barSearch: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchApi()
        barSearch.delegate = self
    }
    
    //    MARK:- Pexel
    let headers : HTTPHeaders = ["authorization" : " bKZg25Zinj2SSXmMMPML3v8MXCzPdRIygh5XeJRXkftDG7oRlAJ7OFzj"] // pexel
    
    var d : [singleArrayBody]? = nil
    var f = [Int]()
}
extension ViewController{
    func fetchApi()
    {
        //        let url = "https://api.pexels.com/v1/search?query=nature&per_page=1"
        //        let url = "https://api.pexels.com/videos/search?query=nature&per_page=1"
        let url = "https://api.opendota.com/api/heroStats"
        
//        AF.request(url).responseJSON{ response in
//            switch response.result{
//            case .success :
//                let blogPost: BlogPost = try! JSONDecoder().decode(BlogPost.self, from: jsonData)
//                print(response.value!)
//            case .failure :
//                print(response.error!)
//            }
//        }
        AF.request(url).responseDecodable(of: [singleArrayBody].self ){
            response in
            guard let data = response.value else {
                print("fail",response.error!)
                return
            }
          print(response)
            DispatchQueue.main.async {
                self.d = data
                self.myTableView.reloadData()
            }
        }
    }
    
}


extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if f.isEmpty
        {
            return d?.count ?? 0
        }
        return f.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        let ind = f.isEmpty ? indexPath.row : f[indexPath.row]
        var image = String()
        image = "https://api.opendota.com" + (d?[ind].img ?? "")
        
        //        MARK:- AlamofireImage
        //        slow
        //        cell.myImage.af.setImage(withURL: URL(string: image )!)
        //        cell.imageIcon.af.setImage(withURL: URL(string: "https://api.opendota.com" + (d?[ind].icon ?? "") )!)
        
        
        //        MARK:- Kingfisher
        //        slow first then fast
        
        cell.myImage.kf.setImage(with: URL(string: image))
        cell.imageIcon.kf.setImage(with: URL(string: "https://api.opendota.com" + (d?[ind].icon ?? "") )!)
        
        //        MARK:- SDWebImage
        //        slow first then fast
        //        cell.myImage.sd_setImage(with: URL(string: image )!)
        //        cell.imageIcon.sd_setImage(with: URL(string: "https://api.opendota.com" + (d?[ind].icon ?? "" )!))
        
        let pattern = d?[ind]
        cell.label1.text = pattern?.localizedName
        var str = ""
        str += pattern?.roles.joined(separator: ", ") ?? ""
        cell.label2.text =  str
        let str1 = pattern!.attackType
        cell.label3.text = (str1.prefix(1).capitalized)  + (str1[str1.index(after: str1.startIndex)...])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension ViewController : UISearchBarDelegate
{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        f.removeAll()
        if barSearch.text! != ""
        {
        let str = (barSearch.text!.prefix(1).capitalized)  + (barSearch.text![barSearch.text!.index(after: barSearch.text!.startIndex)...]).lowercased()
        if let secondMatch = d?.firstIndex(where: {$0.localizedName == str
        } )
        {
            f.removeAll()
            f.append(secondMatch)
        }
        else{
            for (i,v) in d!.enumerated(){
                
                    
                    if( v.localizedName.starts(with: str) || v.attackType == str )
                        && str != ""
                    {
                        if !f.contains(i)
                        {
                            f.append(i)
                        }
                    }
                    if  (v.roles.firstIndex(where: { $0 == str }) != nil)
                    {
                        if !f.contains(i)
                        {
                            f.append(i)
                        }
                    }
            }
        }
        }
        if f.isEmpty && barSearch.text != ""{
            let alert = UIAlertController(title: "No Hero Available", message: "Type Other Name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        print(f)
        print(barSearch.text!.lowercased())
        myTableView.reloadData()
    }
}


