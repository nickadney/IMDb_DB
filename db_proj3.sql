--nick
DROP TABLE tv_show CASCADE CONSTRAINTS;
DROP TABLE genre_lkp CASCADE CONSTRAINTS;
DROP TABLE movie CASCADE CONSTRAINTS;
DROP TABLE movie_review CASCADE CONSTRAINTS;
--nick

--nate
DROP TABLE Acts_in_Movie CASCADE CONSTRAINTS;
DROP TABLE Writes_TV CASCADE CONSTRAINTS;
DROP TABLE Writes_Movie CASCADE CONSTRAINTS;
DROP TABLE Directs_TV CASCADE CONSTRAINTS;
--nate

--colby
DROP TABLE produces_tv CASCADE CONSTRAINTS;
DROP TABLE produces_movie CASCADE CONSTRAINTS;
DROP TABLE production_company CASCADE CONSTRAINTS;
DROP TABLE acts_in_tv CASCADE CONSTRAINTS;
--colby

--harrison
DROP TABLE Person CASCADE CONSTRAINTS;
DROP TABLE Directs_Movie CASCADE CONSTRAINTS;
DROP TABLE Known_For CASCADE CONSTRAINTS;
DROP TABLE Awards CASCADE CONSTRAINTS;
--harrison

--nick
CREATE TABLE tv_show
(
title_id			varchar2(10) CONSTRAINT tv_show_title_id_pk PRIMARY KEY,
title 				varchar2(100),
release_dt			date,
rating				numeric(2,1),
num_episodes		number,
num_seasons			number,
maturity_rating		varchar2(4));

CREATE TABLE genre_lkp
(
title_id			varchar2(10),
genre				varchar2(20),
CONSTRAINT genre_title_id_genre_pk PRIMARY KEY(title_id, genre));

CREATE TABLE movie
(
title_id 			varchar2(10) CONSTRAINT movie_title_id_pk PRIMARY KEY,
title				varchar2(100),
release_dt			date,
rating				numeric(2,1),
runtime_in_mins		number);

CREATE TABLE movie_review
(
title_id			varchar2(10),
review_user			varchar2(20),
review_dt			date,
review_rating		number,
review_title		varchar2(150),
CONSTRAINT movie_review_title_id_user_ck PRIMARY KEY(title_id, review_user));
--nick

--nate
CREATE TABLE Acts_in_Movie
(
title_id			varchar2(10),
name_id				varchar2(10),
CONSTRAINT acts_in_movie_ck PRIMARY KEY(title_id, name_id));


CREATE TABLE Writes_TV
(
title_id			varchar2(10),
name_id				varchar2(10),
CONSTRAINT writes_tv_ck PRIMARY KEY(title_id, name_id));


CREATE TABLE Writes_Movie
(
title_id 			varchar2(10),
name_id				varchar2(10),
CONSTRAINT writes_movie_ck PRIMARY KEY(title_id, name_id));


CREATE TABLE Directs_TV
(
title_id			varchar2(10),
name_id				varchar2(10),
CONSTRAINT directs_tv_ck PRIMARY KEY(title_id, name_id));
--nate

--colby
CREATE TABLE produces_tv
(
title_id			varchar2(10) CONSTRAINT produces_tv_title_id_nn NOT NULL,
company_id          varchar2(10) CONSTRAINT produces_tv_company_id_nn NOT NULL,
CONSTRAINT produces_tv_pk PRIMARY KEY(title_id, company_id));

CREATE TABLE produces_movie
(
    title_id			varchar2(10) CONSTRAINT produces_movie_title_id_nn NOT NULL,
    company_id          varchar2(10) CONSTRAINT produces_movie_company_id_nn NOT NULL,
    CONSTRAINT produces_movie_pk PRIMARY KEY(title_id, company_id));

CREATE TABLE production_company
(
    company_id          varchar2(10) CONSTRAINT production_company_companyID PRIMARY KEY,
    company_name        varchar2(10),
    country             varchar2(10),
    CEO_fname           varchar2(10),
    CEO_lname           varchar2(10));

CREATE TABLE acts_in_tv
(
    name_id			varchar2(10) CONSTRAINT acts_in_tv_name_id_nn NOT NULL,
    title_id          varchar2(10) CONSTRAINT acts_in_tv_title_id_nn NOT NULL,
    CONSTRAINT acts_in_tv_id_pk PRIMARY KEY(title_id, name_id));
--colby

