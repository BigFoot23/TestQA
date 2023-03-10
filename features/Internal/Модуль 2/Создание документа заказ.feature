#language: ru

@tree

Функционал: Создание документа заказ

Как Менеджер по продажам я хочу
Создание документа заказ 
чтобы зарегистрировать заказ

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _00101 Подготовительный сценарий для создания документа заказ 
* Загрузка констант и организаций
	И Перезаполнение констант
* Загрузка НСИ для документа заказ
	И Перезаполнение НСИ заказа

Сценарий: _00102 Заполнение шапки документа заказ
* Заполнение шапки документа
	И Заполнить шапку заказа
* Заполнеие ТЧ заказа
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Торт '
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '7'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Хлеб'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '3,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '6'
	И в таблице "Товары" я завершаю редактирование строки	
* Проверка суммы итого ТЧ	
	Тогда значение поля с именем "ТоварыИтогКоличество" содержит текст "13"