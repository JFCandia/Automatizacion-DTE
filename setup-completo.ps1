# 🚀 Script de Setup Completo - Automatización DTE
# Autor: Juan Francisco Candia - Baplica S.A.
# Descripción: Setup completo del proyecto desde cero

Write-Host "🚀 Iniciando setup de Automatización DTE..." -ForegroundColor Green
Write-Host "👨‍💻 Desarrollado por: Juan Francisco Candia - Baplica S.A." -ForegroundColor Cyan
Write-Host "🔗 Repositorio: https://github.com/JFCandia/Automatizacion-DTE" -ForegroundColor Yellow

# Verificar si estamos en el directorio correcto
if (!(Test-Path "package.json")) {
    Write-Host "❌ Error: No se encontró package.json" -ForegroundColor Red
    Write-Host "💡 Este script debe ejecutarse en el directorio raíz del proyecto" -ForegroundColor Yellow
    Write-Host "📂 Si acabas de clonar el repositorio, ejecuta:" -ForegroundColor Blue
    Write-Host "   cd Automatizacion-DTE" -ForegroundColor White
    Write-Host "   .\setup-completo.ps1" -ForegroundColor White
    pause
    exit 1
}

# Paso 1: Verificar Node.js
Write-Host "`n🔍 Verificando Node.js..." -ForegroundColor Blue
try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js encontrado: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js no encontrado" -ForegroundColor Red
    Write-Host "📥 Instálalo desde: https://nodejs.org/" -ForegroundColor Yellow
    pause
    exit 1
}

# Paso 2: Instalar dependencias
Write-Host "`n📦 Instalando dependencias npm..." -ForegroundColor Blue
try {
    npm install
    Write-Host "✅ Dependencias instaladas correctamente" -ForegroundColor Green
} catch {
    Write-Host "❌ Error instalando dependencias" -ForegroundColor Red
    pause
    exit 1
}

# Paso 3: Instalar navegadores de Playwright
Write-Host "`n🎭 Instalando navegadores de Playwright..." -ForegroundColor Blue
try {
    npx playwright install chromium
    Write-Host "✅ Navegadores de Playwright instalados" -ForegroundColor Green
} catch {
    Write-Host "❌ Error instalando navegadores de Playwright" -ForegroundColor Red
    pause
    exit 1
}

# Paso 4: Configurar variables de entorno
Write-Host "`n🔧 Configurando variables de entorno..." -ForegroundColor Blue
if (!(Test-Path ".env.local")) {
    Copy-Item ".env.example" ".env.local"
    Write-Host "✅ Archivo .env.local creado desde .env.example" -ForegroundColor Green
    Write-Host "⚠️  IMPORTANTE: Edita .env.local con tus credenciales reales" -ForegroundColor Yellow
    Write-Host "📝 Las credenciales actuales son de ejemplo" -ForegroundColor Yellow
} else {
    Write-Host "✅ Archivo .env.local ya existe" -ForegroundColor Green
}

# Paso 5: Verificar configuración
Write-Host "`n🧪 Verificando configuración..." -ForegroundColor Blue
if (Test-Path "tests/login-simple.spec.js") {
    Write-Host "✅ Test principal encontrado" -ForegroundColor Green
} else {
    Write-Host "❌ Test principal no encontrado" -ForegroundColor Red
}

if (Test-Path "playwright.config.js") {
    Write-Host "✅ Configuración de Playwright encontrada" -ForegroundColor Green
} else {
    Write-Host "❌ Configuración de Playwright no encontrada" -ForegroundColor Red
}

# Paso 6: Mostrar comandos disponibles
Write-Host "`n🎯 Setup completado! Comandos disponibles:" -ForegroundColor Green
Write-Host ""
Write-Host "🧪 Ejecutar tests:" -ForegroundColor White
Write-Host "   npm test                    # Ejecutar todos los tests" -ForegroundColor Gray
Write-Host "   npm run test:headed         # Con navegador visible" -ForegroundColor Gray
Write-Host "   npm run test:ui             # Con interfaz de Playwright" -ForegroundColor Gray
Write-Host ""
Write-Host "📊 Scripts PowerShell:" -ForegroundColor White
Write-Host "   .\ejecutar-test-mejorado.ps1   # Test completo con limpieza" -ForegroundColor Gray
Write-Host "   .\run-test.ps1                  # Test básico" -ForegroundColor Gray
Write-Host ""
Write-Host "📄 Ver reportes:" -ForegroundColor White
Write-Host "   npm run test:report         # Abrir reporte HTML" -ForegroundColor Gray
Write-Host "   # Los PDFs se generan en test-results/" -ForegroundColor Gray
Write-Host ""
Write-Host "🔧 Debugging:" -ForegroundColor White
Write-Host "   .\run-debug-confirmar.ps1   # Test con debugging" -ForegroundColor Gray

# Paso 7: Información adicional
Write-Host "`n📚 Información adicional:" -ForegroundColor Yellow
Write-Host "📂 Estructura del proyecto:" -ForegroundColor White
Write-Host "   tests/           # Tests de Playwright" -ForegroundColor Gray
Write-Host "   test-results/    # Screenshots y reportes" -ForegroundColor Gray
Write-Host "   playwright-report/ # Reportes HTML de Playwright" -ForegroundColor Gray
Write-Host ""
Write-Host "🌐 Enlaces útiles:" -ForegroundColor White
Write-Host "   📖 Documentación: README.md" -ForegroundColor Gray
Write-Host "   📝 Changelog: CHANGELOG.md" -ForegroundColor Gray
Write-Host "   🐛 Reportar issues: https://github.com/JFCandia/Automatizacion-DTE/issues" -ForegroundColor Gray
Write-Host ""
Write-Host "👨‍💻 Desarrollado por Juan Francisco Candia" -ForegroundColor Cyan
Write-Host "🏢 Baplica S.A. - Área de Sistemas" -ForegroundColor Cyan
Write-Host "📧 juan.candia@baplica.cl" -ForegroundColor Cyan

Write-Host "`n🎉 ¡Setup completado exitosamente!" -ForegroundColor Green
Write-Host "💡 Para comenzar, ejecuta: npm test" -ForegroundColor Yellow

pause
