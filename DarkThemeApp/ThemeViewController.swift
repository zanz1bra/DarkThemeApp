//
//  ThemeViewController.swift
//  DarkThemeApp
//
//  Created by erika.talberga on 19/10/2023.
//

import UIKit

class ThemeViewController: UIViewController {

    @IBOutlet weak var darkButton: UIButton!
    @IBOutlet weak var folderButton: UIBarButtonItem!
    @IBOutlet weak var trashButton: UIBarButtonItem!
// #warning("need to have IBOutlet another Item button and put on leading side")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ThemeViewController func viewDidLoad")
        darkButton.layer.cornerRadius = 10
    }

    @IBAction func darkButtonTapped(_ sender: Any) {
        print("darkButtonTapped")
        view.backgroundColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        darkButton.setTitle("Dark Theme off", for: .normal)
        darkButton.setTitleColor(UIColor.black, for: .normal)
        darkButton.tintColor = UIColor.white
        
        #warning("Dark Theme off : Dark Theme on")
    }
    
    @IBAction func folderTapped(_ sender: Any) {
        basicAlert2(title: "My Folder", message: "This is my item button!")
    }
//    #warning("Need to have IBAction for Item button and logic to present actionSheet")
    @IBAction func trashButtonTapped(_ sender: Any) {
        basicAlert(title: "Trash", message: "Are you sure?")
    }
    
}

extension UIViewController {
    
    func basicAlert(title: String?, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    func basicAlert2(title: String?, message: String?) {
        DispatchQueue.main.async {
            let alert2 = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            alert2.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            
            self.present(alert2, animated: true)
        }
    }
}
