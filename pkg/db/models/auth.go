package models

import (
	"github.com/uptrace/bun"
	"time"
)

type Role struct {
	bun.BaseModel `bun:"table:role"`

	ID          string                 `bun:"id,pk"`
	Name        string                 `bun:"name,notnull"`
	DisplayName string                 `bun:"displayName,notnull"`
	Permissions map[string]interface{} `bun:"permissions,type:jsonb,default:{}"`
}

type User struct {
	bun.BaseModel `bun:"table:user"`

	ID            string                 `bun:"id,pk"`
	Username      string                 `bun:"username,nullzero"`
	Name          string                 `bun:"name,nullzero"`
	FirstName     string                 `bun:"firstName,nullzero"`
	LastName      string                 `bun:"lastName,nullzero"`
	Email         string                 `bun:"email,notnull,unique"`
	Phone         string                 `bun:"phone,nullzero"`
	Dob           string                 `bun:"dob,nullzero"`
	JobTitle      string                 `bun:"jobTitle,nullzero"`
	Photos        map[string]interface{} `bun:"photos,type:jsonb,default:{}"`
	Location      string                 `bun:"location,nullzero"`
	Latitude      string                 `bun:"latitude,nullzero"`
	Longitude     string                 `bun:"longitude,nullzero"`
	RoleID        string                 `bun:"roleId,nullzero"`
	EmployerID    string                 `bun:"employerId,nullzero"`
	State         map[string]interface{} `bun:"state,type:jsonb,default:{}"`
	UpdatedAt     time.Time              `bun:"updatedAt,default:current_timestamp"`
	IsOnboarded   bool                   `bun:"isOnboarded,notnull,default:false"`
	EmailVerified bool                   `bun:"emailVerified,notnull,default:false"`
	Image         string                 `bun:"image,nullzero"`
	CreatedAt     time.Time              `bun:"createdAt,default:current_timestamp"`
}
