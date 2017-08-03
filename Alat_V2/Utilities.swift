//
//  Utilities.swift
//  Zone
//
//  Created by Zone 3 on 5/22/17.
//  Copyright © 2017 Zone 3. All rights reserved.
//

import UIKit
import Contacts


class Utilities {

        static func getColorWithHexString(_ hex:String) -> UIColor{
        
        var cString:String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
        
    }

    
    static func alertMessage(_ targetControler: UIViewController,title: String, message: String,buttonTitle :String) {
        if let getModernAlert: AnyClass = NSClassFromString("UIAlertController") { // iOS 8
            let myAlert: UIAlertController = UIAlertController(title: title, message: message,preferredStyle: .alert)
            myAlert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
            targetControler.present(myAlert, animated: true, completion: nil)
        } else { // iOS 7
            let alert: UIAlertView = UIAlertView()
            alert.delegate = self
            alert.title = title
            alert.message = message
            alert.addButton(withTitle: buttonTitle)
            
            alert.show()
        }
    }
    
    
    
    
    class func retrieveContactsWithStore(store: CNContactStore, completion : ([CNContact])-> ()) {
        
        var contacts =  [CNContact]()

        let keysToFetch = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName), CNContactEmailAddressesKey, CNContactPhoneNumbersKey, CNContactImageDataKey] as [Any]
        var allContainers: [CNContainer] = []
        do {
            allContainers = try store.containers(matching: nil)
        } catch {
            print("Error fetching containers")
        }
        
        
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            
            do {
                let containerResults = try store.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                contacts.append(contentsOf: containerResults)
                completion(contacts)
            } catch {
                print("Error fetching results for container")
            }
        }
        
        
        
    }
    
    

}
