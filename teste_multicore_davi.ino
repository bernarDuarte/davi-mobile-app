
#include <Wire.h>
#include "SparkFun_VL53L1X.h" //biblioteca sensor optico: http://librarymanager/All#SparkFun_VL53L1X

//Optional interrupt and shutdown pins.
#define SHUTDOWN_PIN 2
#define INTERRUPT_PIN 3
#define TEMPO_DEBOUNCE 50 //ms

SFEVL53L1X distanceSensor;

TaskHandle_t Task1; // 1º tarefa
TaskHandle_t Task2; // 2º tarefa

// pinOut
const int led = 13;
const int buzzer = 33;
const int motor = 32;
int distance;

const uint8_t button = 27;
const uint8_t core = 1;

unsigned long timestamp_ultimo_acionamento = 0; // controle botao
bool controle = 0;

void attachInterruptTask(void *pvParameters);
void isr();

void setup(void){

  Wire.begin();
  Serial.begin(115200);
  pinMode(led, OUTPUT);
  pinMode(motor, OUTPUT);
  pinMode(buzzer, OUTPUT);
 
  
  Serial.println("VL53L1X Teste");

  if (distanceSensor.begin() != 0){ //Inicia e retorna 0 para o funcionamento 
    Serial.println("Falha na inicialização...");
    while (1);
  }
  Serial.println("Sensor Ativo!");
   digitalWrite(led, HIGH); // Liga led para confirmar funcionamento do sensor lidar

  //Create Task running in core 0
  
  xTaskCreatePinnedToCore( Task1code, "Tarefa1", 10000, NULL, 6, &Task1, 0); // Função da tarefa, nome da tarefa, tamanho (bytes), parametro da tarefa, prioridade,tarefa criada, alocaão do nucleo
  delay(500);
  xTaskCreatePinnedToCore( Task2code, "Tarefa2", 10000, NULL, 2, &Task2, 1);
    delay(500);
  xTaskCreatePinnedToCore(attachInterruptTask, "Tarefa interrupcao", 2000, NULL, 3, NULL, 1);
    delay(500);
}
 // tarefa determinada ao botão no core 0
void attachInterruptTask(void *pvParameters) {
    //Setar Botao como input pull-up
    pinMode(button, INPUT_PULLUP);
    attachInterrupt(digitalPinToInterrupt(button), isr, RISING);
   /* while(true){
        Serial.println("Task rodando");
        delay(500);
      }*/
    vTaskDelete(NULL);
    delay(500);
}
 
// tarefa destinada ao sensor no core0
void Task1code( void * pvParameters ){
  for(;;){
  Serial.print("Task1 rodando no core ");
  Serial.println(xPortGetCoreID());

  distanceSensor.startRanging(); //Configuração de escrita em byte para iniciar a medição
  while (!distanceSensor.checkForDataReady()){
    vTaskDelay(500/portTICK_PERIOD_MS);
  }
  
  distance = distanceSensor.getDistance(); //(Get) resultado da medida gerada pelo sensor
  distanceSensor.clearInterrupt();
  distanceSensor.stopRanging();

  Serial.print("Distancia(mm): ");
  Serial.print(distance);

  Serial.println();

  } 
}

// tarefa destinada ao motor e buzzer no core1
void Task2code( void * pvParameters ){
  //Serial.print("Task2 running on core ");
  //Serial.println(xPortGetCoreID());
  
 for(;;){ // Loop infinito

    if (controle == 0){
      if (distance>1000 && distance<1500){// Se distancia for maior que 700 e menor que 1000...
        digitalWrite(motor, HIGH);
        digitalWrite(buzzer, HIGH);
        delay(1000);
        
        digitalWrite(motor, LOW);
        digitalWrite(buzzer, LOW);
        delay(1000);
      }
      
      if (distance<1000){ // Se distancia for menor 700...
        digitalWrite(motor, HIGH);
        digitalWrite(buzzer, HIGH);
        delay(500);
        
        digitalWrite(motor, LOW);
        digitalWrite(buzzer, LOW);
        delay(500);
      }
    }

    if (controle == 1){
      
      if (distance>1000 && distance<1500){// Se distancia for maior que 700 e menor que 1000...
        digitalWrite(motor, HIGH);
        delay(1000);
        
        digitalWrite(motor, LOW);
        delay(1000);
      }
      
      if (distance<1000){ // Se distancia for menor 700...
        digitalWrite(motor, HIGH);
        delay(500);
        
        digitalWrite(motor, LOW);
        delay(500);
      }
    
}
}
}

void IRAM_ATTR isr() { //IRAM_ATTR, utilizada para indicar que tal trecho de código ficará na seção do barramento de instruções da RAM (maior velocidade), e não na Flash.

  if ( (millis() - timestamp_ultimo_acionamento) >= TEMPO_DEBOUNCE ){
    controle=(!controle);
    timestamp_ultimo_acionamento = millis();
  }

  Serial.print("Interrupção");
  Serial.println(controle);
  delayMicroseconds(500);
}

void loop(void){
  
  }
