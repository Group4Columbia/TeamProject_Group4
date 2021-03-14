-- covid_map_data definition

CREATE TABLE covid_map_data (
	"index" INTEGER primary Key,
	location VARCHAR(24),
	iso_code VARCHAR(8),
	date VARCHAR(10),
	total_vaccinations_x INTEGER,
	people_vaccinated_x INTEGER,
	people_fully_vaccinated INTEGER,
	daily_vaccinations_raw INTEGER,
	daily_vaccinations INTEGER,
	total_vaccinations_per_hundred REAL,
	people_vaccinated_per_hundred REAL,
	people_fully_vaccinated_per_hundred REAL,
	daily_vaccinations_per_million INTEGER,
	Country VARCHAR(52),
	Status VARCHAR(22),
	Note VARCHAR(39),
	total_vaccinations_y INTEGER,
	people_vaccinated_y INTEGER,
	total_deaths INTEGER,
	total_cases INTEGER,
	new_cases INTEGER,
	new_deaths INTEGER,
	population_density REAL,
	gdp_per_capita REAL,
	handwashing_facilities INTEGER,
	diabetes_prevalence REAL,
	hospital_beds_per_thousand REAL,
	life_expectancy REAL,
	human_development_index REAL
);


-- covid_youth definition

CREATE TABLE "covid_youth" (
	"index"	INTEGER,
	"map_index"	INTEGER,
	"iso_code"	VARCHAR(8),
	"date"	VARCHAR(10),
	"total_vaccinations"	VARCHAR(1),
	"people_vaccinated"	VARCHAR(1),
	"total_deaths"	INTEGER,
	"total_cases"	INTEGER,
	"new_cases"	INTEGER,
	"new_deaths"	INTEGER,
	"population_density"	REAL,
	"gdp_per_capita"	REAL,
	"handwashing_facilities"	REAL,
	"diabetes_prevalence"	REAL,
	"hospital_beds_per_thousand"	REAL,
	"life_expectancy"	REAL,
	"human_development_index"	REAL,
	FOREIGN KEY("map_index") REFERENCES "covid_map_data"("index"),
	PRIMARY KEY("index")
);


-- covid_education definition

CREATE TABLE "covid_education" (
	"index"	INTEGER,
	"map_index"	INTEGER,
	"youth_index"	INTEGER,
	"Country"	VARCHAR(32) COLLATE BINARY,
	"Status"	VARCHAR(22) COLLATE BINARY,
	"Note"	VARCHAR(39) COLLATE BINARY,
	"iso_code"	VARCHAR(3) COLLATE BINARY,
	"date"	VARCHAR(10) COLLATE BINARY,
	FOREIGN KEY("map_index") REFERENCES "covid_map_data"("index"),
	PRIMARY KEY("index"),
	FOREIGN KEY("youth_index") REFERENCES "covid_youth"("index")
);