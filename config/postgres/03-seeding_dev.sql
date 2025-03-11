-- Insert Business
INSERT INTO business (id, name, industry, description, bio, photo, city, "countryId", "ownerId", "createdAt",
                      "updatedAt")
VALUES ('1', 'Natures Nectar', 'Honey', 'Zambias most sustainable & impactful honey',
        'Natures nectar works with rural communities in Zambia to create a sustainable income and enhance the protection of local forests through beekeeping. With few resources and little access to market, rural Zambian farmer are challenged to find a viable income that doesnt negatively impact the environment. Honey has been a major crop and income source for many communities in Zambia for hundreds of years, and with just a few changes, we can keep this practice alive. Nature’s nectar was founded with the core belief that sustainability and impact are essential to success. It is the intention of nature’s nectar to make top bar beekeeping the most prevalent way for rural communities to produce honey all over Zambia. This will ensure the tradition of beekeeping is kept alive, advanced, and a long term value is placed directly on forests and accompanying ecosystems.',
        'https://t.ly/Pe0GE', 'Lusaka', '249', '1', NOW(), NOW());

-- Insert Farm
INSERT INTO farm (id, name, city, "countryId", latitude, longitude, "createdAt", "updatedAt")
VALUES ('1', 'Farm A', 'Chisengisengi', '249', '-12.2074435', '24.9057937', NOW(), NOW()),
       ('2', 'Farm B', 'Lusaka', '249', '-12.2074000', '24.9057000', NOW(), NOW()),
       ('3', 'Farm C', 'Lusaka', '249', '-12.2074100', '24.9057100', NOW(), NOW()),
       ('4', 'Farm D', 'Lusaka', '249', '-12.2074200', '24.9057200', NOW(), NOW()),
       ('5', 'Farm E', 'Lusaka', '249', '-12.2074300', '24.9057300', NOW(), NOW()),
       ('6', 'Farm F', 'Lusaka', '249', '-12.2074400', '24.9057400', NOW(), NOW()),
       ('7', 'Farm G', 'Lusaka', '249', '-12.2074500', '24.9057500', NOW(), NOW()),
       ('8', 'Farm H', 'Lusaka', '249', '-12.2074600', '24.9057600', NOW(), NOW()),
       ('9', 'Farm I', 'Lusaka', '249', '-12.2074700', '24.9057700', NOW(), NOW()),
       ('10', 'Farm J', 'Lusaka', '249', '-12.2074800', '24.9057800', NOW(), NOW()),
       ('11', 'Farm K', 'Lusaka', '249', '-12.2074900', '24.9057900', NOW(), NOW());

-- Insert businessFarm join table
INSERT INTO "businessFarm" ("businessId", "farmId", "createdAt", "updatedAt")
VALUES ('1', '1', NOW(), NOW()),
       ('1', '2', NOW(), NOW()),
       ('1', '3', NOW(), NOW()),
       ('1', '4', NOW(), NOW()),
       ('1', '5', NOW(), NOW()),
       ('1', '6', NOW(), NOW()),
       ('1', '7', NOW(), NOW()),
       ('1', '8', NOW(), NOW()),
       ('1', '9', NOW(), NOW()),
       ('1', '10', NOW(), NOW()),
       ('1', '11', NOW(), NOW());

-- Insert Factory Staff
INSERT INTO "user" (id, "firstName", "lastName", email, phone, dob, "jobTitle", "isOnboarded", location, latitude,
                    longitude, "roleId", "employerId", "createdAt", "updatedAt")
VALUES ('2', 'Bill', 'Jones', 'factorystaff@naturesnectarzambia.com', '762733711', '1980-01-01', 'Factory Staff', TRUE,
        'Chisengisengi', '-12.2074435', '24.9057937', '3', '1', NOW(), NOW());

-- Insert Field Supervisor
INSERT INTO "user" (id, "firstName", "lastName", email, phone, dob, "jobTitle", "isOnboarded", location, latitude,
                    longitude, "roleId", "employerId", "createdAt", "updatedAt")
VALUES ('3', 'Alice', 'Smith', 'fieldsupervisor@naturesnectarzambia.com', '762733711', '1980-01-01', 'Field Supervisor',
        TRUE, 'Chisengisengi', '-12.2074435', '24.9057937', '4', '1', NOW(), NOW());

-- Insert Zone Lead Farmer
INSERT INTO "user" (id, "firstName", "lastName", email, phone, dob, "jobTitle", "isOnboarded", location, latitude,
                    longitude, "roleId", "createdAt", "updatedAt")
VALUES ('4', 'John', 'Smith', 'zoneleadfarmer@naturesnectarzambia.com', '762733712', '1983-01-01', 'Zone Lead Farmer',
        TRUE, 'Chisengisengi', '-12.2074435', '24.9057937', '5', NOW(), NOW());
