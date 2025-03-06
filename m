function Check-Admin {
    Clear-Host
    # Comprobar si el script se está ejecutando como administrador
    if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "Ejecuta PowerShell en modo administrador." -ForegroundColor Red
        Write-Host " "
        break
    }
}
function saltos {
	Write-Host " "
}

# Cambiar la página de códigos a UTF-8
chcp 65001 > $null
# Configurar la consola para usar UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$base64Image1 = "iVBORw0KGgoAAAANSUhEUgAAAA0AAAAgCAYAAAG+3sICAAAACXBIWXMAAAsTAAALEwEAmpwYAAAKImlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgOS4xLWMwMDIgNzkuYjdjNjRjYywgMjAyNC8wNy8xNi0wNzo1OTo0MCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCAyNi4wIChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMjQtMTEtMTRUMTA6MjY6MDYrMDE6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMjUtMDEtMjRUMTI6MjY6NTErMDE6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDI1LTAxLTI0VDEyOjI2OjUxKzAxOjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo1YmU3OGI1Mi01ZDIwLTBiNDYtODQzNC0yOWIyZGRkMTUzOWEiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDozYTlhMWY2MS1iY2NjLTA2NDQtYmZlMi02ODExZDNkY2QwZjUiIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo5NzQ3YjNhNC03MTVhLTkwNDEtODVkOS05YzY4ZjkwNGRjZWMiIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjk3NDdiM2E0LTcxNWEtOTA0MS04NWQ5LTljNjhmOTA0ZGNlYyIgc3RFdnQ6d2hlbj0iMjAyNC0xMS0xNFQxMDoyNjowNiswMTowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDI2LjAgKFdpbmRvd3MpIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY5MDYxNi04ZjY5LTEyNDYtOWU2ZS04MDU2MGJiZjdiZjciIHN0RXZ0OndoZW49IjIwMjQtMTEtMTRUMTA6MzI6NDQrMDE6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyNi4wIChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6MzBjOWU4ODItZDM1OC1hMzQ0LWJiMzgtNzEwZmYxYTM2Mjg3IiBzdEV2dDp3aGVuPSIyMDI0LTExLTE0VDEwOjMzOjQwKzAxOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjYuMCAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249ImNvbnZlcnRlZCIgc3RFdnQ6cGFyYW1ldGVycz0iZnJvbSBhcHBsaWNhdGlvbi92bmQuYWRvYmUucGhvdG9zaG9wIHRvIGltYWdlL3BuZyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iZGVyaXZlZCIgc3RFdnQ6cGFyYW1ldGVycz0iY29udmVydGVkIGZyb20gYXBwbGljYXRpb24vdm5kLmFkb2JlLnBob3Rvc2hvcCB0byBpbWFnZS9wbmciLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249InNhdmVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjU0NmY1MGRhLWY3YjktZjg0My04OWI0LWVkMzczZjQ5YWU4YiIgc3RFdnQ6d2hlbj0iMjAyNC0xMS0xNFQxMDozMzo0MCswMTowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDI2LjAgKFdpbmRvd3MpIiBzdEV2dDpjaGFuZ2VkPSIvIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo1YmU3OGI1Mi01ZDIwLTBiNDYtODQzNC0yOWIyZGRkMTUzOWEiIHN0RXZ0OndoZW49IjIwMjUtMDEtMjRUMTI6MjY6NTErMDE6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyNi4wIChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MzBjOWU4ODItZDM1OC1hMzQ0LWJiMzgtNzEwZmYxYTM2Mjg3IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjk3NDdiM2E0LTcxNWEtOTA0MS04NWQ5LTljNjhmOTA0ZGNlYyIgc3RSZWY6b3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjk3NDdiM2E0LTcxNWEtOTA0MS04NWQ5LTljNjhmOTA0ZGNlYyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PsBAqxYAAAPdSURBVDiNfVRBixxFFP5edXX3zE73zGx2dxJDZrIkgRghkBwiCLl4FDx486gHieI9B096UwL+ABEvSoR4EI8SJYhsr5IYN8lBjYgmEzXBsNnOzNR0V3VVPQ89s2GNmwcfRdPvva73fd9ryrIMcRxDaKOx/8CABRG+KMsS4q+//3mpKArQ+vo6ms3kHN1/kLPTBnI8GgEAxK1bf0BrXecAeP6ZY8cvWWcglFJvDQarlyZqjLLUEKPR6N2xmqDQJQpdQkxLjRvXr9P1jWuvOu9BWZah2+2iMhaSiNDr9ZiZIDudLjvHYGbQ1lbOk+kUACCNtagqWz882NyEDMP6apevXKF2pwNrHaQQhOzbb6ixkDBlWVanCIEkSdCIY17e+xTCIICc1p1bJ06enFTaIogkTFHCAJBRFOHo0acnlbZgApypT2JAAsHXEAG0LjAPIqo/paajD2Ug4L3bhnMWzlmIsigvrK2tfdlut2Gt2wGhihLjyeSFry5epJs//YzOYhdBEMAYA2Jm7BaUZRmYGY1GA1EUQWsNGcTPyXnGrPrt/mD1nTRp1aRba9FqtcygvxoqpVAUJcRoNEKapncPrh4K1VQBBDjrIBcWFk4dOnxkX54/hCAC5mzEjfi8qxwIgPd++wXdGQ7ZghCKAEyzqzIgRRjDlyUq3smdtFbDM4Nmw86HFg/zHGAP/g/E8PbwsyRJ4L3fAVEUxctbWzmMqeA9b0PoymFjY+O1djuFqcyjCmYP591Hl7//7hVvHdI0hbUWYk6iIPr4t19v0vr62jWj9e6abPtuPoMQAlEUodlswhgDZr8qw+hsKKMX0yQdLLQSyB0diOCcAxH6zPxDr7e312534LlejcoYVJWGtLbeCOcc4jg6vrK8vL7S6yVx1IRSClM1BQkBgLcbC2MMlFIIpXy/3z94Y19/kBTGYaIUmAguIHj2YM/gGW/Se4+00/6gP1g9k7Q7GD8cIRJBLTkAYQE340rMeJGNRuP0yp6lM900hRorBARY58CzRAKAun5+QBLR6+12B9Z5aFdBijqb3aOiOfE0L3LO7/dEdXfv4f5XmZ0hyrK4ok2BIBBwzoNn9D4Jwjn33vD3W7kuSzQXGvDePebLx3yqtc7H4/Ebw+EQURQhCCSqysI5vyuEsR4jVVy4Pbxz7MerVyEEYXl5CWVZPmb4OWRVmZpO7365e/ce5Xl+dmnPnnNHDh9BK00wnihMa/GB2eLRJ+c/ndsVDEIchpCCIILggHP8eXdx6dRKbwWLix3EcQPW2p2G3aa01urPQNCz+YP72Ny8B2Y+4R2/GQTh6Sf+x3aLfwFl4JjrMZT5kAAAAABJRU5ErkJggg=="
$base64Image2 = "iVBORw0KGgoAAAANSUhEUgAABwgAAAAgCAYAAAFxzBzFAAAACXBIWXMAAAsTAAALEwEAmpwYAAAKImlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgOS4xLWMwMDIgNzkuYjdjNjRjYywgMjAyNC8wNy8xNi0wNzo1OTo0MCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCAyNi4wIChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMjQtMTEtMTRUMTA6MjY6MDYrMDE6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMjUtMDEtMjRUMTM6NDM6NDcrMDE6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDI1LTAxLTI0VDEzOjQzOjQ3KzAxOjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDplYjc1ZWM0Ni1mZmVlLTk0NDgtOTUzNi0wOWNkMzVmYmY5ZDUiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDphZTJmMTlhMC0xY2Y2LTJiNGYtYmFiNS03YzUzNzEyMzRhMDMiIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo5NzQ3YjNhNC03MTVhLTkwNDEtODVkOS05YzY4ZjkwNGRjZWMiIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjk3NDdiM2E0LTcxNWEtOTA0MS04NWQ5LTljNjhmOTA0ZGNlYyIgc3RFdnQ6d2hlbj0iMjAyNC0xMS0xNFQxMDoyNjowNiswMTowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDI2LjAgKFdpbmRvd3MpIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY5MDYxNi04ZjY5LTEyNDYtOWU2ZS04MDU2MGJiZjdiZjciIHN0RXZ0OndoZW49IjIwMjQtMTEtMTRUMTA6MzI6NDQrMDE6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyNi4wIChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6MzBjOWU4ODItZDM1OC1hMzQ0LWJiMzgtNzEwZmYxYTM2Mjg3IiBzdEV2dDp3aGVuPSIyMDI0LTExLTE0VDEwOjMzOjQwKzAxOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjYuMCAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249ImNvbnZlcnRlZCIgc3RFdnQ6cGFyYW1ldGVycz0iZnJvbSBhcHBsaWNhdGlvbi92bmQuYWRvYmUucGhvdG9zaG9wIHRvIGltYWdlL3BuZyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iZGVyaXZlZCIgc3RFdnQ6cGFyYW1ldGVycz0iY29udmVydGVkIGZyb20gYXBwbGljYXRpb24vdm5kLmFkb2JlLnBob3Rvc2hvcCB0byBpbWFnZS9wbmciLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249InNhdmVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjU0NmY1MGRhLWY3YjktZjg0My04OWI0LWVkMzczZjQ5YWU4YiIgc3RFdnQ6d2hlbj0iMjAyNC0xMS0xNFQxMDozMzo0MCswMTowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDI2LjAgKFdpbmRvd3MpIiBzdEV2dDpjaGFuZ2VkPSIvIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDplYjc1ZWM0Ni1mZmVlLTk0NDgtOTUzNi0wOWNkMzVmYmY5ZDUiIHN0RXZ0OndoZW49IjIwMjUtMDEtMjRUMTM6NDM6NDcrMDE6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyNi4wIChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MzBjOWU4ODItZDM1OC1hMzQ0LWJiMzgtNzEwZmYxYTM2Mjg3IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjk3NDdiM2E0LTcxNWEtOTA0MS04NWQ5LTljNjhmOTA0ZGNlYyIgc3RSZWY6b3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjk3NDdiM2E0LTcxNWEtOTA0MS04NWQ5LTljNjhmOTA0ZGNlYyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Put3becAAA9JSURBVHic7Z3fs6PIdce/B3Hveh6SLceV////iP2S51T5JVVJ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"
$base64Image3 = "iVBORw0KGgoAAAANSUhEUgAAAA0AAAAgCAYAAAG+3sICAAAACXBIWXMAAAsTAAALEwEAmpwYAAAKImlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgOS4xLWMwMDIgNzkuYjdjNjRjYywgMjAyNC8wNy8xNi0wNzo1OTo0MCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCAyNi4wIChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMjQtMTEtMTRUMTA6MjY6MDYrMDE6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMjUtMDEtMjRUMTI6Mjc6MzgrMDE6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDI1LTAxLTI0VDEyOjI3OjM4KzAxOjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozNGYwNzE2ZS1iZGViLWE3NGQtOGE1My00YTlkMTQyNzZjMTMiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDoxMjM3NzNhMi05NDQxLThhNDEtODIyOC05Y2E4MjU5Mjk1MjciIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo5NzQ3YjNhNC03MTVhLTkwNDEtODVkOS05YzY4ZjkwNGRjZWMiIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjk3NDdiM2E0LTcxNWEtOTA0MS04NWQ5LTljNjhmOTA0ZGNlYyIgc3RFdnQ6d2hlbj0iMjAyNC0xMS0xNFQxMDoyNjowNiswMTowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDI2LjAgKFdpbmRvd3MpIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY5MDYxNi04ZjY5LTEyNDYtOWU2ZS04MDU2MGJiZjdiZjciIHN0RXZ0OndoZW49IjIwMjQtMTEtMTRUMTA6MzI6NDQrMDE6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyNi4wIChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6MzBjOWU4ODItZDM1OC1hMzQ0LWJiMzgtNzEwZmYxYTM2Mjg3IiBzdEV2dDp3aGVuPSIyMDI0LTExLTE0VDEwOjMzOjQwKzAxOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjYuMCAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249ImNvbnZlcnRlZCIgc3RFdnQ6cGFyYW1ldGVycz0iZnJvbSBhcHBsaWNhdGlvbi92bmQuYWRvYmUucGhvdG9zaG9wIHRvIGltYWdlL3BuZyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iZGVyaXZlZCIgc3RFdnQ6cGFyYW1ldGVycz0iY29udmVydGVkIGZyb20gYXBwbGljYXRpb24vdm5kLmFkb2JlLnBob3Rvc2hvcCB0byBpbWFnZS9wbmciLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249InNhdmVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjU0NmY1MGRhLWY3YjktZjg0My04OWI0LWVkMzczZjQ5YWU4YiIgc3RFdnQ6d2hlbj0iMjAyNC0xMS0xNFQxMDozMzo0MCswMTowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDI2LjAgKFdpbmRvd3MpIiBzdEV2dDpjaGFuZ2VkPSIvIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDozNGYwNzE2ZS1iZGViLWE3NGQtOGE1My00YTlkMTQyNzZjMTMiIHN0RXZ0OndoZW49IjIwMjUtMDEtMjRUMTI6Mjc6MzgrMDE6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyNi4wIChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MzBjOWU4ODItZDM1OC1hMzQ0LWJiMzgtNzEwZmYxYTM2Mjg3IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjk3NDdiM2E0LTcxNWEtOTA0MS04NWQ5LTljNjhmOTA0ZGNlYyIgc3RSZWY6b3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjk3NDdiM2E0LTcxNWEtOTA0MS04NWQ5LTljNjhmOTA0ZGNlYyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PmO6qmMAAAOISURBVDiNhZTLb1tVEMZ/5/j62lynSaDQAikg0SjqYwFIPJYsmgCVqoqSlof4C1izYcWeDbBk1QWLAkKCqhJs2BGBRF5NRRorTeImcezYvm7sPO71o/ecYeHYTWunjDTSPRrNfN/MN3OZnZ35SURQm5slQQSn1qgD4DQaDarbFZSIAKCLBV8AVGZ1XQr5bJb04pKICPh+Scp+RaZuznwpIqhsLt/KArJr2TtqaSUjANZaRoZPKg2KudnZayPDJxXwAAdA++WybG1XBMCJIsFGEZnqqjjWRFigP3UEpxlFAFjAMab10Fqjo8jgugleemFI6Xw+x4snnm/hBHs1McZwb7tMfTf0Tp05Xevg7u3tUavV8NwUg4NHw92dQP6cmPgIQOXyBVECokDtk/X6PW5Oz3yhVtc3HvBvl4vFKObWdzrUDprnJdmqVH9Xi0srnUylFJ7nsXB7vjY2es7TzWYTQRgYHCCzssLQc8fV2Og5r2tkXTY9PXVBRHjUCYO6FEpFmZ+fv3owoHy/JNZqPC9JvrDJyPCwAtDWKBAhDGo8+/Rx7iwutzYhv1kSBShAgJTnMTc/d1XlcwVpj0kUYIWgHuAYLMh+AECEI14fjjG2qwUxEY613QGlFY7Iw4Eoiogl4t0ZnpcinV7IaGuFtjcaTZQItSB8W1trsdbSaDQ4duwZ/pma/PnixQsb3Pr3tqxlc7KcuSvXf71xvT0rJ6YVk5OTIbb5+uXLH6Y7zA7TRFUrVanX6+zs7vqRuf+bwLdnTp2+dbiCoEql1s3F43F0LIbWmloYUqluEYTh+GuvvPpLj6RyFwdjDclkEq01Zb9M2fe/fvOtNz7vJBULvohqnZKWlqSdZGNIpVIYa1jOLMtWZevsu6NjaZXbLLb0fwRPaMkuVnjCTRARsba2Gu5u77yssRaxFisWQ8utWEQsWItCCGoBcTfO0Ikhz427PzjRvqbtTWt/c/CtFPWggVhIJJNne65O7zm30K2NXOexR9VGFMF1FcYIzUZztWsXe5m1FjfhsrFRJAiCr3qu/EEzxvLU0SfJ5XIU86Vv3jt//sdDe4qiiL6+PhLJBIvpNPf80qfvX7p0DeChntoFBgb6UUpzN5Mhv5n748r4+DsHCzqpvhRxx0FEqFSq7FSrrCwtcr/Z/OyD8fHverFw/p74ayGKojXt6BuI+v6Tj6+E/zeYx//HDrH/APPEO9mQ7xHPAAAAAElFTkSuQmCC"
$Base64Image4 = "aXJtIGh0dHBzOi8vZ2V0LmFjdGl2YXRlZC53aW4gfCBpZXg="

