from flask import render_template, redirect, url_for, current_app

@current_app.route('/')
def index():
    return render_template('index.html')

@current_app.route('/game')
def game():
    return render_template('game.html')
