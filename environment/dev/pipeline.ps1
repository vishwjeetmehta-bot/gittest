# ==========================================
# Terraform ADO Classic Pipeline
# ==========================================

$ErrorActionPreference = "Stop"

Write-Host "=========================================="
Write-Host " Terraform Pipeline Started"
Write-Host "=========================================="

# Current script directory
$TerraformFolder = $PSScriptRoot

Write-Host "Terraform Folder:"
Write-Host $TerraformFolder

Set-Location $TerraformFolder


# ==========================================
# 1. Terraform Init
# ==========================================

Write-Host ""
Write-Host "========== TERRAFORM INIT =========="

terraform init

if ($LASTEXITCODE -ne 0) {
    Write-Error "Terraform Init FAILED"
    exit 1
}

Write-Host "Terraform Init SUCCESS" -ForegroundColor Green


# ==========================================
# 2. Terraform Format Check
# ==========================================

Write-Host ""
Write-Host "========== TERRAFORM FORMAT =========="

terraform fmt -check -recursive

if ($LASTEXITCODE -ne 0) {
    Write-Error "Terraform Format Check FAILED"
    exit 1
}

Write-Host "Terraform Format Check SUCCESS" -ForegroundColor Green


# ==========================================
# 3. Terraform Validate
# ==========================================

Write-Host ""
Write-Host "========== TERRAFORM VALIDATE =========="

terraform validate

if ($LASTEXITCODE -ne 0) {
    Write-Error "Terraform Validate FAILED"
    exit 1
}

Write-Host "Terraform Validate SUCCESS" -ForegroundColor Green


# ==========================================
# Pipeline Successful
# ==========================================

Write-Host ""
Write-Host "=========================================="
Write-Host " Terraform Pipeline SUCCESS"
Write-Host "==========================================" -ForegroundColor Green