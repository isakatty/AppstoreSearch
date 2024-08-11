//
//  AppDescriptionView.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/10/24.
//

import UIKit

import SnapKit

final class AppDescriptionView: BaseView {
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = .zero
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        label.text =
"""
대한민국에서 가장 빠른 길을 안내하는 카카오맵!\n가장 빠른 길찾기는 물론 맛집, 주변추천 등\n당신이 기대하는 길찾기의 모든 것을 만나보세요!\n\n► 빠른 길찾기가 필요한 순간!\n[가장 빠르고 정확한 지도]\n자동차/대중교통/도보/자전거 무엇을 이용하든 24시간 내에 업데이트 된 최신정보로 안내해요\n[바로 내비게이션 안내]\n별도의 설치 없이, 길찾기 후 카카오맵에서 바로 내비게이션 안내를 받아요\n[메뉴 이동 없는 통합검색]\n검색창 하나로 버스번호, 정류장, 장소 등 모든 정보를 한 번에 찾을 수 있어요\n\n► 주변 정보가 필요한 순간!\n[지금 당신을 위한 추천]\n당신의 현 위치를 기반으로 맛집/검색어/스팟/축제 등 유용한 정보를 추천해드려요\n[지도 위 영역 검색]\n지도 상에서 ‘이 지역 재검색’ 기능으로 바로 검색결과를 볼 수 있어요!\n[데이터가 알려주는 장소]\n방문자 빅데이터를 분석하여 장소에 대한 연령별/성별/요일별 정보를 알려드려요!\n\n► 더욱 전문적인 지도가 필요한 순간!\n[그룹으로 관리하는 나만의 즐겨찾기]\n그룹 형태로 즐겨찾기를 관리하고, 지도 위 표시는 물론 그룹 공유&구독까지 한번에!\n[미리 보는 로드뷰]\n길찾기 후 로드뷰로 장소 방문 전 미리 현장을 볼 수 있어요\n[실제 장소 같은 3D 지도]\n벡터 기반의 지도로 360º 회전, 기울이기가 가능한 3D뷰로 더욱 실감나는 지도를 제공해드려요\n[하늘에서 보는 실사3D 스카이뷰]\n입체적인 지도 검색이 필요할때 실사 3D 스카이뷰를 활용하세요\n\n► 그리고 당신의 길찾기를 위한 모든 부가기능\n- 지도 위에 바로 표시되는 즐겨찾기\n- 기다림을 줄여주는 실시간 버스 정보\n- 어느 길이 막히나 실시간 교통 정보\n- 지하철로 어디 갈 땐 지하철 노선도\n- 늦은밤 귀가할 땐 톡친구 위치공유 기능\n- 부산, 춘천, 목포, 울산, 제주, 광주 초정밀 버스위치정보 서비스\n\n► 카카오맵 자전거 내비게이션 이용 시 길안내와 데이터 기록을 위해 건강앱 데이터(운동, 사이클링 거리, 활동 에너지)와 연동합니다.\n\n여러분과 함께 진화하는 카카오맵은 언제든지 여러분의 목소리를 기다립니다. \n► 문의 창구\n- maps@kakaocorp.com\n- 카카오 고객센터 홈페이지(http://www.kakao.com/requests?locale=ko&service=59)\n- 고객센터: 1577-3321\n- 개발자 연락처: 1577-3754\n\n——\n► 서비스 접근 권한 안내\n[선택 접근 권한]\n- 위치 : 현 위치 기반 주변검색 및 길찾기 정보 제공\n- 마이크 : 음성으로 검색\n- 카메라 : 장소 리뷰 및 신고, 프로필 설정시 사진 촬영\n- 사진 : 장소 리뷰 및 신고, 프로필 설정시 사진 첨부\n- 알림 : 승하차알람, 위치공유알람, 추천알람 및 주요 공지 알림 수신\n\n* 선택 접근 권한은 동의하지 않아도 서비스 이용이 가능합니다.
"""
        return label
    }()
    
    override func configureHierarchy() {
        addSubview(descriptionLabel)
    }
    override func configureLayout() {
        super.configureLayout()
        
        descriptionLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }
    
    func configureUI() {
        
    }
}
