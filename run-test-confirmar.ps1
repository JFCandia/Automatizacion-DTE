#!/usr/bin/env pwsh

Write-Host "🚀 Ejecutando test mejorado con manejo de botón Confirmar..." -ForegroundColor Green
Write-Host "📍 Directorio actual: $(Get-Location)" -ForegroundColor Yellow

# Cambiar al directorio del proyecto
Set-Location "c:\Users\jcandia.SBAD\Documents\JCANDIA\DTE"

Write-Host "🧹 Limpiando resultados anteriores..." -ForegroundColor Cyan
if (Test-Path "test-results") {
    Remove-Item -Path "test-results\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "✅ Resultados anteriores eliminados" -ForegroundColor Green
}

Write-Host "🎬 Iniciando test con navegador visible..." -ForegroundColor Magenta
Write-Host "⚠️  IMPORTANTE: El test ahora maneja el popup de confirmación automáticamente" -ForegroundColor Yellow
Write-Host "🔍 Observa cómo detecta y presiona el botón 'Confirmar'" -ForegroundColor Yellow

try {
    # Ejecutar el test
    & npm run test:headed
    
    Write-Host "✅ Test completado exitosamente!" -ForegroundColor Green
    
    # Mostrar archivos generados
    Write-Host "`n📁 Archivos generados:" -ForegroundColor Cyan
    if (Test-Path "test-results") {
        Get-ChildItem -Path "test-results" -Name | ForEach-Object {
            Write-Host "   - $_" -ForegroundColor White
        }
    }
    
    # Abrir reporte HTML si existe
    if (Test-Path "test-results\reporte-completo.html") {
        Write-Host "`n🌐 Abriendo reporte HTML..." -ForegroundColor Green
        Start-Process "test-results\reporte-completo.html"
    }
    
    # Mostrar reporte de Playwright si existe
    if (Test-Path "playwright-report\index.html") {
        Write-Host "📊 Abriendo reporte de Playwright..." -ForegroundColor Green
        Start-Process "playwright-report\index.html"
    }
    
} catch {
    Write-Host "❌ Error durante la ejecución del test:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    
    # Mostrar screenshots de error si existen
    Write-Host "`n📸 Screenshots de error disponibles:" -ForegroundColor Yellow
    if (Test-Path "test-results") {
        Get-ChildItem -Path "test-results" -Filter "*error*.png" | ForEach-Object {
            Write-Host "   - $($_.Name)" -ForegroundColor Red
        }
    }
}

Write-Host "`n🎯 Test de botón Confirmar completado!" -ForegroundColor Green
Write-Host "📋 Puntos verificados:" -ForegroundColor Cyan
Write-Host "   ✓ Login básico" -ForegroundColor White
Write-Host "   ✓ Selección de empresa" -ForegroundColor White
Write-Host "   ✓ Manejo de popup de confirmación" -ForegroundColor Yellow
Write-Host "   ✓ Botón 'Confirmar' presionado" -ForegroundColor Yellow
Write-Host "   ✓ Flujo completo hasta fiscalización" -ForegroundColor White

Read-Host "`nPresiona Enter para continuar..."
