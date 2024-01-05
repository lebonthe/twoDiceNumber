//
//  ViewController.swift
//  twoDiceNumber
//
//  Created by Min Hu on 2024/1/5.
//

import UIKit

class ViewController: UIViewController {
    // 第一個骰子的 Image View
    @IBOutlet weak var dice1ImageView: UIImageView!
    
    // 第二個骰子的 Image View
    @IBOutlet weak var dice2ImageView: UIImageView!
    
    // 骰子 1 到 6 點的 SF Symbol 名稱
    let diceImages = [
        "die.face.1",
        "die.face.2",
        "die.face.3",
        "die.face.4",
        "die.face.5",
        "die.face.6"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 將 UserDefaults 中的 data1 儲存的點數作為骰子1 的點數
        let content1 = UserDefaults.standard.string(forKey: "data1")
        dice1ImageView.image = UIImage(systemName: content1 ?? "0")
        // 將 UserDefaults 中的 data2 儲存的點數作為骰子2 的點數
        let content2 = UserDefaults.standard.string(forKey: "data2")
        dice2ImageView.image = UIImage(systemName: content2 ?? "0")
    }
    // 擲骰子
    @IBAction func dice(_ sender: UIButton) {
        // 隨機取得 0...5 數字，更換 dice1ImageView 圖片
        let image1 = diceImages[Int.random(in: 0...5)]
        dice1ImageView.image = UIImage(systemName: image1)
        // 隨機取得 0...5 數字，，更換 dice2ImageView 圖片
        let image2 = diceImages[Int.random(in: 0...5)]
        dice2ImageView.image = UIImage(systemName: image2)
        
        // 將骰子的數字用 data1 作為 forKey 存到 UserDefaults 中
        UserDefaults.standard.set(image1, forKey: "data1")
        // 將骰子的數字用 data2 作為 forKey 存到 UserDefaults 中
        UserDefaults.standard.set(image2, forKey: "data2")
        print(UserDefaults.standard.string(forKey:"data1") ?? "無")
    }
}
