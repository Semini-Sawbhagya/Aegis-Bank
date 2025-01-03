import React, {useState}from 'react';
import { Routes, Route, Link,useNavigate, useLocation } from 'react-router-dom';  
import backgroundImage from '../../../assets/background.jpg';
import logo from '../../../assets/AegisLogo.png';
import settingsIcon from '../../../assets/settings0.svg';
import logoutIcon from '../../../assets/logout-020.svg';
import helpIcon from '../../../assets/help0.svg';
import transIcon from '../../../assets/wallet-020.svg';
import loansIcon from '../../../assets/bag-040.svg';
import accountIcon from '../../../assets/bank-note-010.svg';
import customerIcon from '../../../assets/customer.png';
import employeeIcon from '../../../assets/employee.png';
import reportIcon from '../../../assets/reports.svg';
import fixedDepositIcon from '../../../assets/fixedDeposits.svg';
import back from '../../../assets/back.jpg';
import './AdminDashboard.css';
import { logout } from '../../../services/auth';
import Cookies from 'js-cookie';
import AddCustomers from '../customers/AddCustomers';
import GetCustomerDetails from '../customers/GetCustomerDetails';
import Customers from '../customers/Customers';
import Reports from '../reports/Reports';
import BranchTransactionReport from '../reports/BranchTransactionReport';
import BranchLatePaymentsReport from '../reports/BranchLatePaymentsReport';
import Transactions from '../transactions/transactions';
import Settings from '../../admin/settings/Settings';
import FixedDeposit from '../FixedDeposits/fixedDeposits';
import Employee from '../employees/Employees';
import AddEmployeeForm from '../employees/AddEmployees';
import RemoveEmployee from '../employees/removeEmployee';
import UpdateEmployee from '../employees/updateStaffDetails';
import UpdateEmployeeUserDetails from '../employees/updateUserDetails';
import UpdateEmployeeBranch from '../employees/updatebranchDetails';
import CreateAccount from '../accounts/CreateAccount';
import EmployeeLoans from '../../admin/Loans/EmployeeLoans/employeeLoans';
import ManagerLoans from '../../admin/Loans/ManagerLoans/managerLoans';



const AdminDashboard = () => {
  const userName = Cookies.get('username');
  const userRole = Cookies.get('role');
  console.log(userRole);

  const navigate = useNavigate();
  const location = useLocation(); // Hook to get the current location
  const isOnDashboard = location.pathname === '/admin_dashboard'; // Check if on the dashboard route

  const handleLogout = async () => {
    const token = Cookies.get('refreshToken');
    if (!token) {
      console.error("Logout error ! : Missing Token");
      return;
    }
    console.log('Token:', token);
    try {
      console.log("Logout request processing");
      await logout(token);
      navigate('/login');
    } catch (error) {
      console.error('Logout error:', error.response ? error.response.data : error.message);
      console.error('Token :', token);
    }
  };

  const menuItems = [
    { path: '/admin_dashboard/customers/customer_details', img: customerIcon, label: 'Customers' },
    ...(userRole === 'manager' ? [{ path: '/admin_dashboard/employees/add_employee', img: employeeIcon, label: 'Employees' }] : []),
    { path: '/admin_dashboard/create_account', img: accountIcon, label: 'Create Accounts' },
    { path: '/admin_dashboard/transactions', img: transIcon, label: 'Transactions' },
    { path: '/admin_dashboard/fixed_deposits', img: fixedDepositIcon, label: 'Fixed Deposits' },
    ...(userRole === 'manager' ? [{ path: '/admin_dashboard/manager_loans', img: loansIcon, label: 'Manager Loans' }] : []),
    ...(userRole === 'employee' ? [{ path: '/admin_dashboard/employee_loans', img: loansIcon, label: 'Employee Loans' }] : []),
    ...(userRole === 'manager' ? [{ path: '/admin_dashboard/reports/transaction_reports', img: reportIcon, label: 'Reports' }] : []),
  ];

  const footItems = [
    { path: '/admin_dashboard/settings', img: settingsIcon, label: 'Settings' },
   // { path: '/dashboard/help', img: helpIcon, label: 'Help' },
    { path: '/dashboard/logout', img: logoutIcon, label: 'Logout' },
  ];

  return (
    <div className="user-dashboard">
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
          <nav>
            {footItems.map((item, index) => {
              if (item.label === 'Logout') {
                return (
                  <div
                    key={index}
                    className="menu-item"
                    onClick={handleLogout}
                    role="button"
                    aria-label={item.label}
                    tabIndex={0}
                  >
                    <img src={item.img} alt={item.label} />
                    <span>{item.label}</span>
                  </div>
                );
              }
              return (
                <Link key={index} to={item.path} className="menu-item" aria-label={item.label}>
                  <img src={item.img} alt={item.label} />
                  <span>{item.label}</span>
                </Link>
              );
            })}
          </nav>
        </div>
      </div>

      <div className="main-content">
      <div className="heading">
              <p>Welcome, {userName}.</p>
            </div>
        {isOnDashboard && (
          <div className="welcome-section">
            <img className="background" src={back} alt="Background" />
            <p className="welcome-message">WELCOME TO AEGIS BANK</p>
          </div>
        )}

        <Routes>
          <Route path="customers" element={<Customers />}>
            <Route path="add_customer" element={<AddCustomers />} />
            <Route path="customer_details" element={<GetCustomerDetails />} />
          </Route>
          <Route path="employees" element={<Employee />}>
            <Route path="add_employee" element={<AddEmployeeForm />} />
            <Route path="remove_employee" element={<RemoveEmployee />} />
            <Route path="update_employee" element={<UpdateEmployee />} />
            <Route path="update_employee_user" element={<UpdateEmployeeUserDetails />} />
            <Route path="update_employee_branch" element={<UpdateEmployeeBranch />} />
          </Route>
          <Route path="create_account" element={<CreateAccount />} />
          <Route path="transactions" element={<Transactions />} />
          <Route path="reports" element={<Reports />}>
            <Route path="transaction_reports" element={<BranchTransactionReport />} />
            <Route path="branch_late_payments_report" element={<BranchLatePaymentsReport />} />
          </Route>
          <Route path="manager_loans" element={<ManagerLoans />} />
          <Route path="employee_loans" element={<EmployeeLoans />} />
          <Route path="fixed_deposits" element={<FixedDeposit />} />
          <Route path="settings" element={<Settings />} />
          <Route path="logout" element={<Settings />} />
        </Routes>
      </div>
    </div>
  );
};

export default AdminDashboard;
