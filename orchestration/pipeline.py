from prefect import flow, task
import subprocess
import os
from dotenv import load_dotenv

# Cargar variables del .env
load_dotenv()

@task
def run_dbt():
    dbt_command = os.getenv("DBT_COMMAND")
    profiles_dir = os.getenv("DBT_PROFILES_DIR")

    print(f"Ejecutando: {dbt_command}")
    print(f"Profiles dir: {profiles_dir}")

    result = subprocess.run(
        dbt_command.split(),
        capture_output=True,
        text=True,
        env={**os.environ, "DBT_PROFILES_DIR": profiles_dir}
    )

    print(result.stdout)

    if result.returncode != 0:
        raise Exception("Error ejecutando dbt")

@flow(name="weather_pipeline")
def weather_pipeline():
    run_dbt()

if __name__ == "__main__":
    weather_pipeline()