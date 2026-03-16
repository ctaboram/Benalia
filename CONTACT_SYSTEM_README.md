# Sistema de Formulario de Contacto - Benalia Tech

## 📋 Resumen
Sistema completo de formulario de contacto con validación, persistencia en base de datos, envío de emails automáticos y rate limiting para prevenir spam.

## 🏗️ Arquitectura

### Frontend (`src/components/Contact.astro`)
- **Formulario interactivo** con validación en tiempo real
- **Estados visuales** para campos (normal/válido/error)
- **Integración con API** mediante fetch
- **Manejo de errores** y mensajes de estado
- **Accesibilidad** completa con ARIA labels

### Backend API (`src/pages/api/contact.js`)
- **Endpoint POST** `/api/contact` para recibir formularios
- **Rate limiting** (3 requests por minuto por IP)
- **Validación robusta** de datos con Zod
- **Sanitización** para prevenir XSS
- **Persistencia** en PostgreSQL
- **Emails automáticos** con Resend

### Servicios de Soporte

#### Validación (`src/lib/validation.js`)
- Schema Zod para validación de datos
- Rate limiting en memoria
- Sanitización de datos
- Detección de IP del cliente

#### Base de Datos (`src/lib/database.js`)
- Conexión con PostgreSQL (Vercel)
- Función para insertar contactos
- Función para consultar contactos
- Manejo de errores de BD

#### Sistema de Emails (`src/lib/email.js`)
- Integración con Resend
- Email de confirmación al cliente
- Email de notificación al equipo
- Plantillas HTML responsive

## 📁 Estructura de Archivos
```
src/
├── components/
│   └── Contact.astro           # Componente principal del formulario
├── pages/api/
│   └── contact.js              # Endpoint de la API
└── lib/
    ├── validation.js           # Validación y sanitización
    ├── database.js             # Operaciones de base de datos
    └── email.js                # Sistema de emails
```

## 🚀 Instalación y Configuración

### 1. Instalar Dependencias
```bash
npm install zod resend @vercel/postgres
```

### 2. Variables de Entorno
Copiar `.env.example` a `.env` y configurar:

```env
# Base de datos PostgreSQL (Vercel)
POSTGRES_URL="postgresql://user:pass@host:port/db"
POSTGRES_URL_NON_POOLING="postgresql://user:pass@host:port/db"

# Email service (Resend)
RESEND_API_KEY="re_xxxxxxxxxxxxxxxxxxxxxxxxx"

# Configuración de la empresa
COMPANY_EMAIL="benaliatech@gmail.com"
COMPANY_PHONE="+34 612 345 678"
COMPANY_NAME="Benalia Tech"
APP_URL="https://benalia.es"
```

### 3. Configurar Base de Datos
El sistema creará automáticamente la tabla `contacts` en PostgreSQL:

```sql
CREATE TABLE IF NOT EXISTS contacts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(20),
  service VARCHAR(50),
  message TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  ip_address INET,
  user_agent TEXT
);
```