INSERT INTO farmer (id, "firstName", "lastName", gender, phone, "maritalStatus", dob, "householdSize",
                    "estimatedAnnualIncome", "sourceOfIncome", "countryId", "roleId", "userId", "farmId", "regionId",
                    "metadata", "createdAt", "updatedAt")
VALUES ('4', 'Joe', 'Smith', 'male', '762733712', 'single', '1983-01-02', 4, 1200.00, 'Farming', '249', '5', '4', '1',
        'EP', '{}', NOW(), NOW());

-- Insert farmer
INSERT INTO "user" (id, "firstName", "lastName", email, phone, dob, "jobTitle", "isOnboarded", location, latitude,
                    longitude, "roleId", "createdAt", "updatedAt")
VALUES ('5', 'Joe', 'Montana', 'farmer2@naturesnectarzambia.com', '762733712', '1983-01-02', 'Farmer', TRUE,
        'Chisengisengi', '-12.2074435', '24.9057937', '6', NOW(), NOW()),
       ('6', 'Anne', 'Taylor', 'farmer3@naturesnectarzambia.com', '762733713', '1984-01-01', 'Farmer', TRUE, 'Mumbwa',
        '-13.132123', '26.9057937', '6', NOW(), NOW()),
       ('7', 'Susan', 'Miller', 'farmer4@naturesnectarzambia.com', '762733714', '1985-02-02', 'Farmer', TRUE, 'Kitwe',
        '-12.809667', '28.213564', '6', NOW(), NOW()),
       ('8', 'Mike', 'Johnson', 'farmer5@naturesnectarzambia.com', '762733715', '1986-03-03', 'Farmer', TRUE, 'Ndola',
        '-13.192345', '27.859333', '6', NOW(), NOW()),
       ('9', 'Lucy', 'Wilson', 'farmer6@naturesnectarzambia.com', '762733716', '1987-04-04', 'Farmer', TRUE, 'Lusaka',
        '-15.416667', '28.283333', '6', NOW(), NOW()),
       ('10', 'John', 'Doe', 'farmer7@naturesnectarzambia.com', '762733717', '1988-05-05', 'Farmer', TRUE, 'Kafue',
        '-15.766667', '28.183333', '6', NOW(), NOW()),
       ('11', 'Alex', 'Smith', 'farmer8@naturesnectarzambia.com', '762733718', '1989-06-06', 'Farmer', TRUE,
        'Livingstone', '-17.856667', '25.867667', '6', NOW(), NOW()),
       ('12', 'Mary', 'Jones', 'farmer9@naturesnectarzambia.com', '762733719', '1990-07-07', 'Farmer', TRUE, 'Chipata',
        '-13.633333', '32.633333', '6', NOW(), NOW()),
       ('13', 'Tom', 'Brown', 'farmer10@naturesnectarzambia.com', '762733720', '1991-08-08', 'Farmer', TRUE, 'Kasama',
        '-10.212', '31.180', '6', NOW(), NOW()),
       ('14', 'Ron', 'Bates', 'farmer1@naturesnectarzambia.com', '762733712', '1983-01-01', 'Farmer', TRUE,
        'Chisengisengi', '-12.2074435', '24.9057937', '6', NOW(), NOW());

INSERT INTO farmer (id, "firstName", "lastName", gender, phone, "maritalStatus", dob, "householdSize",
                    "estimatedAnnualIncome", "sourceOfIncome", "countryId", "roleId", "userId", "farmId", "regionId",
                    "metadata", "createdAt", "updatedAt")
VALUES ('5', 'Joe', 'Montana', 'male', '762733712', 'single', '1983-01-02', 4, 1200.00, 'Farming', '249', '6', '5', '1',
        'EP', '{}', NOW(), NOW()),
       ('6', 'Anne', 'Taylor', 'female', '762733713', 'married', '1984-01-01', 5, 1500.00, 'Farming', '249', '6', '6',
        '1', 'EP', '{}', NOW(), NOW()),
       ('7', 'Susan', 'Miller', 'female', '762733714', 'married', '1985-02-02', 6, 1800.00, 'Farming', '249', '6', '7',
        '1', 'EP', '{}', NOW(), NOW()),
       ('8', 'Mike', 'Johnson', 'male', '762733715', 'single', '1986-03-03', 3, 1100.00, 'Farming', '249', '6', '8',
        '1', 'EP', '{}', NOW(), NOW()),
       ('9', 'Lucy', 'Wilson', 'female', '762733716', 'married', '1987-04-04', 4, 1300.00, 'Farming', '249', '6', '9',
        '1', 'EP', '{}', NOW(), NOW()),
       ('10', 'John', 'Doe', 'male', '762733717', 'single', '1988-05-05', 5, 1250.00, 'Farming', '249', '6', '10', '1',
        'EP', '{}', NOW(), NOW()),
       ('11', 'Alex', 'Smith', 'male', '762733718', 'single', '1989-06-06', 2, 1000.00, 'Farming', '249', '6', '11',
        '1', 'EP', '{}', NOW(), NOW()),
       ('12', 'Mary', 'Jones', 'female', '762733719', 'married', '1990-07-07', 6, 1600.00, 'Farming', '249', '6', '12',
        '1', 'EP', '{}', NOW(), NOW()),
       ('13', 'Tom', 'Brown', 'male', '762733720', 'single', '1991-08-08', 3, 1150.00, 'Farming', '249', '6', '13', '1',
        'EP', '{}', NOW(), NOW()),
       ('14', 'Ron', 'Bates', 'male', '762733712', 'single', '1983-01-01', 4, 1220.00, 'Farming', '249', '6', '14', '1',
        'EP', '{}', NOW(), NOW());

