--[[
    GD50
    -- Super Mario Bros. Remake --

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameObject = Class{}

function GameObject:init(def)
    self.x = def.x
    self.y = def.y
    self.texture = def.texture
    self.width = def.width
    self.height = def.height
    self.frame = def.frame
    self.solid = def.solid
    self.collidable = def.collidable
    self.consumable = def.consumable
    self.onCollide = def.onCollide
    self.onConsume = def.onConsume
    self.hit = def.hit
    self.shiny = def.shiny

    -- Defines particle system, emitted if object is shiny
    self.psystem = love.graphics.newParticleSystem(gTextures["particle"], 10)

    -- Particle system behavior functions
    self.psystem:setParticleLifetime(0.5, 1)
    self.psystem:setSpeed(10, 20)
    self.psystem:setLinearAcceleration(-15, -15, 15, 15)
    self.psystem:setEmissionRate(5)
    self.psystem:setSpread(20)
    self.psystem:setOffset(-15, -15)
    self.psystem:setEmissionArea("none", 8, 8, 1, true)
    self.psystem:setSizes(0.5)

    -- Over the particle's lifetime, we transition from first to second color
    self.psystem:setColors(
        -- First color
        251/255, 242/255, 54/255, 1,
        -- Second color
        1, 1, 1, 0
    )
end

function GameObject:collides(target)
    return not (target.x > self.x + self.width or self.x > target.x + target.width or
            target.y > self.y + self.height or self.y > target.y + target.height)
end

function GameObject:update(dt)
    if self.shiny then
        self.psystem:update(dt)
    end
end

function GameObject:render()
    if self.shiny then
        love.graphics.draw(self.psystem, self.x, self.y)
    end

    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.frame], self.x, self.y)
end