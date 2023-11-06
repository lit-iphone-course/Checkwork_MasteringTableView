

//MARK: ①TableViewのdelegate,datasourceのコードを追加しよう
//MARK: ②ビルドした際に発生するエラー「Thread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value」を解決しよう
//MARK: ③TableViewのセルにデータを表示されていないので、ラベルにデータを表示させよう。ラベルの変数名はTableViewCell.swiftに書いてあるよ！
//MARK: ④TableViewに設置しているパーツが見えないので、セルのレイアウトを調整してみよう
//MARK: ⑤TableViewのセルをスワイプして削除できるようにしよう(応用)。スワイプ削除について調べてみよう！

import UIKit
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var vacationListTableView: UITableView!
    
    public var data = [
        VacationData(imagePath: "NewYork", destination: "NewYork", explanation: "Statue of Liberty,Times Square,Central Park"),
        VacationData(imagePath: "Taipei", destination: "Taipei", explanation: "Taipei 101,Shilin Night Market,Ximending"),
        VacationData(imagePath: "Pari", destination: "Pari", explanation: "Eiffel Tower,Palace of Versailles,Notre-Dame Cathedral"),
        VacationData(imagePath: "Seoul", destination: "Seoul", explanation: "Gyeongbokgung Palace,Dongdaemun Design Plaza,Jogyesa Temple:"),
        VacationData(imagePath: "Hawaii", destination: "Hawaii", explanation: "Waikiki Beach,Volcanoes National Park")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //デリゲートの処理はここに書こう
        self.vacationListTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
}

