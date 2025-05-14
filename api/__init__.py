from flask import Flask
from flask_sqlalchemy import SQLAlchemy

from . import config

db = SQLAlchemy()

def create_app(config_name=None):
    app = Flask(__name__)
    if config_name is None:
        app.config["SQLALCHEMY_DATABASE_URI"] = config.DevelopmentConfig.SQLALCHEMY_DATABASE_URI

    db.init_app(app)

    with app.app_context():
        from . import routes
    app.register_blueprint(routes.bp)
    return app