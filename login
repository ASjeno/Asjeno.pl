<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <title>Asjeno.pl - Logowanie</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #e6ffe6; /* zielony motyw */
      color: #0044cc; /* niebieska czcionka */
      text-align: center;
      padding: 50px;
    }
    .hidden {
      display: none;
    }
    .login-box {
      background: white;
      padding: 20px;
      border-radius: 15px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.2);
      max-width: 300px;
      margin: auto;
    }
    input {
      width: 90%;
      padding: 10px;
      margin: 10px 0;
      border-radius: 10px;
      border: 1px solid #ccc;
    }
    button {
      background: #28a745;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 10px;
      cursor: pointer;
      font-size: 16px;
    }
    button:hover {
      background: #218838;
    }
  </style>
</head>
<body>
  <!-- Główna treść (pokazuje się tylko w Chrome / Opera / Opera GX) -->
  <div id="content" class="hidden">
    <h1>Asjeno.pl</h1>
    <p>Zaloguj się, aby przejść do czatu</p>

    <div class="login-box">
      <form id="loginForm">
        <input type="text" id="username" placeholder="Login" required><br>
        <input type="password" id="password" placeholder="Hasło" required><br>
        <button type="submit">Zaloguj</button>
      </form>
      <p id="loginMessage"></p>
    </div>
  </div>

  <!-- Blokada przeglądarki -->
  <div id="blocked" class="hidden">
    <h1>Nieobsługiwana przeglądarka 🚫</h1>
    <p>Proszę otworzyć stronę w Google Chrome, Opera lub Opera GX.</p>
  </div>

  <script>
    // Sprawdzenie przeglądarki
    const ua = navigator.userAgent.toLowerCase();
    const isChrome = ua.includes("chrome") && !ua.includes("edg") && !ua.includes("brave") && !ua.includes("opr");
    const isOpera = ua.includes("opr") || ua.includes("opera"); // też łapie Opera GX

    if (isChrome || isOpera) {
      document.getElementById("content").classList.remove("hidden");
    } else {
      document.getElementById("blocked").classList.remove("hidden");
    }

    // Proste logowanie (przykład)
    const loginForm = document.getElementById("loginForm");
    const loginMessage = document.getElementById("loginMessage");

    loginForm.addEventListener("submit", function(e) {
      e.preventDefault();

      const username = document.getElementById("username").value;
      const password = document.getElementById("password").value;

      // przykładowe dane do logowania
      const correctUser = "admin";
      const correctPass = "1234";

      if (username === correctUser && password === correctPass) {
        loginMessage.style.color = "green";
        loginMessage.textContent = "✅ Zalogowano pomyślnie! Przechodzę do czatu...";
        setTimeout(() => {
          window.location.href = "chat.html"; // tu wstawisz link do strony z czatem
        }, 1500);
      } else {
        loginMessage.style.color = "red";
        loginMessage.textContent = "❌ Nieprawidłowy login lub hasło.";
      }
    });
  </script>
</body>
</html>
