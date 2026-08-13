Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609801F3D56
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 03:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786590857; cv=none; b=sQnpEasNkN3vru1OjkxT3QlAkhPG5k2/4n1fL2BVoVbkcdjdJciiqNTnLkUgwyB5VDj5jIskFM4j+x/jdLXu8rkAND+WJQqB0if0eZ9d3UZHDNnUgv3CdVbfkxYyhE2Ak5MnRXOxInX+XRR2oUpfiOpXvvjpjl7tbdBsPgqtueA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786590857; c=relaxed/simple;
	bh=weK+SQdH4SPnjRUM5peXyi39bNNNBrSZr0/vMv75Bv8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k5ftsw2ydryfFV35Lco6KbDtJdx38kBztfUc8G8EEFSBZ15jaiT7udmhCSygNUlR/kOnaf7denCii6rMrRS4CFy8u57+EGS7aqzqoPLY/J+UtoeHQ8JZVmLR0Lve7bRuTV5AS8z46qkUTGKyb2TOS525cPCQI3P4SxgQa0fkt90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bstfitCc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bstfitCc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7EE1F000E9;
	Thu, 13 Aug 2026 03:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786590855;
	bh=4i9sv+3WPDQt+GfKliaW1OMnYs4bXVsdMu8mNe3kDu8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bstfitCc/vOHdg/ebAJN+dIX3ZF8tHESYuNezqmI8R/pY3GtYc14vqalf4BP5KuJP
	 eGMKo+aWX6EWLGnly992spPwTBNq4CGBkljLicYaPPpjJZPVGTr8QZ6u9cWDR159v2
	 ZJ7pi/0AvQ7FnD+cJq1Rcu1Ze6OL0WufRKmKiToTYVGP6yzFduF4y7jYCZqKr0dSTP
	 yskASwe+BsjSInowIyScFfRdfs0BHYDwgLugx1EV8qniA6al0o6I1vcn3eahfhbfGO
	 SwgqZfFjCmd13+4A8ecQRYrLnwsTsT7E/Xc9LZUUIl1VU4sxLWdJCO37M2b8wPpeDJ
	 t7Wp9oa7Vb2PQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] iio: adc: ti-ads112c04: Add support for TI
 ADS112C04
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260813-ti-ads112c04-driver-v5-2-79dff9e249cd@gmail.com>
References: <20260813-ti-ads112c04-driver-v5-0-79dff9e249cd@gmail.com>
 <20260813-ti-ads112c04-driver-v5-2-79dff9e249cd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 03:14:15 +0000
Message-Id: <20260813031415.AB7EE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Interrupt storm on level-triggered lines and probe failure on nest=
ed IRQs due to hardirq request.
- [High] Time-of-Check to Time-of-Use (TOCTOU) heap buffer overflow when pa=
rsing device tree channels.
- [Medium] Hardware state desynchronization causing silent data corruption =
after system suspend.
--

--- Patch [2]: [PATCH v5 2/2] iio: adc: ti-ads112c04: Add support for TI AD=
S112C04 ---
commit 60ab1f79461d9cde81c399c16a9e8fc0068a1dee
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

iio: adc: ti-ads112c04: Add support for TI ADS112C04

Add IIO driver support for the Texas Instruments ADS112C04 (16-bit)
delta-sigma ADCs.

