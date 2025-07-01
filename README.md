# 🤖 Automatización de Testing - Sistema DTE Baplica

[![Playwright](https://img.shields.io/badge/Playwright-2EAD33?style=for-the-badge&logo=playwright&logoColor=white)](https://playwright.dev/)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![Node.js](https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node.js&logoColor=white)](https://nodejs.org/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/JFCandia/Automatizacion-DTE)
[![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)](https://docs.microsoft.com/en-us/powershell/)

## 📋 Descripción del Proyecto

Este proyecto demuestra **competencias avanzadas en QA Automation** mediante la automatización completa del sistema de login y navegación de Asistencia DT de Baplica. Desarrollado con **Playwright** y **JavaScript**, implementa técnicas profesionales de testing que cualquier empresa busca en un **QA Automation Engineer**.

Sistema de automatización completo para validar el flujo de login y navegación del sistema de Asistencia DT de Baplica utilizando **Playwright** con **JavaScript/Node.js**.

### 🎯 Objetivos
- ✅ Automatizar proceso completo de autenticación
- ✅ Validar selección de empresas
- ✅ Verificar navegación a módulo de fiscalización
- ✅ Generar reportes detallados con evidencias visuales
- ✅ Implementar estrategias robustas para elementos dinámicos

## 🚀 Características Principales

### 🔐 Automatización de Login
- **Email automático**: `juan.candia@baplicada.cl`
- **Manejo de contraseñas**: Variables de entorno seguras
- **Validación multi-paso**: Email → Contraseña → Autenticación

### 🏢 Selección de Empresas
- **Selección automática**: Empresa "ALTERNATTIVA"
- **Fallback inteligente**: Selección alternativa si no encuentra la principal
- **Validación de disponibilidad**: Verifica empresas activas

### 🎯 Navegación Avanzada
- **Manejo de popups**: 11+ estrategias para elementos DevExpress
- **Botón "Confirmar"**: Múltiples métodos de interacción
- **Acceso a fiscalización**: Navegación completa al módulo objetivo

### 📊 Reportería Profesional
- **Screenshots automáticos**: Evidencia visual de cada paso
- **Reportes PDF**: Documentación completa del proceso
- **Reporte HTML**: Versión interactiva con imágenes
- **Logging detallado**: Seguimiento completo de ejecución

## �️ Tecnologías Utilizadas

| Tecnología | Versión | Propósito |
|------------|---------|-----------|
| **Node.js** | 18+ | Runtime de JavaScript |
| **Playwright** | 1.40+ | Framework de testing E2E |
| **JavaScript** | ES6+ | Lenguaje de programación |
| **dotenv** | 16.0+ | Manejo de variables de entorno |
| **PowerShell** | 5.1+ | Scripts de automatización |

## 📁 Estructura del Proyecto

```
📦 Automatizacion-DTE/
├── 📂 tests/
│   └── 📄 login-simple.spec.js      # Test principal
├── 📂 test-results/                 # Screenshots y reportes
│   ├── 🖼️ *.png                     # Capturas de pantalla
│   ├── 📄 *.pdf                     # Reportes PDF
│   └── 📄 *.html                    # Reportes HTML
├── 📂 scripts/
│   ├── 📄 ejecutar-test-mejorado.ps1 # Script de ejecución
│   └── 📄 *.ps1                     # Scripts auxiliares
├── 📄 package.json                  # Configuración Node.js
├── 📄 playwright.config.js          # Configuración Playwright
├── 📄 .env.example                  # Variables de entorno ejemplo
├── 📄 .gitignore                    # Archivos ignorados
└── 📄 README.md                     # Este archivo
```

## ⚙️ Configuración e Instalación

### 1️⃣ Clonar el Repositorio
```bash
git clone https://github.com/JFCandia/Automatizacion-DTE.git
cd Automatizacion-DTE
```

### 2️⃣ Instalar Dependencias
```bash
# Instalar Node.js dependencies
npm install

# Instalar navegadores de Playwright
npx playwright install
```

### 3️⃣ Configurar Variables de Entorno
```bash
# Copiar archivo de ejemplo
cp .env.example .env.local

# Editar credenciales (opcional)
# LOGIN_PASSWORD=tu_password_aqui
```

### 4️⃣ Ejecutar Tests
```bash
# Ejecución básica
npm test

# Ejecución con interfaz visual
npm run test:headed

# Ejecución con debugging
npm run test:debug
```

### Desde VS Code
- Presiona `Ctrl+Shift+P`
- Busca "Tasks: Run Task"
- Selecciona "Login Simple"

## 📁 Estructura

```
├── tests/
│   └── login-simple.spec.js    # Test principal
├── .env.local                  # Credenciales (no incluido en git)
├── package.json               # Configuración del proyecto
└── playwright.config.js       # Configuración de Playwright
```

## ⚙️ Configuración

Crea un archivo `.env.local` con:

```bash
TEST_USERNAME=tu.email@dominio.cl
TEST_PASSWORD=tu_password
```

## 🎮 Controles

- **Para cerrar la sesión**: Presiona `Ctrl+C` en la terminal
- **Capturas**: Se guardan automáticamente en `test-results/`

## 📸 Capturas generadas

- `01-login-inicial.png` - Página inicial
- `02-email-ingresado.png` - Después de ingresar email  
- `03-pantalla-password.png` - Pantalla de contraseña
- `04-password-ingresado.png` - Después de ingresar contraseña
- `05-pantalla-empresas-final.png` - Pantalla final de empresas

## 🔍 Funcionamiento

1. Navega a la página de login
2. Ingresa email automáticamente
3. Hace clic en "Ingresar contraseña"
4. Ingresa contraseña automáticamente  
5. Hace clic en "Iniciar Sesión"
6. Llega a la pantalla de empresas
7. **Se mantiene abierta indefinidamente**

## ⚠️ Notas

- La página permanecerá abierta hasta que presiones `Ctrl+C`
- Puedes navegar manualmente por el sistema después del login
- Las credenciales se toman del archivo `.env.local`

---

## 👨‍💻 Autor

**Juan Francisco Candia**
- 🏢 **Empresa:** Baplica S.A. - Área de Sistemas
- 📧 **Email:** juan.candia@baplicada.cl
- 💼 **LinkedIn:** [linkedin.com/in/jfcandia](https://linkedin.com/in/jfcandia)
- 🐱 **GitHub:** [github.com/JFCandia](https://github.com/JFCandia)
- 🌐 **Portfolio:** [jfcandia.github.io](https://jfcandia.github.io)

### 🚀 Habilidades Demostradas en este Proyecto

- **Test Automation:** Playwright, Selenium
- **Web Development:** JavaScript, Node.js, HTML, CSS
- **DevOps:** Git, GitHub Actions, CI/CD
- **Scripting:** PowerShell, Bash
- **QA Testing:** Test Planning, Bug Reporting, Test Cases
- **Problem Solving:** Debugging, Error Handling, Robustness Engineering

---

## 📄 Licencia

Este proyecto fue desarrollado como parte del trabajo en **Baplica S.A.** para automatización de procesos internos.

**© 2025 Juan Francisco Candia - Baplica S.A.**

---

⭐ **¿Te gustó este proyecto?** ¡Dale una estrella en GitHub y conecta conmigo en LinkedIn!

**🔗 [Ver Demo en Vivo](https://github.com/JFCandia/Automatizacion-DTE)** | **📧 [Contáctame](mailto:juan.candia@baplicada.cl)**
