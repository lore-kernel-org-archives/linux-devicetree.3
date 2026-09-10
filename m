Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1737256853C
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063009; cv=none; b=czwQjWw+g3+o54f10mZna/JcrpDWqV8b3yW7eWx7yOnH7/vl16ia8WfWNjXPmd8p/e9xQfekIH+MJi9xigeI23rmZ5uh8dV7UbMI5suFmkJ+i2unqV9L+OT9H8jQ7KbSN8W40FPxJI/kL5zBdBHKzXAIQbNfrn2R/glIwCMBUzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063009; c=relaxed/simple;
	bh=TCIV94+iXWVjIY9v894kAiNBD52+4C8YHLAH3ze85TQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tIhevkwP3rTYMDcMjo+HhFNXEhb3WT1VOg3MlZ1IZUlGr1ouwyjAroxXlSiupoVG1rsRH06ULVlyy6N00qOzPkXn39nlvCRhYmqpJCSHbaExvZtkwZ6MYULec/n5E90hT30bEV5pBZ4UF/X4wlsdy5tVt9m0zjputFe4BZjHXU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1kN0fb8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1kN0fb8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8F21F000FF;
	Thu, 10 Sep 2026 17:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789063008;
	bh=HP53Vba8Rayg2LEK5CjELwEALBAQp+nESfoZvs8rmnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S1kN0fb8/B8KFLme1/ATAE5QG2PKPVXK8EOELNvvMC8bXUMKa4xVM80KmNb1fxJIS
	 olPoIRLX8QkQqfSMREJ4bfBkhNx3Koc41utN6u9c+V5dvCxUIh4GJc2G2PIh8PzLYO
	 IH/INwBdG9PA4mIybG2okBXv+2KtB19RMvieE95miZXSp95uLw68bMdgQ3BnRT8DUs
	 HTCcBIsMcnP79AJI4CCOPo4HJHs10W5fePct8wf/wXlN7p9N/kC7cgZ2IwY/UPTGCP
	 8HXE8L8ADKlvgoyv+yEQgM1JqUQ2BdA208oJDGZ3yEmVeIqy9wmou7s0L7vTXOzFSu
	 XySZrxYTQl9Bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/17] iio: adc: Add AD7768 and AD7768-4 core support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-ad7768-driver-v7-5-7f70b07627e1@analog.com>
References: <20260910-ad7768-driver-v7-0-7f70b07627e1@analog.com>
 <20260910-ad7768-driver-v7-5-7f70b07627e1@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:56:47 +0000
Message-Id: <20260910175647.BA8F21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The AD7768_REG_CH_STANDBY register is incorrectly programmed using=
 logical channel indices instead of physical channel bitmasks for the AD776=
8-4 variant.
--

commit 09736b063e77e92595bbf9636bddc775b728127b
Author: Janani Sunil <janani.sunil@analog.com>

iio: adc: Add AD7768 and AD7768-4 core support

This commit adds core support for the AD7768 and AD7768-4 simultaneous
sampling ADCs. It provides SPI protocol configuration, channels and input
buffer parsing, IIO backend connection, and runtime PM support.

> diff --git a/drivers/iio/adc/ad7768.c b/drivers/iio/adc/ad7768.c
> new file mode 100644
> index 0000000000000..3cb58c2554a31
> --- /dev/null
> +++ b/drivers/iio/adc/ad7768.c
[ ... ]
> +static u8 ad7768_all_standby_mask(const struct ad7768_state *st)
> +{
> +	return GENMASK(st->chip_info->num_channels - 1, 0);
> +}

[Severity: High]
Does this logic in ad7768_all_standby_mask() in drivers/iio/adc/ad7768.c
compute the correct standby mask for the AD7768-4? The GENMASK macro returns
a logical mask (0x0F for 4 channels), but shouldn't it return the physical
mask (0x33, mapping to physical channels 0, 1, 4, 5)? Returning the logical
mask here might cause issues with standby register updates for AD7768-4
logical channels 2 and 3.

[ ... ]
> +static int ad7768_update_scan_mode(struct iio_dev *indio_dev,
> +				   const unsigned long *scan_mask)
> +{
> +	struct ad7768_state *st =3D iio_priv(indio_dev);
> +	unsigned long channel_mask;
> +	unsigned long standby_mask;
> +	int ret;
> +
> +	channel_mask =3D ad7768_all_standby_mask(st);
> +	standby_mask =3D channel_mask & ~*scan_mask;
> +
> +	/*
> +	 * Crystal excitation requires channel 4 on AD7768 or channel 2 on
> +	 * AD7768-4 to remain active.
> +	 */
> +	if (st->clock_source =3D=3D AD7768_CLOCK_SOURCE_XTAL)
> +		__clear_bit(st->chip_info->num_channels / 2, &standby_mask);
> +
> +	ret =3D regmap_update_bits(st->regmap, AD7768_REG_CH_STANDBY,
> +				 channel_mask, standby_mask);

[Severity: High]
Could this update in ad7768_update_scan_mode() be writing to the wrong
hardware bits? Because it uses the logical channel mask, it appears to write
to reserved bits for the AD7768-4.=20

Additionally, clearing st->chip_info->num_channels / 2 clears logical bit 2
for the AD7768-4, but shouldn't it clear physical bit 4 to keep the XTAL cl=
ock
channel active? Failing to keep the correct physical channel active could s=
top
the master clock and break the device when using the XTAL clock source.

[ ... ]
> +static int ad7768_parse_config(struct iio_dev *indio_dev,
> +			       struct device *dev)
> +{
[ ... ]
> +	device_for_each_named_child_node_scoped(dev, child, "channel") {
> +		u32 channel;
> +
> +		ret =3D fwnode_property_read_u32(child, "reg", &channel);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to parse reg of %pfwP\n",
> +					     child);
> +
> +		if (channel >=3D st->chip_info->num_channels)
> +			return dev_err_probe(dev, -ECHRNG,
> +					     "Invalid channel %u in firmware\n",
> +					     channel);
> +
> +		ret =3D regmap_clear_bits(st->regmap, AD7768_REG_CH_STANDBY,
> +					BIT(channel));

[Severity: High]
Does this initialization in ad7768_parse_config() use the raw logical chann=
el
index instead of the physical mapping? By using BIT(channel) here, it looks
like it writes to reserved bits instead of the actual physical channels for
AD7768-4 channels 2 and 3, which could leave those channels permanently in
standby and lead to data loss.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-ad7768-dri=
ver-v7-0-7f70b07627e1@analog.com?part=3D5
