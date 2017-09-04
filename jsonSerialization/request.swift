// http://api.icndb.com/jokes/random

import UIKit
import Foundation
struct headers {
    var Accept: String
    var Accept_encoding: String
    var Accept_language: String
    init(haed : NSDictionary){
        Accept = haed.objectForKey("Accept") as! String
        Accept_encoding = haed.objectForKey("Accept-Encoding") as! String
        Accept_language = haed.objectForKey("Accept-Language") as! String
    }
}
class get: AnyObject {
    var origin: String
    var url: String
    var head: headers
    init(g: NSDictionary){
        origin = g.objectForKey("origin") as! String
        url = g.objectForKey("url") as! String
        head = headers(haed: g.objectForKey("headers") as! NSDictionary)
    }
    func pr(){
        print("origin = \(origin)")
        print("url = \(url)")
        print("Accept = \(head.Accept)")
        print("Encoding = \(head.Accept_encoding)")
        print("Language = \(head.Accept_language)")
        
    }
}
let uuu = NSURL(string: "https://httpbin.org/get")!
let ddd = NSData(contentsOfURL: uuu)
do{
    let di = try NSJSONSerialization.JSONObjectWithData(ddd!, options:NSJSONReadingOptions.AllowFragments) as! NSDictionary
    var answ = get(g: di)
    answ.pr()
    
}catch{
    print(error)
}
