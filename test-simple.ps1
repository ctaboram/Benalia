$body = '{"name":"Test User","email":"test@benalia.es","phone":"+34666777888","service":"desarrollo-web","message":"Mensaje de prueba del sistema de contacto"}'

try {
    Write-Host "🧪 Probando endpoint..." -ForegroundColor Cyan
    
    $response = Invoke-RestMethod -Uri "http://localhost:4321/api/contact" -Method POST -Body $body -ContentType "application/json"
    
    Write-Host "✅ ÉXITO!" -ForegroundColor Green
    Write-Host $response.message -ForegroundColor Yellow
    
} catch {
    Write-Host "❌ ERROR:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}