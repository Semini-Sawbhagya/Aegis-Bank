import React, { useState } from 'react';
import { TextField, Button, Typography, Card } from '@mui/material';
import SnackbarAlert from '../../common/alert/SnackbarAlert';
import ConfirmationDialog from '../../common/confirmation-dialog/ConfirmationDialog';
import api from '../../../services/api';

const UpdateEmployeeBranch = () => {
  const [employeeBranchData, setEmployeeBranchData] = useState({
    staffId: '',
    branchId: ''
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
    updateEmployeeBranch();
  };

  const handleCancelDialog = () => {
    handleCloseDialog();
  };

  const updateEmployeeBranch = async () => {
    try {
      console.log('Updating employee branch:', employeeBranchData);
      const response = await api.post('/updateStaffBranch', {
        staff_id: employeeBranchData.staffId,
        branch_id: employeeBranchData.branchId
      });
      console.log('Response:', response.data);
      showMessage('Employee branch updated successfully', 'success');
    } catch (error) {
      console.error('Error updating employee branch:', error);
      showMessage('Error updating employee branch', 'error');
    }
  };

  const handleUpdateBranch = () => {
    if (!employeeBranchData.staffId || !employeeBranchData.branchId) {
      showMessage('Please fill in both Staff ID and Branch ID', 'error');
      return;
    }
    handleOpenDialog();
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setEmployeeBranchData((prev) => ({
      ...prev,
      [name]: value
    }));
  };

  return (
    <div className="update-employee-branch-container" style={{ paddingBottom: '25px' }}>
      <Card sx={{ maxWidth: '600px', margin: 'auto', padding: '20px', borderRadius: 4, marginTop: '20px',backgroundColor:"#083010", color:"white"}}>
        <Typography variant="h6">Update Employee Branch</Typography>

        <TextField
          label="Staff ID"
          name="staffId"
          value={employeeBranchData.staffId}
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
          label="Branch ID"
          name="branchId"
          value={employeeBranchData.branchId}
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

        <div className="button-container">
          <Button
            variant="contained"
            color="primary"
            onClick={handleUpdateBranch}
            sx={{
              marginRight: 1,
              backgroundColor: "#614915",
              color: "white",
              '&:hover': {
                  backgroundColor: "#614915", // Hover effect
              },
          }}
          >
            Update Branch
          </Button>
        </div>
      </Card>

      <ConfirmationDialog
        open={dialogOpen}
        onClose={handleCloseDialog}
        message={"Are you sure you want to update this employee's branch?"}
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

export default UpdateEmployeeBranch;
