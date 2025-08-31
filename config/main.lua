return {
   Commands = {
      ['cephebaslat'] = {
         command = 'cephebaslat',
         description = 'Cephe savaşı etkinliğini başlatır.',
         permission = 'admin',
      },
      ['cephebitir'] = {
         command = 'cephebitir',
         description = 'Cephe savaşı etkinliğini bitirir.',
         permission = 'admin',
      },
      ['cephekatil'] = {
         command = 'cephekatil',
         description = 'Cephe savaşı etkinliğine katılır.',
         permission = 'user',
      },
      ['cepheayril'] = {
         command = 'cepheayril',
         description = 'Cephe savaşı etkinliğinden ayrılır.',
         permission = 'user',
      },
   },
   Locations = {
      ['ABD'] = {
         coords = vector3(-2230.56, 3393.92, 32.48),
         radius = 250.0,
         items = {
            {
               name = 'abd_equipment',
               amount = 1,
            }
         }
      },
      ['RUSYA'] = {
         coords = vector3(1734.02, 3301.16, 41.22),
         radius = 250.0,
         items = {
            {
               name = 'rus_equipment',
               amount = 1,
            }
         }
      },
   },
   Equipments = {
      [1] = {
         name = 'weapon_assaultrifle',
         amount = 1,
      },
      [2] = {
         name = 'weapon_m4',
         amount = 1,
      },
      [3] = {
         name = 'ammo-rifle',
         amount = 200,
      },
      [4] = {
         name = 'ammo-rifle2',
         amount = 200,
      },
      [5] = {
         name = 'heavyarmor',
         amount = 50,
      },
      [6] = {
         name = 'bandage',
         amount = 50,
      },
      [7] = {
         name = 'pizza',
         amount = 50,
      },
      [8] = {
         name = 'sogukcay',
         amount = 50,
      },
   },
   Bags = {
      ['abd_equipment'] = {
         [1] = {
            name = 'weapon_m4',
            amount = 1,
         },
         [2] = {
            name = 'ammo-rifle',
            amount = 200,
         },
         [3] = {
            name = 'heavyarmor',
            amount = 50,
         },
         [4] = {
            name = 'bandage',
            amount = 50,
         },
         [5] = {
            name = 'pizza',
            amount = 50,
         },
         [6] = {
            name = 'sogukcay',
            amount = 50,
         },
      },
      ['rus_equipment'] = {
         [1] = {
            name = 'weapon_assaultrifle',
            amount = 1,
         },
         [2] = {
            name = 'ammo-rifle2',
            amount = 200,
         },
         [3] = {
            name = 'heavyarmor',
            amount = 50,
         },
         [4] = {
            name = 'bandage',
            amount = 50,
         },
         [5] = {
            name = 'pizza',
            amount = 50,
         },
         [6] = {
            name = 'sogukcay',
            amount = 50,
         },
      },
   }
}