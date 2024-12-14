import React from 'react'
import backgroundImage from '../../../assets/background.jpg';
import logo from '../../../assets/AegisLogo.png';
import home from '../../../assets/home.svg';
import moneytransfer from '../../../assets/moneytransfer.svg';
import transactionhistory from '../../../assets/transactionhistory.svg';
import loans from '../../../assets/loans.svg';
import account from '../../../assets/account.svg';
import './UserDashboard.css'
const UserDashboard = () => {
  return (
    <div>
      <div class="desktop-1">
       <div class="rectangle-6"></div>
       <img className="image-4" src={logo} alt="logo" />
       <div class="rectangle-7"></div>
       <img className="image-6" src={backgroundImage} alt="Background" />

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
      <img className="image-6" src={backgroundImage} alt="Background" />
    <img className="bank-note-01" src={home} alt="home" />
    <img className="currency-coin-dollar" src={moneytransfer}  alt="moneytransfer" />
      <div class="frame-20">
        <img className="wallet-02" src={transactionhistory} alt="transactionhistory"/>
      </div>
      <div class="frame-16">
        <img className="bag-04" src={loans} alt="loans" />
      </div>
      <div class="aegis-bank">AEGIS BANK</div>
  </div>
    </div>
  )
}

export default UserDashboard
