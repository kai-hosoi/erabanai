import React,{Component} from 'react'
import { withRouter } from 'react-router-dom';

class FirstPage extends Component {

  constructor(props){
    super(props);
    this.state = {
      text: '',
    }

    this.handleChange = this.handleChange.bind(this)
    this.handleClick = this.handleClick.bind(this)
  }

  handleChange(e){
    this.setState({
      text: e.target.value
    })
  }


  handleClick(){
    this.props.history.push({
      pathname: "/secondpage",
      state: { text: this.state.text }
  });
  }



  render(){
    return(
      <div className = "container">
      <div className = "row">
        <form>
              <div className="field py-3">
              <label naem="place">場所(駅名、地名を入力してください)</label>
                <div>
                <input type='text' value={this.state.text} onChange={this.handleChange}></input>
                <p>{this.state.text}</p>
                </div>
                <button className="btn btn-primary" onClick={this.handleClick}>次の質問</button>
              </div>
        </form>
      </div>
    </div>
    );
  }
}

export default withRouter(FirstPage)

