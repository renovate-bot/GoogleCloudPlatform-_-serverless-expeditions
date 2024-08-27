@if not defined GCP_PROJECT_ID (
	@echo Please define the environment variable GCP_PROJECT_ID
	Exit /B 1
)

:: @set GCP_PROJECT_ID=
@set REGION=us-central1
@set SERVICE_NAME=gemini-python-flask-v0
@set IMAGE_NAME=gemini-python-flask-v0
@set LOCATION=us-central1
@set REPOSITORY=gemini-project

call gcloud builds submit ^
--tag %LOCATION%-docker.pkg.dev/%GCP_PROJECT_ID%/%REPOSITORY%/%IMAGE_NAME%
@if errorlevel 1 goto err_out

goto end

:err_out
@echo ***************************************************************
@echo Build Failed     Build Failed     Build Failed     Build Failed
@echo ***************************************************************

:end