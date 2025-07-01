#!/usr/bin/env pwsh

Write-Host "🔬 EJECUTANDO TEST DE DEBUG PARA BOTÓN CONFIRMAR" -ForegroundColor Magenta
Write-Host "=================================================" -ForegroundColor Magenta

# Cambiar al directorio del proyecto
Set-Location "c:\Users\jcandia.SBAD\Documents\JCANDIA\DTE"

Write-Host "🧹 Limpiando resultados anteriores..." -ForegroundColor Cyan
if (Test-Path "test-results") {
    Remove-Item -Path "test-results\debug-*.png" -Force -ErrorAction SilentlyContinue
}

Write-Host "🎬 Iniciando test de debug con análisis completo del DOM..." -ForegroundColor Yellow
Write-Host "📋 Este test analizará:" -ForegroundColor Cyan
Write-Host "   ✓ Estado del DOM después de seleccionar empresa" -ForegroundColor White
Write-Host "   ✓ Todos los elementos que contienen 'Confirmar'" -ForegroundColor White
Write-Host "   ✓ Múltiples métodos de click" -ForegroundColor White
Write-Host "   ✓ Información detallada de debugging" -ForegroundColor White

try {
    # Ejecutar el test de debug específico
    & npx playwright test tests/debug-boton-confirmar.spec.js --project=chromium --workers=1 --timeout=0 --headed --reporter=list
    
    Write-Host "`n✅ Test de debug completado!" -ForegroundColor Green
    
    # Mostrar archivos de debug generados
    Write-Host "`n📁 Archivos de debug generados:" -ForegroundColor Cyan
    if (Test-Path "test-results") {
        Get-ChildItem -Path "test-results" -Filter "debug-*.png" | ForEach-Object {
            Write-Host "   📸 $($_.Name)" -ForegroundColor Yellow
        }
    }
    
    Write-Host "`n📊 Revisa la consola arriba para ver:" -ForegroundColor Magenta
    Write-Host "   🔍 Análisis detallado del DOM" -ForegroundColor White
    Write-Host "   🎯 Elementos encontrados con 'Confirmar'" -ForegroundColor White
    Write-Host "   🔥 Resultados de cada método de click" -ForegroundColor White
    Write-Host "   ✅ Método exitoso (si alguno funcionó)" -ForegroundColor White
    
} catch {
    Write-Host "`n❌ Error durante el test de debug:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}

Write-Host "`n🎯 PRÓXIMOS PASOS:" -ForegroundColor Green
Write-Host "1. Revisar los screenshots debug-*.png" -ForegroundColor White
Write-Host "2. Analizar la información del DOM en la consola" -ForegroundColor White
Write-Host "3. Identificar el método exitoso para aplicar al test principal" -ForegroundColor White

Read-Host "`nPresiona Enter para continuar..."
