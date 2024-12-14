import React from 'react';
import UserDashboard from './components/user/dashboard/UserDashboard';
import { BrowserRouter as Router, Route, Routes, Navigate} from 'react-router-dom';

function App() {
  return (
    <div className="App">
      <div class="desktop-1">
  <div class="rectangle-6"></div>
  <img class="image-4" src="image-40.png" />
  <div class="rectangle-7"></div>
  <img class="image-6" src="image-60.png" />
  <div class="frame-15">
    <img class="settings" src="settings0.svg" />
    <div class="settings2">settings</div>
  </div>
  <div class="frame-34">
    <img class="logout-02" src="logout-020.svg" />
    <div class="logout">logout</div>
  </div>
  <div class="frame-22">
    <img class="help" src="help0.svg" />
    <div class="help2">help</div>
  </div>
  <div class="rectangle-8"></div>
  <div class="rectangle-9"></div>
  <div class="rectangle-10"></div>
  <div class="rectangle-11"></div>
  <div class="rectangle-12"></div>
  <div class="frame-27">
    <img class="home-01" src="home-010.svg" />
  </div>
  <div class="text">
    <br />
  </div>
  <div class="home">HOME</div>
  <div class="account">ACCOUNT</div>
  <div class="details">DETAILS</div>
  <div class="money">MONEY</div>
  <div class="transfer">TRANSFER</div>
  <div class="transaction">TRANSACTION</div>
  <div class="history">HISTORY</div>
  <div class="loans">LOANS</div>
  <img class="bank-note-01" src="bank-note-010.svg" />
  <img class="currency-coin-dollar" src="currency-coin-dollar0.svg" />
  <div class="frame-20">
    <img class="wallet-02" src="wallet-020.svg" />
  </div>
  <div class="frame-16">
    <img class="bag-04" src="bag-040.svg" />
  </div>
  <div class="aegis-bank">AEGIS BANK</div>
</div>

    <Router>
        <Routes>
          <Route path="/dashboard/*" element={<UserDashboard />} />
          <Route path="*" element={<Navigate to="/dashboard" />} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;
