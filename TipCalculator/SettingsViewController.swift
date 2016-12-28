//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by George Ku on 12/27/16.
//  Copyright © 2016 George Ku. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        defaultControl.selectedSegmentIndex =
            defaults.integer(forKey: "tipInt")
    }
    
    @IBAction func setDefault(_ sender: Any) {
        let defaults = UserDefaults.standard
        let defaultTip = defaultControl.selectedSegmentIndex
        defaults.set(defaultTip, forKey: "tipInt")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
