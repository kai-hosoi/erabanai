// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { withRouter } from 'react-router-dom';
import  Routes  from './route';
import FirstPage from './firstpage'
import SecondPage from './secondpage'
import Sample from './sample'

const Hello = props => (
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
)



document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <div>
      <Routes/>
    </div>,
    document.body.appendChild(document.createElement('div')),
  )
})