### 4. Configurar Resend
1. Crear cuenta en [Resend](https://resend.com)
2. Obtener API key
3. Configurar dominio de envío
4. Actualizar `RESEND_API_KEY` en `.env`

## 🔧 Funcionalidades

### Validación de Datos
- **Nombre**: 2-100 caracteres, requerido
- **Email**: Formato válido, requerido  
- **Teléfono**: Formato internacional, opcional
- **Servicio**: Lista predefinida, opcional
- **Mensaje**: 10-2000 caracteres, requerido

### Rate Limiting
- **Límite**: 3 requests por minuto por IP
- **Ventana**: 60 segundos
- **Almacenamiento**: En memoria (Map)
- **Limpieza**: Automática cada hora

### Emails Automáticos

#### Email al Cliente
- Confirmación de recibo
- Tiempo estimado de respuesta
- Información de contacto alternativa

#### Email al Equipo
- Notificación de nuevo contacto
- Todos los datos del formulario
- Metadatos (IP, timestamp, user agent)

### Persistencia
- **Base de datos**: PostgreSQL via @vercel/postgres
- **Tabla**: `contacts` con todos los campos
- **Metadatos**: IP, timestamp, user agent
- **Error handling**: Continúa aunque falle la BD

## 📱 Frontend Features

### Estados del Formulario
- **Normal**: Estado inicial
- **Válido**: Campo validado correctamente (verde)
- **Error**: Campo con errores (rojo)
- **Enviando**: Botón deshabilitado con spinner

### Validación en Tiempo Real
- **onBlur**: Valida cuando el usuario deja el campo
- **onInput**: Valida 500ms después de dejar de escribir
- **onFocus**: Reset al estado normal si está vacío

### Mensajes de Estado
- **Éxito**: Confirmación de envío
- **Error**: Errores específicos o generales
- **Info**: Información de contacto alternativa

## 🔒 Seguridad

### Sanitización
- HTML entities para prevenir XSS
- Trimming de espacios
- Validación de tipos de datos

### Rate Limiting
- Por IP del cliente
- Límites configurables
- Mensajes informativos

### Validación Robusta
- Schema Zod en backend
- Validación adicional en frontend
- Manejo de errores comprehensivo

## 🎨 Estilos y UX

### Estados Visuales
- Colores diferenciados para cada estado
- Transiciones suaves
- Feedback inmediato

### Responsive Design
- Mobile-first approach
- Grid layout adaptativo
- Touch-friendly en móviles

### Accesibilidad
- ARIA labels completos
- Roles semánticos
- Navegación por teclado
- Screen reader compatible

## 🔍 Debugging

### Logs de Desarrollo
```javascript
console.log('📧 Procesando contacto:', { name, email, service });
```

### Variables de Debug
```env
EMAIL_DEBUG=true
SKIP_EMAIL_SENDING=false
SKIP_DB_OPERATIONS=false
```

### Estados de Error
- **400**: Datos inválidos
- **429**: Rate limit excedido
- **500**: Error interno del servidor

## 📊 Análisis y Métricas

### Datos Almacenados
- Información del contacto
- Timestamp de creación
- IP del cliente
- User agent
- Servicio de interés

### Rate Limiting Stats
- Requests por IP
- Ventanas de tiempo
- Reset automático

## 🚀 Deploy en Vercel

### 1. Variables de Entorno
Configurar en Dashboard de Vercel:
- `POSTGRES_URL`
- `RESEND_API_KEY`
- `COMPANY_EMAIL`
- `APP_URL`

### 2. Base de Datos
- Crear PostgreSQL en Vercel
- La tabla se crea automáticamente

### 3. Dominio de Email
- Configurar dominio en Resend
- Verificar DNS records

## 📈 Mejoras Futuras

### Funcionalidades
- [ ] Dashboard admin para ver contactos
- [ ] Integración con CRM
- [ ] Webhooks para notificaciones
- [ ] Analytics de conversión
- [ ] A/B testing del formulario

### Técnicas
- [ ] Queue system para emails
- [ ] Redis para rate limiting
- [ ] Validación con CAPTCHA
- [ ] Metrics y monitoring
- [ ] Tests automatizados

## 🆘 Troubleshooting

### Error: "Failed to fetch"
- Verificar que el servidor está corriendo
- Comprobar la URL del endpoint
- Revisar CORS headers

### Rate Limit Activado
- Esperar 1 minuto
- Verificar configuración de límites
- Limpiar caché si es necesario

### Emails No Enviados
- Verificar RESEND_API_KEY
- Comprobar dominio verificado
- Revisar logs del servidor

### Base de Datos
- Verificar POSTGRES_URL
- Comprobar permisos de escritura
- Revisar logs de conexión

---

## 📞 Soporte

Para soporte técnico:
- **Email**: benaliatech@gmail.com
- **Teléfono**: +34 612 345 678

**Sistema implementado**: ✅ Completo y funcional