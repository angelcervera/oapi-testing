package api

import (
	"context"
	"time"
)

// Generate a new dashboard link
// (GET /dashboard-links)
func (Server) CreateDashboardLink(ctx context.Context, request CreateDashboardLinkRequestObject) (CreateDashboardLinkResponseObject, error) {
	dashboard := DashboardLink{
		CreatedAt:   time.Now(),
		DashboardId: 1,
	}

	return CreateDashboardLink201JSONResponse(dashboard), nil
}