-- Two accounts
INSERT INTO public."user" (id,username,"name","firstName","lastName",email,phone,dob,"jobTitle",photos,"location",latitude,longitude,"roleId","employerId",state,"updatedAt","isOnboarded","emailVerified",image,"createdAt") VALUES
    ('817Hs1WZ9PwCkeRwipPOINTDIeYN15fq',NULL,'The CEO User','CEO name','CEO lastname','theceo@naturesnectarzambia.com','762733711','1980-01-01','CEO','{}','Chisengisengi','-12.2074435','24.9057937','1','1','{}','2025-01-29 08:40:00.297',true,false,NULL,'2025-01-29 08:40:00.297'),
    ('817Hs1WZ9PwCkeRwipPOINTDIeYN_001',NULL,'The Manager User','Manager name','Manager lastname','themanager@naturesnectarzambia.com','762733713','1980-01-01','Manager','{}','Chisengisengi','-12.2074435','24.9057937','1','1','{}','2025-02-13 10:43:19',true,false,NULL,'2025-02-13 10:43:19')
;

INSERT INTO account
(id,"accountId","providerId","userId","accessToken","refreshToken","idToken","accessTokenExpiresAt","refreshTokenExpiresAt","scope","password","createdAt","updatedAt")
VALUES
    ('MDCxSACz0Zp02mt3pkrvwdsHAYNxquDa','817Hs1WZ9PwCkeRwipPOINTDIeYN15fq','credential','817Hs1WZ9PwCkeRwipPOINTDIeYN15fq',NULL,NULL,NULL,NULL,NULL,NULL,'b0a1ec9dc0c566d5598593f18b3ea0b9:f65f597b451b6f10ce69a9036743f3f50c5240599a730da87ce2fe52df680183c826b53d353494c5a7324ed96fb5a2ff6f3a7a414d7003402eb4257e340656f6','2025-01-29 08:40:00.575','2025-01-29 08:40:00.575'),
    ('MDCxSACz0Zp02mt3pkrvwdsHAYNx_001','817Hs1WZ9PwCkeRwipPOINTDIeYN_001','credential','817Hs1WZ9PwCkeRwipPOINTDIeYN_001',NULL,NULL,NULL,NULL,NULL,NULL,'b0a1ec9dc0c566d5598593f18b3ea0b9:f65f597b451b6f10ce69a9036743f3f50c5240599a730da87ce2fe52df680183c826b53d353494c5a7324ed96fb5a2ff6f3a7a414d7003402eb4257e340656f6','2025-02-13 10:46:41','2025-02-13 10:46:30')
;


-- Insert certificate
INSERT INTO certificate (id, "businessId", name, description, "certificateNumber", "certificateDate", "createdAt",
                         "updatedAt")
VALUES ('1', '1', 'African Honey Board Member Certificate', 'African Honey Board', 'Q257hfn756', '2022-01-01', NOW(),
        NOW()),
       ('2', '1', 'Certified Organic', 'Certified Organic Honey', 'Q1567fn756', '2020-01-09', NOW(), NOW()),
       ('3', '1', 'Honey Board Member Certificate', 'Certificate description', '88834782384hhh8asdF', '2018-05-17',
        NOW(), NOW());

-- Insert Harvest Location
INSERT INTO "harvestLocation" (id, name, latitude, longitude, "farmId", "createdAt", "updatedAt")
VALUES ('1', 'CS_ - Chisengisengi', '-12.2074435', '24.9057937', '1', NOW(), NOW());

-- Insert Beehive asset
INSERT INTO "assetType" (id, type, description, "createdAt", "updatedAt")
VALUES ('1', 'beehive', 'Beehive asset', NOW(), NOW());

INSERT INTO asset (id, name, status, latitude, longitude, metadata, "assetTypeId", "businessId", "createdBy",
                   "createdAt", "updatedAt")
