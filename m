Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9807647DF87
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268930; cv=none; b=pzaDd4zyDGRRdfJlLPQ/0ApFAcdpRePtOxvUCQM6EZgRHXgu4npO/PMpE2IEZ0iZnuvheMCvK/TlZ0hR+I7jp/ceOEfAhzBln/LhYpBIk5DXtWbFyaVpmu//zi4PuDLds4IZFT/H0vcy4MCOyyY2yrXQnnblRpyC5Nz4Su79590=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268930; c=relaxed/simple;
	bh=1aPR5Shjavfd//HoPrCBhzX8tYeCne6p5HM+hDtIy84=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SnzLNI3cB3GxAhJcJ+JTQ3IN0K3D/sgM9XsPFNNWEa/JHVUjLfdfEZfbTmdss/o6S+8YSNTPuJ88oHv2J8ZV6Fjvxv9XyqbjRNQlgmwLeYHPPm4tTXm0GmY4EmQv/ehhk9pIMHJww5wEIrd2YPTO3KNaFge1/Rr05ejlJfGBu4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RtzrV48y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RtzrV48y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE64C1F000E9;
	Tue,  1 Sep 2026 13:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788268929;
	bh=Vrxm3GuU76cMw1J9oINQcf3KDQqi0QQTygmxk05YRLY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RtzrV48yuE0LbDL0uC86Fb5k95ChGFCUYO/VDH9e1xl2jg3UGtt0dzbBQ2BV5qHjT
	 5sKJ6fz5rLupEAqSvZGlTp9KVt4ON7kt+wIWlYL+qtU27GZIAVzBe+W87BKjJc/oOX
	 LDDXIOjIpll+1QJ1hgTuSSdq5l4llTHR8cd5IMuqHzmHexwpFnWBeiKDTB9uqIOl7r
	 ZXgCFRNkoFDjyJiUMSFbHSoynH6OJAMkb1yH468yBrT88s2nFAtEcGlx0io/UAtD5C
	 71CjX/sQ6od/Hm3ceTdO1dkzy9ydwecQ+79R4jn4aVi8tfzhgrmIdssUODAAFLbZ/N
	 YsbiHvqqGH3AA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/4] iio: light: veml6031x00: add support for events
 and trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260901-veml6031x00-v8-4-532cb4f2168a@gmail.com>
References: <20260901-veml6031x00-v8-0-532cb4f2168a@gmail.com>
 <20260901-veml6031x00-v8-4-532cb4f2168a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 13:22:08 +0000
Message-Id: <20260901132208.EE64C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Use-After-Free of iio->pollfunc in IRQ handler during device unbin=
d or probe failure.
- [Medium] Unintended I2C read of configuration register when pushing times=
tamp to buffer
- [Medium] The interrupt_users counter can permanently underflow during err=
or recovery, breaking hardware interrupt control.
--

commit c87f3d48e1ee614fc184995b816c8f8679a6b774
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: veml6031x00: add support for events and trigger

The device provides a shared interrupt line to notify events and data ready.
Add support for configurations with and without an interrupt line, providing
events and trigger support when an interrupt line is available.

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index 3d5a27a0baaed..7bd7975eb1a76 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c
[ ... ]
> +static irqreturn_t veml6031x00_irq(int irq, void *private)
> +{
[ ... ]
> +	if (trigger_poll) {
> +		iio->pollfunc->timestamp =3D timestamp;
> +		iio_trigger_poll_nested(data->trig);
> +	}
> +
> +	pm_runtime_put(dev);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
Could this lead to a use-after-free of the pollfunc during device unbind or
if probe fails?

Because the IRQ is requested via devres inside veml6031x00_init_iiodev()
before the triggered buffer is set up in veml6031x00_probe(), devres will
tear down the buffer (and free iio->pollfunc) before freeing the IRQ. If an
interrupt fires during this teardown window, the IRQ thread could be
preempted and then dereference the freed iio->pollfunc here.

Would it be safer to ensure devm_iio_triggered_buffer_setup() is called
before the IRQ is requested?

[ ... ]
> +static int __veml6031x00_set_trigger_state(struct veml6031x00_data *data=
, bool state)
> +	__must_hold(&data->irq_lock)
> +{
[ ... ]
> +	data->trig_en =3D state;
> +
> +	return 0;
> +
> +clear_interrupt:
> +	veml6031x00_set_interrupt(data, !state);
> +
> +	return ret;
> +}

[Severity: Medium]
Can data->interrupt_users permanently underflow here during error recovery?

If an I2C error occurs in __veml6031x00_set_trigger_state() while disabling
the trigger, this error recovery path calls veml6031x00_set_interrupt() to
revert the counter, but fails to update the software state (data->trig_en).

If a subsequent successful disable happens later, the counter will be
decremented again, potentially underflowing to UINT_MAX and silently skippi=
ng
all future hardware writes.

[ ... ]
> +static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *iio =3D pf->indio_dev;
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	struct regmap *map =3D data->regmap;
> +	IIO_DECLARE_BUFFER_WITH_TS(__le16, scan, 2) =3D { };
> +	unsigned int i;
> +	int ch, ret;
> +
> +	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
> +	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
> +		ret =3D regmap_bulk_read(map, VEML6031X00_REG_ALS_L,
> +				       scan, 2 * sizeof(*scan));
> +		if (ret)
> +			goto done;
> +	} else {
> +		i =3D 0;
> +		iio_for_each_active_channel(iio, ch) {
> +			ret =3D regmap_bulk_read(map, iio->channels[ch].address,
> +					       &scan[i++], sizeof(*scan));
> +			if (ret)
> +				goto done;
> +		}
> +	}

[Severity: Medium]
Does this loop unintentionally perform an I2C read of the configuration
register when pushing the timestamp to the buffer?

The iio_for_each_active_channel() iteration includes the IIO_TIMESTAMP
channel. Since its address is 0, this causes an unintended I2C read of the
configuration register (0x00) on every trigger event when the IR channel is
disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-veml6031x0=
0-v8-0-532cb4f2168a@gmail.com?part=3D4
