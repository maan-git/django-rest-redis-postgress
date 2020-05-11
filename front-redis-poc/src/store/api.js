import axios from 'axios';

//const apiUrl = 'https://conta-comigo-ap.herokuapp.com/';
const apiUrl = 'http://0.0.0.0:8000/';

export default () => axios.create({
  baseURL: apiUrl,
  withCredentials: true,
  Accept: 'application/json',
  headers: {
    'Content-Type': 'application/json',
  },
});
