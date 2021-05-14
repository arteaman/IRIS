import React from 'react';

import { useHistory } from "react-router-dom";

import { SignUpIn } from "../components/SignUpIn";
import { UserContext } from '../user'
import {getClient, addClient} from '../services/api'

export const AuthPage = ({ signIn }) => {
	const history = useHistory();
	const { setUser } = React.useContext(UserContext);

	const onSignIn = async (data) => {
		const user= await getClient(data.email);
		console.log(user);
		setUser(user);
		history.push('/');
	};

	const onSignUp = async (data) => {
        console.log(data)
		const user = await addClient({ Email: data.email, FIO: data.name, Mobile: data.mobile })
		console.log(user);
		setUser(user);
		history.push('/');
	};

	const onSubmit = signIn ? onSignIn : onSignUp;
	return (
		<SignUpIn onSubmit={onSubmit} isSignup={!signIn}/>
	);
}