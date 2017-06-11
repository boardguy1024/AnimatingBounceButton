
/*
 이건 다른 소스로부터 당신의 데이터를 겟팅할 것이다.
 This is where you will be getting your data from a different source.
 */

import UIKit

class Data {
    
    // 인스턴스를 생성하지 않아도 바로 사용할 수 있게 static 으로 선언해서 클래스메소드로 만들었다. 
    
    static func getData(completion: @escaping ([Model]) -> ()) {
        
        // 처리의 우선도를 userInteractive 로 설정
        DispatchQueue.global(qos: .userInteractive).async {
            // 파라메터로받은 모델의 배열을 초기화
            var data = [Model]()
            // 모델의 배열에 데이터를 셋팅함
            data.append(Model(title: "Title", subTitle: "Subtitle", image: nil, data1: "Data1", data2: "Data2"))
            // 모델의 배열에 2번째데이터를 셋팅함
            data.append(Model(title: "Title", subTitle: "Subtitle", image: nil, data1: "Data1", data2: "Data2"))
            
            // 모델의 배열에 데이터의 셋팅이 완료하면 (즉 겟데이터가 완료했으므로) 이제 비동기로 UI에 셋팅할 차례이므로 
            // 비동기로 컴플리션 메소드를 호출하는데 파라메터로 셋팅할 데이터를 넘긴다!
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
