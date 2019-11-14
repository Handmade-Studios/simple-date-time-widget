#A Simple Widget To Tell The Date and Time
#Made by Alex Hawking

#change position
#position top
pos_top = '30px'

#position left
pos_left = '30px'

#theme
#options are 'dark' or 'light'
theme = 'dark'

#Choose wether or not to have flashing separator ['yes' or 'no']
flash = 'yes'

#------------------------------------------------------------------------------------------------#



if theme == 'dark'
  text_color = 'WHITE'
  background_color = '#0D0E10'
  theme_opacity = '0.6'

if theme == 'light'
  text_color = 'BLACK'
  background_color = '#D6D7DB'
  theme_opacity = '0.8'

if flash == 'yes'
  flashing = 'flash 1s infinite'

if flash == 'no'
  flashing = 'none'



refreshFrequency: (1000 * 3)

date = new Date()
hour = date.getHours()
minutes = date.getMinutes()
day = date.getDay()
month = date.getMonth()

command: "pmset -g batt | grep -o '[0-9]*%'"


render: (output) -> """
  <table id="content">
    <tr class="section">
      <td id="time"></td>   
    </tr>
    <tr class="section">
      <td id="date"></td>   
    </tr>
  </table>
"""

  

update: (output, domEl) ->
  document.getElementById("date").innerHTML = day + ' / ' + month
  document.getElementById("time").innerHTML = hour + '<span id="time-separator"> : </span>' + minutes 



style: """
  font-family: Avenir Next
  
  top:	#{pos_top}
  left:	#{pos_left}

  @keyframes flash {
    0% {
      opacity: 0
      font-weight: 400
    }
    50% {
      opacity: 1
      font-weight: 600
    }
    100% {
      opacity: 0
      font-weight: 400
    }
  }


  #time
    font-size: 30px

  #time-separator
    animation: #{flashing}


  #content
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    text-align: center
    color: #{text_color}
    background: #{background_color}
    padding-left: 15px
    padding-right: 15px
    border-radius: 5px
    padding-top: 10px
    padding-bottom: 10px
    opacity: #{theme_opacity}
"""