--harrison
Create TABLE Person
(
    name_id VARCHAR2(10),
    F_name VARCHAR2(20) CONSTRAINT person_f_name_nn NOT NULL,
    L_name VARCHAR2(20) CONSTRAINT person_l_name_nn NOT NULL,
    Birth_date DATE,
    Acting_credits NUMBER, 
    Writing_credits NUMBER,
    Directing_credits NUMBER,
    CONSTRAINT person_name_id_pk PRIMARY KEY(name_id));
	
Create TABLE Directs_Movie
(
    name_id  VARCHAR2(10),
    title_id VARCHAR2(10),
    CONSTRAINT directs_movie_name_id_pk PRIMARY KEY(name_id, title_id));

Create Table Known_For
(
    name_id VARCHAR2(10),
    known_For VARCHAR2(10),
    CONSTRAINT known_for_pk PRIMARY KEY(name_id, known_For));

Create TABLE Awards
(
    name_id VARCHAR2(10),
    awards VARCHAR2(10),
    CONSTRAINT awards_pk PRIMARY KEY(name_id, awards));
--harrison

--nick
--foreign key pointing to tv_show
ALTER TABLE genre_lkp
ADD CONSTRAINT genre_lkp_tv_show_title_id_fk FOREIGN KEY(title_id) 
REFERENCES tv_show(title_id);

--foreign key pointing to movie
ALTER TABLE genre_lkp
ADD CONSTRAINT genre_lkp_movie_title_id_fk FOREIGN KEY(title_id) 
REFERENCES movie(title_id);

ALTER TABLE movie_review
ADD CONSTRAINT movie_review_title_id_fk FOREIGN KEY(title_id)
REFERENCES movie(title_id);
--nick

--nate
ALTER TABLE Acts_in_Movie
ADD CONSTRAINT Acts_in_Movie_title_id_fk FOREIGN KEY(title_id) 
REFERENCES movie(title_id);

ALTER TABLE Acts_in_Movie
ADD CONSTRAINT Acts_in_Movie_name_id_fk FOREIGN KEY(name_id)
REFERENCES person(name_id);

ALTER TABLE Writes_TV
ADD CONSTRAINT Writes_TV_movie_title_id_fk FOREIGN KEY(title_id) 
REFERENCES tv_show(title_id);

ALTER TABLE Writes_TV
ADD CONSTRAINT Writes_TV_name_id_fk FOREIGN KEY(name_id)
REFERENCES person(name_id);

ALTER TABLE Writes_Movie
ADD CONSTRAINT Writes_Movie_title_id_fk FOREIGN KEY(title_id)
REFERENCES movie(title_id);

ALTER TABLE Writes_Movie
ADD CONSTRAINT Writes_Movie_name_id_fk FOREIGN KEY(title_id)
REFERENCES person(name_id);

ALTER TABLE Directs_TV
ADD CONSTRAINT Directs_TV_title_id_fk FOREIGN KEY(title_id)
REFERENCES tv_show(title_id);

ALTER TABLE Directs_TV
ADD CONSTRAINT Directs_TV_name_id_fk FOREIGN KEY(title_id)
REFERENCES person(name_id);
--nate

--colby
ALTER TABLE produces_tv
ADD CONSTRAINT produces_tv_company_id_fk FOREIGN KEY(company_id) 
REFERENCES production_company(company_id);

ALTER TABLE produces_tv
ADD CONSTRAINT produces_tv_title_id_fk FOREIGN KEY(title_id) 
REFERENCES tv_show(title_id);

ALTER TABLE produces_movie
ADD CONSTRAINT produces_movie_company_id_fk FOREIGN KEY(company_id) 
REFERENCES production_company(company_id);

ALTER TABLE produces_movie
ADD CONSTRAINT produces_movie_title_id_fk FOREIGN KEY(title_id) 
REFERENCES movie(title_id);

ALTER TABLE acts_in_tv
ADD CONSTRAINT acts_in_tv_title_id_fk FOREIGN KEY(title_id)
REFERENCES tv_show(title_id);

ALTER TABLE acts_in_tv
ADD CONSTRAINT acts_in_tv_name_id_fk FOREIGN KEY(name_id)
REFERENCES person(name_id);
--colby

--harrison
ALTER TABLE Directs_Movie
ADD CONSTRAINT directs_movie_name_id_fk FOREIGN KEY(name_id)
REFERENCES person(name_id);

ALTER TABLE Directs_Movie
ADD CONSTRAINT directs_movie_title_id_fk FOREIGN KEY(title_id)
REFERENCES movie(title_id);

ALTER TABLE Known_For
ADD CONSTRAINT known_for_name_id_fk FOREIGN KEY(name_id)
REFERENCES person(name_id);

ALTER TABLE Awards
ADD CONSTRAINT awards_name_id_fk FOREIGN KEY(name_id)
REFERENCES person(name_id);
--harrison