VALUES ('1', 'Beehive A', 'active', '-12.2074435', '24.9057937', '{
  "id": "1",
  "beehive_functional": true,
  "beehive_repair": true,
  "beehive_observation": "Beehive is ok",
  "beehive_occupied": true,
  "photos": [
    "https://t.ly/Pe0GE",
    "https://t.ly/dC1Ja",
    "https://t.ly/q5AYJ"
  ]
}', '1', '1', '3', NOW(), NOW()),
       ('2', 'Beehive B', 'active', '-12.2074435', '24.9057937', '{
         "id": "2",
         "beehive_functional": true,
         "beehive_repair": true,
         "beehive_observation": "Beehive needs to be hanged",
         "beehive_occupied": false,
         "photos": [
           "https://t.ly/Pe0GE",
           "https://t.ly/dC1Ja",
           "https://t.ly/q5AYJ"
         ]
       }', '1', '1', '3', NOW(), NOW()),
       ('3', 'Beehive C', 'active', '-12.2074435', '24.9057937', '{
         "id": "3",
         "beehive_functional": true,
         "beehive_repair": false,
         "beehive_observation": "Beehive needs to be moved",
         "beehive_occupied": true,
         "photos": [
           "https://t.ly/Pe0GE",
           "https://t.ly/dC1Ja",
           "https://t.ly/q5AYJ"
         ]
       }', '1', '1', '3', NOW(), NOW()),
       ('4', 'Beehive D', 'active', '-12.2074435', '24.9057937', '{
         "id": "4",
         "beehive_functional": false,
         "beehive_repair": true,
         "beehive_observation": "Beehive needs a new hook",
         "beehive_occupied": false,
         "photos": [
           "https://t.ly/Pe0GE",
           "https://t.ly/dC1Ja",
           "https://t.ly/q5AYJ"
         ]
       }', '1', '1', '3', NOW(), NOW()),
       ('5', 'Beehive E', 'active', '-12.2074435', '24.9057937', '{
         "id": "5",
         "beehive_functional": false,
         "beehive_repair": false,
         "beehive_observation": "Beehive needs to be wired",
         "beehive_occupied": true,
         "photos": [
           "https://t.ly/Pe0GE",
           "https://t.ly/dC1Ja",
           "https://t.ly/q5AYJ"
         ]
       }', '1', '1', '3', NOW(), NOW());

INSERT INTO "assetStatus" (id, status, latitude, longitude, metadata, "assetId", "farmerId", "createdBy", "createdAt",
                           "updatedAt")
VALUES ('1', 'active', '-12.2074435', '24.9057937', '{
  "id": "1",
  "beehive_functional": true,
  "beehive_repair": true,
  "beehive_observation": "Beehive is ok",
  "beehive_occupied": true,
  "photos": [
    "https://t.ly/Pe0GE",
    "https://t.ly/dC1Ja",
    "https://t.ly/q5AYJ"
  ]
}', '1', '4', '3', NOW(), NOW()),
       ('2', 'active', '-12.2074435', '24.9057937', '{
         "id": "2",
         "beehive_functional": true,
         "beehive_repair": true,
         "beehive_observation": "Beehive needs to be hanged",
         "beehive_occupied": false,
         "photos": [
           "https://t.ly/Pe0GE",
           "https://t.ly/dC1Ja",
           "https://t.ly/q5AYJ"
         ]
       }', '2', '4', '3', NOW(), NOW()),
       ('3', 'active', '-12.2074435', '24.9057937', '{
         "id": "3",
         "beehive_functional": true,
         "beehive_repair": false,
         "beehive_observation": "Beehive needs to be moved",
         "beehive_occupied": true,
         "photos": [
           "https://t.ly/Pe0GE",
           "https://t.ly/dC1Ja",
           "https://t.ly/q5AYJ"
         ]
       }', '3', '4', '3', NOW(), NOW()),
       ('4', 'active', '-12.2074435', '24.9057937', '{
         "id": "4",
         "beehive_functional": false,
         "beehive_repair": true,
         "beehive_observation": "Beehive needs a new hook",
         "beehive_occupied": false,
         "photos": [
           "https://t.ly/Pe0GE",
           "https://t.ly/dC1Ja",
           "https://t.ly/q5AYJ"
         ]
       }', '4', '4', '3', NOW(), NOW()),
       ('5', 'active', '-12.2074435', '24.9057937', '{
         "id": "5",
         "beehive_functional": false,
         "beehive_repair": false,
         "beehive_observation": "Beehive needs to be wired",
         "beehive_occupied": true,
         "photos": [
           "https://t.ly/Pe0GE",
           "https://t.ly/dC1Ja",
           "https://t.ly/q5AYJ"
         ]
       }', '5', '4', '3', NOW(), NOW());
