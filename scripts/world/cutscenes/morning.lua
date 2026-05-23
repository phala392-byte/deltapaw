-- =============================================================================
--  Cutscene: morning
--  Группа:   morning
--  Имя:      start
--
--  Запуск:   объект на карте bedroom с полями
--              name = "script"
--              cutscene = "morning.start"
--              autorun  = true
--              once     = true   (флаг "morning_start_done" ставится движком)
--
--  Глобальный параметр сцены: всё медленно и неспешно.
--  Скорости:
--    FADE_SPEED   = 1.8 сек  (fade in / fade out)
--    SLIDE_SPEED  = 1.6 сек  (перемещения персонажей)
--    WAKE_WAIT    = 1.2 сек  (пауза "просыпается")
--    MONOLOGUE_PAUSE = 1.8 сек  (пауза между грустными строчками)
-- =============================================================================

-- ─── Константы скорости ────────────────────────────────────────────────────
local FADE_SPEED       = 1.8
local SLIDE_SPEED      = 1.6
local WAKE_WAIT        = 1.2
local MONOLOGUE_PAUSE  = 1.8

-- ─── Позиции на карте bedroom (спрайт 272×464 px, tile 16 px) ──────────────
--   Кровать:             x≈185..250, y≈110..175
--   Кошачье место/кровать: кот лежит рядом с хозяином на кровати
--   Дверь (выход вниз):  x≈248, y≈350-430
local BED_OWNER_X   = 207   -- хозяин — центр кровати
local BED_OWNER_Y   = 138
local BED_CAT_X     = 190   -- кот — рядом (спит на хозяине)
local BED_CAT_Y     = 155
local BED_EXIT_X    = 207   -- куда уходит хозяин (вниз, за экран)
local BED_EXIT_Y    = 490   -- ниже нижнего края карты

-- ─── Позиции на карте kitchen (спрайт 320×272 px, tile 16 px) ─────────────
--   Плита:               x≈180..225, y≈55..120
--   Миска кота:          x≈40..70,   y≈195..215
--   Стол:                x≈80..190,  y≈168..215
--   Левый край (выход):  x≈-40       (за экраном)
local KIT_OWNER_STOVE_X  = 197   -- хозяин у плиты
local KIT_OWNER_STOVE_Y  = 88
local KIT_CAT_START_X    = 155   -- кот заходит снизу
local KIT_CAT_START_Y    = 250
local KIT_BOWL_X         = 52    -- миска кота
local KIT_BOWL_Y         = 208
local KIT_TABLE_X        = 115   -- хозяин за столом
local KIT_TABLE_Y        = 190
local KIT_EXIT_X         = -60   -- хозяин уходит влево за экран
local KIT_EXIT_Y         = 190

-- ─── Утилиты ───────────────────────────────────────────────────────────────

-- Безопасная установка анимации
local function setAnim(chara, anim)
    if chara and chara.sprite then
        if chara.sprite.setAnimation then
            chara.sprite:setAnimation(anim)
        elseif chara.sprite.setSprite then
            chara.sprite:setSprite(anim)
        end
    end
end

