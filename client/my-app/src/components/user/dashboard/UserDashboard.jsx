import React, { useState } from 'react';
import MoneyTransfer from '../MoneyTransfer/MoneyTransfer';  // Adjust the path based on your folder structure
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
import './UserDashboard.css';

const UserDashboard = () => {
  const [activePage, setActivePage] = useState('home'); // State for active page

  // Render content based on activePage
  const renderContent = () => {
    switch (activePage) {
      case 'home':
        return <div>Welcome to Aegis Bank Dashboard!</div>;
      case 'moneyTransfer':
        return <MoneyTransfer />;
      default:
        return <div>Select a page</div>;
    }
  };

  return (
    <div>
      <div className="desktop-1">
        <div className="rectangle-6"></div>
        <img className="image-4" src={logo} alt="Logo" />
        <div className="rectangle-7"></div>
        <img className="image-6" src={backgroundImage} alt="Background" />

        {/* Settings */}
        <div className="frame-15">
          <img className="settings" src={settings} alt="Settings" />
          <div className="settings2">Settings</div>
        </div>

        {/* Logout */}
        <div className="frame-34">
          <img className="logout-02" src={logout} alt="Logout" />
          <div className="logout">Logout</div>
        </div>

        {/* Help */}
        <div className="frame-22">
          <img className="help" src={help} alt="Help" />
          <div className="help2">Help</div>
        </div>

        <div className="rectangle-8"></div>
        <div className="rectangle-9"></div>
        <div className="rectangle-10"></div>
        <div className="rectangle-11"></div>
        <div className="rectangle-12"></div>

        {/* Home */}
        <div className="frame-27" onClick={() => setActivePage('home')}>
          <img className="home-01" src={home} alt="Home" />
          <div className="home">HOME</div>
        </div>

        {/* Money Transfer */}
        <div className="frame-20" onClick={() => setActivePage('moneyTransfer')}>
          <img className="currency-coin-dollar" src={money} alt="Money Transfer" />
          <div className="money">MONEY</div>
          <div className="transfer">TRANSFER</div>
        </div>

        {/* Account */}
        <div>
          <img className="bank-note-01" src={account} alt="Account" />
          <div className="account">ACCOUNT</div>
        </div>

        {/* Loans */}
        <div className="frame-16">
          <img className="bag-04" src={loans} alt="Loans" />
          <div className="loans">LOANS</div>
        </div>

        <div className="aegis-bank">AEGIS BANK</div>
      </div>

      {/* Render selected page */}
      <div className="content-area">{renderContent()}</div>
    </div>
  );
};

export default UserDashboard;
