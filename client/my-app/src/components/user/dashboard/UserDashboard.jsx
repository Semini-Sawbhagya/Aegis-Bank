import React from 'react';
import { Routes, Route, Link } from 'react-router-dom';
import MoneyTransfer from '../MoneyTransfer/MoneyTransfer'; // Adjust the path based on your folder structure
import AccountDetails from '../account-details/AccountDetails';   
import backgroundImage from '../../../assets/background.jpg';
import logo from '../../../assets/AegisLogo.png';
import settingsIcon from '../../../assets/settings0.svg';
import logoutIcon from '../../../assets/logout-020.svg';
import helpIcon from '../../../assets/help0.svg';
import transIcon from '../../../assets/wallet-020.svg';
import loansIcon from '../../../assets/bag-040.svg';
import accountIcon from '../../../assets/bank-note-010.svg';
import moneyIcon from '../../../assets/currency-coin-dollar0.svg';
import homeIcon from '../../../assets/home-010.svg';
import back from '../../../assets/back.jpg';
import './UserDashboard.css';
import Home from '../home/Home';
import Cookies from 'js-cookie';
import Loans from '../loans/Loans';
import ApplyLoan from '../loans/ApplyLoan';
import LoanDetails from '../loans/LoanDetails';
import LoanPayment from '../loans/LoanPayment';
import TransactionHistory from '../transaction-history/transaction';
import Settings from "../../user/settings/Settings";
const UserDashboard = () => {
  // Menu items array for dynamic rendering
  const menuItems = [
    { path: '/dashboard/home', img: homeIcon, label: 'Home' },
    { path: '/dashboard/account-details', img: accountIcon, label: 'Account Details' },
    { path: '/dashboard/money-transfer', img: moneyIcon, label: 'Money Transfer' },
    { path: '/dashboard/transaction-history', img: transIcon, label: 'Transaction History' },
    { path: '/dashboard/loans/apply', img: loansIcon, label: 'Loans' },
    
  ];
  const userName = Cookies.get('username');
  const userRole =  Cookies.get('role');
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
            <Link to="/dashboard/settings">
            <img src={settingsIcon} alt="Settings" />
            <span>Settings</span>
            </Link>
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
      <div className="main-content" backgroundImage={back} >
        <div className="heading">
          <p> Welcome, {userName}. (customer)</p>
        </div>
        <img className="background" src={backgroundImage} alt="Background" />
        <Routes>
          <Route path="/money-transfer" element={<MoneyTransfer />} />
          <Route path='/home' element={<Home/>} />
          <Route path="/account-details" element={<AccountDetails/>}/>
          <Route path="loans" element={<Loans/>}>
            <Route path="apply" element={<ApplyLoan/>}/>
            <Route path="payment" element={<LoanPayment/>}/>
            <Route path="details" element={<LoanDetails/>}/>
          </Route>
          <Route path="transaction-history" element={<TransactionHistory/>}/>
          <Route path="settings" element={<Settings />} />
        </Routes>
      </div>
    </div>
  );
};

export default UserDashboard;
