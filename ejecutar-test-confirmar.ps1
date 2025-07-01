#!/usr/bin/env pwsh

Write-Host "🔬 EJECUTANDO DEBUG ESPECÍFICO DEL BOTÓN CONFIRMAR" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Green

# Cambiar al directorio del proyecto
Set-Location "c:\Users\jcandia.SBAD\Documents\JCANDIA\DTE"

Write-Host "🧹 Limpiando resultados anteriores..." -ForegroundColor Cyan
if (Test-Path "test-results") {
    Remove-Item -Path "test-results\*" -Force -ErrorAction SilentlyContinue
    Write-Host "✅ Resultados anteriores eliminados" -ForegroundColor Green
}

Write-Host "🎬 Ejecutando test de debugging del botón confirmar..." -ForegroundColor Yellow
Write-Host "📝 Este test:" -ForegroundColor Cyan
Write-Host "   ✓ Hace login hasta llegar al popup" -ForegroundColor White
Write-Host "   ✓ Analiza el DOM detalladamente" -ForegroundColor White
Write-Host "   ✓ Prueba 5 métodos diferentes de click" -ForegroundColor White
Write-Host "   ✓ Reporta exactamente qué método funciona" -ForegroundColor White
Write-Host "   ✓ Genera screenshots de cada paso" -ForegroundColor White

try {
    # Ejecutar el test de debug específico para el botón Confirmar
    Write-Host "`n🚀 Iniciando test..." -ForegroundColor Magenta
    & npx playwright test tests/debug-boton-confirmar.spec.js --project=chromium --workers=1 --timeout=0 --headed --reporter=line
    
    Write-Host "`n✅ Test de debug completado!" -ForegroundColor Green
    
    # Mostrar archivos generados
    Write-Host "`n📁 Screenshots generados:" -ForegroundColor Cyan
    if (Test-Path "test-results") {
        Get-ChildItem -Path "test-results" -Filter "*.png" | ForEach-Object {
            Write-Host "   📸 $($_.Name)" -ForegroundColor Yellow
        }
    }
    
    Write-Host "`n🔍 REVISA LA CONSOLA ARRIBA para ver:" -ForegroundColor Magenta
    Write-Host "   📊 Análisis detallado del DOM" -ForegroundColor White
    Write-Host "   🎯 Elementos encontrados con 'Confirmar'" -ForegroundColor White
    Write-Host "   🔥 Resultado de cada método de click" -ForegroundColor White
    Write-Host "   ✅ Método exitoso (si alguno funcionó)" -ForegroundColor Green
    
} catch {
    Write-Host "`n❌ Error durante el test:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    
    # Mostrar screenshots de error si existen
    if (Test-Path "test-results") {
        Write-Host "`n📸 Screenshots de error:" -ForegroundColor Yellow
        Get-ChildItem -Path "test-results" -Filter "*error*.png" | ForEach-Object {
            Write-Host "   📸 $($_.Name)" -ForegroundColor Red
        }
    }
}

Write-Host "`n📋 PRÓXIMOS PASOS:" -ForegroundColor Green
Write-Host "1. Analizar la salida de la consola" -ForegroundColor White
Write-Host "2. Revisar los screenshots generados" -ForegroundColor White
Write-Host "3. Identificar qué método funcionó para aplicarlo al test principal" -ForegroundColor White
Write-Host "4. Si ningún método funcionó, necesitaremos más información del DOM" -ForegroundColor White

Write-Host "`n🎯 Con esta información podremos arreglar definitivamente el test principal!" -ForegroundColor Green

Read-Host "`nPresiona Enter para finalizar..."
