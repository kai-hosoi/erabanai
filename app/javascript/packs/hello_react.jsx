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
          <div className = "col align-items-center">
            <form >
              <div className="border rounded m-3 p-2">
              <label name="place">場所(駅名、地名を入力してください)</label>
                <div>
                  <input type="text" name="place" placeholder="入力してください" value={this.props.place.value} onChange={this.props.handleChange} required></input>
                </div>
                <div>
                  <input type="button" value="次へ" onClick={() => this.props.State(this.props.num)}></input>
                </div>
              </div>
            </form>
          </div>
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
                  <input type="submit" value="戻る" onClick={() => this.props.State2(this.props.num)}></input>
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
                  <div>
                    <input type="submit" value="戻る" onClick={() => this.props.State2(this.props.num)}></input>
                    <input type="button" value="次へ" onClick={() => this.props.State(this.props.num)}></input>
                  </div>
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
          <div className = "col align-items-center" >
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
                  <input type="submit" value="戻る" onClick={() => this.props.State2(this.props.num)}></input>
                  <input type="submit" value="次へ" onClick={() => this.props.State(this.props.num)}></input>
                </div>
          </div>
        </div>
    </div>
    );
  }
  }
    
class Personality extends React.Component{
  constructor(props) {
    super(props);
  }
  render(){
    return(
      <div className = "container">
        <div className = "row">
          <div className = "col align-items-center" >
                <div className="border rounded m-3 p-2">
                <label name="place">性格</label>
                <div>
                  <label>
                    <input type="radio" name="personality" value="1" checked={this.props.personality === '1'} onChange={this.props.onValueChange} required></input>好奇心旺盛
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="personality" value="2" checked={this.props.personality === '2'} onChange={this.props.onValueChange} required></input>辛抱強い
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="personality" value="3" checked={this.props.personality === '3'} onChange={this.props.onValueChange} required></input>野心家
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="personality" value="4" checked={this.props.personality === '4'} onChange={this.props.onValueChange} required></input>マイペース
                  </label>
                </div>
                  <input type="submit" value="戻る" onClick={() => this.props.State2(this.props.num)}></input>
                  <input type="submit" value="次へ" onClick={() => this.props.State(this.props.num)}></input>
                </div>
          </div>
        </div>
    </div>
    );
  }
  }
  
class Color extends React.Component{
  constructor(props) {
    super(props);
  }
  render(){
    return(
      <div className = "container">
        <div className = "row">
          <div className = "col align-items-center" >
                <div className="border rounded m-3 p-2">
                <label name="place">どの色が一番好きなですか？</label>
                <div>
                  <label>
                    <input type="radio" name="color" value="0" checked={this.props.color === '0'} onChange={this.props.onValueChange} required></input>赤色
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="color" value="1" checked={this.props.color === '1'} onChange={this.props.onValueChange} required></input>青色
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="color" value="2" checked={this.props.color === '2'} onChange={this.props.onValueChange} required></input>黄色
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="color" value="3" checked={this.props.color === '3'} onChange={this.props.onValueChange} required></input>緑色
                  </label>
                </div>
                  <input type="submit" value="戻る" onClick={() => this.props.State2(this.props.num)}></input>
                  <input type="submit" value="次へ" onClick={() => this.props.State(this.props.num)}></input>
                </div>
          </div>
        </div>
    </div>
    );
  }
  }
  
class Number extends React.Component{
  constructor(props) {
    super(props);
  }
  render(){
    return(
      <div className = "container">
        <div className = "row">
          <div className = "col align-items-center" >
                <div className="border rounded m-3 p-2">
                <label name="place">好きな数字はなんですか？（１〜９）</label>
                <div>
                  <input type="text" name="number" placeholder="１〜９の中で一番好きな数字を入力してください" value={this.props.number.value} onChange={this.props.handleChange} required></input>
                </div>
                  <input type="submit" value="戻る" onClick={() => this.props.State2(this.props.num)}></input>
                  <input type="submit" value="次へ" onClick={() => this.props.State(this.props.num)}></input>
                </div>
          </div>
        </div>
    </div>
    );
  }
  }

class Sleep extends React.Component{
  constructor(props) {
    super(props);
  }
  render(){
    return(
      <div className = "container">
        <div className = "row">
          <div className = "col align-items-center" >
                <div className="border rounded m-3 p-2">
                <label name="place">何時間寝ますか？</label>
                <div>
                  <label>
                    <input type="radio" name="sleep" value="0" checked={this.props.sleep === '0'} onChange={this.props.onValueChange} required></input>4〜6時間
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="sleep" value="1" checked={this.props.sleep === '1'} onChange={this.props.onValueChange} required></input>6〜8時間
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="sleep" value="2" checked={this.props.sleep === '2'} onChange={this.props.onValueChange} required></input>8〜10時間
                  </label>
                </div>
                  <input type="submit" value="戻る" onClick={() => this.props.State2(this.props.num)}></input>
                  <input type="submit" value="次へ" onClick={() => this.props.State(this.props.num)}></input>
                </div>
          </div>
        </div>
    </div>
    );
  }
  }

