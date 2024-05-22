package com.lec.sping.controller;

import com.lec.sping.domain.Address;
import com.lec.sping.domain.Authority;
import com.lec.sping.domain.User;
import com.lec.sping.domain.crew.Crew;
import com.lec.sping.domain.crew.CrewBoard;
import com.lec.sping.domain.crew.CrewManager;
import com.lec.sping.dto.ChangeCrewDto;
import com.lec.sping.dto.CreateCrewDto;
import com.lec.sping.dto.CrewBoardDto;
import com.lec.sping.dto.JoinAcceptDto;
import com.lec.sping.jwt.TokenProvider;
import com.lec.sping.service.AddressService;
import com.lec.sping.service.AuthService;
import com.lec.sping.service.CrewService;
import com.lec.sping.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/CR")
public class CrewController {

    private final UserService userService;
    private final TokenProvider tokenProvider;
    private final CrewService crewService;
    private final AddressService addressService;

    @CrossOrigin
    @PostMapping("/Create")
    public ResponseEntity<?> createCrew(@RequestHeader("Authorization") String authTokenHeader, @RequestBody CreateCrewDto crewDto){
        System.out.println("🛠️크루 생성 작업 요청 받음");
        System.out.println("🔎생성자 조회중...");
        String token = authTokenHeader.substring(7);
        User userData = userService.findByUserEmail(tokenProvider.parseClaims(token).getSubject());
        System.out.println("✅생성자 데이터 확인 완료");
        Crew createdCrew = crewService.createCrew(userData,crewDto);
        System.out.println("✅크루 생성 완료");
        System.out.println("🛠️ 크루 생성 관련 데이터 초기화중...");
        crewService.defaultCrewSet(createdCrew);
        return new ResponseEntity<>(createdCrew,HttpStatus.OK);
    }

    @CrossOrigin
    @PostMapping("/LoadCrewData")
    public ResponseEntity<?> loadCrewData(@RequestHeader("Authorization") String authTokenHeader, @RequestBody Long crewId){
        System.out.println("🛠️ 크루 데이터 호출 요청 받음");
        Crew crew = crewService.findById(crewId);
        System.out.println("✅ 크루 데이터 로드 완료");
        System.out.println(crew);
        return new ResponseEntity<>(crew,HttpStatus.OK);
    }

    @CrossOrigin
    @PostMapping("/ChangeAddress")
    public ResponseEntity<?> changeAddressData(@RequestHeader("Authorization") String authTokenHeader, @RequestBody ChangeCrewDto changeCrewData){
        System.out.println("🛠️ 크루 지역 데이터 수정 요청 받음");
        System.out.println("🔎 수정하려는 지역 조회중...");
        Address address = addressService.findByLocation(changeCrewData.getCrew_city(), changeCrewData.getCrew_town());
        System.out.println("✅ 지역 조회 완료");
        System.out.println("🔎 크루 데이터 수정 작업 중...");
        Crew crew = crewService.updateLoction(changeCrewData, address);
        System.out.println("✅ 크루 데이터 수정 완료");
        return new ResponseEntity<>(crew,HttpStatus.OK);
    }

    @CrossOrigin
    @PostMapping("ChangeContext")
    public ResponseEntity<?> changeContext(@RequestHeader("Authorization") String authTokenHeader, @RequestBody ChangeCrewDto changeCrewData){
        System.out.println("🛠️ 크루 인사말 수정 요청 받음 ");
        System.out.println("🔎 수정하려는 크루 데이터 조회중...");
        Crew crew = crewService.findById(changeCrewData.getCrew_id());
        System.out.println("✅ 크루 데이터 조회 완료");
        System.out.println("🛠️ 데이터 수정 중...");
        crew.setCrew_context(changeCrewData.getCrew_context());
        System.out.println("✅ 크루 데이터 수정 완료");
        return new ResponseEntity<>(crewService.save(crew),HttpStatus.OK);
    }

    @CrossOrigin
    @PostMapping("GetCrewMember")
    public ResponseEntity<?> getCrewMembers(@RequestHeader("Authorization") String authTokenHeader, @RequestBody Long crewId){
        System.out.println("🛠️ 크루 멤버 호출 요청 받음");
        System.out.println("🔎 크루 멤버 조회중...");
        List<CrewManager> resultData = crewService.getCrewMember(crewId);
        System.out.println("✅ 크루 멤버 조회 완료");
        return new ResponseEntity<>(resultData,HttpStatus.OK);
    }

    @CrossOrigin
    @GetMapping("CrewAllData")
    public ResponseEntity<?> findAllCrew(){
        System.out.println("🛠️ 모든 크루 리스트 호출 요청 받음");
        System.out.println("🔎 크루 리스트 조회중...");
        List<Crew> crewList = crewService.findAllCrew();
        System.out.println("✅ 크루 리스트 조회 완료");
        return new ResponseEntity<>(crewList,HttpStatus.OK);
    }

    @CrossOrigin
    @PostMapping("RequestCrewJoin")
    public ResponseEntity<?> requestCrewJoin(@RequestHeader("Authorization") String authTokenHeader, @RequestBody Long crewId){
        System.out.println("🛠️ 크루 가입 신청 요청 받음");
        String token = authTokenHeader.substring(7);
        crewService.requestJoinCrew(crewId, tokenProvider.parseClaims(token).getSubject());
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @CrossOrigin
    @PostMapping("RequestJoinAccept")
    public ResponseEntity<?> requestJoinAccept(@RequestHeader("Authorization") String authTokenHeader, @RequestBody JoinAcceptDto joinAcceptDto){
        System.out.println("🛠️ 크루 가입 신청 수락 요청 받음");
        crewService.requestJoinAccept(joinAcceptDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @CrossOrigin
    @PostMapping("RequestJoinRefuse")
    public ResponseEntity<?> requestJoinRefuse(@RequestHeader("Authorization") String authTokenHeader, @RequestBody JoinAcceptDto joinAcceotDto){
        System.out.println("🛠️ 크루 가입 신청 거절 요청 받음");
        crewService.requestJoinRefuse(joinAcceotDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @CrossOrigin
    @PostMapping("RequestWriteBoard")
    public ResponseEntity<?> createWriteCrewBoard(@RequestHeader("Authorization") String authTokenHeader, @RequestBody CrewBoardDto crewBoardDto){
        System.out.println("🛠️ 크루 게시판 작성 요청 받음");
        String token = authTokenHeader.substring(7);
        crewService.writeBoard(crewBoardDto,tokenProvider.parseClaims(token).getSubject());

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @CrossOrigin
    @GetMapping("LoadCrewBoard")
    public ResponseEntity<?> responseEntity(@RequestHeader("Authorization") String authTokenHeader){
        System.out.println("🛠️ 크루 게시글 목록 요청 받음");
        String token = authTokenHeader.substring(7);
        List<CrewBoard> crewBoardList = crewService.getCrewBoard(tokenProvider.parseClaims(token).getSubject());
        return new ResponseEntity<>(crewBoardList,HttpStatus.OK);
    }

    // 🔎 크루 게시글 조회
    @CrossOrigin
    @GetMapping("BoardDetail/board")
    public ResponseEntity<?> loadBoardDetail(@RequestParam Long boardId){
        System.out.println("🛠️ 크루 게시글 조회 요청 받음");
        CrewBoard resultBoard = crewService.getCrewBoardDetail(boardId);
        return new ResponseEntity<>(resultBoard,HttpStatus.OK);
    }
}
