# Pauta en código - Actividad 02

## Ejecución

### Local

1. Instalar *ruby* (2.7.1)

2. Instalar dependencias:

   ```
   bundle install
   ```

3. Correr batería de tests:

   ```
   rspec
   ```

   O bien:

   ```
   bundle exec rspec
   ```

### Docker

1. Construir contenedor de Docker:

   ```
   docker build -t IIC3745-2020-2/a02-solution .
   ```

2. Correr toda la batería de tests (se usa volumen para mapear archivos de *coverage* a la máquina local):

   ```
   docker run --rm -v $(pwd):/tester IIC3745-2020-2/a02-solution
   ```

   O bien, se puede entrar a consola y correr algún test específico:

   ```
   docker run -it --rm -v $(pwd):/tester IIC3745-2020-2/a02-solution bash
    
     > rspec spec/pdf_pricer_lc_spec.rb
   ```

