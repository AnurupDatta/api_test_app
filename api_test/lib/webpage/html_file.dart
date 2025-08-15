const String phoneInputHtml = '''
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      background: #fff;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }
    .container {
      background: #fff;
      border-radius: 18px;
      box-shadow: 0 8px 32px rgba(255, 140, 0, 0.12);
      padding: 32px 24px;
      max-width: 340px;
      width: 100%;
      text-align: center;
    }
    h2 {
      color: #ff6f00;
      margin-bottom: 18px;
    }
    input[type="tel"] {
      width: 90%;
      padding: 12px;
      border: 1.5px solid #ff9800;
      border-radius: 8px;
      margin-bottom: 18px;
      font-size: 16px;
      outline: none;
      transition: border 0.2s;
    }
    input[type="tel"]:focus {
      border: 2px solid #ff6f00;
    }
    button {
      background: linear-gradient(90deg, #ff9800 0%, #ff6f00 100%);
      color: #fff;
      border: none;
      border-radius: 8px;
      padding: 12px 0;
      width: 100%;
      font-size: 18px;
      font-weight: bold;
      cursor: pointer;
      box-shadow: 0 2px 8px rgba(255, 140, 0, 0.08);
      transition: background 0.2s;
    }
    button:hover {
      background: linear-gradient(90deg, #ff6f00 0%, #ff9800 100%);
    }
    #result {
      margin-top: 18px;
      color: #ff6f00;
      font-weight: 500;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Enter your phone number</h2>
    <form id="phoneForm" onsubmit="event.preventDefault(); sendPhone();">
      <input type="tel" id="phoneInput" placeholder="Phone Number" pattern="[0-9]{10,15}" required><br>
      <button type="submit">Submit</button>
    </form>
    <p id="result"></p>
  </div>
  <script>
    async function sendPhone() {
      const phoneNumber = document.getElementById('phoneInput').value;
      if (!phoneNumber) {
        document.getElementById('result').innerText = "Please enter a phone number.";
        return;
      }
      try {
        let response = await fetch('https://example.com/api/send-phone', {
          method: 'POST',
          headers: {'Content-Type': 'application/json'},
          body: JSON.stringify({phone: phoneNumber})
        });
        let text = await response.text();
        document.getElementById('result').innerText = "Response: " + text;
      } catch (error) {
        document.getElementById('result').innerText = "Error: " + error;
      }
    }
  </script>
</body>
</html>
''';