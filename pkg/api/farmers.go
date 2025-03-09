package api

import (
	"context"
	openapi_types "github.com/oapi-codegen/runtime/types"
	"time"
)

// Search farmers
// (GET /farmers/search)
func (Server) SearchFarmers(ctx context.Context, request SearchFarmersRequestObject) (SearchFarmersResponseObject, error) {
	farmer := Farmer{
		CountryId:       nil,
		CreatedAt:       time.Now(),
		Dob:             openapi_types.Date{},
		FirstName:       "",
		Gender:          nil,
		Id:              "",
		LastName:        nil,
		Phone:           nil,
		RegionId:        nil,
		RoleDisplayName: nil,
		RoleId:          nil,
		UpdatedAt:       time.Now(),
	}

	result := []Farmer{farmer}
	farmers := FarmerList{
		Page:       nil,
		PageSize:   nil,
		Results:    &result,
		Total:      nil,
		TotalPages: nil,
	}

	return SearchFarmers200JSONResponse(farmers), nil
}
