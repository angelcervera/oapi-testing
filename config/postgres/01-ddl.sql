-- DROP DATABASE IF EXISTS palmira_pro_db;

-- CREATE DATABASE palmira_pro_db;

-- \c palmira_pro_db

-- DROP SEQUENCE honey_purchase_eastern_data_objectid_seq;

CREATE SEQUENCE honey_purchase_eastern_data_objectid_seq
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 2147483647
    START 1
    CACHE 1
    NO CYCLE;

-- public."assetType" definition

-- Drop table

-- DROP TABLE "assetType";

CREATE TABLE "assetType"
(
    id          text                                NOT NULL,
    "type"      text                                NOT NULL,
    description text                                NULL,
    "createdAt" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT "assetType_pkey" PRIMARY KEY (id)
);

-- public.beehive_locations_eastern_data definition

-- Drop table

-- DROP TABLE beehive_locations_eastern_data;

CREATE TABLE beehive_locations_eastern_data
(
    objectid                  int4      NULL,
    globalid                  text      NULL,
    zones                     text      NULL,
    zone_code                 text      NULL,
    farmer_id_number          text      NULL,
    unique_farmer_id          text      NULL,
    beehive_id_number         int4      NULL,
    unique_beehive_id         text      NULL,
    first_name                text      NULL,
    last_name                 text      NULL,
    full_name                 text      NULL,
    longitude                 float4    NULL,
    latitude                  float4    NULL,
    date_updated              text      NULL,
    functional                text      NULL,
    repair                    text      NULL,
    repair_part               text      NULL,
    repair_part_other         text      NULL,
    beehive_observation       text      NULL,
    beehive_observation_other text      NULL,
    note_on_beehive           text      NULL,
    field1                    text      NULL,
    field2                    float4    NULL,
    field3                    float4    NULL,
    field4                    float4    NULL,
    occupied                  text      NULL,
    occupancy_note            text      NULL,
    creationdate              timestamp NULL,
    creator                   text      NULL,
    editdate                  timestamp NULL,
    editor                    text      NULL,
    x                         float4    NULL,
    y                         float4    NULL
);


-- public.commodity definition

-- Drop table

-- DROP TABLE commodity;

CREATE TABLE commodity
(
    id          text                                NOT NULL,
    "name"      text                                NOT NULL,
    code        text                                NOT NULL,
    "createdAt" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT commodities_code_unique UNIQUE (code),
    CONSTRAINT commodity_pkey PRIMARY KEY (id)
);


-- public.country definition

-- Drop table

-- DROP TABLE country;

CREATE TABLE country
(
    id            text NOT NULL,
    code          text NOT NULL,
    "name"        text NOT NULL,
    "displayName" text NOT NULL,
    CONSTRAINT countries_code_unique UNIQUE (code),
    CONSTRAINT country_pkey PRIMARY KEY (id)
);


-- public.currency definition

-- Drop table

-- DROP TABLE currency;

CREATE TABLE currency
(
    code           text NOT NULL,
    symbol         text NOT NULL,
    "symbolNative" text NULL,
    "name"         text NOT NULL,
    CONSTRAINT currency_pkey PRIMARY KEY (code)
);


-- public.honey_purchase_eastern_data definition

-- Drop table

-- DROP TABLE honey_purchase_eastern_data;

CREATE TABLE honey_purchase_eastern_data
(
    objectid                   serial4        NOT NULL,
    globalid                   uuid           NULL,
    zones                      text           NULL,
    zone_code                  text           NULL,
    farmer_id_number           text           NULL,
    unique_farmer_id           text           NULL,
    first_name                 text           NULL,
    last_name                  text           NULL,
    full_name                  text           NULL,
    purchase_date              timestamp      NULL,
    beehive_total              int4           NULL,
    honey_bucket_weigh_formula text           NULL,
    number_buckets             int4           NULL,
    total_weight_honey         numeric        NULL,
    honey_price                numeric        NULL,
    purchase_price             numeric        NULL,
    notes_on_purchase          text           NULL,
    commission_percentage      numeric        NULL,
    calculation                text           NULL,
    commission_calculated      numeric        NULL,
    field7                     text           NULL,
    field8                     text           NULL,
    field9                     text           NULL,
    "CreationDate"             text           NULL,
    creator                    text           NULL,
    "EditDate"                 text           NULL,
    editor                     text           NULL,
    number_rejected_buckets    int4           NULL,
    farmer_gender              text           NULL,
    x                          numeric(12, 8) NULL,
    y                          numeric(12, 8) NULL,
    CONSTRAINT honey_purchase_eastern_data_pkey PRIMARY KEY (objectid)
);


