import React from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { signup } from '../../actions/session_actions';
import SignupFrom from './signup_form';

const mSTP = ({ errors }) => {
    return {
        errors: errors.session,
        formType: 'signup',
        navLink: <Link to="/login">Log In instead</Link>
    }
}

const mDTP = dispatch => {
    return {
        processForm: (user) => dispatch(signup(user))
    }
}

export default connect(mSTP, mDTP)(SignupFrom);