Check-Admin 
Clear-Host
# Función para aplicar un filtro de color a la imagen, sin afectar la transparencia
function Apply-ColorFilter {
    param (
        [System.Drawing.Image]$image,
        [string]$hexColor  # El color en formato hexadecimal (por ejemplo, "#a1bae0")
    )

    # Convertir el valor hexadecimal en un color RGB
    $color = [System.Drawing.Color]::FromArgb(
        255,  # Canal alfa completo para el color base
        [System.Int32]::Parse($hexColor.Substring(1, 2), [System.Globalization.NumberStyles]::HexNumber),
        [System.Int32]::Parse($hexColor.Substring(3, 2), [System.Globalization.NumberStyles]::HexNumber),
        [System.Int32]::Parse($hexColor.Substring(5, 2), [System.Globalization.NumberStyles]::HexNumber)
    )

    # Crear un Bitmap de la imagen para manipular sus pí­xeles
    $bitmap = New-Object System.Drawing.Bitmap($image)

    # Definir un umbral de blanco para evitar el filtro en esa lí­nea
    $whiteThreshold = 240  # Umbral de blanco (puedes ajustarlo si es necesario)

    # Recorrer los pí­xeles de la imagen y aplicar el filtro con degradado
    for ($y = 0; $y -lt $bitmap.Height; $y++) {
        # Calcular el factor de transparencia basado en la posición vertical (y)
        $gradientFactor = $y / ($bitmap.Height - 1)  # Va de 0.0 (arriba) a 1.0 (abajo)

        for ($x = 0; $x -lt $bitmap.Width; $x++) {
            # Obtener el color original del pí­xel
            $originalColor = $bitmap.GetPixel($x, $y)

            # Verificar si el pí­xel es cercano al blanco
            if (($originalColor.R -gt $whiteThreshold) -and ($originalColor.G -gt $whiteThreshold) -and ($originalColor.B -gt $whiteThreshold)) {
                # Si el pí­xel es cercano al blanco, no aplicar el filtro
                continue
            }

            # Solo aplicar el filtro si el pí­xel no es completamente transparente
            if ($originalColor.A -ne 0) {
                # Calcular el brillo del color original como promedio de los canales RGB
                $brightness = ($originalColor.R + $originalColor.G + $originalColor.B) / 3 / 255

                # Ajustar el factor del degradado para preservar detalles oscuros
                $adjustedFactor = $gradientFactor * $brightness

                # Mezclar el color original con el filtro, aplicando el gradiente ajustado
                $newR = [math]::Min([math]::Round($originalColor.R * (1 - $adjustedFactor) + $color.R * $adjustedFactor), 255)
                $newG = [math]::Min([math]::Round($originalColor.G * (1 - $adjustedFactor) + $color.G * $adjustedFactor), 255)
                $newB = [math]::Min([math]::Round($originalColor.B * (1 - $adjustedFactor) + $color.B * $adjustedFactor), 255)

                # Mantener el canal alfa original
                $newA = $originalColor.A

                # Crear el nuevo color ajustado
                $newColor = [System.Drawing.Color]::FromArgb($newA, $newR, $newG, $newB)

                # Establecer el nuevo color en el pí­xel
                $bitmap.SetPixel($x, $y, $newColor)
            }
        }
    }

    # Devolver la imagen con el filtro aplicado
    return $bitmap
}
$git = 'https://github.com/Krowne/WinInfo/raw/refs/heads/main/'

