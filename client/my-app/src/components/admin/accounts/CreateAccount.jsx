import React, { useState, useEffect } from 'react';
import { Typography, TextField, Button, MenuItem, FormControl, InputLabel, Select, Card } from '@mui/material';
import CancelIcon from '@mui/icons-material/Cancel';
import AddCircleIcon from '@mui/icons-material/AddCircle';
import SnackbarAlert from '../../common/alert/SnackbarAlert';
import api from '../../../services/api';
import Cookies from 'js-cookie';
import './CreateAccount.css';

const CreateAccount = () => {
  const [customerType, setCustomerType] = useState('');
  const [accountType, setAccountType] = useState('');
  const [branchName, setBranchName] = useState('');
  const [branchId, setBranchId] = useState('');
  const [savingsPlanType, setSavingsPlanType] = useState('');
  const [initialDeposit, setInitialDeposit] = useState('');
  const [idNumber, setIdNumber] = useState('');
  const [licenseNumber, setLicenseNumber] = useState('');
  const [generatedAccountNumber, setGeneratedAccountNumber] = useState('');

  // Snackbar alert
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [snackbarSeverity, setSnackbarSeverity] = useState('');

  const showMessage = (message, severity) => {
    setSnackbarMessage(message);
    setSnackbarSeverity(severity);
    setSnackbarOpen(true);
  };

  const handleSnackbarClose = () => {
    setSnackbarOpen(false);
  };

  const handleCancel = () => {
    setCustomerType('');
    setAccountType('');
    setBranchName('');
    setSavingsPlanType('');
    setInitialDeposit('');
    setIdNumber('');
    setLicenseNumber('');
    setGeneratedAccountNumber('');
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
  
    // Validate initial deposit for savings accounts
    if (accountType === 'savings') {
      const minDeposit = getMinimumDeposit(savingsPlanType);
      if (parseFloat(initialDeposit) < minDeposit) {
        showMessage(`Initial deposit must be at least $${minDeposit}`, 'error');
        return;
      }
    }    
  
    try {
      const accountData = {
        customerType,
        accountType,
        branchId,
        savingsPlanTypeId: getPlanTypeId(savingsPlanType),
        initialDeposit,
        idNumber,
        licenseNumber
      };
      console.log('Account Data:', accountData);
      const response = await api.post('staff/create_account', accountData);
      
      if (response && response.data) {
        setGeneratedAccountNumber(response.data.accountNumber);
        showMessage(response.data.message, 'success');
      } else {
        showMessage('Failed to create account: No response data', 'error');
      }
    } catch (error) {
      console.error('Error creating account:', error);
      showMessage(error.response?.data?.message || 'Failed to create account', 'error');
    }

  };

  const getMinimumDeposit = (planType) => {
    switch (planType) {
      case 'child':
        return 0;
      case 'teen':
        return 500;
      case 'adult':
      case 'senior':
        return 1000;
      default:
        return 0;
    }
  };
  const getPlanTypeId = (planType) => {
    switch (planType) {
      case 'child':
        return 1;
      case 'teen':
        return 2;
      case 'adult':
        return 3;
      case 'senior':
        return 4;
      default:
        return 0;
    }
  };

  useEffect(() => {
    const fetchBranchName = async () => {
      try {
        const staffId = Cookies.get('staffId');  // Retrieve staff_id from cookies
        const staff_role = Cookies.get('role');  // Retrieve staff_role from local storage
        if (!staffId) {
          showMessage('Staff ID not found', 'error');
          return;
        }
        if (!staff_role) {
          showMessage('Staff role not found', 'error');
          return;
        }
        
        const response = await api.get('staff/branch_name', { params: { staffId, staff_role } });  // Pass as query param
        setBranchName(response.data.branchName);
        setBranchId(response.data.branchId);
      } catch (error) {
        console.error('Error fetching branch name:', error);
        showMessage('Failed to fetch branch name', 'error');
      }
    };
  
    fetchBranchName();
  }, []);
  

  return (
    <div className="create-account-container">
      <Card sx={{ maxWidth: '600px', margin: 'auto', padding: '20px', borderRadius: 4, marginTop: '20px'}}>
        <Typography variant="h6">Create Account</Typography>
        <form onSubmit={handleSubmit} className="create-account-form">
          <FormControl fullWidth margin="normal">
            <InputLabel>Customer Type</InputLabel>
            <Select value={customerType} onChange={(e) => setCustomerType(e.target.value)}>
              <MenuItem value="individual">Individual</MenuItem>
              <MenuItem value="organization">Organization</MenuItem>
            </Select>
          </FormControl>
          {customerType === 'individual' && (
            <TextField
              fullWidth
              margin="normal"
              label="ID Number"
              value={idNumber}
              onChange={(e) => setIdNumber(e.target.value)}
            />
          )}
          {customerType === 'individual' && (
            <FormControl fullWidth margin="normal">
            <InputLabel>Account Type</InputLabel>
            <Select value={accountType} onChange={(e) => setAccountType(e.target.value)}>
              <MenuItem value="savings">Savings</MenuItem>
              <MenuItem value="checking">Checking</MenuItem>
            </Select>
          </FormControl>
          )}
          {customerType === 'organization' && (
            <TextField
              fullWidth
              margin="normal"
              label="License Number"
              value={licenseNumber}
              onChange={(e) => setLicenseNumber(e.target.value)}
            />
          )}
          {customerType === 'organization' && (
            <FormControl fullWidth margin="normal">
            <InputLabel>Account Type</InputLabel>
            <Select value={accountType} onChange={(e) => setAccountType(e.target.value)}>
              <MenuItem value="checking">Checking</MenuItem>
            </Select>
          </FormControl>
          )}
          <TextField
            fullWidth
            margin="normal"
            label="Branch Name"
            value={branchName}
            disabled
          />
          {accountType === 'savings' && customerType === 'individual' && (
            <FormControl fullWidth margin="normal">
            <InputLabel>Savings Plan Type</InputLabel>
            <Select value={savingsPlanType} onChange={(e) => setSavingsPlanType(e.target.value)}>
              <MenuItem value="child">Children - 12%, no minimum</MenuItem>
              <MenuItem value="teen">Teen - 11%, $500 minimum</MenuItem>
              <MenuItem value="adult">Adult (18+) - 10%, $1000 minimum</MenuItem>
              <MenuItem value="senior">Senior (60+) - 13%, $1000 minimum</MenuItem>
            </Select>
            </FormControl>)
          }
          {accountType === 'savings' &&(
            <>
              <TextField
                fullWidth
                margin="normal"
                label="Initial Deposit"
                type="number"
                value={initialDeposit}
                onChange={(e) => setInitialDeposit(e.target.value)}
                sx={{
                  height: '56px', 
                  '& input': { 
                    height: '56px',
                    fontSize: '16px'
                    }
                }}
              />
            </>
          )}
          {accountType === 'checking' && (
            <TextField
              fullWidth
              margin="normal"
              label="Initial Deposit"
              type="number"
              value={initialDeposit}
              onChange={(e) => setInitialDeposit(e.target.value)}            
              // sx={{
              //   height: '56px', 
              //   '& input': { 
              //   height: '56px',
              //   fontSize: '16px'
              //   }
              // }}
            />
          )}
          <div className="button-container">
            <Button className="cancel-button"
              variant="contained"
             // startIcon={<CancelIcon />}
              // sx={{ backgroundColor: '#695CFE', ':hover': { backgroundColor: '#5648CC' } }}
              //style={{ marginRight: '8px' }}
              onClick={handleCancel}
            >
              Cancel
            </Button>
            <Button className="create-account-button"
              type="submit"
              variant="contained"
              //endIcon={<AddCircleIcon />}
            //  sx={{ backgroundColor: '#695CFE', ':hover': { backgroundColor: '#5648CC' } }}
            >
              Create Account
            </Button>
          </div>
        </form>
        {generatedAccountNumber && (
          <Typography variant="h6" color="success" align="center" sx={{ mt: 2 }}>
            Account created successfully! Account Number: {generatedAccountNumber}
          </Typography>
        )}
      </Card>

      <SnackbarAlert
        open={snackbarOpen}
        onClose={handleSnackbarClose}
        severity={snackbarSeverity}
        message={snackbarMessage}
      />
    </div>
  );
};

export default CreateAccount;