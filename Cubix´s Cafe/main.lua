function love.load()
  
  love.window.setTitle("Cubix's Cafe") --Game's Name

--Player Variables
  playerX = 300
  playerY = 50
  playerWidth = 40
  playerHeight = 40
  handsFull = false

 --Bartender Variables
  bartenderX = 530
  bartenderY = 15
  bartenderWidth = 40
  bartenmderHeight = 40
  ordersReceived = 0

--Costumer's Variables
  costumer1CentreX = 100
  costumer1CentreY = 300
  costumer1Radius = 30

  costumer2CentreX = 400
  costumer2CentreY = 500
  costumer2Radius = 30

  costumer3CentreX = 700
  costumer3CentreY = 350
  costumer3Radius = 30

--Costumers orders
  order1 = false
  order2 = false
  order3 = false

  order1Taken = false
  order2Taken = false
  order3Taken = false

  order1Fullfilled = false
  order2Fullfilled = false
  order3Fullfilled = false

--Customer 1 food
  drawTriangle1 = false
  drawEllipse1 = false
  drawRectangle1 = false

--Customer 2 food
  drawTriangle2   = false
  drawEllipse2 = false
  drawRectangle2 = false

--Customer 3 food
  drawTriangle3 = false
  drawEllipse3 = false
  drawRectangle3 = false

  customerNumber = 0
  timer = 0
end

function love.update(dt)

timer = timer + dt

--Player Movement
if love.keyboard.isDown("right") then
    playerX = playerX + 100 * dt
elseif love.keyboard.isDown("left") then
    playerX = playerX - 100 * dt
end

if love.keyboard.isDown("down") then
    playerY = playerY + 100 * dt
elseif love.keyboard.isDown("up") then
	playerY = playerY - 100 * dt
end
--End Player Movement

--Picking for a random Customer
if timer > 4 then
	customerNumber = love.math.random(3)
	makeAnOrder(customerNumber)
	timer = 0
end

--Checking overlaps between player, customers and counter
if CheckCollision(playerX, playerY, playerWidth, playerHeight,  costumer1CentreX - costumer1Radius, costumer1CentreY - costumer1Radius, costumer1Radius * 2, costumer1Radius * 2) then --player vs customer1

	if love.keyboard.isDown("space") and handsFull == false and order1 == true then --taking order 1
		print("took order 1")
		order1Taken = true
		handsFull = true
		order1 = false

	end

elseif CheckCollision(playerX, playerY, playerWidth, playerHeight,  costumer2CentreX - costumer2Radius, costumer2CentreY - costumer2Radius, costumer2Radius * 2, costumer2Radius * 2) then --player vs customer2

	if love.keyboard.isDown("space") and handsFull == false and order2 == true then -- taking order 2
		print("took order 2")
		order2Taken = true
		handsFull = true
		order2 = false

	end

elseif CheckCollision(playerX, playerY, playerWidth, playerHeight,  costumer3CentreX - costumer3Radius, costumer3CentreY - costumer3Radius, costumer3Radius * 2, costumer3Radius * 2) then --player vs customer3

	if love.keyboard.isDown("space") and handsFull == false  and order3 == true then -- taking order 3
		print("took order 3")
		order3Taken = true
		handsFull = true
		order3 = false

	end

elseif CheckCollision(playerX, playerY, playerWidth, playerHeight,  400, 0, (800-400), (100 - 0)) then -- player vs Counter

	if love.keyboard.isDown("space") and handsFull == true  and order1Taken == true then -- placing order 1
		
		print("placed order 1")

		order1Taken = false

		handsFull = false

		ordersReceived = ordersReceived + 1

		order1Fullfilled = true

	elseif love.keyboard.isDown("space") and handsFull == true  and order2Taken == true then -- placing order 2
		
		print("placed order 2")

		order2Taken = false

		handsFull = false

		ordersReceived = ordersReceived + 1

		order2Fullfilled = true

	elseif love.keyboard.isDown("space") and handsFull == true  and order3Taken == true then -- placing order 3
		
		print("placed order 3")

		order3Taken = false

		handsFull = false

		ordersReceived = ordersReceived + 1

		order3Fullfilled = true

	end
end

end

function love.draw()

