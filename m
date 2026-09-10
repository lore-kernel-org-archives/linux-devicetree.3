Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DA949E120
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 22:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789079144; cv=none; b=fA4s+u256KceWdpBntjBLDfcdBmsaiQA0Wxzt6rh2/fnGJLh3D8dKhnJbpmq+VazD7C2xtoo36XZ9o4SX4BqPBcrmxZTiePXjhiWtCkYXaU3LJ1scpWMK6/HI1LXPT5RsL70NzAZOQs1WcgmZoGWGU3avMTVdQsVgUc3Xa/xGZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789079144; c=relaxed/simple;
	bh=czOpfpIuGUvLy0eRvJb5f0VnFyKY5Fdz/ianAHc2IDk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dcFQaRGJLkQI8uCrdMukxu3WtQpbg/IN9/w4CyNIIg3y+vXMrC61M3mSujlN25aZoIT+Rhqf4rTCcJCDtJiMEa9wfEM+UpKd6VbX523IM6M3iGw2Mu6cVsvw8uWJ0yFblueozOVWQ08oLTmo+CqgL+HYjaa1ivP+bGBmnjfW3oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKOwcrPj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKOwcrPj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3921F000FF;
	Thu, 10 Sep 2026 22:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789079143;
	bh=xY8oLlAmuo34lg4aed3jekeDO0N4tgbPRTHEWIE+s1E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SKOwcrPjs5rVVGXCy8vzxmxiZOzJmXKr1wPvmHCzjEGgvBzUSvKzpRXXUiQXoog1w
	 0jvBGkUYxKlZ4WXG9lZPh9xLYJYfLVGjxQ5RfS9LqJ/IYKTVWi9efXTMzR4Z1mxIlc
	 6cr/6sNoYy5jQwNBHwgv8OtgnxehDJBCUkV7DfBRf/GBEef0uiRdIQEzsHGyyAG1Dd
	 4amcmCMICrENrcoEebLSoruG1nASkklgCYRw086QQBqt5B3h3OfX53TZaE0Pu+URpn
	 +UQtDap5s2KnnrJ6IaDKjyJ87nVKN3t/G1B0D16aFlmXnF44u03PbSpQnIagNaQFYR
	 r8MDhJycsiqDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] iio: temperature: add support for Analog Devices
 MAX30210
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <1d3cdd6163923b1c537b8db49b833863ee6bf545.1789032019.git.johnerasmusmari.geronimo@analog.com>
References: <cover.1789032019.git.johnerasmusmari.geronimo@analog.com>
 <1d3cdd6163923b1c537b8db49b833863ee6bf545.1789032019.git.johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 22:25:42 +0000
Message-Id: <20260910222542.DC3921F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] The driver uses `regmap_bulk_read` to read from the FIFO, which in=
crements the register address on fallback, corrupting the read.
- [High] Threshold events will never trigger unless the FIFO buffer is also=
 enabled, because autonomous conversion is not managed correctly.
- [High] Use-after-free on IIO `event_interface` during device removal due =
to incorrect devm registration order.
- [Medium] The driver strictly requires an interrupt, contradicting the com=
mit message claim that interrupt signaling is optional.
- [Low] Missing Kconfig dependencies for REGMAP_I2C, IIO_BUFFER, and IIO_KF=
IFO_BUF.
- [Low] Device is not powered down or disabled on driver removal, leading t=
o power leaks.
- [Low] Missing `#include <linux/regulator/consumer.h>` causes implicit fun=
ction declaration.
- [Low] Macro naming typo suggests writing to the wrong register.
--

commit cfe908c78eef329997beda55cb489b59b1cf8d93
Author: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

iio: temperature: add support for Analog Devices MAX30210

This adds support for the Analog Devices MAX30210 I2C temperature sensor.
The driver integrates with the IIO framework, providing direct mode
temperature conversion, threshold events, and FIFO operation.

> --- a/drivers/iio/temperature/Kconfig
> +++ b/drivers/iio/temperature/Kconfig
> @@ -152,6 +152,16 @@ config MAX30208
>  	  This driver can also be built as a module. If so, the module
>  	  will be called max30208.
> =20
> +config MAX30210
> +	tristate "Analog Devices MAX30210 temperature sensor"
> +	depends on I2C

[Severity: Low]
Should this select REGMAP_I2C, IIO_BUFFER, and IIO_KFIFO_BUF? The driver=20
code calls devm_regmap_init_i2c() and devm_iio_kfifo_buffer_setup_ext().=20
Without these selections, could a build with CONFIG_MAX30210 enabled fail=20
at compile or link time if the user doesn't manually enable them?

