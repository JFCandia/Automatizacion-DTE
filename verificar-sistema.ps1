# 🔍 Script de Verificación del Sistema - Automatización DTE
# Verificar que todo esté configurado correctamente

Write-Host "🔍 Verificando configuración del sistema..." -ForegroundColor Blue
Write-Host "👨‍💻 Autor: Juan Francisco Candia - Baplica S.A.`n" -ForegroundColor Cyan

$errores = @()
$warnings = @()

# Verificar Node.js
Write-Host "📋 Verificando Node.js..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "  ✅ Node.js: $nodeVersion" -ForegroundColor Green
} catch {
    $errores += "❌ Node.js no encontrado"
}

# Verificar npm
try {
    $npmVersion = npm --version
    Write-Host "  ✅ npm: $npmVersion" -ForegroundColor Green
} catch {
    $errores += "❌ npm no encontrado"
}

# Verificar archivos clave
Write-Host "`n📋 Verificando archivos del proyecto..." -ForegroundColor Yellow
$archivosRequeridos = @(
    "package.json",
    "playwright.config.js", 
    "tests/login-simple.spec.js",
    "README.md",
    ".env.example"
)

foreach ($archivo in $archivosRequeridos) {
    if (Test-Path $archivo) {
        Write-Host "  ✅ $archivo" -ForegroundColor Green
    } else {
        $errores += "❌ Archivo faltante: $archivo"
    }
}

# Verificar node_modules
Write-Host "`n📋 Verificando dependencias..." -ForegroundColor Yellow
if (Test-Path "node_modules") {
    Write-Host "  ✅ node_modules existe" -ForegroundColor Green
    
    # Verificar Playwright específicamente
    if (Test-Path "node_modules/@playwright") {
        Write-Host "  ✅ Playwright instalado" -ForegroundColor Green
    } else {
        $warnings += "⚠️  Playwright podría no estar instalado correctamente"
    }
} else {
    $errores += "❌ node_modules no encontrado - ejecuta 'npm install'"
}

# Verificar variables de entorno
Write-Host "`n📋 Verificando configuración..." -ForegroundColor Yellow
if (Test-Path ".env.local") {
    Write-Host "  ✅ .env.local existe" -ForegroundColor Green
} else {
    $warnings += "⚠️  .env.local no existe - se usarán valores por defecto"
}

# Verificar Git
Write-Host "`n📋 Verificando Git..." -ForegroundColor Yellow
try {
    $gitVersion = git --version
    Write-Host "  ✅ Git: $gitVersion" -ForegroundColor Green
    
    # Verificar si estamos en un repo Git
    if (Test-Path ".git") {
        $gitRemote = git remote get-url origin 2>$null
        if ($gitRemote) {
            Write-Host "  ✅ Repositorio Git configurado: $gitRemote" -ForegroundColor Green
        } else {
            $warnings += "⚠️  No hay remote configurado"
        }
    } else {
        $warnings += "⚠️  No es un repositorio Git"
    }
} catch {
    $warnings += "⚠️  Git no encontrado"
}

# Verificar PowerShell version
Write-Host "`n📋 Verificando PowerShell..." -ForegroundColor Yellow
$psVersion = $PSVersionTable.PSVersion
Write-Host "  ✅ PowerShell: $psVersion" -ForegroundColor Green

# Verificar scripts de ejecución
Write-Host "`n📋 Verificando scripts..." -ForegroundColor Yellow
$scripts = @(
    "ejecutar-test-mejorado.ps1",
    "setup-completo.ps1",
    "run-test.ps1"
)

foreach ($script in $scripts) {
    if (Test-Path $script) {
        Write-Host "  ✅ $script" -ForegroundColor Green
    } else {
        $warnings += "⚠️  Script faltante: $script"
    }
}

# Verificar espacio en disco
Write-Host "`n📋 Verificando recursos del sistema..." -ForegroundColor Yellow
$drive = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:'"
$freeSpaceGB = [math]::Round($drive.FreeSpace / 1GB, 2)
Write-Host "  ✅ Espacio libre en C: $freeSpaceGB GB" -ForegroundColor Green

if ($freeSpaceGB -lt 1) {
    $warnings += "⚠️  Poco espacio en disco (menos de 1GB libre)"
}

# Mostrar resumen
Write-Host "`n" + "="*60 -ForegroundColor White
Write-Host "📊 RESUMEN DE VERIFICACIÓN" -ForegroundColor White
Write-Host "="*60 -ForegroundColor White

if ($errores.Count -eq 0) {
    Write-Host "🎉 CONFIGURACIÓN COMPLETA" -ForegroundColor Green
    Write-Host "✅ Todos los componentes críticos están presentes" -ForegroundColor Green
} else {
    Write-Host "❌ ERRORES ENCONTRADOS ($($errores.Count))" -ForegroundColor Red
    foreach ($error in $errores) {
        Write-Host "   $error" -ForegroundColor Red
    }
}

if ($warnings.Count -gt 0) {
    Write-Host "`n⚠️  ADVERTENCIAS ($($warnings.Count))" -ForegroundColor Yellow
    foreach ($warning in $warnings) {
        Write-Host "   $warning" -ForegroundColor Yellow
    }
}

Write-Host "`n📋 COMANDOS RECOMENDADOS:" -ForegroundColor Cyan
if ($errores.Count -eq 0) {
    Write-Host "   npm test                    # Ejecutar tests" -ForegroundColor White
    Write-Host "   .\ejecutar-test-mejorado.ps1   # Test completo" -ForegroundColor White
    Write-Host "   npm run test:ui             # Interfaz visual" -ForegroundColor White
} else {
    Write-Host "   .\setup-completo.ps1        # Configurar proyecto" -ForegroundColor White
    Write-Host "   npm install                 # Instalar dependencias" -ForegroundColor White
}

Write-Host "`n📞 SOPORTE:" -ForegroundColor Cyan
Write-Host "   📧 juan.candia@baplica.cl" -ForegroundColor White
Write-Host "   🐛 https://github.com/JFCandia/Automatizacion-DTE/issues" -ForegroundColor White

if ($errores.Count -eq 0) {
    Write-Host "`n🚀 ¡Sistema listo para usar!" -ForegroundColor Green
} else {
    Write-Host "`n🔧 Soluciona los errores antes de continuar" -ForegroundColor Yellow
}

pause
