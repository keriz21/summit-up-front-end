import { createStore } from "vuex";
import axios from 'axios';

export default createStore({
    state : {
        authToken: null,
        user: null
    },
    mutations:{
        setToken(state, token){
            state.authToken = token;
        },
        clearToken(state) {
            state.authToken = null;
        },
        setUser(state,user) {
            state.user = user;
        },
        clearUser(state){
            state.user = null;
        }
    },
    actions:{
        async login({comit}, {email, password}) {
            try {
                const response = await axios.post('http://localhost:3039/api/auth/login,', {
                    email,
                    password
                });

                if (response.status === 200){
                    const {token, user} = response.data;
                    commit('setToken', token);
                    commit('setUser', user);
                    localStorage.setItem('authToken', token);
                    localStorage.setItem('user', JSON.stringify(user))
                }
            } catch (error) {
                console.error('Error during login:', error.response?.data?.message || error.message);
            }
        },
        logout({commit}){
            commit('clearToken');
            commit('clearUser');
            localStorage.removeItem('authToken');
            localStorage.removeItem('user');
        },
        loadStoredData({commit}){
            const token = localStorage.getItem('authToken');
            const user = localStorage.getItem('user');

            if(token){
                commit('setToken', token);
            }

            if (user) {
                commit('setUser', JSON.parse(user));
            }
        }
    },
    getters: {
        isAuthenticated(state){
            return !!state.authToken;
        },
        getUser(state){
            return state.user;
        }
    }
})