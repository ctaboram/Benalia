// Script de prueba para el endpoint de contacto
// Ejecutar con: node test-contact-api.js

const testData = {
  name: "Carlos Test",
  email: "test@benalia.es",
  phone: "+34 666 777 888",
  service: "desarrollo-web",
  message: "Este es un mensaje de prueba del sistema de contacto. Verificando que todo funciona correctamente."
};

async function testContactEndpoint() {
  console.log('🧪 Iniciando prueba del endpoint de contacto...\n');
  
  try {
    const response = await fetch('http://localhost:4321/api/contact', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(testData)
    });
    
    const result = await response.json();
    
    console.log('📊 Resultado de la prueba:');
    console.log('Status:', response.status);
    console.log('Success:', result.success);
    
    if (result.success) {
      console.log('✅ ÉXITO - El endpoint funciona correctamente');
      console.log('📧 Mensaje:', result.message);
      if (result.data) {
        console.log('📋 ID:', result.data.id);
        console.log('⏰ Timestamp:', result.data.timestamp);
        console.log('📨 Emails enviados:', result.data.emailsSent);
      }
    } else {
      console.log('❌ ERROR - El endpoint reportó un fallo');
      console.log('🔍 Error:', result.error);
      if (result.errors) {
        console.log('📝 Errores de validación:', result.errors);
      }
    }
    
  } catch (error) {
    console.log('💥 ERROR DE CONEXIÓN');
    console.log('🔍 Detalles:', error.message);
    console.log('');
    console.log('💡 Posibles causas:');
    console.log('   - El servidor no está corriendo (ejecutar: npm run dev)');
    console.log('   - Variables de entorno no configuradas');
    console.log('   - Problemas de red/firewall');
  }
  
  console.log('\n🏁 Prueba completada');
}

// Solo ejecutar si no tenemos dependencias de Node.js instaladas
if (typeof fetch === 'undefined') {
  console.log('❌ Este script requiere Node.js 18+ con soporte para fetch');
  console.log('💡 Alternativa: Prueba el formulario directamente en http://localhost:4321');
} else {
  testContactEndpoint();
}