$testData = @{
    name = "Test User"
    email = "test@benalia.es"
    phone = "+34 666 777 888"
    service = "desarrollo-web"
    message = "Este es un mensaje de prueba del sistema de contacto."
} | ConvertTo-Json

try {
    Write-Host "🧪 Probando endpoint de contacto..." -ForegroundColor Cyan
    
    $response = Invoke-RestMethod -Uri "http://localhost:4321/api/contact" -Method POST -Body $testData -ContentType "application/json"
    
    Write-Host "✅ ÉXITO - El endpoint funciona correctamente" -ForegroundColor Green
    Write-Host "📧 Mensaje: $($response.message)" -ForegroundColor Yellow
    
    if ($response.data) {
        Write-Host "📋 ID: $($response.data.id)" -ForegroundColor Gray
        Write-Host "⏰ Timestamp: $($response.data.timestamp)" -ForegroundColor Gray
        Write-Host "📨 Emails enviados:" -ForegroundColor Gray
        Write-Host "   Cliente: $($response.data.emailsSent.client)" -ForegroundColor Gray  
        Write-Host "   Interno: $($response.data.emailsSent.internal)" -ForegroundColor Gray
    }
    
} catch {
    Write-Host "❌ ERROR:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    
    if ($_.Exception.Response) {
        Write-Host "Código de estado: $($_.Exception.Response.StatusCode)" -ForegroundColor Red
    }
}