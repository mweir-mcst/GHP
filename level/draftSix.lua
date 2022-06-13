return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.8.5",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 20,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 7,
  nextobjectid = 40,
  properties = {},
  tilesets = {
    {
      name = "mainTileset",
      firstgid = 1,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 30,
      image = "../tileset/dungeon tileset calciumtrice.png",
      imagewidth = 480,
      imageheight = 560,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 1050,
      tiles = {
        {
          id = 581,
          animation = {
            {
              tileid = 581,
              duration = 300
            },
            {
              tileid = 583,
              duration = 300
            },
            {
              tileid = 582,
              duration = 300
            },
            {
              tileid = 583,
              duration = 300
            }
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 2,
      name = "Background",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 212, 219, 220, 221, 221, 221, 220, 220, 219, 219, 219, 219, 219, 219, 213, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 217, 211, 211, 211, 211, 211, 211, 211, 211, 211, 211, 211, 211, 211, 225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 214, 262, 211, 211, 211, 211, 211, 211, 211, 211, 211, 211, 211, 211, 225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 217, 263, 222, 222, 223, 222, 222, 224, 223, 222, 222, 222, 262, 225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 217, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 217, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 217, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 218, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 216, 227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 216, 227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 217, 225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 217, 225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 217, 227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 218, 225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 212, 220, 260, 261, 221, 220, 213, 0, 0, 0, 0, 0, 0, 0, 217, 225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 216, 211, 211, 211, 211, 211, 226, 0, 0, 0, 0, 0, 0, 0, 217, 261, 220, 220, 219, 219, 220, 260, 226, 0, 0, 0, 0, 0, 0,
        0, 218, 211, 211, 211, 211, 211, 227, 0, 0, 0, 0, 0, 0, 0, 217, 211, 211, 211, 211, 211, 211, 211, 225, 0, 0, 0, 0, 0, 0,
        0, 217, 211, 211, 211, 211, 211, 226, 0, 0, 0, 0, 0, 0, 0, 218, 211, 211, 211, 211, 211, 211, 211, 225, 0, 0, 0, 0, 0, 0,
        0, 216, 211, 211, 211, 211, 211, 225, 0, 0, 0, 0, 0, 0, 0, 217, 211, 211, 211, 211, 211, 211, 211, 227, 0, 0, 0, 0, 0, 0,
        0, 214, 224, 224, 223, 222, 223, 245, 230, 0, 0, 0, 0, 0, 0, 214, 222, 224, 224, 222, 222, 223, 223, 215, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 1,
      name = "Foreground",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {
        ["collidable"] = true
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 83, 42, 44, 44, 43, 44, 44, 44, 43, 43, 44, 43, 42, 43, 42, 42, 82, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 47, 122, 124, 122, 122, 122, 125, 124, 123, 123, 123, 122, 125, 122, 122, 122, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 46, 152, 152, 155, 155, 153, 154, 154, 155, 152, 153, 153, 155, 153, 152, 152, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 47, 0, 575, 0, 0, 0, 0, 0, 0, 0, 0, 575, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 45, 575, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 81, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 46, 0, 0, 32, 39, 41, 41, 39, 40, 39, 40, 39, 33, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 47, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 46, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        83, 43, 35, 0, 0, 34, 42, 44, 82, 31, 0, 0, 0, 0, 45, 0, 0, 36, 0, 81, 41, 33, 0, 0, 32, 41, 80, 0, 0, 0,
        45, 121, 126, 0, 0, 121, 123, 126, 37, 31, 0, 0, 0, 0, 45, 0, 0, 34, 42, 44, 42, 35, 0, 0, 36, 0, 0, 0, 0, 0,
        47, 151, 156, 0, 0, 151, 153, 156, 36, 31, 0, 0, 0, 0, 47, 0, 0, 121, 124, 123, 125, 122, 0, 0, 37, 0, 0, 0, 0, 0,
        45, 0, 0, 0, 0, 0, 575, 0, 38, 31, 0, 0, 0, 0, 47, 0, 0, 151, 154, 152, 153, 153, 0, 0, 36, 0, 0, 0, 0, 0,
        46, 0, 0, 0, 0, 0, 0, 575, 36, 31, 0, 0, 0, 0, 45, 0, 0, 0, 0, 458, 0, 0, 0, 0, 36, 0, 0, 0, 0, 0,
        47, 0, 0, 0, 0, 0, 0, 0, 59, 82, 0, 0, 0, 0, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0,
        47, 0, 0, 0, 0, 0, 0, 0, 121, 38, 0, 0, 0, 0, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0,
        47, 0, 0, 0, 0, 0, 0, 0, 151, 38, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 0,
        62, 0, 0, 0, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 45, 0, 0, 0, 0, 575, 575, 0, 0, 0, 38, 0, 0, 0, 0, 0,
        81, 39, 40, 41, 41, 40, 41, 39, 39, 80, 0, 0, 0, 0, 81, 40, 39, 41, 41, 40, 40, 40, 40, 41, 80, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 6,
      name = "Decoration",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 353, 582, 0, 0, 0, 582, 0, 349, 0, 582, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 383, 0, 0, 0, 0, 0, 0, 379, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 666, 666, 666, 666, 666, 666, 388, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 582, 0, 0, 582, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 666, 0, 0, 582, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 666, 0, 0, 0, 0, 0, 666, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 355, 666, 0, 0, 0, 0, 0, 666, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 666, 666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 385, 666, 0, 0, 0, 0, 0, 666, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 666, 666, 666, 666, 0, 666, 666, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "Object",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 18,
          name = "PlayerSpawn",
          type = "PlayerSpawn",
          shape = "point",
          x = 48,
          y = 272,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "Checkpoint1Spawn",
          type = "PlayerSpawn",
          shape = "point",
          x = 64,
          y = 128,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "Lever1",
          type = "Lever",
          shape = "rectangle",
          x = 96,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          visible = false,
          properties = {
            ["targets"] = "1"
          }
        },
        {
          id = 27,
          name = "Box1",
          type = "Box",
          shape = "rectangle",
          x = 80,
          y = 272,
          width = 16,
          height = 16,
          rotation = 0,
          visible = false,
          properties = {}
        },
        {
          id = 30,
          name = "Door1",
          type = "Door",
          shape = "rectangle",
          x = 48,
          y = 160,
          width = 32,
          height = 32,
          rotation = 0,
          visible = false,
          properties = {}
        },
        {
          id = 32,
          name = "Checkpoint1",
          type = "Checkpoint",
          shape = "rectangle",
          x = 48,
          y = 144,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "Door2",
          type = "Door",
          shape = "rectangle",
          x = 240,
          y = 144,
          width = 32,
          height = 32,
          rotation = 0,
          visible = false,
          properties = {}
        },
        {
          id = 35,
          name = "Box2",
          type = "Box",
          shape = "rectangle",
          x = 272,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          visible = false,
          properties = {}
        },
        {
          id = 36,
          name = "Box3",
          type = "Box",
          shape = "rectangle",
          x = 272,
          y = 272,
          width = 16,
          height = 16,
          rotation = 0,
          visible = false,
          properties = {}
        },
        {
          id = 37,
          name = "Button2",
          type = "Button",
          shape = "rectangle",
          x = 320,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          visible = false,
          properties = {
            ["targets"] = "2,3"
          }
        },
        {
          id = 38,
          name = "Button1",
          type = "Button",
          shape = "rectangle",
          x = 144,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          visible = false,
          properties = {
            ["targets"] = "2"
          }
        },
        {
          id = 39,
          name = "Door3",
          type = "Door",
          shape = "rectangle",
          x = 352,
          y = 176,
          width = 32,
          height = 32,
          rotation = 0,
          visible = false,
          properties = {}
        }
      }
    }
  }
}
