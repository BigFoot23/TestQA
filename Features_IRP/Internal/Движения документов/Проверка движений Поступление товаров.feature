﻿#language: ru

@tree
@ДвиженияДокументов

Функционал: проверка движений документа Поступление товаров

Как Тестировщик я хочу
Проверить движения документа Поступление товаров 
чтобы убедиться что документ делает движения по нужным регистрам 
Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
	
Сценарий: _0501 подготовительный сценарий (движени документа Поступление товаров)
	когда экспорт основных данных
	когда Загрузка документа Поступление
	И я выполняю код встроенного языка на сервере
	|'Документы.PurchaseInvoice.НайтиПоНомеру(1001).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	
	
Сценарий: _0502 проверка движений документа Поступление товаров и услуг по регистру R1001 Закупки
	Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice" 
	И в таблице "List" я перехожу к строке	
	|'Номер'|
	|'1 001'|
	И я нажимаю на кнопку с именем 'FormReportDocumentRegistrationsReportRegistrationsReport'
	Тогда открылось окно 'Движения документа'
	И из выпадающего списка с именем "FilterRegister" я выбираю точное значение 'R1001 Закупки'
	И я нажимаю на кнопку с именем 'GenerateReport'
	Тогда табличный документ "ResultTable" равен:
		| 'Поступление товаров и услуг 1 001 от 17.01.2023 21:02:48' | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| 'Движения документа по регистрам'                          | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| 'Регистр  "R1001 Закупки"'                                 | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| ''                                                         | 'Period'              | 'Resources'  | ''      | ''                  | ''             | 'Dimensions'             | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | 'Attributes'        |
		| ''                                                         | ''                    | 'Количество' | 'Сумма' | 'Сумма без налогов' | 'Сумма скидки' | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Инвойс'                                                   | 'Характеристика'          | 'Ключ строки'                          | 'Отложенный расчет' |
		| ''                                                         | '17.01.2023 21:02:48' | '1'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 17.01.2023 21:02:48' | 'Услуга'                  | '8e6bc9df-0486-487e-9123-1689d7d7ba8e' | 'Да'                |
		| ''                                                         | '17.01.2023 21:02:48' | '1'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 17.01.2023 21:02:48' | 'Услуга'                  | '8e6bc9df-0486-487e-9123-1689d7d7ba8e' | 'Нет'               |
		| ''                                                         | '17.01.2023 21:02:48' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 17.01.2023 21:02:48' | 'Услуга'                  | '8e6bc9df-0486-487e-9123-1689d7d7ba8e' | 'Нет'               |
		| ''                                                         | '17.01.2023 21:02:48' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 17.01.2023 21:02:48' | 'Услуга'                  | '8e6bc9df-0486-487e-9123-1689d7d7ba8e' | 'Нет'               |
		| ''                                                         | '17.01.2023 21:02:48' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 17.01.2023 21:02:48' | 'Услуга'                  | '8e6bc9df-0486-487e-9123-1689d7d7ba8e' | 'Нет'               |
		| ''                                                         | '17.01.2023 21:02:48' | '2'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 17.01.2023 21:02:48' | 'Товар без характеристик' | 'fbd44a7e-1234-4eae-84c4-5dcd86517169' | 'Да'                |
		| ''                                                         | '17.01.2023 21:02:48' | '2'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 17.01.2023 21:02:48' | 'Товар без характеристик' | 'fbd44a7e-1234-4eae-84c4-5dcd86517169' | 'Нет'               |
		| ''                                                         | '17.01.2023 21:02:48' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 17.01.2023 21:02:48' | 'Товар без характеристик' | 'fbd44a7e-1234-4eae-84c4-5dcd86517169' | 'Нет'               |
		| ''                                                         | '17.01.2023 21:02:48' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 17.01.2023 21:02:48' | 'Товар без характеристик' | 'fbd44a7e-1234-4eae-84c4-5dcd86517169' | 'Нет'               |
		| ''                                                         | '17.01.2023 21:02:48' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 17.01.2023 21:02:48' | 'Товар без характеристик' | 'fbd44a7e-1234-4eae-84c4-5dcd86517169' | 'Нет'               |
И я закрываю все окна клиентского приложения

Сценарий: _0503 проверка движений документа Поступление товаров и услуг по регистру R1021 Взаиморасчеты с поставщиками
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice" 
	И в таблице "List" я перехожу к строке	
	|'Номер'|
	|'1 001'|
	И я нажимаю на кнопку с именем 'FormReportDocumentRegistrationsReportRegistrationsReport'
	Тогда открылось окно 'Движения документа'
	И из выпадающего списка с именем "FilterRegister" я выбираю точное значение 'R1021 Взаиморасчеты с поставщиками'
	И я нажимаю на кнопку с именем 'GenerateReport'	
	Тогда табличный документ "ResultTable" равен:
		| 'Поступление товаров и услуг 1 001 от 17.01.2023 21:02:48' | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
		| 'Движения документа по регистрам'                          | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
		| 'Регистр  "R1021 Взаиморасчеты с поставщиками"'            | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
		| ''                                                         | 'Record type' | 'Period'              | 'Resources' | 'Dimensions'             | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | 'Attributes'        | ''                             |
		| ''                                                         | ''            | ''                    | 'Сумма'     | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Контрагент'  | 'Партнер'     | 'Соглашение'                 | 'Документ основание' | 'Отложенный расчет' | 'Закрытие авансов поставщиков' |
		| ''                                                         | 'Приход'      | '17.01.2023 21:02:48' | ''          | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Да'                | ''                             |
		| ''                                                         | 'Приход'      | '17.01.2023 21:02:48' | '343,6'     | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
		| ''                                                         | 'Приход'      | '17.01.2023 21:02:48' | '400'       | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
		| ''                                                         | 'Приход'      | '17.01.2023 21:02:48' | '400'       | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
		| ''                                                         | 'Приход'      | '17.01.2023 21:02:48' | '400'       | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
	И я закрываю все окна клиентского приложения
	
			
			