class Season extends React.Component{
  constructor(props) {
    super(props);
  }
  render(){
    return(
      <div className = "container">
        <div className = "row">
          <div className = "col align-items-center" >
                <div className="border rounded m-3 p-2">
                <label name="place">好きな季節はなんですか？</label>
                <div>
                  <label>
                    <input type="radio" name="season" value="1" checked={this.props.season === '1'} onChange={this.props.onValueChange} required></input>春
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="season" value="2" checked={this.props.season === '2'} onChange={this.props.onValueChange} required></input>夏
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="season" value="3" checked={this.props.season === '3'} onChange={this.props.onValueChange} required></input>秋
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="season" value="4" checked={this.props.season === '4'} onChange={this.props.onValueChange} required></input>冬
                  </label>
                </div>
                  <div>
                    <input type="submit" value="戻る" onClick={() => this.props.State2(this.props.num)}></input>
                    <input type="submit" value="送信" onClick={(state) => this.props.handleSubmit(state)}></input>
                  </div>
                </div>
          </div>
        </div>
    </div>
    );
  }
  }
            

  class App extends React.Component{
    constructor(props) {
      super(props);
      this.state = {num: 1,place:"",budget:"",style:"",age:"",personality:"",color:"",number:"",sleep:"",season:""};
      this.handleChange = this.handleChange.bind(this);
      this.onValueChange = this.onValueChange.bind(this);
    }


    onButtonClick = (state) => {
      this.setState({ num: state+1 });
    };

    onButtonClick2 = (state) => {
      this.setState({ num: state-1 });
    };

    handleChange(event) {
      this.setState({
        place: event.target.value
      });
    }
    handleChange2(event) {
      this.setState({
        number: event.target.value
      });
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

    onValueChange4(event) {
      this.setState({
        personality: event.target.value
      });
    }

    onValueChange5(event) {
      this.setState(event);

    }

    onValueChange6(event) {
      this.setState({
        sleep: event.target.value
      });
    }
    onValueChange7(event) {
      this.setState({
        season: event.target.value
      });
    }


    handleSubmit(state) {
      window.location.href = `search/search?place=${state.place}&budget=${state.budget}&style=${state.style}&age=${state.age}&personality=${state.personality}&color=${state.color}&number=${state.number}&sleep=${state.sleep}&season=${state.season}`
    }

    render(){
      console.log(this.state)
      const { num,place,budget,style,age,personality,color,number,sleep,season} = this.state
      let simpleDataJSON = JSON.stringify(this.state);
      // console.log(simpleDataJSON);
      // console.log()
      return(
        <div>
          {num === 1 && <Place State={(state) => this.onButtonClick(state)} State2={(state) => this.onButtonClick2(state)} num={num} place={place} handleChange={(event) => this.handleChange(event)}/>}
          {num === 2 && <Budget State={(state) => this.onButtonClick(state)} State2={(state) => this.onButtonClick2(state)} num={num} budget={budget} onValueChange={(event) =>this.onValueChange(event)}/>}
          {num === 3 && <Style State={(state) => this.onButtonClick(state)} State2={(state) => this.onButtonClick2(state)} num={num} style={style} onValueChange={(event) =>this.onValueChange2(event)}/>}
          {num === 4 && <Age State={(state) => this.onButtonClick(state)} State2={(state) => this.onButtonClick2(state)} num={num} age={age} onValueChange={(event) =>this.onValueChange3(event)}/>}
          {num === 5 && <Personality State={(state) => this.onButtonClick(state)} State2={(state) => this.onButtonClick2(state)} num={num} personality={personality} onValueChange={(event) =>this.onValueChange5({personality: event.target.value})}/>}
          {num === 6 && <Color State={(state) => this.onButtonClick(state)} State2={(state) => this.onButtonClick2(state)} num={num} color={color} onValueChange={(event) =>this.onValueChange5({color: event.target.value})} />}
          {num === 7 && <Number State={(state) => this.onButtonClick(state)} State2={(state) => this.onButtonClick2(state)} num={num} number={number} handleChange={(event) =>this.handleChange2(event)} />}
          {num === 8 && <Sleep State={(state) => this.onButtonClick(state)} State2={(state) => this.onButtonClick2(state)} num={num} sleep={sleep} onValueChange={(event) =>this.onValueChange6(event)} />}
          {num === 9 && <Season State={(state) => this.onButtonClick(state)} State2={(state) => this.onButtonClick2(state)} num={num} season={season} onValueChange={(event) =>this.onValueChange7(event)} handleSubmit={() => this.handleSubmit(this.state)}/>}


        </div>
      )
    }
  }
  

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App/>,
    document.getElementById("root"),
  )
})
