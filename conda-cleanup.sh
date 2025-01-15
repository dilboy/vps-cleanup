#!/bin/bash

# 清理 conda 缓存和未使用的包
echo "正在清理 conda 缓存和未使用的包..."
conda clean --all -y

# 列出所有 conda 环境
echo "当前 conda 环境列表："
conda env list

# 提示用户输入要删除的环境名称
read -p "请输入要删除的环境名称（如果不需要删除，请直接按 Enter）： " env_name

if [ -n "$env_name" ]; then
    echo "正在删除环境：$env_name ..."
    conda env remove --name "$env_name" -y
fi

# 提示用户输入要删除的包名称
read -p "请输入要从当前环境中删除的包名称（如果不需要删除，请直接按 Enter）： " package_name

if [ -n "$package_name" ]; then
    echo "正在从当前环境中删除包：$package_name ..."
    conda remove --name "$(basename $(pwd))" "$package_name" -y
fi

echo "清理完成！"
