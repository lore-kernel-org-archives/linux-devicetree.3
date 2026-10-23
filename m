Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792744228;
	b=EmuWiGpwaMMiSh8triz1PdSuKWFSF3WqHCjXnH63ZU/Drlgi/ZjTQq/KYmamufBel+yI
	 teqWwKJYfNc0eDaAuMWi9411x5Vh8AoLEUI4eJPM0DdDGW+DEKll9kubNtsxDGIuDN3wj
	 WMpknv2yrJ9nTeiqB1WeoDlJlx0upmEioBAnvqqj+ASWS4LfYXJtXaUbLowT3Jiur+ZcA
	 nr5Bo3IasDuY6W5Ja6iEDlXXw6Ee2Tak2Ty9mBaYmR8BmvYh10rXBDt+pQM9jxQe7GtnJ
	 u9fXgoEwAG75Ap2XwR3fsSytedIkm68hrq5t0IGYEdQRG7YWqG0b1ZNhfQokpdK6Ugg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744228;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7M03XGfw83rRB9E3wIpQDVit+3YfqIM2oxVHDUVUsk4=;
	b=FBmiLbUcAbfMUbCkBVdOTp+NcxV8CIBX+wH9Gqn/gfsqNgAsBsWByiWXkOqk9hUpCMBI
	 TJo3WIdBcpxzqlH+NKocAknDfSL4mWUOGI+BbtdZyyB+CgG6O4hG1j7Ql8MBEB272FNxB
	 BIO8HWWrQLb4KPyXnIMQoiOrO3zr6C0CFQwSM+o3EJeXBdPIJDTudhDxKyVmOZE9E3CRw
	 leZvYLu6Ouv5oxP3sJNUbIzIy/ppX0I3QpcdurKBfNjYDngBSiIbknjlAFEgBj9vz+Twf
	 VFjXDzhBLq24x68vRYdeMl/BgMMrStx9P4r5hYjceLj35QZsog/Fx55cqE4/CQO6WZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXe88En4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82455606A324
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXe88En4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DAD1F031E0;
	Fri, 23 Oct 2026 08:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792744227;
	bh=7M03XGfw83rRB9E3wIpQDVit+3YfqIM2oxVHDUVUsk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OXe88En4pRQjCXXGm3lp1RH+9HmXLsptJQJsYv7tUj2tfbdrkTt9m9pAZzSpoL09N
	 YeZlez6Xj+4F/vr1c0CDiFQLYdw/6W3132WtCyeb1jX6M2Z3jhvn+wzcB4UaAky5wa
	 TSCAfUEMg47S8ojH7qmMZAregyu9dWeJIadcJdY+x9SHegaJmHNSd7DBvlHXzxsbtg
	 6l1AkG1MEyelj2h8W1EjB3pdSVZBiruJq8yUjLArDqXQLSaCblL6vrdpp3H/sSVrnv
	 9I3jBFtLJrbN3x/HzxuXaH3RCMDvFrlCb8tJYNhu/f0yp0td0Ih4hF9+n9rxBv60OD
	 xGWFA1uLxjT9g==
Message-ID: <sashiko-outbox-182518@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] iio: temperature: add support for Analog Devices
 MAX30210
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023080623.1830-3-johnerasmusmari.geronimo@analog.com>
References: <20261023080623.1830-1-johnerasmusmari.geronimo@analog.com>
 <20261023080623.1830-3-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 08:30:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] iio: temperature: max30210: wrong scale factor in max30210_read_ra=
w()
- [High] iio: temperature: max30210: race between buffer disable and max302=
10_fifo_read()
- [Medium] iio: temperature: max30210: broken events and missing quiesce wi=
thout IRQ
- [Medium] iio: temperature: max30210: FIFO enable order and watermark race=
 in preenable