-- public.jwks definition

-- Drop table

-- DROP TABLE jwks;

CREATE TABLE jwks
(
    id           text      NOT NULL,
    "publicKey"  text      NOT NULL,
    "privateKey" text      NOT NULL,
    "createdAt"  timestamp NOT NULL,
    CONSTRAINT jwks_pkey PRIMARY KEY (id)
);

-- public."role" definition

-- Drop table

-- DROP TABLE "role";

CREATE TABLE "role"
(
    id            text                      NOT NULL,
    "name"        text                      NOT NULL,
    "displayName" text                      NOT NULL,
    permissions   jsonb DEFAULT '{}'::jsonb NULL,
    CONSTRAINT role_pkey PRIMARY KEY (id)
);

-- public.verification definition

-- Drop table

-- DROP TABLE verification;

CREATE TABLE verification
(
    id          text      NOT NULL,
    identifier  text      NOT NULL,
    value       text      NOT NULL,
    "expiresAt" timestamp NOT NULL,
    "createdAt" timestamp NULL,
    "updatedAt" timestamp NULL,
    CONSTRAINT verification_pkey PRIMARY KEY (id)
);


-- public."administrativeArea" definition

-- Drop table

-- DROP TABLE "administrativeArea";

CREATE TABLE "administrativeArea"
(
    id         varchar      NOT NULL,
    "name"     varchar(255) NOT NULL,
    "level"    int4         NOT NULL,
    "parentId" varchar      NULL,
    CONSTRAINT "administrativeArea_pkey" PRIMARY KEY (id),
    CONSTRAINT "fkParent" FOREIGN KEY ("parentId") REFERENCES "administrativeArea" (id)
);


-- public.business definition

-- Drop table

-- DROP TABLE business;

CREATE TABLE business
(
    id          text                                NOT NULL,
    "name"      text                                NOT NULL,
    industry    text                                NULL,
    description text                                NULL,
    bio         text                                NULL,
    photo       text                                NULL,
    zipcode     text                                NULL,
    city        text                                NULL,
    "countryId" text                                NULL,
    "ownerId"   text                                NULL,
    "createdAt" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT business_pkey PRIMARY KEY (id),
    CONSTRAINT businesses_country_id_countries_id_fk FOREIGN KEY ("countryId") REFERENCES country (id)
);


-- public.certificate definition

-- Drop table

-- DROP TABLE certificate;

CREATE TABLE certificate
(
    id                  text                                NOT NULL,
    "businessId"        text                                NOT NULL,
    "name"              text                                NOT NULL,
    description         text                                NULL,
    "certificateNumber" text                                NOT NULL,
    "certificateDate"   text                                NOT NULL,
    "createdAt"         timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt"         timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT certificate_pkey PRIMARY KEY (id),
    CONSTRAINT certificates_business_id_businesses_id_fk FOREIGN KEY ("businessId") REFERENCES business (id) ON DELETE CASCADE
);


-- public."eventTemplate" definition

-- Drop table

-- DROP TABLE "eventTemplate";

CREATE TABLE "eventTemplate"
(
    id            text                                NOT NULL,
    "name"        text                                NOT NULL,
    description   text                                NULL,
    "commodityId" text                                NULL,
    "epcisType"   text                                NOT NULL,
    metadata      jsonb     DEFAULT '{}'::jsonb       NULL,
    "createdAt"   timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt"   timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT "eventTemplate_pkey" PRIMARY KEY (id),
    CONSTRAINT event_templates_commodity_id_commodities_id_fk FOREIGN KEY ("commodityId") REFERENCES commodity (id) ON DELETE CASCADE
);


-- public.farm definition

-- Drop table

-- DROP TABLE farm;

