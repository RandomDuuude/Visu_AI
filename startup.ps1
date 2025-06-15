$PYTHON_DIR = "./AI_Server"
$NODE_DIR = "./ChromeExtensionNode"
$REACT_DIR = "./threed-render"

Write-Output "Starting all servers..."
Write-Output ""

# Verify paths exist before proceeding
if (!(Test-Path $PYTHON_DIR)) { Write-Output "⚠️ Python directory not found: $PYTHON_DIR"; exit }
if (!(Test-Path $NODE_DIR)) { Write-Output "⚠️ Node directory not found: $NODE_DIR"; exit }
if (!(Test-Path $REACT_DIR)) { Write-Output "⚠️ React directory not found: $REACT_DIR"; exit }

Write-Output "[1/3] Starting Python server..."
Start-Process -FilePath "cmd.exe" -ArgumentList "/k cd /d $PYTHON_DIR && python3 app.py" -WindowStyle Normal

Write-Output "Waiting 1 second..."
Start-Sleep -Seconds 1

Write-Output "[2/3] Starting Node app..."
Start-Process -FilePath "cmd.exe" -ArgumentList "/k cd /d $NODE_DIR && npm i && npm start" -WindowStyle Normal

Write-Output "[3/3] Starting React App..."
Start-Process -FilePath "cmd.exe" -ArgumentList "/k cd /d $REACT_DIR && npm i && npm start" -WindowStyle Normal

Write-Output "All servers started!"
Pause



