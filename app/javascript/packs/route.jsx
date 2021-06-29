
import React ,{Component}from 'react'
import { Route,BrowserRouter as Router,Switch,Link} from 'react-router-dom';
import FirstPage from './firstpage'
import SecondPage from './secondpage'


const Routes = (props) => {
      return (
        <Router>
            <Switch>
                <Route path='/firstpage' component={FirstPage}/>
                <Route  path='/secondpage' component={SecondPage}/>
            </Switch>
            <FirstPage/>
        </Router>
      )
    }

export default Routes;
  