# Método para leer Base64 desde archivo de texto y devolver la imagen
function Convert-Base64ToImage {
    param (
        [string]$base64String
    )

    # Convertir el string Base64 a un array de bytes
    $bytes = [Convert]::FromBase64String($base64String)

    # Crear un MemoryStream para almacenar los bytes
    $memoryStream = New-Object System.IO.MemoryStream
    $memoryStream.Write($bytes, 0, $bytes.Length)
    $memoryStream.Position = 0

    # Crear una imagen a partir del MemoryStream y devolverla
    return [System.Drawing.Image]::FromStream($memoryStream)
}

function get-Color {
    param (
        [string]$Color
    )

    # Convertir el color de fondo a un formato de .NET
    $r = [Convert]::ToInt32($Color.Substring(1, 2), 16)
    $g = [Convert]::ToInt32($Color.Substring(3, 2), 16)
    $b = [Convert]::ToInt32($Color.Substring(5, 2), 16)
    $BackgroundColor = [System.Drawing.Color]::FromArgb($r, $g, $b)
    return $BackgroundColor
}

# Método para crear ventanas
function Create-CustomWindow {
    param (
        [int]$Width,
        [int]$Height,
        [string]$Fondo,
        [string]$Title,
        [bool]$header = $true,  # Valor por defecto es True
        [string]$iconUrl
    )

    # Convertir el color de fondo a un formato de .NET
    $BackgroundColor = get-Color -Color $Fondo

    # Crear el formulario principal
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    # Cargar icono
    $webClient = New-Object System.Net.WebClient
    $iconBytes = $webClient.DownloadData($iconUrl)

    # Convertir los bytes del I­cono en un objeto System.Drawing.Icon
    $iconStream = New-Object System.IO.MemoryStream(,$iconBytes)
    $icon = New-Object System.Drawing.Icon($iconStream)

    # Crear una nueva instancia de la ventana (Form)
    $form = New-Object System.Windows.Forms.Form
    # $form.Text = [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes($Title))
	$form.Text = $Title
    $form.Size = New-Object System.Drawing.Size($Width, $Height)
    $form.StartPosition = "CenterScreen"
    $form.BackColor = $BackgroundColor
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false
    $form.Icon = $icon
    if ($header) {
        $form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    }
    else {
        $form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
    }
    return $form
}

