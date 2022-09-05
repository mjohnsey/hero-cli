import requests

from hero_cli.lib.schema_example.api_schemas import GetHeroes

if __name__ == "__main__":
    heroes = GetHeroes.parse_obj(requests.get('http://localhost:8000/heroes').json())
    for hero in heroes.heroes:
        print(hero)