import React, { useState } from 'react';
import { TextField, Button, Typography, Paper, Card, CardContent } from '@mui/material';
import SnackbarAlert from '../../common/alert/SnackbarAlert';
import api from '../../../services/api';
import './GetCustomerDetails.css';

const GetCustomerDetails = () => {
  const [NICOrLicenseNumber, setNICOrLicenseNumber] = useState('');
  const [customerDetails, setCustomerDetails] = useState(null);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [snackbarSeverity, setSnackbarSeverity] = useState('');

  const handleSnackbarClose = () => {
    setSnackbarOpen(false);
  };

  const showMessage = (message, severity) => {
    setSnackbarMessage(message);
    setSnackbarSeverity(severity);
    setSnackbarOpen(true);
  };

  const handleSearch = async () => {
    try {
        console.log(NICOrLicenseNumber);
      const response = await api.post('/customer-details', { NIC_or_licenseNumber: NICOrLicenseNumber });
      if (response.data.success) {
        setCustomerDetails(response.data.details[0]);
        showMessage('Customer found!', 'success');
      } else {
        setCustomerDetails(null);
        showMessage('No customer found for this identifier.', 'warning');
      }
    } catch (error) {
      console.error('No customer found:', error);
      showMessage('No customer found for this identifier.', 'error');
      setCustomerDetails(null);
    }
  };

  return (
    <div style={{ padding: '20px' }}>
      <Card sx={{ maxWidth: '600px', margin: 'auto', padding: '20px', borderRadius: 4,backgroundColor:"#083010", color:"white"}}>
        <CardContent>
          <Typography variant="h6" gutterBottom sx={{ color: "white" }}>
            Get Customer Details
          </Typography>
          
          {/* Search Input Field */}
          <TextField
              label="NIC or License Number"
              variant="outlined"
              fullWidth
              margin="normal"
              value={NICOrLicenseNumber}
              onChange={(e) => setNICOrLicenseNumber(e.target.value)}
              sx={{
                '& .MuiOutlinedInput-root': {
                '& fieldset': {
                   borderColor: 'white', // Default border color
                 },
                '&:hover fieldset': {
                   borderColor: 'white', // Border color on hover
                 },
                '&.Mui-focused fieldset': {
                   borderColor: 'white', // Border color when focused
                 },
                },
                '& .MuiInputLabel-root': {
                  color: 'white', // Label color
                },
                '& .MuiInputBase-input': {
                  color: 'white', // Text color
                },
              }}
          />

          {/* Search Button */}
          <Button
              className="search-button"
              variant="contained"
              onClick={handleSearch}
              //style={{ marginBottom: '20px' }}
              sx={{
                marginRight: 1,
                backgroundColor: "#614915",
                color: "white",
                '&:hover': {
                    backgroundColor: "#614915", // Hover effect
                },
            }}
          >
              Search
          </Button>

          {/* Customer Details Display */}
          {customerDetails && (
              <Paper elevation={3} style={{ padding: '20px', marginTop: '20px' }}>
                <Typography variant="subtitle1" gutterBottom>Customer Details</Typography>
                <Typography><strong>Customer ID:</strong> {customerDetails.customer_id}</Typography>
                <Typography><strong>Name:</strong> {customerDetails.customer_name}</Typography>
                <Typography><strong>Mobile Number:</strong> {customerDetails.mobile_number}</Typography>
                <Typography><strong>Landline Number:</strong> {customerDetails.landline_number}</Typography>
                <Typography><strong>Address:</strong> {customerDetails.address}</Typography>
              </Paper>
          )}
        </CardContent>
      </Card>

      {/* Snackbar for Feedback Messages */}
      <SnackbarAlert
        open={snackbarOpen}
        onClose={handleSnackbarClose}
        severity={snackbarSeverity}
        message={snackbarMessage}
      />
    </div>
  );
};

export default GetCustomerDetails;
