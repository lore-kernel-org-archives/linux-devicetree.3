Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C740A244694
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792027981; cv=none; b=qvV1GPt7hoSvM9pAWvpAhuB81e8owSf17olJBttxES0ZpbwN2ULW8z2x/sRx7u5NNsfacSeB/SUQ5TOsXPnVHuSHP9DqXpwcYfPG5F/TiebTyfZS29x5j12065bLcALS92sk55PHi1c1O+5at51GxFe5ZN6mA1/s050a670Kfmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792027981; c=relaxed/simple;
	bh=ZnrZuhMduxgDty14h1AesxbVdf5Yc9RUxIFED36SvoQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jSwxvJlIJWa395iacwjp5s7jCAUKLeCGMy3wLfHQbiCjTei2oiL24K3KMjIGb40urF/rGkv/2OziapfZuqXpP+a1Cs9hurhxsmxazW8ayz5UvZikKnoJ/MKYkH3xLVAgDwY7AztCKQhp2fktRAtRXGH5XycaGW+vJ8bgwse2ECs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qe+sK44A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qe+sK44A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047D81F000C4;
	Thu, 15 Oct 2026 01:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792027980;
	bh=f4jICgYgzzH6ZCG0H4+m3vE0Btmb0qg6WmkMCtUckeY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qe+sK44AxMHBs+eNX69nbgkIflJN4k1yQK7Gfr2yqlUH1xExH5yByRQ104XfLpuiP
	 OQdkeiw0GTBLKDIhGL9pAXhcKL1EEX0QBPaR6illO7AguC0H7lLzmeJuni8KZwoIzU
	 k0VWSQcnja1EBZDbF395dRR5T4ELhRm6GYQGA6DngyNdxCZnyoYSOAZ6ry5LvoWj7r
	 XBS9WYS3cYV3DGIgWrKbVXV/44cyg11Z5cx4brnB7ABqyYGN24H9MOq1IrOkANXT6e
	 LCZaNWDudgBwog7PA/WNFMseMY7iL+OOpxO4IgrSQiTHLeCJR7rneFKakj1wvRrs9j
	 tcLMyBvZTtIUQ==
Message-ID: <sashiko-outbox-172097@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] iio: temperature: add support for Analog Devices
 MAX30210
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015012159.44-3-johnerasmusmari.geronimo@analog.com>
References: <20261015012159.44-1-johnerasmusmari.geronimo@analog.com>
 <20261015012159.44-3-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 01:32:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] iio: max30210: missing power-up delay before first I2C transacti=
on
- [Medium] iio: max30210: autoconv_users reference count leak on duplicate =
sysfs writes
- [Medium] iio: max30210: hardware interrupt left enabled on buffer preenab=
le/postdisable failure
- [Low] iio: max30210: unconditional IRQ_HANDLED return breaks shared inter=
rupt lines
--

commit 296957e73a12ca35c9045876e136385ab80ca00e
Author: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

iio: temperature: add support for Analog Devices MAX30210

This commit adds support for the Analog Devices MAX30210 I2C temperature
sensor. It introduces a driver using regmap for register access, supporting
direct mode, configurable sampling, threshold events, and FIFO buffer
operation.

> diff --git a/drivers/iio/temperature/max30210.c b/drivers/iio/temperature=
/max30210.c
> new file mode 100644
> index 0000000000000..04123d51c6da4
> --- /dev/null
> +++ b/drivers/iio/temperature/max30210.c

[ ... ]

> +static irqreturn_t max30210_irq_handler(int irq, void *dev_id)
> +{
> +	struct iio_dev *indio_dev =3D dev_id;
> +	struct max30210_state *st =3D iio_priv(indio_dev);
> +	unsigned int status;
> +	int ret;

[ ... ]

> +	if (status & MAX30210_STATUS_TEMP_LO_MASK)
> +		iio_push_event(indio_dev,
> +			       IIO_UNMOD_EVENT_CODE(IIO_TEMP, 0,
> +						    IIO_EV_TYPE_THRESH,
> +						    IIO_EV_DIR_FALLING),
> +			       iio_get_time_ns(indio_dev));
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Low]
Does this unconditional return defeat the kernel's spurious interrupt
detection? If a shared interrupt line gets stuck or stormy from another
device, the kernel might not detect it because this driver claims to have
handled every interrupt even when no relevant status bits were set. Should
this return IRQ_NONE if no active interrupts were serviced?

