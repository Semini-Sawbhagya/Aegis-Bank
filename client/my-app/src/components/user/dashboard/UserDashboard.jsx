import React from 'react';
import { Routes, Route, Link } from 'react-router-dom';
import MoneyTransfer from '../MoneyTransfer/MoneyTransfer'; // Adjust the path based on your folder structure
import backgroundImage from '../../../assets/background.jpg';
import logo from '../../../assets/image-40.png';
import settingsIcon from '../../../assets/settings0.svg';
import logoutIcon from '../../../assets/logout-020.svg';
import helpIcon from '../../../assets/help0.svg';
import transIcon from '../../../assets/wallet-020.svg';
import loansIcon from '../../../assets/bag-040.svg';
import accountIcon from '../../../assets/bank-note-010.svg';
import moneyIcon from '../../../assets/currency-coin-dollar0.svg';
import homeIcon from '../../../assets/home-010.svg';
import './UserDashboard.css';

const UserDashboard = () => {
  // Menu items array for dynamic rendering
  const menuItems = [
    { path: '/dashboard/home', img: homeIcon, label: 'Home' },
    { path: '/dashboard/account-details', img: accountIcon, label: 'Account Details' },
    { path: '/dashboard/money-transfer', img: moneyIcon, label: 'Money Transfer' },
    { path: '/dashboard/transaction-history', img: transIcon, label: 'Transaction History' },
    { path: '/dashboard/loans', img: loansIcon, label: 'Loans' },
  ];

  return (
    <div className="user-dashboard">
      {/* Sidebar Section */}
      <div className="sidebar">
        <img className="logo" src={logo} alt="Aegis Bank Logo" />
        <nav className="menu">
          {menuItems.map((item, index) => (
            <Link key={index} to={item.path} className="menu-item" aria-label={item.label}>
              <img src={item.img} alt={item.label} />
              <span>{item.label}</span>
            </Link>
          ))}
        </nav>
        <div className="sidebar-footer">
          <div className="settings">
            <img src={settingsIcon} alt="Settings" />
            <span>Settings</span>
          </div>
          <div className="help">
            <img src={helpIcon} alt="Help" />
            <span>Help</span>
          </div>
          <div className="logout">
            <img src={logoutIcon} alt="Logout" />
            <span>Logout</span>
          </div>
        </div>
      </div>

      {/* Main Content Section */}
      <div className="main-content" >
        <img className="background" src={backgroundImage} alt="Background" />
        <Routes>
          <Route path="/money-transfer" element={<MoneyTransfer />} />
          {/* Add other routes here */}
        </Routes>
      </div>
    </div>
  );
};

export default UserDashboard;