> diff --git a/drivers/iio/adc/ti-ads112c04.c b/drivers/iio/adc/ti-ads112c0=
4.c
> index 0000000000000..c2995e94c4f8d
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads112c04.c
> @@ -166,15 +166,15 @@ static int ads112c04_get_adc_result(struct iio_dev =
*indio_dev,
> +	unsigned int idx =3D chan - indio_dev->channels;
> +	u8 new_config0, new_config1;
> +	int ret;
> +
> +	new_config0 =3D st->config0;
> +	FIELD_MODIFY(ADS112C04_CONF0_MUX, &new_config0, chan->address);
> +
> +	if (st->config0 !=3D new_config0) {
> +		ret =3D ads112c04_write_reg(st->client, ADS112C04_REG_CONFIG0,
> +					  new_config0);
> +		if (ret < 0)
> +			return ret;
> +
> +		st->config0 =3D new_config0;
> +	}

[Severity: Medium]
Could this caching logic lead to silent data corruption after a system
suspend?

The driver skips writing the configuration if it matches the cached
value. Since there are no PM suspend/resume hooks, if the system
enters suspend and power to the ADC is cut, the hardware resets to its
Power-On Reset (POR) state.

Upon resume, if a conversion is requested that matches the cached
configuration, the driver will skip the I2C write. The hardware will
remain in its POR state and return incorrect measurements.

[ ... ]

> @@ -203,9 +203,9 @@ static irqreturn_t ads112c04_irq_handler(int irq, voi=
d *private)
> +static irqreturn_t ads112c04_irq_handler(int irq, void *private)
> +{
> +	struct iio_dev *indio_dev =3D private;
> +	struct ads112c04_state *st =3D iio_priv(indio_dev);
> +
> +	complete(&st->completion);
> +
> +	return IRQ_HANDLED;
> +}

[ ... ]

> @@ -223,31 +223,31 @@ static int ads112c04_parse_channels(struct iio_dev =
*indio_dev,
> +static int ads112c04_parse_channels(struct iio_dev *indio_dev,
> +				    bool *need_avdd_ref, bool *need_ext_ref)
> +{
> +	struct device *dev =3D indio_dev->dev.parent;
> +	struct ads112c04_state *st =3D iio_priv(indio_dev);
> +	struct iio_chan_spec *channels;
> +	u32 num_channels, pair[2], channel;
> +	unsigned int i;
> +	int ret;
> +
> +	num_channels =3D device_get_named_child_node_count(dev, "channel");
> +	if (!num_channels)
> +		return dev_err_probe(dev, -EINVAL, "no channel subnodes found\n");
> +
> +	if (num_channels > ADS112C04_MAX_CHANNELS)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "num of channel nodes exceeds %d\n",
> +				     ADS112C04_MAX_CHANNELS);
> +
> +	channels =3D devm_kcalloc(dev, num_channels, sizeof(*channels), GFP_KER=
NEL);
> +	if (!channels)
> +		return -ENOMEM;
> +
> +	st->vref_source =3D devm_kcalloc(dev, num_channels,
> +				       sizeof(*st->vref_source), GFP_KERNEL);
> +	if (!st->vref_source)
> +		return -ENOMEM;
> +
> +	i =3D 0;
> +	device_for_each_named_child_node_scoped(dev, child, "channel") {
> +		struct iio_chan_spec *spec =3D &channels[i];

[Severity: High]
Can this cause an out-of-bounds heap write?

The driver counts the number of child nodes to allocate the arrays, and
then iterates over the child nodes to populate them in two separate
traversals.

If a device tree overlay is applied concurrently between the count and
the iteration, the number of child nodes can increase, causing the loop
index 'i' to exceed num_channels.

[ ... ]

> @@ -493,5 +493,5 @@ static int ads112c04_probe(struct i2c_client *client)
> +	if (client->irq > 0) {
> +		ret =3D devm_request_irq(dev, client->irq, ads112c04_irq_handler, 0,
> +				       indio_dev->name, indio_dev);

[Severity: High]
Will this cause an interrupt storm if the DRDY interrupt is configured
as level-triggered?

Since this is requested as a hard IRQ via devm_request_irq(), the
handler completes the completion and returns IRQ_HANDLED without
clearing the hardware interrupt. The line will remain asserted.

Also, if the ADC is connected to a slow bus (like an I2C GPIO
expander) which provides a nested threaded IRQ, will this fail with
-EINVAL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-ti-ads112c=
04-driver-v5-0-79dff9e249cd@gmail.com?part=3D2