- [Medium] iio: temperature: max30210: missing SYS_CONF_REG in max30210_vol=
atile_reg()
- [Medium] iio: temperature: max30210: IRQ requested after devm_iio_device_=
register()
- [Medium] iio: temperature: max30210: non-sleeping gpiod_set_value() in ma=
x30210_setup()
- [Medium] iio: temperature: max30210: unmasked status bits in max30210_irq=
_handler()
- [Medium] iio: temperature: max30210: unconditional decrement in max30210_=
autoconv_put()
--

commit 3d7457ec9559f89625f738367b02f298331f750f
Author: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

iio: temperature: add support for Analog Devices MAX30210

This commit adds an IIO driver for the Analog Devices MAX30210 I2C
temperature sensor, supporting direct mode reads, configurable sampling
frequency, threshold events, and a 64-sample hardware FIFO buffer.

> diff --git a/drivers/iio/temperature/max30210.c b/drivers/iio/temperature=
/max30210.c
> new file mode 100644
> index 0000000000000..01a1eff4da663
> --- /dev/null
> +++ b/drivers/iio/temperature/max30210.c

[ ... ]

> +static bool max30210_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case MAX30210_STATUS_REG:
> +	case MAX30210_FIFO_DATA_REG:
> +	case MAX30210_FIFO_CONF_2_REG:
> +	case MAX30210_TEMP_CONV_REG:
> +	/*
> +	 * TEMP_DATA_REG is a 16-bit value spanning two byte registers;
> +	 * both must be volatile or regmap_bulk_read()'s range check falls
> +	 * back to caching the second byte forever (see max30210_read_temp()).
> +	 */
> +	case MAX30210_TEMP_DATA_REG:
> +	case MAX30210_TEMP_DATA_REG + 1:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}

[Severity: Medium]
Should MAX30210_SYS_CONF_REG also be marked volatile in
max30210_volatile_reg()?

When probing without powerdown-gpios, max30210_setup() calls:

    regmap_set_bits(st->regmap, MAX30210_SYS_CONF_REG,
                    MAX30210_SYSCONF_RESET);

Because max30210_regmap uses REGCACHE_MAPLE and MAX30210_SYS_CONF_REG is not
in max30210_volatile_reg(), the self-clearing MAX30210_SYSCONF_RESET bit
(0x01) remains cached after the hardware finishes resetting and clears it to
0. Would this cause subsequent reads (such as via max30210_reg_access()) to
return a stale 0x01 value, or cause future read-modify-write operations on
MAX30210_SYS_CONF_REG to re-trigger a device reset?

[ ... ]

> +static int max30210_autoconv_put(struct max30210_state *st)
> +{
> +	int ret =3D 0;
> +
> +	lockdep_assert_held(&st->lock);
> +
> +	if (st->autoconv_users =3D=3D 1)
> +		ret =3D regmap_write(st->regmap, MAX30210_TEMP_CONV_REG, 0);
> +	if (st->autoconv_users)
> +		st->autoconv_users--;
> +
> +	return ret;
> +}

[Severity: Medium]
If regmap_write() fails in max30210_autoconv_put() when st->autoconv_users
is 1, should st->autoconv_users still be decremented?

Decrementing st->autoconv_users on error leaves st->autoconv_users at 0 whi=
le
autonomous conversions remain enabled in MAX30210_TEMP_CONV_REG. In
max30210_write_event_config(), MAX30210_INT_EN_REG is cleared before calling
max30210_autoconv_put(st), so a subsequent attempt to disable the event sees
the bit already cleared and returns 0 early without stopping
MAX30210_TEMP_CONV_REG, while max30210_read_raw() sees st->autoconv_users =
=3D=3D 0
even though AUTO mode is still running.