[ ... ]

> +static int max30210_write_event_config(struct iio_dev *indio_dev,
> +				       const struct iio_chan_spec *chan,
> +				       enum iio_event_type type,
> +				       enum iio_event_direction dir, bool state)
> +{
> +	struct max30210_state *st =3D iio_priv(indio_dev);
> +	unsigned int mask;
> +	int ret;

[ ... ]

> +	/*
> +	 * Threshold events need the device sampling autonomously, independent
> +	 * of whether the FIFO buffer is also enabled.
> +	 */
> +	if (state) {
> +		ret =3D max30210_autoconv_get(st);
> +		if (ret)
> +			return ret;
> +	}

[Severity: Medium]
Could this leak the st->autoconv_users reference count? If userspace
repeatedly writes '1' to an already-enabled threshold event attribute
in sysfs, or '0' to an already-disabled event, the IIO core's
iio_ev_state_store() passes the boolean state here without caching or
deduplicating.

The driver then blindly increments or decrements st->autoconv_users via
max30210_autoconv_get() or max30210_autoconv_put(). This could permanently
inflate the counter, leaving the device stuck in autonomous conversion mode
and causing direct mode reads to fail with -EBUSY.

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
> +		return ret;
> +
> +	return max30210_autoconv_get(st);
> +}

[Severity: Medium]
If the I2C transaction for flushing the FIFO or starting the autonomous
conversions fails, does this leave the hardware interrupt enabled?

The MAX30210_STATUS_A_FULL_MASK interrupt is enabled earlier in this
function, but early error returns do not revert it. The IIO core aborts the
setup and will not call max30210_buffer_postdisable(), which could lead to
an unhandled interrupt storm.

> +
> +static int max30210_buffer_postdisable(struct iio_dev *indio_dev)
> +{
> +	struct max30210_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	ret =3D max30210_autoconv_put(st);
> +	if (ret)
> +		return ret;
> +
> +	/* Flush FIFO */
> +	ret =3D regmap_set_bits(st->regmap, MAX30210_FIFO_CONF_2_REG,
> +			      MAX30210_FIFOCONF2_FLUSH_FIFO);
> +	if (ret)
> +		return ret;
> +
> +	/* Disable FIFO-full interrupt */
> +	return regmap_clear_bits(st->regmap, MAX30210_INT_EN_REG,
> +				 MAX30210_STATUS_A_FULL_MASK);
> +}

[Severity: Medium]
Similarly, if max30210_autoconv_put() or the FIFO flush fails here, this
aborts early and skips disabling the FIFO-full interrupt. Could this leave
the hardware asserting the interrupt line while the software considers the
buffer disabled?

[ ... ]

> +static int max30210_setup(struct max30210_state *st, struct device *dev)
> +{
> +	struct gpio_desc *powerdown_gpio;
> +	unsigned int val;
> +	int ret;
> +
> +	powerdown_gpio =3D devm_gpiod_get_optional(dev, "powerdown",
> +						 GPIOD_OUT_HIGH);
> +	if (IS_ERR(powerdown_gpio))
> +		return dev_err_probe(dev, PTR_ERR(powerdown_gpio),
> +				     "failed to request powerdown GPIO\n");
> +
> +	if (powerdown_gpio) {
> +		/* Deassert powerdown to power up device */
> +		gpiod_set_value(powerdown_gpio, 0);
> +
> +		ret =3D devm_add_action_or_reset(dev, max30210_powerdown, powerdown_gp=
io);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret =3D regmap_set_bits(st->regmap, MAX30210_SYS_CONF_REG,
> +				      MAX30210_SYSCONF_RESET);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/*
> +	 * Datasheet Figure 6:
> +	 * tPU max =3D 700 =C2=B5s after power-up or reset before device is rea=
dy.
> +	 */
> +	fsleep(700);

[Severity: Medium]
Is a delay required before issuing this initial software reset over I2C?

During probe, devm_regulator_get_enable() enables the vdd regulator.
Immediately after, max30210_setup() attempts to issue a software reset via
regmap_set_bits(). The datasheet states tPU max =3D 700 us after power-up
or reset before the device is ready.

The driver correctly implements the delay after the reset, but appears to
miss the required 700 us sleep before the reset following a cold power-up
via the regulator. This might cause the initial I2C transaction to fail
with a NACK.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015012159.44-1=
-johnerasmusmari.geronimo@analog.com?part=3D2
