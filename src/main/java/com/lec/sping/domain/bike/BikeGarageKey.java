package com.lec.sping.domain.bike;

import jakarta.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class BikeGarageKey implements Serializable {
    private Long user_id;
    private Long bike_id;
}