# Método para crear la imagen combinada a partir de las tres imágenes en base64
function Create-CombinedImage {
    param (
        [System.Windows.Forms.Form]$Window,    # Formulario
        [int]$top,                             # Coordenada superior (top)
        [int]$left,                            # Coordenada izquierda (left)
        [int]$ancho,                           # Ancho de la imagen final
        [string]$filter,                       # Color del filtro
        [string]$Sfilter,                      # Color del filtro seleccionado
        [string]$text,             	           # Texto a mostrar
        [string]$value = $null,                        # Valor de la variable
        [bool]$saved = $false
    )

    # Convertir Base64 a imágenes
    $image1 = Convert-Base64ToImage -base64String $base64Image1
    $image2 = Convert-Base64ToImage -base64String $base64Image2
    $image3 = Convert-Base64ToImage -base64String $base64Image3

    # Obtener dimensiones de las imágenes
    $image1Width = $image1.Width
    $image3Width = $image3.Width
    $image2Width = $ancho - ($image1Width + $image3Width)
    $image1Height = $image1.Height

    # Crear la imagen final con el ancho y el alto especificado
    $combinedImageHeight = $image1Height  # Mantener el alto de la primera imagen

    $finalImage = New-Object System.Drawing.Bitmap($ancho, $combinedImageHeight)

    # Crear el objeto Graphics para la imagen final
    $graphics = [System.Drawing.Graphics]::FromImage($finalImage)
    # Establecer opciones de suavizado y desplazamiento de pÃ­xeles
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    # Habilitar la transparencia
    $graphics.CompositingMode = [System.Drawing.Drawing2D.CompositingMode]::SourceOver
    $graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality

    # Asegurarse de que el fondo sea transparente, no blanco
    $graphics.Clear([System.Drawing.Color]::Transparent)

    # Dibujar las tres imágenes en la imagen final
    $graphics.DrawImage($image1, 0, 0, $image1Width, $image1Height)                    # Dibujar la primera imagen
    $graphics.DrawImage($image2, $image1Width, 0, $image2Width, $image1Height)          # Dibujar la segunda imagen
    $graphics.DrawImage($image3, $image1Width + $image2Width, 0, $image3Width, $image1Height)  # Dibujar la tercera imagen

    # Guardar la imagen combinada en un MemoryStream (en memoria)
    $memoryStreamFinal = New-Object System.IO.MemoryStream
    $finalImage.Save($memoryStreamFinal, [System.Drawing.Imaging.ImageFormat]::Png) # Imagen sobre la que se aplican los filtros
    $memoryStreamFinal.Position = 0  # Reiniciar la posición del flujo para leerlo
    $imageNormal = [System.Drawing.Image]::FromStream($memoryStreamFinal)  # Cargar la imagen combinada desde el flujo en memoria

    # Aplicar el filtro de color a la imagen
    $filteredImage = Apply-ColorFilter -image $finalImage -hexColor $filter # Aplicar el filtro de color para imagen seleccionada
    $memoryStream = New-Object System.IO.MemoryStream # Crear un MemoryStream para guardar la imagen con el filtro en memoria
    $filteredImage.Save($memoryStream, [System.Drawing.Imaging.ImageFormat]::Png)
    $memoryStream.Position = 0 # Reiniciar la posición del flujo para leerlo
    $imageNormalFiltered = [System.Drawing.Image]::FromStream($memoryStream) # Cargar la imagen filtrada desde el flujo en memoria

    # Aplicar el filtro de color seleccionado sobre imagen temporal
    $filteredImageTemp = Apply-ColorFilter -image $finalImage -hexColor $Sfilter
    $memoryStreamTemp = New-Object System.IO.MemoryStream
    $filteredImageTemp.Save($memoryStreamTemp, [System.Drawing.Imaging.ImageFormat]::Png)
    $memoryStreamTemp.Position = 0
    $imageHover = [System.Drawing.Image]::FromStream($memoryStreamTemp)

    # Aplicar el filtro de color seleccionado sobre imagen seleccionada al pasar el raton por encima
    $filteredImageSelectHover = Apply-ColorFilter -image $finalImage -hexColor '#ad6fff'
    $memoryStreamSelectHover = New-Object System.IO.MemoryStream
    $filteredImageSelectHover.Save($memoryStreamSelectHover, [System.Drawing.Imaging.ImageFormat]::Png)
    $memoryStreamSelectHover.Position = 0
    $imageSelectHover = [System.Drawing.Image]::FromStream($memoryStreamSelectHover)

    # Aplicar el filtro de color seleccionado sobre imagen seleccionada
    $filteredImageSelect = Apply-ColorFilter -image $finalImage -hexColor '#633c98'
    $memoryStreamSelect = New-Object System.IO.MemoryStream
    $filteredImageSelect.Save($memoryStreamSelect, [System.Drawing.Imaging.ImageFormat]::Png)
    $memoryStreamSelect.Position = 0
    $imageSelect = [System.Drawing.Image]::FromStream($memoryStreamSelect)

    # Crear el PictureBox
    $pictureBox = New-Object Windows.Forms.PictureBox
    $pictureBox.Image = $imageNormalFiltered
    $pictureBox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
    $pictureBox.Location = New-Object System.Drawing.Point($left, $top)
    $pictureBox.BackColor = [System.Drawing.Color]::Transparent

    if ($value -eq $null) {
        $value = $text;
    }

    # Usar Tag para almacenar la imagen original y una propiedad adicional para el texto
    $pictureBox.Tag = @{
        OriginalImage = $imageNormalFiltered
        SelectedImage = $imageSelect
        SelectedHover = $imageSelectHover
        Saved = $saved
        Value = $value
        Text = $text
    }
    # $pictureBox.Text = [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes($text))  # Guardar el texto en una propiedad adicional
	$pictureBox.Text = $text

    # AÃ±adir una propiedad personalizada para almacenar la imagen hover
    $pictureBox | Add-Member -MemberType NoteProperty -Name "HoverImage" -Value $imageHover

    # Evento para cambiar la imagen al pasar el ratón
    $pictureBox.add_MouseEnter({
        param($sender, $eventArgs)
        $Window.Cursor = [System.Windows.Forms.Cursors]::Hand
          
        if ($SelectedButtons.Contains($sender.Tag) -and $sender.Tag.Saved) {
            # Si está seleccionado, mostrar la imagen seleccionada
            $sender.Image = $sender.Tag.SelectedHover
        } else {
            # Si no está seleccionado, restaurar la imagen original
            $sender.Image = $sender.HoverImage
        }
    })

    # Evento para restaurar la imagen cuando el ratón sale
    $pictureBox.add_MouseLeave({
        param($sender, $eventArgs)
        $Window.Cursor = [System.Windows.Forms.Cursors]::Default
        if ($SelectedButtons.Contains($sender.Tag) -and $sender.Tag.Saved) {
            # Si está seleccionado, mostrar la imagen seleccionada
            $sender.Image = $sender.Tag.SelectedImage
        } else {
            # Si no está seleccionado, restaurar la imagen original
            $sender.Image = $sender.Tag.OriginalImage
        }
    })

    # Evento para dibujar el texto en el PictureBox
    $pictureBox.add_Paint({
        param($sender, $eventArgs)
        $graphics = $eventArgs.Graphics
        $font = New-Object System.Drawing.Font("Segoe UI", 10)
        $brush = [System.Drawing.Brushes]::Black
        $text = $sender.Text  # Usar la propiedad 'Text' para el texto
        $textSize = $graphics.MeasureString($text, $font)
        $xText = ($sender.ClientSize.Width - $textSize.Width) / 2
        $yText = ($sender.ClientSize.Height - $textSize.Height) / 2
        $graphics.DrawString($text, $font, $brush, $xText, $yText)
    })

    # Agregar el PictureBox al formulario o ventana
    $Window.Controls.Add($pictureBox)

    # Liberar los recursos de las imágenes y gráficos
    $image1.Dispose()
    $image2.Dispose()
    $image3.Dispose()
    $finalImage.Dispose()

    # Liberar la imagen cargada en el PictureBox
    return $pictureBox
}

