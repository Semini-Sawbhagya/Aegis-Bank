import React, { useState } from 'react';
import { TextField, Button, Typography, Card } from '@mui/material';
import SnackbarAlert from '../../common/alert/SnackbarAlert';
import ConfirmationDialog from '../../common/confirmation-dialog/ConfirmationDialog';
import api from '../../../services/api';

const UpdateEmployee = () => {
  const [employeeInfo, setEmployeeInfo] = useState({
    staffId: '',
    fullName: '',
    dateOfBirth: ''
  });

  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [snackbarSeverity, setSnackbarSeverity] = useState('');
  const [dialogOpen, setDialogOpen] = useState(false);

  const showMessage = (message, severity) => {
    setSnackbarMessage(message);
    setSnackbarSeverity(severity);
    setSnackbarOpen(true);
  };

  const handleSnackbarClose = () => {
    setSnackbarOpen(false);
  };

  const handleOpenDialog = () => {
    setDialogOpen(true);
  };

  const handleCloseDialog = () => {
    setDialogOpen(false);
  };

  const handleConfirm = () => {
    handleCloseDialog();
    updateEmployee();
  };

  const handleCancelDialog = () => {
    handleCloseDialog();
  };

  const updateEmployee = async () => {
    try {
      console.log('Updating employee details:', employeeInfo);
      const response = await api.post('/updateStaffDetails', {
        staff_id: employeeInfo.staffId,
        full_name: employeeInfo.fullName,
        date_of_birth: employeeInfo.dateOfBirth
      });
      console.log('Response:', response.data);
      showMessage('Employee updated successfully', 'success');
    } catch (error) {
      console.error('Error updating employee:', error);
      showMessage('Error updating employee details', 'error');
    }
  };

  const handleUpdateEmployee = () => {
    if (!employeeInfo.staffId || !employeeInfo.fullName || !employeeInfo.dateOfBirth) {
      showMessage('Please fill in all fields', 'error');
      return;
    }
    handleOpenDialog();
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setEmployeeInfo((prev) => ({
      ...prev,
      [name]: value
    }));
  };

  return (
    <div className="update-employee-container" style={{ paddingBottom: '25px' }}>
      <Card sx={{ maxWidth: '600px', margin: 'auto', padding: '20px', borderRadius: 4, marginTop: '20px',backgroundColor:"#083010", color:"white"}}>
        <Typography variant="h6">Update Employee</Typography>

        <TextField
          label="Staff ID"
          name="staffId"
          value={employeeInfo.staffId}
          fullWidth
          margin="normal"
          onChange={handleInputChange}
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

        <TextField
          label="Full Name"
          name="fullName"
          value={employeeInfo.fullName}
          fullWidth
          margin="normal"
          onChange={handleInputChange}
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

        <TextField
          label="Date of Birth"
          name="dateOfBirth"
          type="date"
          value={employeeInfo.dateOfBirth}
          fullWidth
          margin="normal"
          InputLabelProps={{ shrink: true }}
          onChange={handleInputChange}
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

        <div className="button-container">
          <Button
            variant="contained"
            color="primary"
            onClick={handleUpdateEmployee}
            sx={{
              marginRight: 1,
              backgroundColor: "#614915",
              color: "white",
              '&:hover': {
                  backgroundColor: "#614915", // Hover effect
              },
          }}
          >
            Update
          </Button>
        </div>
      </Card>

      <ConfirmationDialog
        open={dialogOpen}
        onClose={handleCloseDialog}
        message={"Are you sure you want to update this employee's details?"}
        onConfirm={handleConfirm}
        onCancel={handleCancelDialog}
      />

      <SnackbarAlert
        open={snackbarOpen}
        onClose={handleSnackbarClose}
        severity={snackbarSeverity}
        message={snackbarMessage}
      />
    </div>
  );
};

export default UpdateEmployee;
