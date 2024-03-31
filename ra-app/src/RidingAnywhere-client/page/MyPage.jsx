import React, { useEffect, useState } from 'react';
import DefaultHeader from '../component/DefaultHeader_main';
import DefaultFooter from '../component/DefaultFooter';
import BikeInfoBox from '../component/mypage/BikeInfoBox';
import "../css/mypage.css"
import { useNavigate } from 'react-router-dom';

const MyPage = () => {

    const navigate = useNavigate();

     // 🪙 토큰 확인
     const [accessToken] = useState(!sessionStorage.getItem('accessToken'))

    // 😎 라이더 정보
     const [riderInfo, setriderInfo] = useState({
        userEmail : "",
        userName : "",
        userNickname : "",
        userBirthday : "",
        userGender : "",
        userPhone : "",
     })

    // 🤝 크루 정보
    const [crewInfo, setcrewInfo] = useState({})

    useEffect(()=>{
        checkData();
        resetBtnAct();
    },[])

     // ✏️ 토큰으로 라이더 정보 가져오기
     const checkData = async () => {
        console.log("🛜라이더 엑세스 체크 중...")
        if(!accessToken){
            console.log("✅접속자에게 엑세스 있음!")
            console.log("🛜라이더 데이터 확인 중...")
            await fetch("/RA/CheckRider",
            {headers:{
                "Authorization": `Bearer ${sessionStorage.getItem('accessToken')}`,
                "Content-Type": "application/json;charset=utf-8"}})
            .then(response => {
                if(response.status===200) return response.json();
                else console.log("⛔ 라이더 데이터 수집 실패!");
            }).then(data => {
                console.log("✅라이더 데이터 수집 완료!");
                let userData = data.userData;
                setriderInfo({...riderInfo,
                    userEmail : userData.userEmail,
                    userName : userData.userName,
                    userNickname : userData.userNickname,
                    userBirthday : userData.userBirthday,
                    userGender : userData.userGender,
                    userPhone : userData.userPhone
                });
                setprofile('data:image/png;base64,'+userData.userProfile);
                if(data.bikeList.length===0){
                    console.log("⛔ 바이크 저장 이력 없음")
                    alert("⚠️입력된 바이크 정보가 없습니다.⚠️\n - 바이크 추가 페이지로 이동합니다. - ")
                    console.log("🛠️ 바이크 추가 페이지로 이동")
                    navigate("/RA/Addbike");
                }
                else {
                    setbikeInfo(data.bikeList.map((data,index)=>{
                        const bikeData = {
                            bike_index:index,
                            bike_year:data.bike_year,
                            bike_cc:data.bikeModel.model_cc,
                            bike_select:data.bike_select,
                            model_name:data.bikeModel.model_name,
                            bikebrand_logo:data.bikeModel.bikebrand_id.bikebrand_logo,
                        }
                        return bikeData
                    }))
                    console.log("바이크 데이터 수집 완료")}
            })
        } else {
            console.log("⛔ 접속자에게 엑세스 없음");
            alert("⚠️로그인이 필요합니다.⚠️\n - 로그인 페이지로 이동합니다. - ")
            console.log("🛠️ 로그인 페이지로 이동")
            navigate("/RA/login");
        }
        
    }

    // 📷 프로필 이미지 관련 라인
    const [profile,setprofile] = useState(null)
    const profileimg = data => {
       const imagefile = data.target.files[0];
       const imageUrl = URL.createObjectURL(imagefile);
       setprofile(imageUrl);
       console.log(imagefile)
       updateImg(imagefile);
   }

   const updateImg = async (data) => {
        console.log("🛜변경 내용 서버로 전달...")
        const imgData = new FormData()
        imgData.append('file',data);
       await fetch("/RA/UpdateImage",
       {   
        method: "POST",
        headers:{
            "Authorization": `Bearer ${sessionStorage.getItem('accessToken')}`},
        body:imgData
    }).then(response=>{
        console.log("✅요청 수신 완료!");
        console.log(response);
        console.log("✅ 이미지 변경이 완료 되었습니다.")
        if(response.status===200) return response.json();
    }).then(data=>{
        console.log(data)
    }).catch(error=>{
        console.log(error);
    })
   }
    
    // 🛠️ 수정되는 라이더 정보
    const [updateRider, setUpdateRider] = useState({
        userEmail : "",
        userNickname : "",
        userName : "",
        userPhone : "",
        userBirthday : "",
        userGender : false
     })

    // 🛠️ 라이더 정보 수정
    const [changeBtnAct, setchangeBtn] = useState("/img/mypage/ChangeBtn.png"); // 수정, 취소 버튼 설정 변수
    const [updateBtnAct, setcheckBtn] = useState({});     // 저장On, 저장Off, 불가 버튼 설정 변수

     // 🛠️ 라이더 정보 리셋
    const resetBtnAct = () => {
        setcheckBtn({
            userNickname:"/img/mypage/SaveBtnOff.png",
            userName:"/img/mypage/SaveBtnOff.png",
            userPhone:"/img/mypage/SaveBtnOff.png",
            userBirthday:"/img/mypage/SaveBtnOff.png",
            userGender:"/img/mypage/SaveBtnOff.png"
        })
    }

    // 프로필 수정 관련 태크 출력 설정 변수
    const [showinput, setinput] = useState(false)       
    const profileControl = () => {
        switch(changeBtnAct){

            // ✏️ 라이더 정보 수정 시작
            case "/img/mypage/ChangeBtn.png" : 
                console.log("🛠️개인정보 수정 중...");
                setinput(true)
                reSetData();
                resetBtnAct();
                setchangeBtn("/img/mypage/CancelBtn.png");
                break;

             // ✏️ 라이더 정보 수정 취소
            case "/img/mypage/CancelBtn.png" : 
                console.log("❌개인정보 수정 취소!");
                setinput(false)
                setchangeBtn("/img/mypage/ChangeBtn.png");
                break;
            default :
        }
    }

    const checkUpdata = (line) => {
        console.log("✏️ 변경 내용 체크 중...");
        switch(updateBtnAct[line.target.name]){
            // ✏️ 라이더 정보 수정 불가
            case "/img/mypage/DeniedBtn.png" :
                console.log("❌변경 불가판정!")
                alert("❌변경 내용이 적절하지 않습니다!")
                break;

            // ✏️ 라이더 정보 수정 가능
            case "/img/mypage/SaveBtnOn.png" :
                console.log("✅검수 완료!")
                riderDataUpdate(line.target.name);
                break;

            // ✏️ 라이더 정보 수정 사항 없음
            case "/img/mypage/SaveBtnOff.png" :
                console.log("⚠️수정 사항 없음!")
                alert("⚠️수정되지 않았습니다.")
                break;
            default :
        }
    }

    // ✏️ 변경된 유저데이터 서버로 전송
    const riderDataUpdate = async (update) => {
        console.log("🛜변경 내용 서버로 전달...")
        let requsetData = {
            ...riderInfo,[update]:updateRider[update]
        }
        console.log(requsetData);
        await fetch("/RA/UpdateUser",
            {   
                method: "POST",
                headers:{
                "Authorization": `Bearer ${sessionStorage.getItem('accessToken')}`,
                "Content-Type": "application/json;charset=utf-8"},
                body:JSON.stringify(requsetData)
            })
                .then(response=>{
                    console.log("✅변경 내용 수신 완료")
                    if(response.status===200)return response.json();
                    else console.log("❌ 데이터 수정 실패!")
                }).then(()=>{
                    console.log("✅데이터 변경 완료!");
                    console.log("🛜유저 데이터 재호출!");
                    checkData();
                    if(update!=="userGender") document.getElementById([update]).value = "";
                    setcheckBtn({...updateBtnAct,[update]:"/img/mypage/SaveBtnOff.png"});
                })
    }


    // ✏️ 수정 시 모든 업데이트 데이터 초기화
    const reSetData = () => {
        setUpdateRider(riderInfo);
        document.getElementById('userName').value = "";
        document.getElementById('userNickname').value = "";
        document.getElementById('userBirthday').value = "";
        document.getElementById('userPhone').value = "";
    }

    // ✏️ 라이더 정보 관련 정규표현식 데이터
    const mapRegExp = {
        "userNickname" : new RegExp('^([A-Za-z\\d\\uAC00-\\uD7A3\\u3131-\\u314E]){1,8}$'),
        "userName" : new RegExp('^([가-힣]){3,4}$'),
        "userPhone" : new RegExp('^(010+[\\d]{8,8})$'),
        "userBirthday" : new RegExp('^([\\d]){8,8}$')
    };

    // 🛠️ 수정하는 데이터 입력 받기
    const insertData = (inputData) => {
        let key = inputData.target.name;
        let value = inputData.target.value;
        setUpdateRider({...updateRider,[key]:value});
        if(value===riderInfo[key]) setcheckBtn({...updateBtnAct,[key]:"/img/mypage/SaveBtnOff.png"});
        else if(mapRegExp[key].test(value)) setcheckBtn({...updateBtnAct,[key]:"/img/mypage/SaveBtnOn.png"});
        else setcheckBtn({...updateBtnAct,[key]:"/img/mypage/DeniedBtn.png"});
    }

    // 🛠️ 성별 데이터 설정하기
    const insertGender = (genderBtn) => {
        let data = genderBtn.target.value==='true'
        setUpdateRider({...updateRider,userGender:data});
        if(data===riderInfo.userGender) setcheckBtn({...updateBtnAct,userGender:"/img/mypage/SaveBtnOff.png"});
        else setcheckBtn({...updateBtnAct,userGender:"/img/mypage/SaveBtnOn.png"});
    }

    // 🏍️ 오토바이 정보
    const [bikeInfo, setbikeInfo] = useState()

    // 🛠️ 바이크 관련 정보 설정 범위
    const [showBike,setShowBike] = useState(0)
    const bikeControl = (btn) => {
        if(btn.target.id==="showBikeUp") bikeInfo.length-1>=showBike+1&&setShowBike(showBike+1);
        else showBike-1>=0&&setShowBike(showBike-1);
    }


    return (
        <main>
            <DefaultHeader/>
            <section className='myPage'>

                <div className='page_tile'>
                    <h1>마이 페이지</h1>
                </div>
                <div className='myInfoLine'>
                    {/* ✏️ 라이더 프로필 범위 */}
                    <div className='profile'>
                        <div className='profile_top'>
                            <h1>프로필</h1>
                            <div className='profile_changeLine'>
                                {/* 수정, 취소 버튼 라인 */}
                                <label id='profile_changeLine' htmlFor='profile_changebtn'><img src={changeBtnAct} alt=''></img></label>
                                <input type='button' className='profile_changebtn' id='profile_changebtn' style={{display:'none'}} onClick={profileControl}/>
                            </div>
                        </div>
                        <div className='profile_seccsion'>
                            <div className='profile_img'>
                                <div id='profile_img'>
                                    <img src={profile===null?'/img/mypage/DefaultProfileImg.png':profile} alt=''/>
                                </div>
                                <label id='prfile_btnLline' htmlFor="profilebtn" style={showinput?{display:'block'}:{display:'none'}}><h3>이미지 변경</h3></label>
                                <input className='profile_btn' type='file' id="profilebtn" style={{display:'none'}} accept='.jpg, .png' onChange={profileimg}/>
                                <h4 style={showinput?{display:'block'}:{display:'none'}}>⚠️크기 : 200px x 200px</h4>
                            </div>
                            <div className='riderInfo'>
                                <table>
                                    <tbody>
                                    <tr>
                                        <td><h2>이메일</h2></td>
                                        <td><h2>{riderInfo.userEmail}</h2></td>
                                    </tr>
                                    <tr>
                                        <td><h2>닉네임</h2></td>
                                        <td style={showinput?{display:'none'}:{display:'table-cell'}} className='profile_inputLine'><h2>{riderInfo.userNickname}</h2></td>
                                        <td style={showinput?{display:'table-cell'}:{display:'none'}} className='profile_inputLine'><input className='profile_text' name='userNickname' id='userNickname' placeholder={riderInfo.userNickname} type='text' onChange={insertData}/></td>
                                        <td className='saveBtn_Line'><label style={showinput?{display:'table-cell'}:{display:'none'}} htmlFor='save_userNickname'><img src={updateBtnAct.userNickname} alt=''></img></label><input id='save_userNickname' name='userNickname' type='button' onClick={checkUpdata} style={{display:'none'}}/></td>
                                    </tr>
                                    <tr>
                                        <td><h2>이름</h2></td>
                                        <td style={showinput?{display:'none'}:{display:'table-cell'}} className='profile_inputLine'><h2>{riderInfo.userName}</h2></td>
                                        <td style={showinput?{display:'table-cell'}:{display:'none'}} className='profile_inputLine'><input className='profile_text' name='userName' id='userName' placeholder={riderInfo.userName} type='text' onChange={insertData}/></td>
                                        <td className='saveBtn_Line'><label style={showinput?{display:'table-cell'}:{display:'none'}} htmlFor='save_userName'><img src={updateBtnAct.userName} alt=''></img></label><input id='save_userName' name='userName' type='button' onClick={checkUpdata} style={{display:'none'}}/></td>
                                    </tr>
                                    <tr>
                                        <td><h2>연락처</h2></td>
                                        <td style={showinput?{display:'none'}:{display:'table-cell'}} className='profile_inputLine'><h2>{riderInfo.userPhone}</h2></td>
                                        <td style={showinput?{display:'table-cell'}:{display:'none'}} className='profile_inputLine'><input className='profile_text' name='userPhone' id='userPhone' placeholder={riderInfo.userPhone} type='text' maxLength={11} onChange={insertData}/></td>
                                        <td className='saveBtn_Line'><label style={showinput?{display:'table-cell'}:{display:'none'}} htmlFor='save_userPhone'><img src={updateBtnAct.userPhone} alt=''></img></label><input id='save_userPhone' name='userPhone' type='button' onClick={checkUpdata} style={{display:'none'}}/></td>
                                    </tr>
                                    <tr>
                                        <td><h2>생일</h2></td>
                                        <td style={showinput?{display:'none'}:{display:'table-cell'}} className='profile_inputLine'><h2>{riderInfo.userBirthday}</h2></td>
                                        <td style={showinput?{display:'table-cell'}:{display:'none'}} className='profile_inputLine'><input name='userBirthday' id='userBirthday' placeholder={riderInfo.userBirthday} type='text' maxLength={8} onChange={insertData}/></td>
                                        <td className='saveBtn_Line'><label style={showinput?{display:'table-cell'}:{display:'none'}} htmlFor='save_userBirthday'><img src={updateBtnAct.userBirthday} alt=''></img></label><input id='save_userBirthday' name='userBirthday' type='button' onClick={checkUpdata} style={{display:'none'}}/></td>
                                    </tr>
                                    <tr>
                                        <td><h2>성별</h2></td>
                                        <td style={showinput?{display:'none'}:{display:'table-cell'}} className='profile_inputLine'><h2>{riderInfo.userGender?"여성 ♀️":"남성 ♂️"}</h2></td>
                                        <td style={showinput?{display:'flex'}:{display:'none'}} className='profile_inputLine' name='changeGender'>
                                            <input id='gender1' name='genderBtn' type='radio' value={false} style={{display:'none'}} onClick={insertGender} defaultChecked={!updateRider.userGender}/>
                                            <label htmlFor='gender1'><h3>남자 ♂️</h3></label>
                                            <input id='gender2' name='genderBtn' type='radio' value={true} style={{display:'none'}}  onClick={insertGender} defaultChecked={updateRider.userGender}/>    
                                            <label htmlFor='gender2'><h3>여자 ♀️</h3></label> 
                                        </td>
                                        <td className='saveBtn_Line'><label style={showinput?{display:'table-cell'}:{display:'none'}} htmlFor='save_userGender'><img src={updateBtnAct.userGender} alt=''></img></label><input id='save_userGender' name='userGender' type='button' onClick={checkUpdata} style={{display:'none'}}/></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    {/* ✏️ 크루 및 바이크 범위*/}
                    <div className='bikeData'>
                        <div className='bikeLine'>
                            <h1>바이크</h1>
                            <div className='bikeInfo'>
                                <label className='showBikeBtn' name="Down" htmlFor='showBikeDown'></label>
                                <input type='button' id='showBikeDown' onClick={bikeControl}/>
                                <div className='bikeInfoLine'>
                                    {!!bikeInfo&&bikeInfo.map((bikeData) => <BikeInfoBox key={bikeData.bike_index} showBikeIndex={showBike} data={bikeData}/>)}
                                </div>
                                <label className='showBikeBtn' name="Up" htmlFor='showBikeUp'></label>
                                <input type='button' id='showBikeUp' onClick={bikeControl}/>
                            </div>
                            <div className='bikeInfo_btnLine'>
                                <input type='button'/>
                                <input type='button'/>
                                <input type='button'/>
                            </div>
                        </div>
                        <div className='crewLine'>
                            <h1>크루</h1>
                        </div>
                    </div>
                </div>
            </section>
            <DefaultFooter/>
        </main>
    );
};

export default MyPage;