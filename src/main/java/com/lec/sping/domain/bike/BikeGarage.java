package com.lec.sping.domain.bike;

import com.lec.sping.domain.User;
import com.lec.sping.repository.LoginRepository;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@NoArgsConstructor
@Data
@Entity
public class BikeGarage {

    @EmbeddedId
    private BikeGarageKey bikegarage_id;          // 내 바이크 Id

    private LocalDate bike_year;        // 바이크 연식
    private String bike_state;          // 바이크 상태 (고장, 정비, 사고 등...)

    // FK 영역
    @ManyToOne
    @JoinColumn(name = "user")
    private User user;                  // 유저

    @ManyToOne(optional = false)
    @JoinColumn(name = "bikemodel")
    private BikeModel bikeModels;       // 바이크 모델
}
