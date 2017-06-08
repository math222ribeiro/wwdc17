/*:
 # Framework Memory Game
 
 Hello, WWDC Scholarships, my name Matheus Ribeiro! 😀
 
 Framework Memory Game is a memory game using ***frameworks*** as card's figures.
 
 Every figure appears in two differents cards. In the beginning, the cards are shown for a few seconds, then they are hidden. Each turn you can choose two cards, if they match a simple demonstration of the framework is shown.
 
 ## Instructions:
 * Click on a card to turn it.
 * Try to remember the position of the card that matchs with the first and click on it.
 * If they match a quick overview of the framework is shown. To go back in the game click continue.
 * If it doesn't, try to memorize its position
 * In the end, you can choose a framework to see it again.
 * Enjoy it! ✌️
 
 
*/
import PlaygroundSupport

var controller = GameViewController()
PlaygroundPage.current.liveView = controller.view
