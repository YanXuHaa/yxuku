import json
import random
import os

def weighted_choice(choices, weights):
    total = sum(weights)
    r = random.uniform(0, total)
    upto = 0
    for choice, weight in zip(choices, weights):
        if upto + weight >= r:
            return choice
        upto += weight

def get_hitokoto(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    return data

def main():
    json_files = ['a.json', 'c.json', 'd.json', 'e.json']
    weights = [0.2, 0.3, 0.35, 0.15]
    json_dir = os.path.expanduser('~/meiri/ku/')

    # 选择JSON文件
    chosen_file = weighted_choice(json_files, weights)
    hitokoto_list = get_hitokoto(os.path.join(json_dir, chosen_file))

    # 根据长度权重选择一言
    length_weights = {
        '0-10': 0.27,
        '10-20': 0.45,
        '20-25': 0.28
    }
    weighted_hitokotos = []
    for hitokoto in hitokoto_list:
        length = hitokoto['length']
        if length > 25:
            continue
        if 20 <= length <= 25:
            weighted_hitokotos.append((hitokoto, length_weights['20-25']))
        elif 10 <= length <= 20:
            weighted_hitokotos.append((hitokoto, length_weights['10-20']))
        elif 0 <= length <= 10:
            weighted_hitokotos.append((hitokoto, length_weights['0-10']))

    chosen_hitokoto = weighted_choice([h[0] for h in weighted_hitokotos], [h[1] for h in weighted_hitokotos])
    print("\n" + chosen_hitokoto['hitokoto'] + "\n\n")

if __name__ == '__main__':
    main()