-- Перемещение с нужной анимацией (если walk/* есть — ставим его)
local function moveChar(cutscene, chara, tx, ty, speed, facing)
    if not chara then return end
    local dir = facing
    if not dir then
        local dx = tx - (chara.x or 0)
        local dy = ty - (chara.y or 0)
        if math.abs(dx) > math.abs(dy) then
            dir = dx > 0 and "right" or "left"
        else
            dir = dy > 0 and "down" or "up"
        end
    end
    -- Пробуем поставить анимацию ходьбы (если спрайт есть — будет виден)
    setAnim(chara, "walk/" .. dir)
    -- slideTo не требует коллизий и работает независимо от путей
    return cutscene:slideTo(chara, tx, ty, speed)
end

-- Моргание экрана (имитация flash/sparkle на чёрном)
local function flashEffect(cutscene)
    -- Двойной быстрый fade in/out на очень короткое время
    cutscene:fadeIn(0.08)
    cutscene:wait(0.06)
    cutscene:fadeOut(0.08)
    cutscene:wait(0.1)
    cutscene:fadeIn(0.08)
    cutscene:wait(0.06)
    cutscene:fadeOut(0.08)
    cutscene:wait(0.15)
    cutscene:fadeIn(0.1)
    cutscene:wait(0.08)
    cutscene:fadeOut(0.1)
    cutscene:wait(0.12)
end

-- =============================================================================
--  Основная функция катсцены
-- =============================================================================

---@param cutscene WorldCutscene
return {
    start = function(cutscene, event)

        -- Проверка что сцена ещё не была показана
        if Game:getFlag("morning_done") then return end

        -- ── Подготовка ──────────────────────────────────────────────────────
        cutscene:detachFollowers()
        cutscene:detachCamera()

        -- Игрок (кот) и хозяин
        local cat   = Game.world.player
        local owner = Game.world:getCharacter("owner_bedroom")

        -- ════════════════════════════════════════════════════════════════════
        --  СЦЕНА 1: СПАЛЬНЯ
        -- ════════════════════════════════════════════════════════════════════

        -- 1. Сразу чёрный экран
        cutscene:fadeOut(0)
        cutscene:wait(0.3)

        -- Расставляем персонажей (пока экран чёрный)
        if cat then
            cat.x = BED_CAT_X
            cat.y = BED_CAT_Y
            setAnim(cat, "idle")
        end

        -- Если хозяин спавнится в комнате через NPC-объект,
        -- ищем его под именем "owner_bedroom". Иначе спавним сами.
        if not owner then
            owner = Game.world:spawnNPC("dummy",
                BED_OWNER_X, BED_OWNER_Y, {
                    id   = "owner_bedroom",
                    name = "owner_bedroom",
                }
            )
        end
        if owner then
            owner.x = BED_OWNER_X
            owner.y = BED_OWNER_Y
            setAnim(owner, "idle")
        end

        cutscene:wait(0.2)

        -- 2. Мерцание на чёрном (VFX «сверкание»)
        flashEffect(cutscene)

        -- 3. Плавное открытие экрана
        cutscene:wait(0.2)
        cutscene:fadeIn(FADE_SPEED)

        -- 4. Хозяин «медленно просыпается» — пауза, потом idle
        cutscene:wait(WAKE_WAIT)
        if owner then setAnim(owner, "idle") end

        -- 5. Смотрит на кота и будит его
        if owner then
            cutscene:setSpeaker(owner)
            -- Небольшой поворот к коту (кот слева — хозяин смотрит влево)
            if owner.sprite and owner.sprite.setFlipX then
                owner.sprite:setFlipX(false)
            end
        end
        cutscene:wait(0.5)

        -- 6. Диалог — будит кота (лицо: сонный)
        cutscene:text("Hey, buddy! Time to get up, no sleeping for you.", "sleepy")

        -- 7. Хозяин встаёт — небольшая пауза
        if owner then setAnim(owner, "idle") end
        cutscene:wait(0.6)

        -- 8. Хозяин идёт вниз и уходит за экран
        if owner then
            cutscene:wait(moveChar(cutscene, owner, BED_EXIT_X, BED_EXIT_Y, SLIDE_SPEED * 1.2, "down"))
        end

        -- 9. Кот лениво встаёт
        cutscene:wait(0.8)
        if cat then setAnim(cat, "idle") end
        cutscene:wait(1.0)

        -- 10. Fade Out — конец сцены 1
        cutscene:fadeOut(FADE_SPEED)
        cutscene:wait(0.4)

        -- ════════════════════════════════════════════════════════════════════
        --  СЦЕНА 2: КУХНЯ
        -- ════════════════════════════════════════════════════════════════════

        -- Загрузка карты кухни (без обычного перехода — прямо из катсцены)
        Game.world:loadMap("kitchen", "spawn_kitchen")
        cutscene:wait(0.5)   -- дать движку успеть загрузить карту

        -- После loadMap перезахватываем ссылки
        cat   = Game.world.player
        owner = Game.world:getCharacter("owner_kitchen")

        -- Расставляем (экран ещё чёрный)
        if cat then
            cat.x = KIT_CAT_START_X
            cat.y = KIT_CAT_START_Y
            setAnim(cat, "idle")
        end

        if not owner then
            owner = Game.world:spawnNPC("dummy",
                KIT_OWNER_STOVE_X, KIT_OWNER_STOVE_Y, {
                    id   = "owner_kitchen",
                    name = "owner_kitchen",
                }
            )
        end
        if owner then
            owner.x = KIT_OWNER_STOVE_X
            owner.y = KIT_OWNER_STOVE_Y
            setAnim(owner, "cooking")
        end

        -- Fade In — открываем кухню
        cutscene:fadeIn(FADE_SPEED)

        -- Хозяин готовит (анимация на фоне)
        cutscene:wait(1.2)

        -- Поворачивается к коту (направо)
        if owner then
            setAnim(owner, "idle")
            if owner.sprite then
                -- смотрит вправо (к коту который будет справа)
            end
            cutscene:setSpeaker(owner)
        end
        cutscene:wait(0.4)

        -- Диалог: "Phew, I'm so hungry, right?"
        cutscene:text("Phew, I'm so hungry, right?", "happy")

        -- Хозяин насыпает корм — идёт к миске
        if owner then
            cutscene:wait(moveChar(cutscene, owner, KIT_BOWL_X + 20, KIT_BOWL_Y - 15, SLIDE_SPEED * 0.8, "down"))
        end
        cutscene:wait(0.4)

        -- Кот идёт к миске
        if cat then
            cutscene:wait(moveChar(cutscene, cat, KIT_BOWL_X, KIT_BOWL_Y, SLIDE_SPEED * 1.1, "down"))
            setAnim(cat, "idle")  -- кот ест (loop idle пока нет спрайта eating)
        end
        cutscene:wait(0.5)

        -- Хозяин идёт к столу
        if owner then
            cutscene:wait(moveChar(cutscene, owner, KIT_TABLE_X, KIT_TABLE_Y, SLIDE_SPEED, "right"))
            setAnim(owner, "eating")   -- сидит, ест
        end
        cutscene:wait(0.8)

        -- ── МОНОЛОГ ЗА СТОЛОМ ────────────────────────────────────────────────
        -- Кот ест на фоне, хозяин говорит — каждое окно отдельное

        if owner then cutscene:setSpeaker(owner) end

        -- Окно 1
        cutscene:text("You know\226\128\166 this kitchen used to be so much louder.", "neutral")
        -- Окно 2
        cutscene:text("She always complained about the mornings. Said I cooked too slowly.", "laugh")
        -- Окно 3
        cutscene:text("Funny thing is\226\128\166 I'd give anything to hear that again.", "neutral")
        -- Окно 4
        cutscene:text("I still catch myself setting two cups on the table. Habit, I guess.", "happy")
        -- Окно 5
        cutscene:text("Or maybe I'm just hoping she'll walk through that door.", "sad")
        -- Окно 6
        cutscene:text("Guess she got tired of waiting. Or maybe\226\128\166 of me.", "sad")

        -- ПАУЗА (~1.8 сек) между грустными строчками
        cutscene:wait(MONOLOGUE_PAUSE)

        -- Окно 7
        cutscene:text("If she were here right now, she'd probably laugh at me talking to a cat.", "laugh")
        -- Окно 8
        cutscene:text("But at least I still have you, buddy.", "happy")

        -- ── ХОЗЯИН ВСТАЁТ ────────────────────────────────────────────────────
        if owner then setAnim(owner, "idle") end
        cutscene:wait(0.6)

        -- ── ДИАЛОГ ПЕРЕД УХОДОМ ──────────────────────────────────────────────
        -- Окно 9
        cutscene:text("Alright, time to face the real world.", "sad")
        -- Окно 10
        cutscene:text("I have to go to work.", "neutral")
        -- Окно 11 — слово SLEEP выделено жёлтым
        cutscene:text("Go get some [color:yellow]SLEEP[color:reset], like you always do, heh.", "neutral")
        -- Окно 12
        cutscene:text("Or just wander around the house first, whatever.", "neutral")
        -- Окно 13
        cutscene:text("See ya.", "happy")

        -- Хозяин уходит влево за экран
        if owner then
            cutscene:wait(moveChar(cutscene, owner, KIT_EXIT_X, KIT_EXIT_Y, SLIDE_SPEED * 1.3, "left"))
        end
        cutscene:wait(0.5)

        -- ── КОНЕЦ КАТСЦЕНЫ ───────────────────────────────────────────────────
        -- Ставим флаг «утро было показано»
        Game:setFlag("morning_done", true)

        -- Возвращаем камеру и последователей
        if cat then
            cutscene:setSpeaker(nil)
        end
        cutscene:attachCamera()
        cutscene:alignFollowers()
        cutscene:attachFollowers()

        -- Кот остаётся у миски — управление возвращается игроку автоматически
        -- (Kristal сам завершает cutscene после return)
    end
}
