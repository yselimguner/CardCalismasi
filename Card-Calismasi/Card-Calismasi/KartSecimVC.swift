//
//  ViewController.swift
//  Card-Calismasi
//
//  Created by Yavuz Güner on 10.10.2022.
//

import UIKit

class KartSecimVC: UIViewController {

    @IBOutlet weak var kartImageView: UIImageView!
    
    @IBOutlet var butonlar: [UIButton]!
    var kartlar : [UIImage] = Kartlar.butunKartlar
    var timer : Timer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for buton in butonlar {
            buton.layer.cornerRadius = 8
        }
        startTimer()
    }
    
    //Yan ekran açıldıında bunu yazmamız icap edecektir.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(rastgeleResimGoster), userInfo: nil, repeats: true)
    }
    @objc func rastgeleResimGoster(){
        kartImageView.image = kartlar.randomElement() ?? UIImage(named: "AS")
    }

    @IBAction func durButonTiklandi(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func resetButonTiklandi(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
