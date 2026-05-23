return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.8.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  -- Карта: 17 тайлов × 29 тайлов, тайл 16×16 px → 272×464 px
  width = 17,
  height = 29,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 7,
  nextobjectid = 80,
  properties = {},
  tilesets = {},
  layers = {
    -- ──────────────────────────────────────────────────────────────────
    --  Слой 1: пустой tile-слой (обязателен для Kristal)
    -- ──────────────────────────────────────────────────────────────────
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 17,
      height = 29,
      id = 1,
      name = "Слой тайлов 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    -- ──────────────────────────────────────────────────────────────────
    --  Слой 2: изображение комнаты
    -- ──────────────────────────────────────────────────────────────────
    {
      type = "imagelayer",
      image = "../../../assets/sprites/rooms/sprite_bedroom.png",
      id = 2,
      name = "Слой изображений 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      repeatx = false,
      repeaty = false,
      properties = {}
    },
    -- ──────────────────────────────────────────────────────────────────
    --  Слой 3: коллизии (по спрайту 272×464 px)
    --
    --  Логика: закрываем стены, мебель и декор.
    --  Дверной проём (переход в коридор) оставляем открытым
    --  на правом краю, y≈354..434.
    -- ──────────────────────────────────────────────────────────────────
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "Collision",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        -- Верхняя стена
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 272,
          height = 14,
          rotation = 0,
          visible = true,
          properties = {}
        },
        -- Левая стена
        {
          id = 31,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 12,
          height = 464,
          rotation = 0,
          visible = true,
          properties = {}
        },
        -- Правая стена (выше дверного проёма)
        {
          id = 32,
          name = "",
          type = "",
          shape = "rectangle",
          x = 257,
          y = 0,
          width = 15,
          height = 354,
          rotation = 0,
          visible = true,
          properties = {}
        },
        -- Правая стена (ниже дверного проёма)
        {
          id = 33,
          name = "",
          type = "",
          shape = "rectangle",
          x = 257,
          y = 434,
          width = 15,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {}
        },
        -- Нижняя стена
        {
          id = 34,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 450,
          width = 272,
          height = 14,
          rotation = 0,
          visible = true,
          properties = {}
        },
        -- Кошачье дерево (верхняя часть комнаты, центр)
        {
          id = 35,
          name = "",
          type = "",
          shape = "rectangle",
          x = 140,
          y = 14,
          width = 86,
          height = 88,
          rotation = 0,
          visible = true,
          properties = {}
        },
        -- Картина + стена за деревом (верхний левый блок)
        {
          id = 36,
          name = "",
          type = "",
          shape = "rectangle",
          x = 12,
          y = 14,
          width = 90,
          height = 54,
          rotation = 0,
          visible = true,
          properties = {}
        },
        -- Кровать (правая сторона)
        -- Блокирует только изголовье и ножной конец; бока открыты для подхода
        {
          id = 37,
          name = "",
          type = "",
          shape = "rectangle",
          x = 162,
          y = 110,
          width = 88,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 38,
          name = "",
          type = "",
          shape = "rectangle",
          x = 162,
          y = 172,
          width = 88,
          height = 10,
          rotation = 0,
          visible = true,
          properties = {}
        },
        -- Диван (левая сторона, центр по высоте)
        {
          id = 39,
          name = "",
          type = "",
          shape = "rectangle",
          x = 12,
          y = 140,
          width = 66,
          height = 78,
          rotation = 0,
          visible = true,
          properties = {}
        },
        -- Стол с ноутбуком (нижний левый угол)
        {
          id = 40,
          name = "",
          type = "",
          shape = "rectangle",
          x = 12,
          y = 360,
          width = 80,
          height = 52,
          rotation = 0,
          visible = true,
          properties = {}
        },
        -- Пальма (левый верхний угол)
        {
          id = 41,
          name = "",
          type = "",
          shape = "rectangle",
          x = 12,
          y = 60,
          width = 26,
          height = 60,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    -- ──────────────────────────────────────────────────────────────────
    --  Слой 4: объекты
    --    - transition → коридор
    --    - script     → autorun катсцена «Утро»
    --    - npc        → хозяин в спальне (для катсцены)
    --    - interactable → кровать, диван, дерево, ноутбук (заготовки)
    -- ──────────────────────────────────────────────────────────────────
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "objects",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        -- ── Переход в коридор ──────────────────────────────────────────
        {
          id = 23,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 250.793,
          y = 354.867,
          width = 5.3346,
          height = 78.969,
          rotation = 0,
          visible = true,
          properties = {
            ["map"]    = "hallway",
            ["marker"] = "spawn3"
          }
        },
        -- ── Автозапуск катсцены «Утро» ─────────────────────────────────
        -- Kristal запускает cutscene-скрипт при входе на карту,
        -- если у объекта autorun=true и once=true (один раз).
        -- Флаг "morning_start_done" ставится движком автоматически.
        {
          id = 60,
          name = "script",
          type = "",
          shape = "rectangle",
          -- Покрываем всю карту чтобы триггер сработал при любом спавне
          x = 0,
          y = 0,
          width = 272,
          height = 464,
          rotation = 0,
          visible = false,
          properties = {
            ["cutscene"] = "morning.start",
            ["autorun"]  = true,
            ["once"]     = true
          }
        },
        -- ── NPC: хозяин в спальне (спавнится для катсцены) ────────────
        {
          id = 61,
          name = "npc",
          type = "",
          shape = "rectangle",
          x = 191,
          y = 125,
          width = 27,
          height = 45,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "dummy",
            ["id"]    = "owner_bedroom"
          }
        },
        -- ── Интерактивные предметы (заготовки — текст вписать позже) ──
        {
          id = 62,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 162,
          y = 110,
          width = 88,
          height = 72,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* The bed looks cozy. Someone was sleeping here."
          }
        },
        {
          id = 63,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 12,
          y = 140,
          width = 66,
          height = 78,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* An old sofa. It has seen better days."
          }
        },
        {
          id = 64,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 140,
          y = 14,
          width = 86,
          height = 88,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* A cat tree. Your favourite spot... after the bed."
          }
        },
        {
          id = 65,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 12,
          y = 360,
          width = 80,
          height = 52,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* A laptop. The screen is dark."
          }
        }
      }
    },
    -- ──────────────────────────────────────────────────────────────────
    --  Слой 5: маркеры
    -- ──────────────────────────────────────────────────────────────────
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "markers",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        -- Главный спавн (из коридора)
        {
          id = 22,
          name = "spawn_bedroom",
          type = "",
          shape = "rectangle",
          x = 224.514,
          y = 387.960,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