CREATE TABLE farm
(
    id          text                                NOT NULL,
    "name"      text                                NOT NULL,
    city        text                                NOT NULL,
    "countryId" text                                NULL,
    latitude    text                                NULL,
    longitude   text                                NULL,
    "createdAt" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT farm_pkey PRIMARY KEY (id),
    CONSTRAINT farms_country_id_countries_id_fk FOREIGN KEY ("countryId") REFERENCES country (id)
);


-- public."harvestLocation" definition

-- Drop table

-- DROP TABLE "harvestLocation";

CREATE TABLE "harvestLocation"
(
    id          text                                NOT NULL,
    "name"      text                                NOT NULL,
    latitude    text                                NULL,
    longitude   text                                NULL,
    metadata    jsonb     DEFAULT '{}'::jsonb       NULL,
    "farmId"    text                                NULL,
    "createdAt" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT "harvestLocation_pkey" PRIMARY KEY (id),
    CONSTRAINT harvest_locations_farm_id_farms_id_fk FOREIGN KEY ("farmId") REFERENCES farm (id) ON DELETE CASCADE
);


-- public.role_reports definition

-- Drop table

-- DROP TABLE role_reports;

CREATE TABLE role_reports
(
    roleid   varchar NULL,
    reportid int4    NULL,
    CONSTRAINT role_reports_pk UNIQUE (roleid, reportid),
    CONSTRAINT role_reports_role_id_fk FOREIGN KEY (roleid) REFERENCES "role" (id)
);


-- public."user" definition

-- Drop table

-- DROP TABLE "user";

CREATE TABLE "user"
(
    id              varchar                             NOT NULL,
    username        varchar(200)                        NULL,
    "name"          varchar(200)                        NULL,
    "firstName"     varchar(200)                        NULL,
    "lastName"      varchar(200)                        NULL,
    email           varchar(200)                        NOT NULL,
    phone           text                                NULL,
    dob             text                                NULL,
    "jobTitle"      text                                NULL,
    photos          jsonb     DEFAULT '{}'::jsonb       NULL,
    "location"      text                                NULL,
    latitude        text                                NULL,
    longitude       text                                NULL,
    "roleId"        text                                NULL,
    "employerId"    text                                NULL,
    state           jsonb     DEFAULT '{}'::jsonb       NULL,
    "updatedAt"     timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "isOnboarded"   bool      DEFAULT false             NOT NULL,
    "emailVerified" bool      DEFAULT false             NOT NULL,
    image           text                                NULL,
    "createdAt"     timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT user_email_key UNIQUE (email),
    CONSTRAINT user_pkey PRIMARY KEY (id),
    CONSTRAINT user_role_id_roles_id_fk FOREIGN KEY ("roleId") REFERENCES "role" (id)
);


-- public.account definition

-- Drop table

-- DROP TABLE account;

CREATE TABLE account
(
    id                      text      NOT NULL,
    "accountId"             text      NOT NULL,
    "providerId"            text      NOT NULL,
    "userId"                text      NOT NULL,
    "accessToken"           text      NULL,
    "refreshToken"          text      NULL,
    "idToken"               text      NULL,
    "accessTokenExpiresAt"  timestamp NULL,
    "refreshTokenExpiresAt" timestamp NULL,
    "scope"                 text      NULL,
    "password"              text      NULL,
    "createdAt"             timestamp NOT NULL,
    "updatedAt"             timestamp NOT NULL,
    CONSTRAINT account_pkey PRIMARY KEY (id),
    CONSTRAINT "account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user" (id)
);


-- public.asset definition

-- Drop table

-- DROP TABLE asset;

CREATE TABLE asset
(
    id            text                                NOT NULL,
    "name"        text                                NOT NULL,
    status        text                                NOT NULL,
    latitude      text                                NULL,
    longitude     text                                NULL,
    metadata      jsonb     DEFAULT '{}'::jsonb       NULL,
    "assetTypeId" text                                NULL,
    "businessId"  text                                NULL,
    "createdBy"   text                                NULL,
    "createdAt"   timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt"   timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT asset_pkey PRIMARY KEY (id),
    CONSTRAINT assets_asset_type_id_asset_types_id_fk FOREIGN KEY ("assetTypeId") REFERENCES "assetType" (id) ON DELETE CASCADE,
    CONSTRAINT assets_business_id_businesses_id_fk FOREIGN KEY ("businessId") REFERENCES business (id) ON DELETE CASCADE,
    CONSTRAINT assets_created_by_user_id_fk FOREIGN KEY ("createdBy") REFERENCES "user" (id) ON DELETE CASCADE
);


