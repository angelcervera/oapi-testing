package repository

import (
	"context"
	"palmyra-pro-api/pkg/db/models"
)

type FarmerRepo interface {
	CreateFarmer(ctx context.Context, farmer *models.Farmer) error
	GetFarmerByID(ctx context.Context, id string) (*models.Farmer, error)
	UpdateFarmer(ctx context.Context, farmer *models.Farmer) error
	DeleteFarmer(ctx context.Context, id string) error
	QuickSearchFarmers(ctx context.Context, fuzzyFilter, id, nrc string, limit, offset int) ([]*models.FarmerQuickSearch, error)
	ListFarmers(ctx context.Context, fuzzyFilter string, globalFilters map[string]interface{}, limit, offset int) ([]*models.Farmer, error)
}
