//
//  MyMusicCell.swift
//  MusicApp
//
//  Created by 이정동 on 2022/09/18.
//

import UIKit

class MyMusicCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var songNameLabel: UILabel!
    
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBOutlet weak var albumNameLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    // 이미지 설정을 위한 이미지 주소를 전달받음
    var imageUrl: String? {
        // imageUrl에 값이 할당되면 loadImage() 실행
        didSet{
            loadImage()
        }
    }
    
    // 셀이 재사용되기 전에 호출되는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
        // 일반적으로 이미지가 바뀌는 것처럼 보이는 현상을 없애기 위해서 실행 ⭐️
        self.mainImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        mainImageView.contentMode = .scaleToFill
    }
    
    // 이미지 다운
    private func loadImage() {
        guard let urlString = self.imageUrl, let url = URL(string: urlString) else {
            return
        }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.mainImageView.image = UIImage(data: data)
            }
        }
    }
    
}
