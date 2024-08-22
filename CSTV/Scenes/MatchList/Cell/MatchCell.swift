import SnapKit
import UIKit

final class MatchCell: TableViewCell {
    // MARK: - Component(s).
    private lazy var bagdeView: UIView = {
        let view = UIView()
        view.backgroundColor = .highlight
        view.corner(radius: 16, corners: .bottomLeft)
        return view
    }()
    
    private lazy var bagdeText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8, weight: .bold)
        label.text = "AGORA"
        label.textColor = .white
        return label
    }()
    
    private lazy var firstTeamView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var firstTeamImage: UIView = {
        let view = UIView()
        return view
    }() 
    
    private lazy var firstTeamText: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var versusText: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var secondTeamView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var secondTeamImage: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var secondTeamText: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var separatorView  : UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var leagueImage: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var leagueText: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: - Initialization(s).
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Method(s).
    @discardableResult
    func configure(with model: String) -> Self {
        return self
    }
    
    private func buildLayout() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    private func buildViewHierarchy() {
        contentView.addSubviews(bagdeView)
        bagdeView.addSubview(bagdeText)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().offset(-12)
            $0.height.equalTo(150)
        }
        
        bagdeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(25)
        }
        
        bagdeText.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
    }
    
    private func configureViews() {
        backgroundColor = .background
        contentView.backgroundColor = .neutralColor01
        contentView.corner(radius: 16)
        selectionStyle = .none
    }
}