if ordersReceived < 3 then  -- Checking wining condition; case: you haven't win yet, the gameplay loads

	love.graphics.setColor(251, 255, 45, 255)
	love.graphics.rectangle("line", playerX, playerY, playerWidth, playerHeight) --Player
	love.graphics.setColor(255, 255, 255, 255)

	love.graphics.circle("line", 100, 300, 30)    --Customer1

	love.graphics.circle("line", 400, 500, 30)    --Customer2

	love.graphics.circle("line", 700, 350, 30)    --Customer3

	love.graphics.setColor(191, 122, 43, 255)
	love.graphics.polygon("line", 400, 0, 400, 100, 800, 100, 800, 65, 435, 65, 435, 0) --Counter
	love.graphics.setColor(255, 255, 255, 255)

	love.graphics.setColor(136, 216, 39, 255)
	love.graphics.rectangle("line", bartenderX, bartenderY, bartenderWidth, bartenmderHeight) --Bartender
	love.graphics.setColor(255, 255, 255, 255)

	--Customer 1 orders
	if drawRectangle1 == true and order1Taken == false and order1Fullfilled == false then
		love.graphics.setColor(255, 0, 0, 255)
		love.graphics.rectangle("fill", 140, 250, 20, 40)
		love.graphics.setColor(255, 255, 255, 255)
	end

	if drawEllipse1 == true and order1Taken == false and order1Fullfilled == false then
		love.graphics.setColor(0, 255, 0, 255)
		love.graphics.ellipse("fill", 145, 275, 10, 20)
		love.graphics.setColor(255, 255, 255, 255)
	end

	if drawTriangle1 == true and order1Taken == false and order1Fullfilled == false then
		love.graphics.setColor(0, 0, 255, 255)
		love.graphics.polygon("fill", 140, 280, 155, 250, 170, 280)
		love.graphics.setColor(255, 255, 255, 255)
	end

	-- Customer 1 order taken
	if drawRectangle1 == true and order1Taken == true  and order1Fullfilled == false then
		love.graphics.setColor(255, 0, 0, 255)
		love.graphics.rectangle("line", 140, 250, 20, 40)
		love.graphics.setColor(255, 255, 255, 255)
	end

	if drawEllipse1 == true and order1Taken == true and order1Fullfilled == false then
		love.graphics.setColor(0, 255, 0, 255)
		love.graphics.ellipse("line", 145, 275, 10, 20)
		love.graphics.setColor(255, 255, 255, 255)
	end

	if drawTriangle1 == true and order1Taken == true and order1Fullfilled == false then
		love.graphics.setColor(0, 0, 255, 255)
		love.graphics.polygon("line", 140, 280, 155, 250, 170, 280)
		love.graphics.setColor(255, 255, 255, 255)
	end
	--end Customer 1

	--Customer 2 orders
	if drawRectangle2 == true and order2Taken == false and order2Fullfilled == false then
		love.graphics.setColor(255, 0, 0, 255)
		love.graphics.rectangle("fill", 440, 450, 20, 40)
		love.graphics.setColor(255, 255, 255, 255)
	end

	if drawEllipse2 == true and order2Taken == false and order2Fullfilled == false then
		love.graphics.setColor(0, 255, 0, 255)
		love.graphics.ellipse("fill", 445, 475, 10, 20)
		love.graphics.setColor(255, 255, 255, 255)
	end

	if drawTriangle2 == true  and order2Taken == false and order2Fullfilled == false then
		love.graphics.setColor(0, 0, 255, 255)
		love.graphics.polygon("fill", 440, 480, 455, 450, 470, 480)
		love.graphics.setColor(255, 255, 255, 255)
	end

	-- Customer 2 oreder taken
	if drawRectangle2 == true and order2Taken == true and order2Fullfilled == false then
		love.graphics.setColor(255, 0, 0, 255)
		love.graphics.rectangle("line", 440, 450, 20, 40)
		love.graphics.setColor(255, 255, 255, 255)
	end

	if drawEllipse2 == true and order2Taken == true and order2Fullfilled == false then
		love.graphics.setColor(0, 255, 0, 255)
		love.graphics.ellipse("line", 445, 475, 10, 20)
		love.graphics.setColor(255, 255, 255, 255)
	end

	if drawTriangle2 == true  and order2Taken == true and order2Fullfilled == false then
		love.graphics.setColor(0, 0, 255, 255)
		love.graphics.polygon("line", 440, 480, 455, 450, 470, 480)
		love.graphics.setColor(255, 255, 255, 255)
	end
	--- end Customer 2

	--Customer 3 orders
	if drawRectangle3 == true and order3Taken == false and order3Fullfilled == false then
		love.graphics.setColor(255, 0, 0, 255)
		love.graphics.rectangle("fill", 740, 300, 20, 40)
		love.graphics.setColor(255, 255, 255, 255)
	end

	if drawEllipse3 == true and order3Taken == false and order3Fullfilled == false then
		love.graphics.setColor(0, 255, 0, 255)
		love.graphics.ellipse("fill", 740, 310, 10, 20)
		love.graphics.setColor(255, 255, 255, 255)
	end

	if drawTriangle3 == true and order3Taken == false and order3Fullfilled == false then
		love.graphics.setColor(0, 0, 255, 255)
		love.graphics.polygon("fill", 740, 330, 755, 300, 770, 330)
		love.graphics.setColor(255, 255, 255, 255)
	end

	-- Customer 3 order taken
	if drawRectangle3 == true and order3Taken == true and order3Fullfilled == false then
		love.graphics.setColor(255, 0, 0, 255)
		love.graphics.rectangle("line", 740, 300, 20, 40)
		love.graphics.setColor(255, 255, 255, 255)
	end

	if drawEllipse3 == true and order3Taken == true and order3Fullfilled == false then
		love.graphics.setColor(0, 255, 0, 255)
		love.graphics.ellipse("line", 740, 310, 10, 20)
		love.graphics.setColor(255, 255, 255, 255)
	end

	if drawTriangle3 == true and order3Taken == true and order3Fullfilled == false then
		love.graphics.setColor(0, 0, 255, 255)
		love.graphics.polygon("line", 740, 330, 755, 300, 770, 330)
		love.graphics.setColor(255, 255, 255, 255)
	end

	--end Customer 3
