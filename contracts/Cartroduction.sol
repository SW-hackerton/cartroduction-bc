pragma solidity 0.5.16;
contract cartroduction {

    address deployer; //배포자 지갑 주소

    //차량 정비 정보
    struct maintenanceData {       
        uint256 userId;             //정비소 user id 
        //string user_name;         //혹은 정비소 명
        string managerName;        //정비사 명
        string date;                //날짜, 
        string carNumber;          //차량 번호
        uint256 carDistance;        //주행 거리
        string repairList;           //category, content, price
        string carImgUrl;           //차 이미지
        string estimatesImgUrl;   //견적서 이미지 url
    }

    mapping (string => maintenanceData[]) maintenanceList;  //차량번호별 정비 기록

    constructor() public { deployer=msg.sender; }


    //데이터 등록 함수
    function resistMaintenanceData( uint256 _userId, 
                                    string memory _managerName, 
                                    string memory _date, 
                                    string memory _carNumber,
                                    uint256 _carDistance,
                                    string memory _repairList,
                                    string memory _carImgUrl,
                                    string memory _estimatesImgUrl) public {
        require(msg.sender==deployer); //함수 호출자가 배포자가 아니라면 실행 X
        //필수 정보 
        require(bytes(_managerName).length != 0 ,"매니저 이름을 입력해주세요.");
        require(bytes(_date).length != 0 ,"날짜을 입력해주세요.");
        require(bytes(_carNumber).length != 0 ,"차량 번호를 입력해주세요.");
        require(_carDistance != 0 ,"주행 거리를 입력해주세요.");
        require(bytes(_estimatesImgUrl).length != 0 ,"견적서 이미지를 입력해주세요.");
        require(bytes(_repairList).length != 0 ,"정비 세부 정보를 입력해주세요.");

        maintenanceList[_carNumber].push(maintenanceData(_userId,
                                                        _managerName,
                                                        _date,
                                                        _carNumber,
                                                        _carDistance,
                                                        _repairList,
                                                        _carImgUrl,
                                                        _estimatesImgUrl
                                        ));
    }

    function getMaintenanceCount(string memory _carNumber) public view returns (uint256) {
        return maintenanceList[_carNumber].length;
    }

    function getMaintenance(string memory _carNumber, uint idx) public view returns (uint256,
                                                                                    string memory,
                                                                                    string memory,
                                                                                    uint256,
                                                                                    string memory,
                                                                                    string memory,
                                                                                    string memory){
        require(idx < maintenanceList[_carNumber].length, "조회할 정비 기록이 없어요.");

        return(maintenanceList[_carNumber][idx].userId,
                maintenanceList[_carNumber][idx].managerName,
                maintenanceList[_carNumber][idx].date,
                maintenanceList[_carNumber][idx].carDistance,
                maintenanceList[_carNumber][idx].repairList,
                maintenanceList[_carNumber][idx].carImgUrl,
                maintenanceList[_carNumber][idx].estimatesImgUrl
        );
    }
}