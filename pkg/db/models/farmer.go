package models

import (
	"github.com/uptrace/bun"
	"time"
)

type Farmer struct {
	bun.BaseModel `bun:"table:farmer"`

	ID                    string                 `bun:"id,pk"`
	FirstName             string                 `bun:"firstName,nullzero"`
	LastName              string                 `bun:"lastName,nullzero"`
	Gender                string                 `bun:"gender,nullzero"`
	Phone                 string                 `bun:"phone,nullzero"`
	MaritalStatus         string                 `bun:"maritalStatus,nullzero"`
	Dob                   string                 `bun:"dob,nullzero"`
	HouseholdSize         string                 `bun:"householdSize,nullzero"`
	EstimatedAnnualIncome float32                `bun:"estimatedAnnualIncome,nullzero"`
	SourceOfIncome        string                 `bun:"sourceOfIncome,nullzero"`
	CountryID             string                 `bun:"countryId,nullzero"`
	RoleID                string                 `bun:"roleId,nullzero"`
	UserID                string                 `bun:"userId,nullzero"`
	FarmID                string                 `bun:"farmId,nullzero"`
	RegionID              string                 `bun:"regionId,nullzero"`
	Metadata              map[string]interface{} `bun:"metadata,type:jsonb,default:{}"`
	CreatedAt             time.Time              `bun:"createdAt,default:current_timestamp"`
	UpdatedAt             time.Time              `bun:"updatedAt,default:current_timestamp"`
}

type FarmerQuickSearch struct {
	bun.BaseModel         `bun:"table:farmer"`
	ID                    string                 `bun:"id,pk"`
	FirstName             string                 `bun:"firstName,nullzero"`
	LastName              string                 `bun:"lastName,nullzero"`
	Gender                string                 `bun:"gender,nullzero"`
	Phone                 string                 `bun:"phone,nullzero"`
	MaritalStatus         string                 `bun:"maritalStatus,nullzero"`
	Dob                   string                 `bun:"dob,nullzero"`
	HouseholdSize         string                 `bun:"householdSize,nullzero"`
	EstimatedAnnualIncome float32                `bun:"estimatedAnnualIncome,nullzero"`
	SourceOfIncome        string                 `bun:"sourceOfIncome,nullzero"`
	CountryID             string                 `bun:"countryId,nullzero"`
	RoleID                string                 `bun:"roleId,nullzero"`
	RoleDisplayName       string                 `bun:"roleDisplayName,notnull"`
	UserID                string                 `bun:"userId,nullzero"`
	FarmID                string                 `bun:"farmId,nullzero"`
	FarmName              string                 `bun:"farmName,nullzero"`
	RegionID              string                 `bun:"regionId,nullzero"`
	Metadata              map[string]interface{} `bun:"metadata,type:jsonb,default:{}"`
	CreatedAt             time.Time              `bun:"createdAt,default:current_timestamp"`
	UpdatedAt             time.Time              `bun:"updatedAt,default:current_timestamp"`
}

type Farm struct {
	bun.BaseModel `bun:"table:farm"`

	ID        string    `bun:"id,pk"`
	Name      string    `bun:"name,notnull"`
	City      string    `bun:"city,notnull"`
	CountryID string    `bun:"countryId,nullzero"`
	Latitude  string    `bun:"latitude,nullzero"`
	Longitude string    `bun:"longitude,nullzero"`
	CreatedAt time.Time `bun:"createdAt,default:current_timestamp"`
	UpdatedAt time.Time `bun:"updatedAt,default:current_timestamp"`
}
