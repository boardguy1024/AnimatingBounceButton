
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuView: UIViewX!
    
    var tableData: [Model] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        // 테이블뷰의 데이터셋팅은 뷰콘에서 하는게 아니라 Data.swift 에서 행한다.
        // 겟데이터를 호출하고 겟데이터 처리가 완료하면 여기에 클로저(콜백함수) 내용을 실행한다
        Data.getData { (data) in
            // tableData 모델의 배열에 파라메터로 받은 데이터를 셋팅한다
            self.tableData = data
            // tavbleView 리로드를 하면 아래의 프로토콜함수가 호출이되므로
            // tableData에 들어있는 내용으로 reLoad 된다.
            self.tableView.reloadData()
        }
        //デフォルトとしてmenuViewのサイズを小さくしておく
        closeMenu()
    }
    
    @IBAction func menuBtnTapped(_ sender: FloatinActionButton) {
        UIView.animate(withDuration: 0.3) { 
            
            if self.menuView.transform == .identity {
                
                self.closeMenu()
                
            } else {
                self.menuView.transform = .identity
            }
        }
       
        
    }
    
    func closeMenu() {
        menuView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
    }
}

// 뷰콘에 프로토콜지향으로  UITableViewDataSource 프로토콜을 확장시키고 실장시킨다.
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        //
        cell.setup(model: tableData[indexPath.row])
        return cell
    }
}
