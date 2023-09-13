#!/bin/bash
#Define your project name
read -p "Insert Django project name: " Django_project_name

PROJECT_NAME="$Django_project_name"

red='\033[0;31m'

green='\033[0;32m'

blue='\033[0;34m'

white='\033[1;37m'

# Upgrade PIP and install Django and Django Rest Framework
pip install --upgrade pip
pip install django
pip install djangorestframework

# Start Django project
django-admin startproject $PROJECT_NAME

cd $PROJECT_NAME

# Activate virtual environment
python3 -m venv $PROJECT_NAME-env
source env/bin/activate

pip install django
pip install psycopg2  # For PostgreSQL support, adjust as needed
pip install django-environ # For managing environment variables

# Create a .env file for environment variables
touch .env

# Create first project app
django-admin startapp myapp

# Migrate changes
python manage.py migrate

# Ask the user if they want to create a frontend
read -p "Do you want to create a frontend (React, Vue, Nuxt.js)? (y/n): " CREATE_FRONTEND

if [ "$CREATE_FRONTEND" == "y" ] || [ "$CREATE_FRONTEND" == "Y" ]; then
    # Ask the user to choose a frontend framework
    echo "Choose a frontend framework:"
    echo -e "${blue}1. React"
    echo -e "${green}2. Vue"
    echo -e "${red}3. Nuxt.js${white}"
    read -p "Enter the number of your choice: " FRONTEND_CHOICE

    # Create a frontend directory based on the user's choice
    FRONTEND_DIR=""
    case $FRONTEND_CHOICE in
        1)
            FRONTEND_DIR="react_frontend"
            npx create-react-app $FRONTEND_DIR
            ;;
        2)
            FRONTEND_DIR="vue_frontend"
            vue create $FRONTEND_DIR
            ;;
        3)
            FRONTEND_DIR="nuxtjs_frontend"
            npx create-nuxt-app $FRONTEND_DIR
            ;;
        *)
            echo "Invalid choice. Exiting."
            exit 1
            ;;
    esac

    # Provide instructions to the user
    echo -e "${blue}Django ${white}boilerplate project with ${blue}$FRONTEND_DIR ${white}created."
    echo -e "You can start developing your Django project in the ${red}'$PROJECT_NAME' ${white}directory."
    echo -e "Your chosen frontend framework is in the ${red}'$FRONTEND_DIR' ${white}directory."
    echo -e "Don't forget to configure your database settings in ${red}settings.py ${white}and add any additional apps you need."
else
    # Provide instructions to the user without creating a frontend
    echo -e "${blue}Django ${white}boilerplate project created without a frontend."
    echo -e "You can start developing your Django project in the ${red}'$PROJECT_NAME' ${white}directory."
    echo -e "If you decide to add a frontend later, you can do so separately."
fi