-- public."businessFarm" definition

-- Drop table

-- DROP TABLE "businessFarm";

CREATE TABLE "businessFarm"
(
    "businessId" text                                NOT NULL,
    "farmId"     text                                NOT NULL,
    "createdAt"  timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt"  timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT "businessFarm_pkey" PRIMARY KEY ("businessId", "farmId"),
    CONSTRAINT businesses_farms_business_id_businesses_id_fk FOREIGN KEY ("businessId") REFERENCES business (id) ON DELETE CASCADE,
    CONSTRAINT businesses_farms_farm_id_farms_id_fk FOREIGN KEY ("farmId") REFERENCES farm (id) ON DELETE CASCADE
);


-- public."event" definition

-- Drop table

-- DROP TABLE "event";

CREATE TABLE "event"
(
    id                text                                NOT NULL,
    "eventTemplateId" text                                NULL,
    "employeeId"      text                                NULL,
    "businessId"      text                                NULL,
    "createdAt"       timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt"       timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT event_pkey PRIMARY KEY (id),
    CONSTRAINT events_business_id_businesses_id_fk FOREIGN KEY ("businessId") REFERENCES business (id) ON DELETE CASCADE,
    CONSTRAINT events_employee_id_user_id_fk FOREIGN KEY ("employeeId") REFERENCES "user" (id) ON DELETE CASCADE,
    CONSTRAINT events_event_template_id_event_templates_id_fk FOREIGN KEY ("eventTemplateId") REFERENCES "eventTemplate" (id) ON DELETE CASCADE
);


-- public.farmer definition

-- Drop table

-- DROP TABLE farmer;

CREATE TABLE farmer
(
    id                      text                                NOT NULL,
    "firstName"             text                                NULL,
    "lastName"              text                                NULL,
    gender                  text                                NULL,
    phone                   text                                NULL,
    "maritalStatus"         text                                NULL,
    dob                     text                                NULL,
    "householdSize"         text                                NULL,
    "estimatedAnnualIncome" float4                              NULL,
    "sourceOfIncome"        text                                NULL,
    "countryId"             text                                NULL,
    "roleId"                text                                NULL,
    "userId"                text                                NULL,
    "farmId"                text                                NULL,
    "regionId"              text                                NULL,
    metadata                jsonb     DEFAULT '{}'::jsonb       NULL,
    "createdAt"             timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt"             timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT farmer_pkey PRIMARY KEY (id),
    CONSTRAINT farmers_country_id_countries_id_fk FOREIGN KEY ("countryId") REFERENCES country (id),
    CONSTRAINT farmers_farm_id_farms_id_fk FOREIGN KEY ("farmId") REFERENCES farm (id),
    CONSTRAINT farmers_role_id_roles_id_fk FOREIGN KEY ("roleId") REFERENCES "role" (id),
    CONSTRAINT farmers_user_id_user_id_fk FOREIGN KEY ("userId") REFERENCES "user" (id)
);


-- public.form definition

-- Drop table

-- DROP TABLE form;

CREATE TABLE form
(
    id           text                                NOT NULL,
    "name"       text                                NOT NULL,
    description  text                                NULL,
    metadata     jsonb     DEFAULT '{}'::jsonb       NULL,
    "businessId" text                                NULL,
    "createdBy"  text                                NULL,
    "createdAt"  timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt"  timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT form_pkey PRIMARY KEY (id),
    CONSTRAINT forms_business_id_businesses_id_fk FOREIGN KEY ("businessId") REFERENCES business (id) ON DELETE CASCADE,
    CONSTRAINT forms_created_by_user_id_fk FOREIGN KEY ("createdBy") REFERENCES "user" (id) ON DELETE CASCADE
);


-- public.message definition

-- Drop table

-- DROP TABLE message;

