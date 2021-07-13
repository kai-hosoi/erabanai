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
              <label naem="place">場所(駅名、地名を入力してください)</label>
                <div>
                  <input type="text" name="place" placeholder="入力してください" required></input>
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
                    <input type="radio" name="budget" vale="B002" required></input>3000円
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="budget" vale="B008" required></input>5000円
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="budget" vale="B005" required></input>10000円
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
                        <input type="radio" name="style" value="0" required></input>インドア派
                      </label>
                    </div>
                    <div>
                      <label>
                        <input type="radio" name="style" value="1" required></input>アウトドア派
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
              <form className = "col align-items-center">
                    <div className="border rounded m-3 p-2">
                    <label name="place">年齢</label>
                    <div>
                      <label>
                        <input type="radio" name="age" value="10" required></input>10-20代
                      </label>
                    </div>
                    <div>
                      <label>
                        <input type="radio" name="age" value="30" required></input>30-40代
                      </label>
                    </div>
                    <div>
                      <label>
                        <input type="radio" name="age" value="50" required></input>50-60代
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
    
      

  class Parent extends React.Component{
    constructor(props) {
      super(props);
      this.state = {num: 1, tw: 10};
    }

    onButtonClick = (state) => {
      this.setState({ num: state+1 });
    };
  

    render(){
      console.log(this.state.num)
      const { num } = this.state
      return(
        <div>
          {num === 1 && <Place State={(state) => this.onButtonClick(state)} num={num}/>}
          {num === 2 && <Budget State={(state) => this.onButtonClick(state)} num={num}/>}
          {num === 3 && <Style State={(state) => this.onButtonClick(state)} num={num}/>}
          {num === 4 && <Age State={(state) => this.onButtonClick(state)} num={num}/>}
        </div>
      )
    }
  }
  

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Parent/>,
    document.body.appendChild(document.createElement('div')),
  )
})
var textbox = document.getElementById("place")
var data = {
  place: textbox.value
}

console.log(data)