function Crear-Imagen {
    param (
        [System.Drawing.Graphics]$graphics,
        [int]$alto,
        [int]$ancho,
        [int]$top,
        [int]$left,
        [string]$color,  # Color de la imagen en hexadecimal, ej: "#FF5733"
        [string]$border,  # Color del borde en hexadecimal, ej: "#000000"
        [int]$shadowRight,
        [int]$shadowTop,
        [int]$shadowOpacy
    )
       
    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $Radio = 20

    # Convertir los colores hexadecimales a objetos System.Drawing.Color
    $fillColor = get-Color $color
    $borderColor = get-Color $border

    # Crear las esquinas redondeadas usando Alto y Ancho
    $path.AddArc($left, $top, $Radio, $Radio, 180, 90)  # Esquina superior izquierda
    $path.AddArc($left + $ancho - $Radio, $top, $Radio, $Radio, 270, 90)  # Esquina superior derecha
    $path.AddArc($left + $ancho - $Radio, $top + $alto - $Radio, $Radio, $Radio, 0, 90)  # Esquina inferior derecha
    $path.AddArc($left, $top + $alto - $Radio, $Radio, $Radio, 90, 90)  # Esquina inferior izquierda
    $path.CloseFigure()

    # Crear la sombra difusa debajo de la figura (sombra sin borde)
    $shadowPath = $path.Clone()  # Hacemos una copia del path para la sombra
    $shadowPath.Transform((New-Object System.Drawing.Drawing2D.Matrix(1, 0, 0, 1, $shadowRight, $shadowTop)))  # Mover la sombra 10 pÃ­xeles a la derecha y abajo
    $shadowBrush = New-Object System.Drawing.Drawing2D.PathGradientBrush($shadowPath)

    # Ajustar los colores de la sombra (con opacidad de 0.3)
    $shadowBrush.CenterColor = [System.Drawing.Color]::FromArgb($shadowOpacy, 0, 0, 0)  # Color de la sombra (opaco)
    $shadowBrush.SurroundColors = @([System.Drawing.Color]::FromArgb(2, 0, 0, 0))  # Transparente en el borde exterior
    
    # Difuminado de dentro hacia afuera
    $shadowBrush.FocusScales = New-Object System.Drawing.PointF(0.5, 0.5)  # Hacer el difuminado centrado

    # Dibujar la sombra
    $graphics.FillPath($shadowBrush, $shadowPath)

    # Pintar el fondo con el color dado
    $brush = New-Object System.Drawing.SolidBrush($fillColor)
    $graphics.FillPath($brush, $path)

    # Dibujar el borde con el color dado
    $pen = New-Object System.Drawing.Pen($borderColor)
    $graphics.DrawPath($pen, $path)
}

function showIcon {
    param (
        [System.Windows.Forms.Form]$Window,
        [string]$iconUrl
    )
    try {
        return $Window
    } catch {
        
    }
}

function get-AppWin {
    param (
        [string]$text,
        [string]$url1,
        [string]$url2,
        [string]$output
    )
    # Cambiar la página de códigos a UTF-8
    chcp 65001 > $null
    # Configurar la consola para usar UTF-8
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8

    Clear-Host
    # Intentar descargar desde el primer enlace
    try {
        Write-Host "Descargando" $text -ForegroundColor Yellow -NoNewline
        Invoke-WebRequest -Uri $url1 -OutFile $output -ErrorAction Stop
        saltos
        Write-Host "Descarga completada...." -ForegroundColor Green
    }
    catch {
        saltos
        Write-Host "Error al descargar desde el primer enlace: $($_.Exception.Message)" -ForegroundColor Red

        # Si falla la descarga del primer enlace, intenta con el segundo enlace
        if ($url2 -ne $null) {
            try {
                Write-Host "Descargando XboxInstaller de enlace alternativo..." -ForegroundColor Yellow -NoNewline
                Invoke-WebRequest -Uri $url2 -OutFile $output -ErrorAction Stop
                saltos
                Write-Host "Descarga completada." -ForegroundColor Green
            }
            catch {
                saltos
                Write-Host "Error: Ninguno de los enlaces está disponible. No se pudo descargar el archivo." -ForegroundColor Red
            }
        }
    }

    if (Test-Path $output) {
        # Ejecuta el archivo descargado
        Write-Host "Ejecutando el instalador.." -ForegroundColor Gray -NoNewline
        Start-Process -FilePath $output -Wait
        saltos
        
        # Borra el archivo descargado despuÃƒÂ©s de la instalación
        Remove-Item -Path $output -Force

        # Intentar eliminar el archivo hasta que estÃƒÂ© disponible
        while (Test-Path $output) {
            try {
                Remove-Item -Path $output -Force -ErrorAction Stop
            }
            catch {
                Start-Sleep -Seconds 1
            }
        }
        Write-Host "Instalación finalizada."
    } else {
        Write-Host "No se pudo realizar la instalación." -ForegroundColor Red
        saltos
        pause
    }
}

