#!/bin/bash

cd app

export DATABASE_NAME="cogo_lens"
export DATABASE_USER="postgres"
export DATABASE_PASSWORD="KgVQ97?V"
export DATABASE_HOST="cogo-lens-testing.cxmkfxrc30yc.ap-south-1.rds.amazonaws.com"
export DATABASE_PORT=5432
export SHARE_POINT_SITE="cogofreight.sharepoint.com"
export SHARE_POINT_USER="santram.gurjar@cogoport.com"
export SHARE_POINT_SITE="btlwvzzhvfgqpnxm"


uvicorn main:app --reload