> +
> +static void max30210_fifo_read(struct iio_dev *indio_dev)
> +{
> +	struct max30210_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	/*
> +	 * FIFO_DATA_REG auto-increments in hardware; bulk_read would treat
> +	 * each subsequent byte as a separate cacheable register.
> +	 */
> +	ret =3D regmap_noinc_read(st->regmap, MAX30210_FIFO_DATA_REG,
> +				st->fifo_buf,
> +				MAX30210_FIFO_BYTES_PER_SAMPLE * st->watermark);
> +	if (ret) {
> +		dev_err(&indio_dev->dev, "Failed to read from fifo.\n");
> +		return;
> +	}
> +
> +	for (unsigned int i =3D 0; i < st->watermark; i++) {
> +		u32 raw =3D get_unaligned_be24(&st->fifo_buf[MAX30210_FIFO_BYTES_PER_S=
AMPLE * i]);
> +		s16 temp;
> +
> +		if (raw =3D=3D MAX30210_FIFO_INVAL_DATA) {
> +			dev_err_ratelimited(&indio_dev->dev, "Invalid data\n");
> +			continue;
> +		}
> +
> +		temp =3D sign_extend32(FIELD_GET(MAX30210_FIFO_TEMP_MASK, raw), 15);
> +
> +		iio_push_to_buffers(indio_dev, &temp);
> +	}
> +}
> +
> +static irqreturn_t max30210_irq_handler(int irq, void *dev_id)
> +{
> +	struct iio_dev *indio_dev =3D dev_id;
> +	struct max30210_state *st =3D iio_priv(indio_dev);
> +	unsigned int status;
> +	int ret;
> +
> +	ret =3D regmap_read(st->regmap, MAX30210_STATUS_REG, &status);
> +	if (ret) {
> +		dev_err(&indio_dev->dev, "Status read failed\n");
> +		return IRQ_NONE;
> +	}
> +
> +	if (!(status & (MAX30210_STATUS_A_FULL_MASK |
> +			MAX30210_STATUS_TEMP_HI_MASK |
> +			MAX30210_STATUS_TEMP_LO_MASK)))
> +		return IRQ_NONE;
> +
> +	if (status & MAX30210_STATUS_A_FULL_MASK)
> +		max30210_fifo_read(indio_dev);
> +
> +	if (status & MAX30210_STATUS_TEMP_HI_MASK)
> +		iio_push_event(indio_dev,
> +			       IIO_UNMOD_EVENT_CODE(IIO_TEMP, 0,
> +						    IIO_EV_TYPE_THRESH,
> +						    IIO_EV_DIR_RISING),
> +			       iio_get_time_ns(indio_dev));
> +
> +	if (status & MAX30210_STATUS_TEMP_LO_MASK)
> +		iio_push_event(indio_dev,
> +			       IIO_UNMOD_EVENT_CODE(IIO_TEMP, 0,
> +						    IIO_EV_TYPE_THRESH,
> +						    IIO_EV_DIR_FALLING),
> +			       iio_get_time_ns(indio_dev));
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
Does max30210_irq_handler() need to mask status with the enabled bits in
MAX30210_INT_EN_REG before dispatching FIFO reads and threshold events?

In hardware, MAX30210_STATUS_REG sets the A_FULL, TEMP_HI, and TEMP_LO flags
whenever those conditions occur during autonomous conversions, regardless of
which bits are enabled in MAX30210_INT_EN_REG.

If only threshold events are enabled (buffer disabled), autonomous conversi=
ons
still fill the FIFO and set MAX30210_STATUS_A_FULL_MASK, causing a threshold
interrupt to also invoke max30210_fifo_read() while the buffer is disabled.
Conversely, if the FIFO buffer (or only one threshold direction) is enabled
and the temperature crosses an unenabled threshold in MAX30210_TEMP_ALM_HI_=
REG
or MAX30210_TEMP_ALM_LO_REG, every FIFO interrupt will see TEMP_HI or TEMP_=
LO
set in status and push disabled threshold events via iio_push_event().

[ ... ]

> +static int max30210_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct max30210_state *st =3D iio_priv(indio_dev);
> +	unsigned int uval;
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		*val =3D 5;
> +		*val2 =3D MILLI;
> +
> +		return IIO_VAL_FRACTIONAL;

[Severity: High]
Is the scale factor for IIO_CHAN_INFO_SCALE in max30210_read_raw() off by a
factor of 1000?

Per Documentation/ABI/testing/sysfs-bus-iio, IIO_TEMP channels report values
in milli-degrees Celsius. Since one LSB of the MAX30210 temperature data
register is 0.005 degrees Celsius (5 milli-degrees Celsius, matching MAX302=
08
in drivers/iio/temperature/max30208.c), setting *val =3D 5 and *val2 =3D MI=
LLI
(1000) with IIO_VAL_FRACTIONAL reports 5 / 1000 =3D 0.005000000 instead of =
5.
Should this set *val =3D 5 and return IIO_VAL_INT?

[ ... ]

> +static int max30210_set_watermark(struct iio_dev *indio_dev, unsigned in=
t val)
> +{
> +	struct max30210_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	if (val < 1 || val > MAX30210_FIFO_SIZE)
> +		return -EINVAL;
> +
> +	/*
> +	 * FIFO_A_FULL sets the number of empty FIFO slots remaining when the
> +	 * A_FULL interrupt fires. For a watermark of N samples, set
> +	 * FIFO_A_FULL =3D FIFO_SIZE - N.
> +	 */
> +	ret =3D regmap_write(st->regmap, MAX30210_FIFO_CONF_1_REG,
> +			   FIELD_PREP(MAX30210_FIFOCONF1_A_FULL_MASK,
> +				      MAX30210_FIFO_SIZE - val));
> +	if (ret)
> +		return ret;
> +
> +	st->watermark =3D val;
> +
> +	return 0;
> +}

[ ... ]

> +static int max30210_buffer_preenable(struct iio_dev *indio_dev)
> +{
> +	struct max30210_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	/* Enable FIFO-full interrupt */
> +	ret =3D regmap_set_bits(st->regmap, MAX30210_INT_EN_REG,
> +			      MAX30210_STATUS_A_FULL_MASK);
> +	if (ret)
> +		return ret;
> +
> +	/* Flush FIFO before starting autonomous conversions */
> +	ret =3D regmap_set_bits(st->regmap, MAX30210_FIFO_CONF_2_REG,
> +			      MAX30210_FIFOCONF2_FLUSH_FIFO);
> +	if (ret)
> +		goto err_disable_irq;
> +
> +	scoped_guard(mutex, &st->lock)
> +		ret =3D max30210_autoconv_get(st);
> +	if (ret)
> +		goto err_disable_irq;
> +
> +	return 0;
> +
> +err_disable_irq:
> +	/* The core won't call postdisable() when preenable() fails. */
> +	regmap_clear_bits(st->regmap, MAX30210_INT_EN_REG,
> +			  MAX30210_STATUS_A_FULL_MASK);
> +
> +	return ret;
> +}

[Severity: Medium]
Could the ordering in max30210_buffer_preenable() and max30210_set_watermar=
k()
cause stale FIFO reads and a race on st->watermark?

First, max30210_buffer_preenable() enables MAX30210_STATUS_A_FULL_MASK in
MAX30210_INT_EN_REG before flushing the FIFO via MAX30210_FIFOCONF2_FLUSH_F=
IFO.
If autonomous conversions were already active for threshold events, A_FULL =
can
already be asserted in MAX30210_STATUS_REG and trigger max30210_irq_handler=
()
on stale FIFO samples before the flush happens.

Second, in iio_enable_buffers(), setup_ops->preenable() runs before
info->hwfifo_set_watermark(). Because the FIFO interrupt and autonomous
conversions are started in .preenable rather than .postenable,
max30210_irq_handler() -> max30210_fifo_read() can run concurrently while
max30210_set_watermark() updates MAX30210_FIFO_CONF_1_REG and st->watermark
without locking. In max30210_fifo_read(), st->watermark is read unlocked for
the regmap_noinc_read() length and re-read unlocked in the loop bound:

    ret =3D regmap_noinc_read(st->regmap, MAX30210_FIFO_DATA_REG,
                            st->fifo_buf,
                            MAX30210_FIFO_BYTES_PER_SAMPLE * st->watermark);
    ...
    for (unsigned int i =3D 0; i < st->watermark; i++) {

If max30210_set_watermark() increases st->watermark while regmap_noinc_read=
()
is in flight, the loop can iterate past the number of samples actually read
into st->fifo_buf and push uninitialized or stale bytes to the IIO buffer.

Additionally, when val > MAX30210_FIFO_SIZE, should max30210_set_watermark()
clamp val to MAX30210_FIFO_SIZE instead of returning -EINVAL, as expected by
iio_enable_buffers() and Documentation/ABI/testing/sysfs-bus-iio?

> +
> +static int max30210_buffer_postdisable(struct iio_dev *indio_dev)
> +{
> +	struct max30210_state *st =3D iio_priv(indio_dev);
> +	int ret, err;
> +
> +	scoped_guard(mutex, &st->lock)
> +		err =3D max30210_autoconv_put(st);
> +
> +	/* Keep going on error so the interrupt is always disabled below. */
> +	ret =3D regmap_set_bits(st->regmap, MAX30210_FIFO_CONF_2_REG,
> +			      MAX30210_FIFOCONF2_FLUSH_FIFO);
> +	if (!err)
> +		err =3D ret;
> +
> +	/* Disable FIFO-full interrupt */
> +	ret =3D regmap_clear_bits(st->regmap, MAX30210_INT_EN_REG,
> +				MAX30210_STATUS_A_FULL_MASK);
> +
> +	return err ?: ret;
> +}

[Severity: High]
Can max30210_buffer_postdisable() return while max30210_irq_handler() is
still executing max30210_fifo_read() on another CPU?

When disabling the buffer via __iio_update_buffers() -> iio_disable_buffers=
()
-> max30210_buffer_postdisable(), the IIO core is operating in
INDIO_BUFFER_SOFTWARE mode and does not synchronize client->irq.
max30210_buffer_postdisable() also flushes the FIFO before clearing
MAX30210_STATUS_A_FULL_MASK and returns without calling synchronize_irq() or
serializing against max30210_fifo_read().

If max30210_fifo_read() is in flight during an I2C read and calling
iio_push_to_buffers(), __iio_update_buffers() immediately proceeds to
iio_buffer_deactivate() and deletes the buffer from
iio_dev_opaque->buffer_list via list_del_init() while iio_push_to_buffers()
iterates buffer_list unlocked, and a subsequent buffer resize and re-enable
via iio_request_update_kfifo() can free and reallocate the underlying kfifo
while iio_store_to_kfifo() is writing to it. Should
max30210_buffer_postdisable() disable MAX30210_STATUS_A_FULL_MASK first and
synchronize with the IRQ handler before flushing the FIFO and returning?

[ ... ]

> +static void max30210_powerdown(void *data)
> +{
> +	struct gpio_desc *powerdown_gpio =3D data;
> +
> +	gpiod_set_value(powerdown_gpio, 1);
> +}
> +
> +static void max30210_quiesce(void *data)
> +{
> +	struct max30210_state *st =3D data;
> +
> +	/* Stop interrupt sources and autonomous conversions; errors are not ac=
tionable here */
> +	regmap_write(st->regmap, MAX30210_INT_EN_REG, 0);
> +	regmap_write(st->regmap, MAX30210_TEMP_CONV_REG, 0);
> +}
> +
> +static int max30210_setup(struct max30210_state *st, struct device *dev)
> +{
> +	struct gpio_desc *powerdown_gpio;
> +	unsigned int val;
> +	int ret;
> +
> +	powerdown_gpio =3D devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_=
HIGH);
> +	if (IS_ERR(powerdown_gpio))
> +		return dev_err_probe(dev, PTR_ERR(powerdown_gpio),
> +				     "failed to request powerdown GPIO\n");
> +
> +	if (powerdown_gpio) {
> +		/* Deassert powerdown to power up device */
> +		gpiod_set_value(powerdown_gpio, 0);

[Severity: Medium]
Should max30210_setup() and max30210_powerdown() use
gpiod_set_value_cansleep() instead of gpiod_set_value()?

Both functions run in sleepable process context, so if powerdown-gpios is
connected through an I2C or SPI GPIO expander, calling gpiod_set_value() wi=
ll
trigger a warning in gpiolib. Also, in max30210_setup(), powerdown_gpio is
requested with GPIOD_OUT_HIGH and immediately set to 0 on the next line
without any delay; should it either be requested with GPIOD_OUT_LOW directly
or wait between asserting and deasserting powerdown?

[ ... ]

> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +	indio_dev->channels =3D &max30210_channel;
> +	indio_dev->num_channels =3D 1;
> +	indio_dev->name =3D "max30210";
> +	indio_dev->info =3D &max30210_info;
> +
> +	/* Currently, without an interrupt there is no way to drain the FIFO in=
to the buffer */
> +	if (client->irq) {
> +		ret =3D devm_iio_kfifo_buffer_setup_ext(dev, indio_dev, &max30210_buff=
er_ops,
> +						      max30210_fifo_attributes);
> +		if (ret)
> +			return ret;
> +
> +		/* Runs after unregister, so nothing can re-arm the device; before pow=
erdown. */
> +		ret =3D devm_add_action_or_reset(dev, max30210_quiesce, st);
> +		if (ret)
> +			return ret;
> +	}

[Severity: Medium]
What happens if client->irq is not provided, but userspace enables threshold
events via sysfs?

In max30210_probe(), indio_dev->channels is unconditionally set to
&max30210_channel (which includes max30210_events) and indio_dev->info is s=
et
to &max30210_info. When client->irq =3D=3D 0, no IRQ handler is registered,=
 so
events can never be delivered, yet writing 1 to events/in_temp_thresh_*_en
still invokes max30210_write_event_config() -> max30210_autoconv_get(st). T=
hat
starts autonomous conversions and increments st->autoconv_users, which caus=
es
max30210_read_raw() to reject all single-shot direct reads with -EBUSY, and
because max30210_quiesce() is only registered inside the if (client->irq)
block, unbinding the driver leaves autonomous conversions and interrupt bits
enabled in hardware. Should event support only be registered when client->i=
rq
is present?

> +
> +	ret =3D devm_iio_device_register(dev, indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	if (!client->irq)
> +		return 0;
> +
> +	/*
> +	 * Request the IRQ after registering the IIO device so devm tears it
> +	 * down first on removal, before the event interface is freed.
> +	 */
> +	return devm_request_threaded_irq(dev, client->irq, NULL,
> +					 max30210_irq_handler, IRQF_ONESHOT,
> +					 indio_dev->name, indio_dev);
> +}

[Severity: Medium]
Should devm_request_threaded_irq() be called before
devm_iio_device_register() in max30210_probe()?

Registering the IIO device first exposes the sysfs and character device
interfaces to userspace before max30210_irq_handler() is installed, and on
driver removal devres frees the IRQ while the IIO device is still registered
and before devm_iio_device_unreg() disables buffers or max30210_quiesce()
masks hardware interrupts. Note that the event interface is freed in
iio_dev_release() (registered via devm_iio_device_alloc()), so requesting t=
he
IRQ before devm_iio_device_register() still ensures the IRQ is torn down
before indio_dev is freed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023080623.1830=
-1-johnerasmusmari.geronimo@analog.com?part=3D2