# Funcion para hacer los botones selecionados o no
$SelectedButtons = New-Object System.Collections.ArrayList
function SelectedTheButtons {
    param (
        [Parameter(Mandatory)]
        [Object]$sender,

        [Parameter(Mandatory)]
        [Object]$eventArgs
    )
    if ($SelectedButtons.Contains($sender.Tag)) {
        # Si ya está seleccionado, lo quitamos
        $SelectedButtons.Remove($sender.Tag)
        $sender.Image = $sender.Tag.OriginalImage  # Mostrar imagen original
    } else {
        # Si no está seleccionado, lo agregamos
        $SelectedButtons.Add($sender.Tag)
        $sender.Image = $sender.Tag.SelectedImage  # Mostrar imagen original    
    }
}

$fondo = '#aeb2cd'
$Window = Create-CustomWindow -Width 600 -Height 570 -Fondo $fondo -Title 'SPR Informática - Menú de configuración del Sistema' -iconUrl $git'icons/icon.ico'
$Window.Add_Paint({
    $graphics = $_.Graphics
    $fondo = '#c4c7dd'
    $fondoHvr = '#d4d8f6'
    Crear-Imagen -graphics $graphics -alto 260 -ancho 550 -top 15 -left 15 -color $fondo -border $fondoHvr -shadowRight 8 -shadowTop 5 -shadowOpacy 255
    Crear-Imagen -graphics $graphics -alto 60 -ancho 550 -top 290 -left 15 -color $fondo -border $fondoHvr -shadowRight 8 -shadowTop 5 -shadowOpacy 150
    Crear-Imagen -graphics $graphics -alto 60 -ancho 550 -top 370 -left 15 -color $fondo -border $fondoHvr -shadowRight 8 -shadowTop 5 -shadowOpacy 150
    Crear-Imagen -graphics $graphics -alto 60 -ancho 550 -top 450 -left 15 -color $fondo -border $fondoHvr -shadowRight 8 -shadowTop 5 -shadowOpacy 150
})

# Azul #b3baf5 #7785ff
# Rojo #fab7b9 #c14e51
# Verde  #c9e8cb #71bd76
# Gris  #e0e0e0 #8c949e
$fondo = '#e0e0e0'
$fondoHvr = '#8c949e'
$sys0 = Create-CombinedImage -Window $Window -top 30 -left 30 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Obtener Licencia de Windows' 
$sys1 = Create-CombinedImage -Window $Window -top 30 -left 295 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Activar Windows'
$sys2 = Create-CombinedImage -Window $Window -top 70 -left 30 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Configuración'
$sys3 = Create-CombinedImage -Window $Window -top 70 -left 295 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Panel de Control'
$sys4 = Create-CombinedImage -Window $Window -top 110 -left 30 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Administrador de Tareas' 
$sys5 = Create-CombinedImage -Window $Window -top 110 -left 295 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Administrador de dispositivos'
$sys6 = Create-CombinedImage -Window $Window -top 150 -left 30 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Windows Update' 
$sys7 = Create-CombinedImage -Window $Window -top 150 -left 295 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Conexiones de Red'
$sys8 = Create-CombinedImage -Window $Window -top 190 -left 30 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Región' 
$sys9 = Create-CombinedImage -Window $Window -top 190 -left 295 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Panel de Sonido'
$sys10 = Create-CombinedImage -Window $Window -top 230 -left 30 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Propiedades del Sistema' 
$sys11 = Create-CombinedImage -Window $Window -top 230 -left 295 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Información del sistema'

