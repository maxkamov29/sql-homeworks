create table airports (
id int identity, airport_name varchar (20), 
country varchar (20), state varchar (20), 
city varchar (20), created_at varchar (20), updated_at varchar (20)
constraint PK_airports primary key (id)
)


create table airline (
id int identity, airline_code varchar (20),
airline_name varchar (20), airline_country varchar (20),
created_at varchar (20), updated_at varchar (20)
constraint PK_airline primary key (id)
)

create table flights (
flight_id int identity, departing_gate varchar (20),
arriving_gate varchar (20), created_at varchar (20),
updated_at varchar (20), airline_id int, 
departing_airport_id int, arriving_airline_id varchar (20)
constraint FK_flights foreign key (airline_id) references airports (id)
)
alter table flights 
add constraint FK_flight foreign key (departing_airport_id) references airports (id)

create table passengers (
id int identity, first_name varchar (20),
last_name varchar (20), date_of_birth date,
country_of_citizenship varchar (20), passport_number varchar (20),
created_at varchar (20), updated_at varchar (20)
constraint PK_passengers primary key (id)
)

create table booking (
bookingid varchar (20), flight_id varchar(20),
status varchar (20), booking_platform varchar (20),
created_at varchar (20), updated_at varchar (20), passenger_id int
constraint PK_booking primary key (bookingid)
constraint FK_booking foreign key (passenger_id) references passengers (id)
)

create table baggage_check (
id int, check_result varchar (20),
created_at varchar (20), updated_at varchar (20),
booking_id varchar (20), passenger_id int
constraint PK_baggageg_check primary key (id),
constraint FK_baggage_check foreign key (booking_id) references booking (bookingid),
constraint FK_baggege_check foreign key (passenger_id) references passengers (id) 
)

create table baggage ( 
id bigint,
weight_in_kg int,
created_at varchar (20),
updated_at varchar,
booking_id varchar (20),
constraint pk_baggage_id primary key (id),
constraint FK_bageege foreign key (booking_id) references booking(bookingid)
)

create table no_fly_list (
id bigint,
active_from date,
active_to date,
no_fly_reason varchar,
created_at timestamp,
updated_at varchar,
passenger_id int,
constraint pk_no_fly_list_id primary key (id),
constraint fk_no_fly_passenger_id foreign key (passenger_id) references passengers (id)
)

create table fly_manifest (
id int,
updated_at varchar (20),
created_at varchar,
booking_id varchar (20),
flight_id int,
constraint pk_fly_manifest_id primary key (id),
constraint fk_fly_manifest_booking_id foreign key (booking_id) references booking (bookingid),
constraint fk_fly_manifest_flight_id foreign key (flight_id) references flights (flight_id)
)