else  -- case : you win, this screen loads
	
	love.graphics.setColor(255, 0, 255, 255)
	love.graphics.polygon("fill", 100, 100, 100, 300, 300, 300, 300, 185, 200, 185, 200, 225, 250, 225, 250, 250, 150, 250, 150, 150, 250, 150, 250, 100)  -- letter G

	love.graphics.setColor(0, 255, 255, 255)
	love.graphics.polygon("fill", 350, 100, 350, 300, 550, 300, 550, 185, 450, 185, 450, 225, 500, 225, 500, 250, 400, 250, 400, 150, 500, 150, 500, 100)  -- letter G  -- letter G

	love.graphics.setColor(255, 255, 0, 255)
	love.graphics.rectangle("fill", 600, 100, 50, 140)  -- stick of ! symbol

	love.graphics.circle("fill", 625, 275, 23)  -- dot of ! symbol

	--Translation
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.polygon("line", 100, 350, 100, 550, 300, 550, 300, 435, 200, 435, 200, 475, 250, 475, 250, 500, 150, 500, 150, 400, 250, 400, 250, 350)  -- letter G

	love.graphics.polygon("line", 350, 350, 350, 550, 550, 550, 550, 435, 450, 435, 450, 475, 500, 475, 500, 500, 400, 500, 400, 400, 500, 400, 500, 350)  -- letter G  -- letter G

	love.graphics.rectangle("line", 600, 350, 50, 140)  -- stick of ! symbol
	love.graphics.circle("line", 625, 525, 23)  -- dot of ! symbol

end

end

function makeAnOrder(customerNumber) -- Picking customers orders
if customerNumber == 1 then

	if order1 == false and order1Taken == false and order1Fullfilled == false then

		food = love.math.random (3)
			
		if food == 1 then
			drawRectangle1 = true

		elseif food == 2 then
			drawEllipse1 = true

		else
			drawTriangle1 = true
		end

		order1 = true

	end

elseif customerNumber == 2 then

	if order2 == false and order2Taken == false and order2Fullfilled == false then

		food = love.math.random (3)
			
		if food == 1 then
			drawRectangle2 = true

		elseif food == 2 then
			drawEllipse2 = true

		else
			drawTriangle2 = true
		end

		order2 = true

	end
	
else
	if order3 == false  and order3Taken == false and order3Fullfilled == false then

		food = love.math.random (3)
			
		if food == 1 then
			drawRectangle3 = true

		elseif food == 2 then
			drawEllipse3 = true

		else
			drawTriangle3 = true
		end

		order3 = true

	end
end

end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2) --Overlapings
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1        --Returns true or false
end