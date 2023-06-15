CREATE TABLE ROLE
(
    role_id VARCHAR(5) PRIMARY KEY,
    role_name VARCHAR(25) NOT NULL UNIQUE,
    salary_grade VARCHAR(2) NOT NULL,
    chargeout_rate NUMBER(11) NOT NULL
)

CREATE TABLE STAFF
(
    staff_num NUMBER(5) PRIMARY KEY,
    staff_name VARCHAR2(50) NOT NULL,
    staff_phone NUMBER(11) NOT NULL UNIQUE,
    staff_fax NUMBER(10) NOT NULL,
    staff_email VARCHAR2(30) NOT NULL,
    role_id VARCHAR2(5) NOT NULL,
    FOREIGN KEY(role_id) REFERENCES ROLE(role_id)
)

CREATE TABLE CLIENT_COMPANY
(
    company_id VARCHAR2(5) PRIMARY KEY,
    company_name VARCHAR2(50) NOT NULL,
    location VARCHAR2(30) NOT NULL,
    account_manager_id NUMBER(5) NOT NULL,
    FOREIGN KEY(account_manager_id ) REFERENCES STAFF(staff_num )     
)

CREATE TABLE CLIENT_STAFF
(
    cl_staff_id NUMBER(5) PRIMARY KEY,
    company_id VARCHAR2(5) NOT NULL,
    cl_staff_name VARCHAR(50) NOT NULL,
    cl_staff_position VARCHAR2 (50) NOT NULL,
    cl_staff_phone NUMBER(11) NOT NULL UNIQUE,
    cl_staff_email VARCHAR2(50) NOT NULL,
    cl_staff_address VARCHAR2 (150) NOT NULL,
    FOREIGN KEY(company_id) REFERENCES CLIENT_COMPANY(company_id)
)

CREATE TABLE PRODUCT
(
    product_id VARCHAR2(5) PRIMARY KEY,
    product_name VARCHAR2(50) NOT NULL,
    company_id VARCHAR2(5) NOT NULL,
    FOREIGN KEY(company_id) REFERENCES CLIENT_COMPANY(company_id)
)

CREATE TABLE CAMPAIGN
(
    campaign_code VARCHAR2(5) PRIMARY KEY,
    campaign_name VARCHAR(100) NOT NULL,
    campaign_manager_id NUMBER(5) NOT NULL,
    product_id VARCHAR2(5) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status NUMBER(1) NOT NULL,
    company_id VARCHAR2(5) NOT NULL,
    FOREIGN KEY(campaign_manager_id) REFERENCES STAFF(staff_num),
    FOREIGN KEY(company_id) REFERENCES CLIENT_COMPANY(company_id),
    FOREIGN KEY(product_id) REFERENCES PRODUCT(product_id)
)

CREATE TABLE CAMPAIGN_TEAM
(
    campaign_code VARCHAR2(5) NOT NULL,
    campaign_manager_id NUMBER(5) NOT NULL,
    cl_staff_id1 NUMBER(5) NOT NULL,
    cl_staff_id2 NUMBER(5) NOT NULL,
    FOREIGN KEY(cl_staff_id1) REFERENCES CLIENT_STAFF(cl_staff_id),
    FOREIGN KEY(cl_staff_id2) REFERENCES CLIENT_STAFF(cl_staff_id)
    FOREIGN KEY(campaign_code) REFERENCES CAMPAIGN(campaign_code),
    FOREIGN KEY(campaign_manager_id) REFERENCES STAFF(staff_num)
)

CREATE TABLE MEETING
(
    meeting_id VARCHAR2(5) PRIMARY KEY,
    campaign_code VARCHAR2(5) NOT NULL,
    date_time_of_meeting TIMESTAMP NOT NULL,
    duration_of_meeting NUMBER(4) NOT NULL,
    purpose VARCHAR2(50) NOT NULL,
    location_of_meeting VARCHAR2(30) NOT NULL,
    FOREIGN KEY(campaign_code) REFERENCES CAMPAIGN(campaign_code)
)

CREATE TABLE MEET_ATTENDANCE
(
    meeting_id VARCHAR2(5) NOT NULL,
    campaign_manager_id NUMBER(5) NOT NULL,
    cl_staff_id1 NUMBER(5) NOT NULL,
    cl_staff_id2 NUMBER(5) NOT NULL,
    account_manager_id NUMBER(5) NOT NULL,
    graphic_designer_id NUMBER(5) NOT NULL,
    FOREIGN KEY(meeting_id) REFERENCES MEETING(meeting_id),
    FOREIGN KEY(campaign_manager_id) REFERENCES STAFF(staff_num),
    FOREIGN KEY(account_manager_id) REFERENCES STAFF(staff_num),
    FOREIGN KEY(graphic_designer_id) REFERENCES STAFF(staff_num),
    FOREIGN KEY(cl_staff_id1) REFERENCES CLIENT_STAFF(cl_staff_id),
    FOREIGN KEY(cl_staff_id2) REFERENCES CLIENT_STAFF(cl_staff_id)
)


CREATE TABLE ADVERT
(
    advert_code VARCHAR2(5) PRIMARY KEY,  
    campaign_code VARCHAR2(5) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status NUMBER(1) NOT NULL,
    advert_type VARCHAR2(25) NOT NULL,
    type_desc VARCHAR2(25) NOT NULL,
    size_of_advert VARCHAR2(10) NOT NULL,
    audience_desc VARCHAR2(30) NOT NULL,
    FOREIGN KEY(campaign_code) REFERENCES CAMPAIGN(campaign_code)
)

CREATE TABLE PROGRESS_TRACKER
(
    campaign_code VARCHAR2(5) NOT NULL,
    advert_code VARCHAR2(5) NOT NULL,
    component_name VARCHAR2(25) NOT NULL,
    status VARCHAR2(10) NOT NULL,
    completion_date DATE NOT NULL,
    adv_ex_id NUMBER(5) NOT NULL,
    FOREIGN KEY(campaign_code) REFERENCES CAMPAIGN(campaign_code),
    FOREIGN KEY(advert_code) REFERENCES ADVERT(advert_code),
    FOREIGN KEY(adv_ex_id) REFERENCES STAFF(staff_num)
)



CREATE TABLE PLACEMENT
(
    placement_code VARCHAR2(5) PRIMARY KEY,
    location_of_placement VARCHAR2(25) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    purchasing_assistant_id NUMBER(5) NOT NULL,
    advert_code VARCHAR2(5) NOT NULL,
    notes VARCHAR2(100),
    FOREIGN KEY(purchasing_assistant_id) REFERENCES STAFF(staff_num),
    FOREIGN KEY(advert_code) REFERENCES ADVERT(advert_code)
)

CREATE TABLE CONTRACT
(
    contract_ref_no VARCHAR2(5) PRIMARY KEY,
    name VARCHAR2(25) NOT NULL,
    contact NUMBER(11) NOT NULL
)

CREATE TABLE PLACEMENT_DETAILS
(
    no_of_pages VARCHAR2(5) NOT NULL,
    no_of_editions VARCHAR2(5) NOT NULL,
    frequency VARCHAR2(5) NOT NULL,
    no_of_leaflets VARCHAR2(5) NOT NULL,
    contract_ref_no VARCHAR2(5) NOT NULL,
    placement_code VARCHAR2(5) NOT NULL,
    FOREIGN KEY(contract_ref_no) REFERENCES CONTRACT(contract_ref_no),
    FOREIGN KEY(placement_code) REFERENCES PLACEMENT(placement_code)
)