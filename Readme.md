# Leaderboard for 301CR
A ruby on rails web-application that provides a fully working leaderboard for a game. The app provides an API which is capable 
of giving awards to players weekly, based on the awards settings that can be accessed via tha admin control panel.
The repository is connected directly to a heroku app which has a CI enabled on the master branch. On the main page
the users can check the global ratings and also the weekly stats of other players. By checking a players stats in the 
website, one can see all the awards that the selected player had and the history of his/her score.

A working demo can be found at the following link: https://leaderboard301cr.herokuapp.com/
A video demonstration can be found here:https://youtu.be/_ovS04f30GY


## Installation
Clone the repository and run `rails s -e production` or for a console interaction `rails c`


## Usage
List players:
https://leaderboard301cr.herokuapp.com/players
https://leaderboard301cr.herokuapp.com/players.json

Get requests:
- /api/playerInfo
- /api/availableDemographics
- /api/highScoreDemographic
- /api/weeklyHighScore
- /api/highscore

Post/Get requests:
- /api/edit
- /api/record_score

Delete requests:
- /api/delete

Check the `\app\controllers\api_controller.rb` for more details

## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request 

## History
- demographical highscore available via the API
- weekly high score available via the API
- global high score available via the API
- player's password_digest attribute is hidden in the API calls
- added security layer on top of the request by checking the header
- playerscorehistory can be access as resources
- awards can be access as resources
- players can be access as resources
- weekly awards are assigned to players
## Credits
Chris Illingworth `christo743@hotmail.co.uk`

## License
**MIT License**

**Copyright (c) 2016 Chris Illingworth**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
