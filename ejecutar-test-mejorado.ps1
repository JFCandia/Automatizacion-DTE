#!/usr/bin/env pwsh
# Script para ejecutar test con mejor control y debugging

Write-Host "🚀 Ejecutando test mejorado con debugging..." -ForegroundColor Green

# Limpiar resultados anteriores
if (Test-Path "test-results") {
    Remove-Item "test-results\*.png" -Force -ErrorAction SilentlyContinue
    Write-Host "🧹 Screenshots anteriores limpiados" -ForegroundColor Yellow
}

# Ejecutar test con configuración específica
Write-Host "▶️ Iniciando Playwright..." -ForegroundColor Cyan

npx playwright test tests/login-simple.spec.js --project=chromium --headed --timeout=0 --reporter=list

Write-Host "✅ Test completado. Revisa las capturas en test-results/" -ForegroundColor Green
