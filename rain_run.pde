
var xPositions = [];
var yPositions = [];
var colorArray = [];
var squareX = random(0, 400);
var score = 0;
var lives = 1;
var squareSize = 30;
var makeNewDot = true;
var noInvincibility = true;

void setup() 
{
    // general setup
    size (400,400);
    smooth();
}


draw = function() //set up the starting page
    {
    background(0);
    fill(255);
    textSize(70);
    text("RAIN RUN", 38, 133);
    textSize(20);
    text("Click anywhere to continue", 100, 175);
    textSize(15);
    text("You could click here.", 50, 200);
    text("Or here.", 200, 225);
    text("Or here.", 175, 275);
    text("Or here.", 300, 300);
    text("I wouldn't care." , 100, 325);
    text("Just click SOMEWHERE, 'cause I'm getting tired.", 25, 350);
    text("CLICK ALREADY!", 150, 375);
    mouseClicked = function() //if the mouse is clicked...
        {
            //starter dot
            xPositions.push(random(0,400));
            yPositions.push(0);
            colorArray.push(color(random(0, 255), random(0, 255), random(0, 255)));
            
            draw = function() //...then start the game
                {
                background(204, 247, 255); //background blue 
                for (var i = 0; i < xPositions.length; i++) //make the dots fall
                    {
                    noStroke();
                    fill(255, 0, 238);
                    rect(squareX, (400 - squareSize), squareSize, squareSize);
                    fill(0, 0, 255);
                    ellipse((squareX + squareSize/4), (400 - (squareSize - 7.5)), squareSize/4, squareSize/4);//left eye
                    ellipse((squareX + (squareSize - squareSize/4)), (400 - (squareSize - 7.5)), squareSize/4, squareSize/4);//right eye
                    ellipse((squareX + squareSize/2), (400 - (squareSize*1/3)), (squareSize/1.25), (squareSize/4));//mouth
                    fill(colorArray[i]);
                    ellipse(xPositions[i], yPositions[i], 10, 10);
                    yPositions[i] += 2;
                    if (yPositions[0] > 400 && makeNewDot) //spawn new dots
                        {
                        var delay = random(-400, 0);
                            
                        xPositions.push(random(0,400));
                        yPositions.push(delay);
                        colorArray.push(color(random(0, 255), random(0, 255), random(0, 255)));
                        }
                    if (yPositions[i] > 400) //make dots loop to top
                        {
                        yPositions[i] = 0;
                        xPositions[i] = random(0, 400);
                        }  
                    //display score and lives    
                    fill(0, 0, 0);
                    text("Score:", 10, 20);
                    text(xPositions.length, 60, 20);
                    text("Lives: " + lives, 10, 35);
                    
                    //if there is a collision...
                    if((xPositions[i] + 5) >= squareX && (xPositions[i] - 5) <= (squareX + squareSize) && yPositions[i] >= (400-squareSize) && noInvincibility)
                        {
                    
                        lives -= 1;
                        yPositions[i] = 0;
                        xPositions[i] = random(0, 400);
                        }
                        
                    //if you lose all your lives...
                    
                    if(lives <= 0){
                        makeNewDot = false;
                        background(255, 0, 0);
                        fill(0, 0, 0);
                        textSize(75);
                        text("YOU DIED!", 5, 200);
                        textSize(20);
                        text("Press space to restart(it takes a while)", 25, 250);
                        text("Your score is " + xPositions.length, 100, 275);
                        if(keyCode === 32){
                            restart();

                        }
                    }
                    
                    if(xPositions.length >= 30 && xPositions.length < 45){
                        squareSize = 20;    
                    }
                    if(xPositions.length >= 45){
                        squareSize = 10;    
                    }
                    
                    }//close of for loop
                    
                if(keyPressed && keyCode === LEFT) {
                        squareX -= 2;
                    }//move left
                if(keyPressed && keyCode === RIGHT) {
                        squareX += 2;
                    }//move right    
                if(squareX >= (400 - squareSize)){
                    squareX = (400 - squareSize);
                    }
                if(squareX <= 0){
                    squareX = 0;
                    }
                
                }; //close of inner draw function
        }; //close of mouse clicked function
    }; //close of outer draw function