CREATE TABLE message
(
    id          varchar                             NOT NULL,
    "senderId"  varchar                             NULL,
    "content"   text                                NOT NULL,
    "createdAt" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt" timestamp                           NULL,
    CONSTRAINT message_pkey PRIMARY KEY (id),
    CONSTRAINT "message_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES "user" (id)
);


-- public."processingItem" definition

-- Drop table

-- DROP TABLE "processingItem";

CREATE TABLE "processingItem"
(
    id              text                                NOT NULL,
    "batchId"       text                                NOT NULL,
    "transactionId" text                                NOT NULL,
    "name"          text                                NOT NULL,
    description     text                                NULL,
    quantity        text                                NOT NULL,
    "amountPaid"    text                                NULL,
    unit            text                                NULL,
    "purchasedFrom" text                                NULL,
    "recordedBy"    text                                NULL,
    metadata        jsonb     DEFAULT '{}'::jsonb       NULL,
    status          text                                NULL,
    "isPurchased"   bool      DEFAULT false             NOT NULL,
    "currencyCode"  text                                NULL,
    "businessId"    text                                NULL,
    "createdAt"     timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt"     timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT "processingItem_pkey" PRIMARY KEY (id),
    CONSTRAINT processing_items_business_id_businesses_id_fk FOREIGN KEY ("businessId") REFERENCES business (id) ON DELETE CASCADE,
    CONSTRAINT processing_items_currency_code_currencies_code_fk FOREIGN KEY ("currencyCode") REFERENCES currency (code),
    CONSTRAINT processing_items_purchased_from_farms_id_fk FOREIGN KEY ("purchasedFrom") REFERENCES farm (id) ON DELETE CASCADE,
    CONSTRAINT processing_items_recorded_by_user_id_fk FOREIGN KEY ("recordedBy") REFERENCES "user" (id) ON DELETE CASCADE
);


-- public."processingItemAsset" definition

-- Drop table

-- DROP TABLE "processingItemAsset";

CREATE TABLE "processingItemAsset"
(
    "processingItemId" text                                NOT NULL,
    "assetId"          text                                NOT NULL,
    "createdAt"        timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt"        timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT "processingItemAsset_pkey" PRIMARY KEY ("processingItemId", "assetId"),
    CONSTRAINT processing_items_assets_asset_id_assets_id_fk FOREIGN KEY ("assetId") REFERENCES asset (id) ON DELETE CASCADE,
    CONSTRAINT processing_items_assets_processing_item_id_processing_items_id_ FOREIGN KEY ("processingItemId") REFERENCES "processingItem" (id) ON DELETE CASCADE
);

-- public."session" definition

-- Drop table

-- DROP TABLE "session";

CREATE TABLE "session"
(
    id          text      NOT NULL,
    "expiresAt" timestamp NOT NULL,
    "token"     text      NOT NULL,
    "createdAt" timestamp NOT NULL,
    "updatedAt" timestamp NOT NULL,
    "ipAddress" text      NULL,
    "userAgent" text      NULL,
    "userId"    text      NOT NULL,
    CONSTRAINT session_pkey PRIMARY KEY (id),
    CONSTRAINT "session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user" (id)
);


-- public."assetStatus" definition

-- Drop table

-- DROP TABLE "assetStatus";

CREATE TABLE "assetStatus"
(
    id          text                                NOT NULL,
    status      text                                NOT NULL,
    latitude    text                                NULL,
    longitude   text                                NULL,
    metadata    jsonb     DEFAULT '{}'::jsonb       NULL,
    "assetId"   text                                NULL,
    "farmerId"  text                                NULL,
    "createdBy" text                                NULL,
    "createdAt" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    "updatedAt" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT "assetStatus_pkey" PRIMARY KEY (id),
    CONSTRAINT "assetStatus_asset_id_assets_id_fk" FOREIGN KEY ("assetId") REFERENCES asset (id) ON DELETE CASCADE,
    CONSTRAINT "assetStatus_created_by_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "user" (id) ON DELETE CASCADE,
    CONSTRAINT "assetStatus_farmer_id_farmer_id_fk" FOREIGN KEY ("farmerId") REFERENCES farmer (id) ON DELETE CASCADE
);