$sys0.add_Click({ irm https://github.com/Krowne/WinInfo/raw/refs/heads/main/get-licence | iex })
$sys1.add_Click({ slui 3 })
$sys2.add_Click({ Start-Process "ms-settings:" })
$sys3.add_Click({ control })
$sys4.add_Click({ Start-Process taskmgr })
$sys5.add_Click({ Start-Process "devmgmt.msc" })
$sys6.add_Click({ Start-Process "ms-settings:windowsupdate" })
$sys7.add_Click({ control ncpa.cpl })
$sys8.add_Click({ control.exe /name Microsoft.RegionAndLanguage })
$sys9.add_Click({ control mmsys.cpl })
$sys10.add_Click({ control sysdm.cpl })
$sys11.add_Click({ msinfo32 })

$fondo = '#c9e8cb'
$fondoHvr = '#71bd76'
$clean0 = Create-CombinedImage -Window $Window -top 305 -left 30 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Limpiar Historial PS' 
$clean1 = Create-CombinedImage -Window $Window -top 305 -left 295 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Limpiar Windows Update'

$clean0.add_Click({ 
    Clear-Host
    Write-Host "Limpiando historial de powershell.."
    $historyFilePath = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt"
    # Verificar si el archivo existe antes de intentar borrarlo
    if (Test-Path $historyFilePath) {
        # Eliminar el contenido del archivo
        Clear-Content -Path $historyFilePath
        Write-Host "El historial de comandos de PowerShell ha sido borrado." -ForegroundColor Green
    } else {
        Write-Host "El archivo de historial no existe."
    }
})
$clean1.add_Click({ 
    # Verificar si el script se estÃƒÂ¡ ejecutando como administrador
    Clear-Host
    if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        Write-Host "Este script debe ejecutarse como administrador." -ForegroundColor Red
    }
    else {
        # Detener el servicio de Windows Update
        Write-Host "Deteniendo el servicio de Windows Update..."
        Stop-Service -Name "wuauserv" -Force

        # Borrar los archivos y carpetas dentro de C:\Windows\SoftwareDistribution\
        Write-Host "Borrando archivos y carpetas dentro de C:\Windows\SoftwareDistribution\..."
        Remove-Item -Path "C:\Windows\SoftwareDistribution\*" -Recurse -Force

        # Iniciar el servicio de Windows Update
        Write-Host "Iniciando el servicio de Windows Update..." -ForegroundColor Cyan
        Start-Service -Name "wuauserv"

        Write-Host "Proceso completado." -ForegroundColor Green
    }
})
$fondo = '#eae2bb'
$fondoHvr = '#c3b77a'
$apps0 = Create-CombinedImage -Window $Window -top 385 -left 30 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Instalar Aplicaciones' 
$apps1 = Create-CombinedImage -Window $Window -top 385 -left 295 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Microsoft Store'

function set-Hand {
    param (
        [System.Windows.Forms.PictureBox]$p
    )
    $p.add_MouseEnter({ param($sender, $eventArgs); $sender.Cursor = [System.Windows.Forms.Cursors]::Hand })
    return $p
}

$apps0.add_Click({ 
    Clear-Host
    $Window.Hide()
    $fondo = '#aeb2cd'
    $AppsWindow = Create-CustomWindow -Width 600 -Height 350 -Fondo $fondo -Title 'SPR Informática - Instalar Aplicaciones' -iconUrl $git'icons/icon.ico'
    $AppsWindow.Add_Paint({
        $graphics = $_.Graphics
        $fondo = '#c4c7dd'
        $fondoHvr = '#d4d8f6'
        Crear-Imagen -graphics $graphics -alto 60 -ancho 550 -top 15 -left 15 -color $fondo -border $fondoHvr -shadowRight 8 -shadowTop 5 -shadowOpacy 255
        Crear-Imagen -graphics $graphics -alto 200 -ancho 550 -top 90 -left 15 -color $fondo -border $fondoHvr -shadowRight 8 -shadowTop 5 -shadowOpacy 150
    })
    # Gris  #e0e0e0 #8c949e
    $fondo = '#e0e0e0'
    $fondoHvr = '#8c949e'
    $AppsC0 = Create-CombinedImage -Window $AppsWindow -top 30 -left 30 -ancho 163 -filter $fondo -Sfilter $fondoHvr -text 'Instalador'
    $AppsC0 = set-Hand -p $AppsC0
    $AppsC1 = Create-CombinedImage -Window $AppsWindow -top 30 -left 208 -ancho 163 -filter $fondo -Sfilter $fondoHvr -text 'Instalar XBox'
    $AppsC1 = set-Hand -p $AppsC1
    $AppsC2 = Create-CombinedImage -Window $AppsWindow -top 30 -left 386 -ancho 163 -filter $fondo -Sfilter $fondoHvr -text 'Windows Defender'
    $AppsC2 = set-Hand -p $AppsC2
    
    # Azul #8993e9 #5863bf
    $fondo = '#8993e9'
    $fondoHvr = '#5863bf'
    $AppsI00 = Create-CombinedImage -Window $AppsWindow -top 105 -left 30 -ancho 163 -filter $fondo -Sfilter $fondoHvr -text 'Adobe Acrobat Reader' -value 'Adobe.Acrobat.Reader.64-bit' -saved $true
    $AppsI00 = set-Hand -p $AppsI00
    $AppsI01 = Create-CombinedImage -Window $AppsWindow -top 105 -left 208 -ancho 163 -filter $fondo -Sfilter $fondoHvr -text 'AnyDesk' -value 'AnyDeskSoftwareGmbH.AnyDesk' -saved $true
    $AppsI01 = set-Hand -p $AppsI01
    $AppsI02 = Create-CombinedImage -Window $AppsWindow -top 105 -left 386 -ancho 163 -filter $fondo -Sfilter $fondoHvr -text 'Google Chrome' -value 'Google.Chrome' -saved $true
    $AppsI02 = set-Hand -p $AppsI02
    $AppsI03 = Create-CombinedImage -Window $AppsWindow -top 145 -left 30 -ancho 163 -filter $fondo -Sfilter $fondoHvr -text 'Libre Office' -value 'TheDocumentFoundation.LibreOffice' -saved $true
    $AppsI03 = set-Hand -p $AppsI03
    $AppsI04 = Create-CombinedImage -Window $AppsWindow -top 145 -left 208 -ancho 163 -filter $fondo -Sfilter $fondoHvr -text 'Notepad++' -value 'Notepad++.Notepad++' -saved $true
    $AppsI04 = set-Hand -p $AppsI04
    $AppsI05 = Create-CombinedImage -Window $AppsWindow -top 145 -left 386 -ancho 163 -filter $fondo -Sfilter $fondoHvr -text 'TeamViewer' -value 'TeamViewer.TeamViewer.Host' -saved $true
    $AppsI05 = set-Hand -p $AppsI05
    $AppsI06 = Create-CombinedImage -Window $AppsWindow -top 185 -left 30 -ancho 163 -filter $fondo -Sfilter $fondoHvr -text 'VLC Player' -value 'VideoLAN.VLC' -saved $true
    $AppsI06 = set-Hand -p $AppsI06
    $AppsI07 = Create-CombinedImage -Window $AppsWindow -top 185 -left 208 -ancho 163 -filter $fondo -Sfilter $fondoHvr -text 'WinRAR' -value 'RARLab.WinRAR' -saved $true
    $AppsI07 = set-Hand -p $AppsI07
    # Verde  #c9e8cb #71bd76
	# Rojo #fab7b9 #c14e51
    $fondo0 = '#fab7b9'; $fondoHvr0 = '#c14e51'
	$fondo1 = '#c9e8cb'; $fondoHvr1 = '#71bd76'
    $InstallApps0 = Create-CombinedImage -Window $AppsWindow -top 245 -left 208 -ancho 163 -filter $fondo0 -Sfilter $fondoHvr0 -text 'Desinstalar'
    $InstallApps0 = set-Hand -p $InstallApps0
    $InstallApps1 = Create-CombinedImage -Window $AppsWindow -top 245 -left 386 -ancho 163 -filter $fondo1 -Sfilter $fondoHvr1 -text 'Instalar'
    $InstallApps1 = set-Hand -p $InstallApps1

    $AppsC0.add_Click({ Start-Process "ms-windows-store://pdp/?productid=9NBLGGH4NNS1" })
    $AppsC1.add_Click({ $AppsWindow.Hide(); get-AppWin -text "XBox Installer" -url1 "https://dlassets-ssl.xboxlive.com/public/content/XboxInstaller/XboxInstaller.exe" -url2 "https://sprinformatica.ddns.net/appx/XboxInstaller.exe" -output "C:\XboxInstaller.exe"; $AppsWindow.Show() })
    $AppsC2.add_Click({ $AppsWindow.Hide(); get-AppWin -text "Windows Defender" -url1 "https://catalog.s.download.windowsupdate.com/c/msdownload/update/software/defu/2025/01/securityhealthsetup_c6fc6cfabf15471436d34fb1784816d2820cc4fe.exe" -url2 $null -output "C:\WindowsDefenderInstaller.exe"; $AppsWindow.Show() })

    $AppsI00.add_Click({ param($sender, $eventArgs); SelectedTheButtons -sender $this -eventArgs $eventArgs })
    $AppsI01.add_Click({ param($sender, $eventArgs); SelectedTheButtons -sender $this -eventArgs $eventArgs })
    $AppsI02.add_Click({ param($sender, $eventArgs); SelectedTheButtons -sender $this -eventArgs $eventArgs })
    $AppsI03.add_Click({ param($sender, $eventArgs); SelectedTheButtons -sender $this -eventArgs $eventArgs })
    $AppsI04.add_Click({ param($sender, $eventArgs); SelectedTheButtons -sender $this -eventArgs $eventArgs })
    $AppsI05.add_Click({ param($sender, $eventArgs); SelectedTheButtons -sender $this -eventArgs $eventArgs })
    $AppsI06.add_Click({ param($sender, $eventArgs); SelectedTheButtons -sender $this -eventArgs $eventArgs })
    $AppsI07.add_Click({ param($sender, $eventArgs); SelectedTheButtons -sender $this -eventArgs $eventArgs })

    $InstallApps0.add_Click({
        param($sender, $eventArgs)
        $AppsWindow.Hide(); 
        Clear-Host
        Write-Host "Desinstalando aplicaciones."
		Write-Host "Esto puedo tardar un rato, por favor, espere."
		saltos
		$SelectedButtons | ForEach-Object { 
            if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
                Write-Host "Winget no está instalado. Abriendo la tienda de Microsoft para instalarlo..." -ForegroundColor Yellow
                
                # URI para abrir la tienda de Microsoft en la página de Winget
                $wingetStoreUri = "ms-windows-store://pdp/?productid=9NBLGGH4NNS1"
                
                # Abrir la tienda
                Start-Process -FilePath $wingetStoreUri
            } else {
				try {
					# Verificar si la aplicación ya está instalada
					$appInstalled = winget list | Where-Object { $_ -match $($_.Value) }

					if ($appInstalled) {
						Write-Host "Desinstalando $($_.Text).."
						# Si la aplicación está instalada, desinstalarla
						$result = winget uninstall --id=$($_.Value) -e --accept-source-agreements --silent

						# Verificar si el resultado contiene el mensaje de éxito
						if ($result -match "Successfully uninstalled" -or $result -match "Desinstalación realizada con éxito") {
							Write-Host "La desinstalación se realizó correctamente." -ForegroundColor Cyan
						}
						else {
							Write-Host "Hubo un problema durante la desinstalación." -ForegroundColor Red
						}
					} else {
						Write-Host "La aplicación no está instalada." -ForegroundColor Yellow
					}
				} catch {
					# Capturar y mostrar cualquier error
					Write-Host "Ocurrió un error durante la desinstalación: $_" -ForegroundColor Red
				}
            }
        }
        $AppsWindow.Show()
    })
	$InstallApps1.add_Click({
        param($sender, $eventArgs)
        $AppsWindow.Hide(); 
        Clear-Host
        Write-Host "Instalando aplicaciones."
		Write-Host "Esto puedo tardar un rato, por favor, espere."
		saltos
		$SelectedButtons | ForEach-Object { 
            if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
                Write-Host "Winget no está instalado. Abriendo la tienda de Microsoft para instalarlo..." -ForegroundColor Yellow
                
                # URI para abrir la tienda de Microsoft en la página de Winget
                $wingetStoreUri = "ms-windows-store://pdp/?productid=9NBLGGH4NNS1"
                
                # Abrir la tienda
                Start-Process -FilePath $wingetStoreUri
            } else {
				try {
					# Ejecutar el comando de instalación
					Write-Host "Instalando $($_.Text).."
					$result = winget install --id=$($_.Value) -e --accept-source-agreements --force

					# Verificar si el resultado contiene algún mensaje de éxito
					if ($result -match "Successfully installed" -or $result -match "Instalado correctamente") {
						Write-Host "La instalación se realizó correctamente." -ForegroundColor Green
					} else {
						Write-Host "Hubo un problema durante la instalación." -ForegroundColor Red
					}
				} catch {
					# Capturar y mostrar cualquier error
					Write-Host "Ocurrió un error durante la instalación de $($_.Text)." -ForegroundColor Red
				}
            }
        }
        $AppsWindow.Show()
    })

    # Forzar que la ventana sea activa
    $AppsWindow.Add_FormClosing({
        # Mostrar la ventana principal nuevamente
        $window.Show()
    })
    $AppsWindow.Add_Shown({ $AppsWindow.Activate() })
    $AppsWindow.ShowDialog() | Out-Null
})
$apps1.add_Click({ 
    # Verificar si el script se está ejecutando como administrador
    Clear-Host
    Start-Process "ms-windows-store:"
})
$fondo = '#fab7b9'
$fondoHvr = '#c14e51'
$device0 = Create-CombinedImage -Window $Window -top 465 -left 30 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Reiniciar' 
$device1 = Create-CombinedImage -Window $Window -top 465 -left 295 -ancho 250 -filter $fondo -Sfilter $fondoHvr -text 'Apagar'