> --- /dev/null
> +++ b/drivers/iio/temperature/max30210.c
> @@ -0,0 +1,689 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Analog Devices MAX30210 I2C Temperature Sensor driver
> + *
> + * Copyright 2026 Analog Devices Inc.
> + */
[ ... ]
> +#include <linux/regmap.h>
> +#include <linux/unaligned.h>
> +#include <linux/units.h>

[Severity: Low]
Should <linux/regulator/consumer.h> be included here? The probe function=20
uses devm_regulator_get_enable(), which might cause an implicit function=20
declaration error on some configurations without this header.

> +static void max30210_fifo_read(struct iio_dev *indio_dev)
> +{
> +	struct max30210_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	ret =3D regmap_bulk_read(st->regmap, MAX30210_FIFO_DATA_REG,
> +			       st->fifo_buf,
> +			       MAX30210_FIFO_BYTES_PER_SAMPLE * st->watermark);

[Severity: High]
Could this corrupt data on SMBus-only adapters? The driver uses=20
regmap_bulk_read() to read the FIFO data register but permits probing on=20
adapters that only support I2C_FUNC_SMBUS_BYTE_DATA.=20

On such adapters, regmap falls back to single-byte reads and automatically=
=20
increments the register address for each byte. Instead of repeatedly=20
reading the FIFO register, this would read sequential configuration=20
registers and push their contents as temperature samples.

> +static int max30210_write_event_config(struct iio_dev *indio_dev,
> +				       const struct iio_chan_spec *chan,
> +				       enum iio_event_type type,
> +				       enum iio_event_direction dir, bool state)
> +{
> +	struct max30210_state *st =3D iio_priv(indio_dev);
> +
> +	switch (dir) {
> +	case IIO_EV_DIR_RISING:
> +		switch (type) {
> +		case IIO_EV_TYPE_THRESH:
> +			return regmap_assign_bits(st->regmap, MAX30210_INT_EN_REG,
> +						  MAX30210_STATUS_TEMP_HI_MASK, state);

[Severity: High]
Will threshold events trigger if the IIO buffer is not enabled?=20

The autonomous conversion bit (MAX30210_TEMPCONV_AUTO_MASK) is only set in=
=20
max30210_buffer_preenable(). If a user configures and enables a threshold=20
event via sysfs without enabling the buffer, does the device remain in=20
standby and never sample the temperature?

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
> +			      MAX30210_FIFOCONF1_FLUSH_FIFO_MASK);

[Severity: Low]
Is MAX30210_FIFOCONF1_FLUSH_FIFO_MASK correct here? It is being applied to=
=20
MAX30210_FIFO_CONF_2_REG. Should this use a FIFOCONF2_ prefixed macro=20
instead to avoid confusion?

> +static int max30210_setup(struct max30210_state *st, struct device *dev)
> +{
> +	struct gpio_desc *powerdown_gpio;
> +	unsigned int val;
> +	int ret;
> +
> +	/* Optional hardware reset via powerdown GPIO */
> +	powerdown_gpio =3D devm_gpiod_get_optional(dev, "powerdown",
> +						 GPIOD_OUT_HIGH);
> +	if (IS_ERR(powerdown_gpio))
> +		return dev_err_probe(dev, PTR_ERR(powerdown_gpio),
> +				     "failed to request powerdown GPIO\n");
> +
> +	if (powerdown_gpio) {
> +		/* Deassert powerdown to power up device */
> +		gpiod_set_value(powerdown_gpio, 0);
> +	} else {

[Severity: Low]
Does this leave the hardware drawing power indefinitely on driver unbind?=20
The device is powered up by deasserting the powerdown GPIO, but there=20
doesn't seem to be a corresponding devm action or .remove callback to=20
re-assert it and put the device back into standby when the module is remove=
d.

> +static int max30210_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct iio_dev *indio_dev;
> +	struct max30210_state *st;
> +	int ret;
[ ... ]
> +	if (!client->irq)
> +		return dev_err_probe(dev, -ENXIO, "Missing interrupt.\n");

[Severity: Medium]
Does this unconditionally require an interrupt? The commit message mentions=
=20
"Optional interrupt-driven data ready signaling", but this check causes the=
=20
probe to fail if no IRQ is provided. Should it fall back gracefully to=20
direct polling mode instead?

> +	ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +					max30210_irq_handler, IRQF_ONESHOT,
> +					indio_dev->name, indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

[Severity: High]
Can this cause a use-after-free on the IIO event_interface during device=20
removal?

Because devm resources are cleaned up in LIFO order,=20
devm_iio_device_register() will unregister first (which frees the=20
event_interface), followed later by the IRQ handler shutdown.=20

If an interrupt fires between these two steps, max30210_irq_handler() could=
=20
call iio_push_event() and dereference the already freed event_interface.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789032019.gi=
t.johnerasmusmari.geronimo@analog.com?part=3D2
