# 🔎전체 테이블 보기
show tables;

# 🔎라이더 리스트 보기
select * from user;

UPDATE user set crew_id = null
WHERE user_id=1;

# 🔎권한 리스트 보기
select * from authority;
drop table authority;
DESCRIBE authority;

# 🔎크루 리스트 보기
drop table crew;
select * from crew;
delete from crew;
ALTER TABLE crew AUTO_INCREMENT = 1;


select * from crew_manager;
delete from crew_manager;

drop table crew_attendance;
drop table crew_schedule;
drop table crew_join_board;

drop table crew_join;
select * from crew_join;

select * from crew_manager;
drop table crew_manager;