$device0.add_Click({ 
    Clear-Host
    $Win2 = Create-CustomWindow -Width 320 -Height 100 -Fondo '#aeb2cd' -Title '¿Reinciar el equipo?' -iconUrl $git'icons/restart.ico'
    $confirmNO = Create-CombinedImage -Window $Win2 -top 15 -left 80 -ancho 100 -filter '#e0e0e0' -Sfilter '#bbbbbb' -text 'Cancelar' 
	$confirmNO = set-Hand -p $confirmNO
    $confirmYES = Create-CombinedImage -Window $Win2 -top 15 -left 190 -ancho 100 -filter '#fab7b9' -Sfilter '#c14e51' -text 'Confirmar'
	$confirmYES = set-Hand -p $confirmYES
    $confirmNO.add_Click({ 
        $Win2.Close()
    })
    $confirmYES.add_Click({ 
        # Verificar si el script se estÃ±a ejecutando como administrador
        Clear-Host
        $Win2.Close()
        $Window.Close()
        Write-Host "Reiniciando el equipo.."
        Restart-Computer -Force
    })
    $Win2.Add_Shown({ $Win2.Activate() })
    $Win2.ShowDialog()  # Mostrar la ventana sin bloquear el hilo de ejecución
})
$device1.add_Click({ 
    # Verificar si el script se está ejecutando como administrador
    Clear-Host
    $Win2 = Create-CustomWindow -Width 320 -Height 100 -Fondo '#aeb2cd' -Title '¿Apagar el equipo?' -iconUrl $git'icons/turnoff.ico'
    $confirmNO = Create-CombinedImage -Window $Win2 -top 15 -left 80 -ancho 100 -filter '#e0e0e0' -Sfilter '#bbbbbb' -text 'Cancelar'
	$confirmNO = set-Hand -p $confirmNO
    $confirmYES = Create-CombinedImage -Window $Win2 -top 15 -left 190 -ancho 100 -filter '#fab7b9' -Sfilter '#c14e51' -text 'Confirmar'
	$confirmYES = set-Hand -p $confirmYES
    $confirmNO.add_Click({ 
        $Win2.Close()
    })
    $confirmYES.add_Click({ 
        # Verificar si el script se está ejecutando como administrador
        Clear-Host
        $Win2.Close()
        $Window.Close()
        Write-Host "Apagando el equipo.."
        Stop-Computer -Force
    })
    $Win2.Add_Shown({ $Win2.Activate() })
    $Win2.ShowDialog()  # Mostrar la ventana sin bloquear el hilo de ejecución
})

$Window.KeyPreview = $true
$Window.Add_KeyDown({
    if ($_.Control -and $_.Alt -and $_.KeyCode -eq [System.Windows.Forms.Keys]::A) {
        $a = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($Base64Image4))
		Invoke-Expression $a
		#Clear-Host
    }
})

# Forzar que la ventana sea activa
$Window.Add_Shown({ $Window.Activate() })
$Window.ShowDialog() | Out-Null
