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

class Hello extends React.Component{
  constructor(props) {
    super(props);
  }
  render(){
    return(
      <div className = "container">
      <div className = "row">
        <form>
              <div className="field py-3">
              <label naem="place">場所(駅名、地名を入力してください)</label>
                <div>
                  <input type="text" name="place" vale="入力してください" required></input>
                </div>
                <input type="button" value="次へ"></input>
              </div>
        </form>
      </div>
    </div>
    );
  }
  }

class Ola extends React.Component{
  constructor(props) {
    super(props);
  }
  render(){
    return(
      <div className = "container">
        <div className = "row">
          <form>
          <div className="field py-3">
            <label naem="place">Hallo</label>
              <div>
                <input type="text" name="place" vale="入力してください" required></input>
              </div>
              <input type="button" value="次へ" onClick={() => this.props.State(this.props.tum)}></input>
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
      this.state = {tum: 1, tw: 10};
    }

    onButtonClick = (state) => {
      this.setState({ tum: state+1 });
    };
  

    render(){
      console.log(this.state.tum)
      const { tum } = this.state
      return(
        <div>
          {tum === 1 && <Ola State={(state) => this.onButtonClick(state)} tum={tum}/>}
          {function() {if(tum===2) return <Hello State={(state) => this.onButtonClick(state)} tum={tum}/> }()}
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
