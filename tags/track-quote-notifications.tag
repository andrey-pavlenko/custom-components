<track-quote-notifications>
    <div class="row">
        <div class="span12">
            <label class="checkbox">
                <input
                        type="checkbox"
                        checked={ notification.byEmail }
                        onchange={ onByEmailChange }> Уведомлять по email об открытии туристом подборки
            </label>
            <input
                    class="input-block-level"
                    type="text"
                    placeholder="Адрес email"
                    disabled={ !notification.byEmail }
                    value={ notification.address }
                    required
                    onchange={ onEmailChange }>
        </div>
        <div class="span12">
            <div class="row">
                <div class={ notification.bySms ? 'span6' : 'span12' }>
                    <label class="checkbox">
                        <input
                                type="checkbox"
                                checked={ notification.bySms }
                                onchange={ onBySmsChange }> Уведомлять по SMS об открытии туристом подборки
                    </label>
                    <input
                            class="input-block-level"
                            type="text"
                            placeholder="Мобильный телефон"
                            disabled={ !notification.bySms }
                            value={ notification.phone }
                            required
                            onchange={ onPhoneChange }>
                    <p class="text-warning">Стоимость SMS не входит в абонентскую плату и оплачивается отдельно в соответствии с <a href="/agency/tariffs/active">тарифами</a>.<span if={ notification.bySms }> Сообщения с длинным текстом может быть разбито сотовым оператором на несколько SMS.</span></p>
                <div class="alert" if={ notification.bySms && notification.smsCost }>На тарифе &laquo;{opts.tariffName}&raquo; цена отправки одного SMS: <strong>{ notification.smsCost }</strong> руб.</div>
                </div>
                <div class="span6" if="{ notification.bySms }">
                    <label class="radio">
                        <input
                                type="radio"
                                name="translit"
                                checked={ !notification.useTranslit }
                                value="false"
                                onchange={ onTranslitChange }> Не использовать транслит
                    </label>
                    <label class="radio">
                        <input
                                type="radio"
                                name="translit"
                                checked={ notification.useTranslit }
                                value="true"
                                onchange={ onTranslitChange }> Использовать транслит
                    </label>
                    <img src={ 'img/' + translitImages[notification.useTranslit.toString()] }>
                    <span class="help-block">Это сообщение будет отправлено <strong class="text-info" if={ notification.useTranslit }>одним</strong><strong class="text-info" if={ !notification.useTranslit }>двумя</strong> SMS<span if={ notification.smsCost }> за {notification.smsCost * (notification.useTranslit ? 1 : 2)} руб.</span></span>
                </div>
            </div>
        </div>
    </div>
    <script>
        // console.info(opts);

        this.translitImages = {
            'true': 'sms-translit.png',
            'false': 'sms-no-translit.png'
        };

        this.notification = {
            byEmail: !!opts.email,
            address: opts.email || "",
            bySms: !!opts.phone,
            phone: opts.phone || "",
            useTranslit: opts.hasOwnProperty('useTranslit'),
            smsCost: opts.tariffSmsCost || 0
        };

        this.one('mount', () => {
            Object.defineProperties(this.root, {
                email: {
                    enumerable: true,
                    get: function() {return this._tag.notification.byEmail ? this._tag.notification.address : null}
                },
                phone: {
                    enumerable: true,
                    get: function() { return this._tag.notification.bySms ? this._tag.notification.phone : null }
                },
                useTranslit: {
                    enumerable: true,
                    get: function () { return this._tag.notification.useTranslit }
                }
            });
        });

        onBySmsChange(event) {
            this.notification.bySms = event.currentTarget.checked;
        }

        onByEmailChange(event) {
            this.notification.byEmail = event.currentTarget.checked;
        }

        onPhoneChange(event) {
            this.notification.phone = event.currentTarget.value;
        }

        onEmailChange(event) {
            this.notification.emain = event.currentTarget.value;
        }

        onTranslitChange(event) {
            this.notification.useTranslit = event.currentTarget.value === 'true';
        }

    </script>

    <style>
        :scope img {
            width: 90%;
        }
    </style>
</track-quote-notifications>
