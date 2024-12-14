import React from 'react'
import backgroundImage from '../../../assets/background.jpg';
import logo from '../../../assets/image-40.png';
import settings from '../../../assets/settings0.svg';
import logout from '../../../assets/logout-020.svg';
import help from '../../../assets/help0.svg';
import trans from '../../../assets/wallet-020.svg';
import loans from '../../../assets/bag-040.svg';
import account from '../../../assets/bank-note-010.svg';
import money from '../../../assets/currency-coin-dollar0.svg';
import home from '../../../assets/home-010.svg';
import './UserDashboard.css'
const UserDashboard = () => {
  return (
    <div>
      <div class="desktop-1">
       <div class="rectangle-6"></div>
       <img className="image-4" src={logo}/>
       <div class="rectangle-7"></div>
       <img className="image-6" src={backgroundImage} alt="Background" />

       <div class="frame-15">
       <button><img className="settings"  src={settings}/></button>
       <div class="settings2">settings</div>
    </div>
      <div class="frame-34">
        <img className="logout-02" src={logout} />
        <div class="logout">logout</div>
      </div>
      <div class="frame-22">
        <img className="help" src={help} />
        <div class="help2">help</div>
      </div>
      <div class="rectangle-8"></div>
      <div class="rectangle-9"></div>
      <div class="rectangle-10"></div>
      <div class="rectangle-11"></div>
      <div class="rectangle-12"></div>
      <div class="frame-27">
        <img className="home-01" src={home} />
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
    <img className="bank-note-01" src={account} />
    <img className="currency-coin-dollar" src={money} />
      <div class="frame-20">
        <img className="wallet-02" src={trans} />
      </div>
      <div class="frame-16">
        <img className="bag-04" src={loans} />
      </div>
      <div class="aegis-bank">AEGIS BANK</div>
  </div>
    </div>
  )
}

export default UserDashboard
