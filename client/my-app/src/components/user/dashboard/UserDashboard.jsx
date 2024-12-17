import React, { useState } from 'react';
import { Routes, Route, Link, useNavigate } from 'react-router-dom';
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
  
  const menuItems=[
    {path: '/dashboard/account-details',img:account,text: 'Account-details'}
  ];

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
        <div>
          <Link to= "/Money Tranfer">
          <img className="home-01" src={home} alt="Home" />
          </Link>
          <div className='home'>
            HOME
          </div>
        </div>

        {/* Account */}
        <div>
          <Link to="/MoneyTansfer">
            <img className="bank-note-01" src={account} alt="Account" />
          </Link>
          <div className="account">
            ACCOUNT <br /> DETAILS
          </div>
        </div>

        {/* Money Transfer */}
<div>
  <Link to="/dashboard/money-transfer">
    <img className="currency-coin-dollar" src={money} alt="Money Transfer" />
  </Link>
  <div className="money">
    MONEY <br /> TRANSFER
  </div>
</div>



        {/*Transaction History*/}
        <div>
          <Link to="/MoneyTansfer">
          <img className="wallet-020" src={trans} alt="Transaction History" />
          </Link>
          <div className="trans">
            TRANSACTION <br /> HISTORY
          </div>
        </div>

        {/* Loans */}
        <div>
          <Link to="/MoneyTansfer">
          <img className="bag-04" src={loans} alt="Loans" />
          </Link>
          <div className="loans">
            Loans
          </div>
        </div>
        
        <div className="aegis-bank">AEGIS BANK</div>
      </div>
     
      <Routes>
        <Route path="/money-transfer" element={<MoneyTransfer />} />
      </Routes>
    </div>
  );
};



export default UserDashboard;


