Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5987D29D26E
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 20:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786567625; cv=none; b=OmAIbp4u7fI4xlraXKUCIs6PfVthYouW3ZJF6E0x1rl4D+j6MLbDqAny2VLV0vy/MPw3jR0xg2e3bLNJXCgMB7NkTtWd3zdFvREbn+XrRpX1cYuIbFML1IKxGbgfbcz7qUirjIMW86/l34TFIyHdq4540IZUJblv/N1vmDp3Zik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786567625; c=relaxed/simple;
	bh=Qo5zNbjLgZsBegWC2KU5BP3r8s2GhTIeqsg8CHO1uRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gFgKv0sb+SvMnDMh+kUrc1trZEtmORFjDqdyh3/ZXWiwatpGqDlM5J++n+CFYoOxXch7Y7+8ISRt531EFWrK5sxASfh7dRUXtsNu3LVau3dW00iZZgd5QCuj0bDonbg4EoGnj6+EQu+TYyIYIS3WqUfP4P3rrYgkjUaB7RP1Ej0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcwbnRZW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcwbnRZW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975571F000E9;
	Wed, 12 Aug 2026 20:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786567623;
	bh=qqtKVQyxuUwb8Oexaj4tgdVrCajNy1NxA8bhya5F/Kk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hcwbnRZWLs6ceTBuk8vnA7lYqaGJ8NAXbrZZWGwaS2EtqsA67PMtYVaXlwX4abfNE
	 lJxy8DlXwsKIWpoKY7fJJvIwTCvLBf23W7yJwdwPZwBhYoJr4/zLT8cIV4pBr4Lism
	 DmUxRCujPsYk7xGYpkAPcZSjG6EkLeuKQVs9VbxtPQMiNtKaB8qlzX0efLL9Vm5VWi
	 Gy42oBWNeSS/XLH+kzXiiwFDCRYGvMXFoWdvW6JzDH+Lpq3Yk0ARME22St81nmj8F4
	 1CsfuKkLDNcnIy7XIG6l/L/G1GXcIuMNbBj2DOfviZDwesoG2fciI+PS2UZGkq7F4+
	 Fepg+pO0BJ+Dw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] iio: light: veml6031x00: add support for events
 and trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812-veml6031x00-v6-4-7eef6e4ce290@gmail.com>
References: <20260812-veml6031x00-v6-0-7eef6e4ce290@gmail.com>
 <20260812-veml6031x00-v6-4-7eef6e4ce290@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 20:47:03 +0000
Message-Id: <20260812204703.975571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Asynchronous `pm_runtime_put_autosuspend()` is used in a devres =
cleanup action immediately before `pm_runtime_disable()`, violating PM subs=
ystem guidelines.
- [Medium] Module and trigger device reference leak in the probe error path=
 due to `iio_trigger_get()`.
- [Medium] Unintended I2C read of the configuration register during trigger=
 handler due to iterating over the soft timestamp channel.
--

--- Patch [4]: [PATCH v6 4/4] iio: light: veml6031x00: add support for even=
ts and trigger ---
commit 2fab19b731ba4590b28fdcf71e13c66950cf30a9
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: veml6031x00: add support for events and trigger

This commit adds support for events and data-ready triggers using a shared
interrupt line for the VEML6031X00 light sensor.

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index 43a701f62aeaa..6dc7ea7e8a4fa 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c

[ ... ]

> +static void veml6031x00_disable_event_action(void *arg)
> +{
> +	struct veml6031x00_data *data =3D arg;
> +	struct device *dev =3D regmap_get_device(data->regmap);
> +	int ret;
> +
> +	guard(mutex)(&data->irq_lock);
> +
> +	if (!data->ev_en)
> +		return;
> +
> +	ret =3D veml6031x00_set_interrupt(data, false);
> +	if (ret)
> +		dev_err(dev, "Failed to disable events: %d\n", ret);
> +
> +	data->ev_en =3D false;
> +	pm_runtime_put_autosuspend(dev);

[Severity: Medium]
Will this asynchronous PM put be cancelled during device removal?

Since this function is registered as a devres action via
devm_add_action_or_reset(), it will execute right before
pm_runtime_disable() on the unbind path.

The PM subsystem guidelines indicate that pm_runtime_put_sync() should be
used when pm_runtime_disable() or device removal follows immediately, as
pending async idle/suspend work can be cancelled.

> +}

[ ... ]

> +static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *iio =3D pf->indio_dev;
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	IIO_DECLARE_BUFFER_WITH_TS(__le16, scan, 2) =3D { };
> +	unsigned int i =3D 0;
> +	int ch, ret;
> +
> +	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
> +	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
> +		ret =3D regmap_bulk_read(data->regmap,
> +				       VEML6031X00_REG_ALS_L,
> +				       scan,
> +				       2 * sizeof(*scan));
> +		if (ret)
> +			goto done;
> +	} else {
> +		iio_for_each_active_channel(iio, ch) {
> +			ret =3D regmap_bulk_read(data->regmap,
> +					       iio->channels[ch].address,
> +					       &scan[i++],

[Severity: Medium]
Does this loop perform an unintended I2C read when the soft timestamp
channel is active?

Since IIO_CHAN_SOFT_TIMESTAMP sets the channel address to 0, if the
timestamp channel is in the active scan mask, this loop will call
regmap_bulk_read() with address 0 (VEML6031X00_REG_CONF0).

Should the loop explicitly skip the timestamp channel, or check if the
channel has a valid I2C register address?

> +					       sizeof(*scan));
> +			if (ret)
> +				goto done;
> +		}
> +	}
> +
> +	iio_push_to_buffers_with_ts(iio, scan, sizeof(scan), pf->timestamp);
> +
> +done:
> +	iio_trigger_notify_done(iio->trig);
> +
> +	return IRQ_HANDLED;
> +}

[ ... ]

> +static int veml6031x00_setup_irq(struct i2c_client *i2c, struct iio_dev =
*iio)
> +{
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	struct device *dev =3D regmap_get_device(data->regmap);
> +	int ret;
> +
> +	data->trig =3D devm_iio_trigger_alloc(dev, "%s-drdy%d",
> +					    iio->name, iio_device_id(iio));
> +	if (!data->trig)
> +		return -ENOMEM;
> +
> +	data->trig->ops =3D &veml6031x00_trigger_ops;
> +	iio_trigger_set_drvdata(data->trig, iio);
> +
> +	ret =3D devm_iio_trigger_register(dev, data->trig);
> +	if (ret)
> +		return ret;
> +
> +	iio->trig =3D iio_trigger_get(data->trig);
> +
> +	return devm_request_threaded_irq(dev, i2c->irq,
> +					NULL, veml6031x00_irq,

[Severity: Medium]
Is there a reference leak here if devm_request_threaded_irq() fails?

If the IRQ request fails, the probe will abort. Since
devm_iio_triggered_buffer_setup() has not been called yet, the
INDIO_BUFFER_TRIGGERED flag won't be set in iio->modes.

During cleanup, iio_dev_release() skips
iio_device_unregister_trigger_consumer() if that flag is missing,
permanently leaking the trigger device and module reference acquired by
iio_trigger_get().

> +					IRQF_ONESHOT, iio->name, iio);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-veml6031x0=
0-v6-0-7eef6e4ce290@gmail.com?part=3D4
