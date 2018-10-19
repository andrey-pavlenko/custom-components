<track-quote-notifications>
    <div class="row">
        <div class="span6">
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
        </div>
        <div class="span6">
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
    </div>
    <script>

        this.notification = {
            byEmail: !!opts.track_notify_email,
            address: opts.track_notify_email || "",
            bySms: !!opts.track_notify_phone,
            phone: opts.track_notify_phone || ""
        };

        Object.defineProperties(this, {
           track_notify_email: {
               enumerable: true,
               get: function() { return this.notification.byEmail ? this.notification.address : null }
           },
           track_notify_phone: {
               enumerable: true,
               get: function() { return this.notification.bySms ? this.notification.phone : null }
           }
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

    </script>
</track-quote-notifications>
