// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM, { render } from 'react-dom'
import PropTypes from 'prop-types'
import { withRouter } from 'react-router-dom';
import  Routes  from './route';
import FirstPage from './firstpage'
import SecondPage from './secondpage'
import Sample from './sample'
import axios from 'axios'


class Place extends React.Component{
  constructor(props) {
    super(props);
    }
  render(){
    return(
      <div className = "container">
      <div className = "row">
        <form className = "col align-items-center">
              <div className="border rounded m-3 p-2">
              <label name="place">場所(駅名、地名を入力してください)</label>
                <div>
                  <input type="text" name="place" placeholder="入力してください" value={this.props.place.value} onChange={this.props.handleChange} required></input>
                </div>
                <input type="button" value="次へ" onClick={() => this.props.State(this.props.num)}></input>
              </div>
        </form>
      </div>
    </div>
    );
  }
}

class Budget extends React.Component{
  constructor(props) {
    super(props);
  }

  render(){
    return(
      <div className = "container">
        <div className = "row">
          <form className = "col align-items-center">
            <div className="border rounded m-3 p-2">
              <label name="place">予算</label>
                <div>
                  <label>
                    <input type="radio" name="budget" value="B002" checked={this.props.budget === 'B002'} onChange={this.props.onValueChange} required></input>3000円
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="budget" value="B008" checked={this.props.budget === 'B008'} onChange={this.props.onValueChange} required></input>5000円
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="budget" value="B005" checked={this.props.budget === 'B005'} onChange={this.props.onValueChange} required></input>10000円
                  </label>
                </div>
                <div>
                  <input type="button" value="次へ" onClick={() => this.props.State(this.props.num)}></input>
                </div>
            </div>
          </form>
        </div>
      </div>
    );
  }
  }

  class Style extends React.Component{
    constructor(props) {
      super(props);
    }
    render(){
      return(
        <div className = "container">
        <div className = "row">
          <form className = "col align-items-center">
                <div className="border rounded m-3 p-2">
                  <label naem="place">インドアですか？アウトドアですか？</label>
                    <div>
                      <label>
                        <input type="radio" name="style" value="0" checked={this.props.style === '0'} onChange={this.props.onValueChange} required></input>インドア派
                      </label>
                    </div>
                    <div>
                      <label>
                        <input type="radio" name="style" value="1" checked={this.props.style === '1'} onChange={this.props.onValueChange} required></input>アウトドア派
                      </label>
                    </div>
                    <input type="button" value="次へ" onClick={() => this.props.State(this.props.num)}></input>
                </div>
          </form>
        </div>
      </div>
      );
    }
    }
  
  class Age extends React.Component{
    constructor(props) {
      super(props);
    }
    render(){
      return(
        <div className = "container">
          <div className = "row">
            <form className = "col align-items-center" onSubmit={() => this.props.handleSubmit()}>
                  <div className="border rounded m-3 p-2">
                  <label name="place">年齢</label>
                  <div>
                    <label>
                      <input type="radio" name="age" value="10" checked={this.props.age === '10'} onChange={this.props.onValueChange} required></input>10-20代
                    </label>
                  </div>
                  <div>
                    <label>
                      <input type="radio" name="age" value="30" checked={this.props.age === '30'} onChange={this.props.onValueChange} required></input>30-40代
                    </label>
                  </div>
                  <div>
                    <label>
                      <input type="radio" name="age" value="50" checked={this.props.age === '50'} onChange={this.props.onValueChange} required></input>50-60代
                    </label>
                  </div>
                    <input type="submit" value="送信" ></input>
                  </div>
            </form>
          </div>
      </div>
      );
    }
    }
    
      

  class App extends React.Component{
    constructor(props) {
      super(props);
      this.state = {num: 1,place:"",budget:"",style:"",age:""};
      this.handleChange = this.handleChange.bind(this);
      this.onValueChange = this.onValueChange.bind(this);
    }

    onButtonClick = (state) => {
      this.setState({ num: state+1 });
    };
    handleChange(event) {
      this.setState({place: event.target.value});
    }
  
    onValueChange(event) {
      this.setState({
        budget: event.target.value
      });
    }

    onValueChange2(event) {
      this.setState({
        style: event.target.value
      });
    }

    onValueChange3(event) {
      this.setState({
        age: event.target.value
      });
    }

    handleSubmit(state) {
      console.log(state)
      axios
        .get('http://localhost:3000/search/search',{ params: state})
        .then((results) => { console.log(results); })
        .catch(console.error);
    }

    render(){
      // console.log(this.state)
      const { num,place,budget,style,age} = this.state
      let simpleDataJSON = JSON.stringify(this.state);
      // console.log(simpleDataJSON);
      // console.log()
      return(
        <div>
          {num === 1 && <Place State={(state) => this.onButtonClick(state)} num={num} place={place} handleChange={(event) => this.handleChange(event)}/>}
          {num === 2 && <Budget State={(state) => this.onButtonClick(state)} num={num} budget={budget} onValueChange={(event) =>this.onValueChange(event)}/>}
          {num === 3 && <Style State={(state) => this.onButtonClick(state)} num={num} style={style} onValueChange={(event) =>this.onValueChange2(event)}/>}
          {num === 4 && <Age State={(state) => this.onButtonClick(state)} num={num} age={age} onValueChange={(event) =>this.onValueChange3(event)} handleSubmit={(event) => this.handleSubmit(this.state)}/>}
        </div>
      )
    }
  }
  

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App/>,
    document.body.appendChild(document.createElement('div')),
  )
})




