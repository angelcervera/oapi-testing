-- DROP SEQUENCE regions_zambia_staging_id_seq;

CREATE SEQUENCE regions_zambia_staging_id_seq
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 2147483647
    START 1
    CACHE 1
    NO CYCLE;


-- public.asset_staging definition

-- Drop table

-- DROP TABLE asset_staging;

CREATE TABLE asset_staging
(
    id             text        NOT NULL,
    "name"         text        NULL,
    "assetTypeId"  text        NULL,
    metadata       jsonb       NULL,
    "activeStatus" text        NULL,
    "businessId"   text        NULL,
    "createdAt"    timestamptz NULL,
    "updatedAt"    timestamptz NULL,
    "createdBy"    text        NULL,
    CONSTRAINT asset_staging_pkey PRIMARY KEY (id)
);



-- public.regions_zambia_staging definition

-- Drop table

-- DROP TABLE regions_zambia_staging;

CREATE TABLE regions_zambia_staging
(
    id           serial4                             NOT NULL,
    region       text                                NULL,
    chiefdom     text                                NULL,
    zones        text                                NULL,
    zone_code    text                                NULL,
    village_name text                                NULL,
    created_at   timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    updated_at   timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT regions_zambia_staging_pkey PRIMARY KEY (id)
);



-- public.staging_farmer_eastern_data definition

-- Drop table

-- DROP TABLE staging_farmer_eastern_data;

CREATE TABLE staging_farmer_eastern_data
(
    objectid                    int4      NOT NULL,
    globalid                    text      NULL,
    contract_date               text      NULL,
    chiefdom                    text      NULL,
    zones                       text      NULL,
    village_name                text      NULL,
    zone_code                   text      NULL,
    longitude                   float4    NULL,
    latitude                    float4    NULL,
    farmer_id                   text      NULL,
    designation                 text      NULL,
    first_name                  text      NULL,
    last_name                   text      NULL,
    full_name                   text      NULL,
    nrc_number                  text      NULL,
    id_card                     text      NULL,
    gender                      text      NULL,
    year_of_birth               text      NULL,
    marital_status              text      NULL,
    number_of_people_household  int4      NULL,
    estimated_annual_income     float4    NULL,
    source_of_income            text      NULL,
    source_of_income_other      text      NULL,
    phone_mtn                   text      NULL,
    phone_airtel                text      NULL,
    phone_zamtel                text      NULL,
    hive_numbers_traditional    int4      NULL,
    changes_or_edits_to_details text      NULL,
    hive_numbers                int4      NULL,
    beehives                    text      NULL,
    purchase_event              float4    NULL,
    collection_events           float4    NULL,
    sales_kwatcha               float4    NULL,
    sales_kgs                   float4    NULL,
    date_last_purchase          date      NULL,
    creationdate                timestamp NULL,
    creator                     text      NULL,
    editdate                    timestamp NULL,
    editor                      text      NULL,
    count_of_contract_images    int4      NULL,
    contract_image_present      text      NULL,
    active_status               text      NULL,
    current_farmer              text      NULL,
    current_farmer_name         text      NULL,
    current_farmer_notes        text      NULL,
    x                           float4    NULL,
    y                           float4    NULL,
    CONSTRAINT staging_farmer_eastern_data_pkey PRIMARY KEY (objectid)
);


-- public."processingItem_staging" definition

-- Drop table

-- DROP TABLE "processingItem_staging";

CREATE TABLE "processingItem_staging"
(
    id              text      NOT NULL,
    "transactionId" text      NOT NULL,
    "batchId"       text      NULL,
    "name"          text      NOT NULL,
    description     text      NULL,
    quantity        numeric   NOT NULL,
    "amountPaid"    numeric   NULL,
    unit            text      NULL,
    "purchasedFrom" text      NULL,
    "recordedBy"    text      NULL,
    metadata        jsonb     NULL,
    status          text      NULL,
    "isPurchased"   bool      NOT NULL,
    "currencyCode"  text      NULL,
    "businessId"    text      NULL,
    "createdAt"     timestamp NULL,
    "updatedAt"     timestamp NULL,
    CONSTRAINT "processingItem_staging_pkey" PRIMARY KEY (id),
    CONSTRAINT "processingItem_staging_purchasedFrom_fkey" FOREIGN KEY ("purchasedFrom") REFERENCES farmer (id)
);


-- public.assetstatus_staging definition

-- Drop table

-- DROP TABLE assetstatus_staging;

CREATE TABLE assetstatus_staging
(
    id          text          NOT NULL,
    "assetId"   text          NULL,
    status      text          NULL,
    latitude    numeric(9, 6) NULL,
    longitude   numeric(9, 6) NULL,
    metadata    jsonb         NULL,
    "farmerId"  text          NULL,
    "createdAt" timestamptz   NULL,
    "updatedAt" timestamptz   NULL,
    "createdBy" text          NULL,
    CONSTRAINT assetstatus_staging_pkey PRIMARY KEY (id),
    CONSTRAINT "assetstatus_staging_assetId_fkey" FOREIGN KEY ("assetId") REFERENCES asset_staging (id),
    CONSTRAINT "assetstatus_staging_farmerId_fkey" FOREIGN KEY ("farmerId") REFERENCES farmer (id)
);

