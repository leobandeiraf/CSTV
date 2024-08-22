import SnapKit
import UIKit

final class MatchCell: TableViewCell {
    // MARK: - Component(s).
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .neutralColor01
        view.corner(radius: 16)
        return view
    }()

    private lazy var bagdeView: UIView = {
        let view = UIView()
        view.backgroundColor = .highlight
        view.corner(radius: 16, corners: .bottomLeft)
        return view
    }()
    
    private lazy var bagdeText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8, weight: .semibold)
        label.text = "AGORA"
        label.textColor = .white
        return label
    }()
    
    private lazy var teamsSection: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var firstTeamView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var firstTeamImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .neutralColor03
        imageView.corner(radius: 30)
        return imageView
    }()
    
    private lazy var firstTeamText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 2
        label.text = "Team 1"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var versusText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "VS"
        label.textAlignment = .center
        label.textColor = .neutralColor03
        return label
    }()
    
    private lazy var secondTeamView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var secondTeamImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .neutralColor03
        imageView.corner(radius: 30)
        return imageView
    }()
    
    private lazy var secondTeamText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 2
        label.text = "Team 2"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private lazy var leagueImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .neutralColor03
        imageView.corner(radius: 8)
        return imageView
    }()
    
    private lazy var leagueText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8, weight: .regular)
        label.text = "League + serie"
        label.textColor = .white
        return label
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
        contentView.addSubview(containerView)
        containerView.addSubviews(bagdeView, teamsSection, separatorView, leagueImage, leagueText)
        bagdeView.addSubview(bagdeText)
        teamsSection.addArrangedSubviews(firstTeamView, versusText, secondTeamView)
        firstTeamView.addSubviews(firstTeamImage, firstTeamText)
        secondTeamView.addSubviews(secondTeamImage, secondTeamText)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview()
        }
        
        bagdeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(25)
        }
        
        bagdeText.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
        
        teamsSection.snp.makeConstraints {
            $0.top.equalToSuperview().offset(42)
            $0.centerX.equalToSuperview()
        }
        
        firstTeamImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.size.equalTo(CGSize(width: 60, height: 60))
        }
        
        firstTeamText.snp.makeConstraints {
            $0.top.equalTo(firstTeamImage.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        secondTeamImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.size.equalTo(CGSize(width: 60, height: 60))
        }
        
        secondTeamText.snp.makeConstraints {
            $0.top.equalTo(secondTeamImage.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(teamsSection.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        leagueImage.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-8)
            $0.size.equalTo(CGSize(width: 16, height: 16))
        }
        
        leagueText.snp.makeConstraints {
            $0.centerY.equalTo(leagueImage)
            $0.leading.equalTo(leagueImage.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
    private func configureViews() {
        contentView.backgroundColor = .background
        selectionStyle = .none
    }
}
