-- City ( Name, Region )
create table city
(
    name   varchar(32),
    region varchar(64),
    primary key (name, region)
);

-- Station ( Name, #Tracks, CityName, Region )
create table station
(
    name      varchar(64) primary key,
    tracks    int,
    city_name varchar(32),
    region    varchar(64),
    foreign key (city_name, region) references city (name, region)
);

-- Train ( TrainNr, Length, StartStationName, EndStationName )
create table train
(
    train_nr           serial primary key,
    length             int,
    start_station_name varchar(32) references station (name),
    end_station_name   varchar(32) references station (name)
);

-- Connection ( FromStation, ToStation, TrainNr, Departure, Arrival)
create table connection
(
    from_station varchar(32) references station (name),
    to_station   varchar(32) references station (name),
    train_nr     int references train (train_nr),
    departure    timestamp,
    arrival      timestamp,
    unique (departure, from_station, train_nr),
    unique (arrival, to_station, train_nr),
    primary key (train_nr, departure, arrival)
);