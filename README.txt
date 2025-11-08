# Comparador de Precios (Elastic Beanstalk)

## Despliegue rápido con EB CLI
eb init -p "Python 3.11 running on 64bit Amazon Linux 2" -r us-east-1 comparador-electro
eb create comparador-electro-env --single --instance_types t3.small
eb deploy
eb open

## Notas
- EB usa Gunicorn por defecto; Procfile arranca en :8000 detrás del proxy. 
- WSGIPath apunta a app:app y los estáticos se sirven desde /static.
