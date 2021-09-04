//
//  ViewController.swift
//  DeleteCell
//
//  Created by 池田光里 on 2021/09/03.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var table: UITableView!
    var models = [
        "卵",
        "牛乳",
        "トイレットペーパー",
        "ゴミ袋",
    ]
    
    var itemArray: [models] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        
        // ボタン作成
        let customButton = UIButton()

        // スクリーンサイズ取得
        let screenWidth:CGFloat = self.view.frame.width
        let screenHeight:CGFloat = self.view.frame.height

        // ボタンサイズ指定
        let buttonWidth: CGFloat = 70
        let buttonHeight: CGFloat = 70

        // ボタンに反映（中央に位置調整）
        customButton.frame = CGRect(
            x: screenWidth/1.4,
            y: screenHeight/1.2,
            width: buttonWidth,
            height: buttonHeight)

        // ボタンの背景色
        customButton.backgroundColor = UIColor.white

        // アプリ標準のシステム画像を設定
        customButton.setImage(UIImage(systemName: "plus"), for: .normal)
        // 画像の色をdarkGrayに変更
        customButton.tintColor = .darkGray

        // 縦幅・横幅いっぱいに画像を表示
        customButton.contentHorizontalAlignment = .fill
        customButton.contentVerticalAlignment = .fill

        // ボタンを丸くする(サイズ/2で設定)
        customButton.layer.cornerRadius = 35
        // 画像を縮小する(マージンのようなもの)
        customButton.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

        // 影の色
        customButton.layer.shadowColor = UIColor.black.cgColor
        // 影のぼかし
        customButton.layer.shadowRadius = 3
        // 影の位置
        customButton.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        // 影の濃さ
        customButton.layer.shadowOpacity = 0.3

        // ボタンをViewに追加
        view.addSubview(customButton)
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "アイテムを追加", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "リストに追加", style: .default) { (action) in
//            let _: models = DeleteCell.models(title: textField.text!)
//            self.models.append(newmodels)
//            self.tableView.reloadData()
            
        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "アイテム名"
            textField = alertTextField
        }

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            models.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

