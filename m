Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A27381E81
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 14:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532315; cv=none; b=e/md27X6QQ5bFKyUhqp4/jiMY3SCfspSHfFeNEO+krCOUIyBMChrUNCv3vu3EoadlKw49dZccwwYHPcwRX9i+RehXcXjyBDk8jhgK3YRkD0O2IQUp+4jmnhA282XEUnSG9tjpHjmQdy+rswPAJ73td8JW9C27Qj88eE9ItzgJUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532315; c=relaxed/simple;
	bh=xtUs4ybTObfldKj1MlQFpw+fCgwW7TVyelReCsjN/po=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yc5LyTJH0dHuXJK5Rs7raNwEHuCOMspei6sxMHjO8qQ14AlxJbHLcFcrpO7m38dr6GW8qK1vYihnxzPcVxKddSUnoEVjpu1pCG9BlRsqMYN/zu8Hrf+lIL9NI8LeR9soxriuL9nTJz2O4BcRqsGm8Cr1Azsb0IHvW/hpOD0J184=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jq+Gqgsq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jq+Gqgsq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF1A1F00A3E;
	Fri,  4 Sep 2026 14:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788532313;
	bh=nuSj8pzp85bYjCSSB7L9ksorfFYxTDgcwkEqGJcwiK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jq+GqgsqA5o8rZ1wCk/5pDVdwVQPrWb7Y+HPDlBugc1//DjWFpcGNJXIOVrrz3gWD
	 iNnIP/91rSal5SRSFSwiEr+/3CdZuYd5vHatqgxSlJHcKuFf1Myc1V7Md4QM8kqP2V
	 /EC6aq16sL87XOodlWB1yBBKS9RIog/ZAn/HNs6zLE+avyeuScyiu6+S8h45GY05HQ
	 PudIpZct2JrvVaoMmcwoBoJ4EeuE2Vu8lOVB6znVafBW1YpaK/UiZmIq3nFaBXGe/c
	 /JRmpZ8cTg5+TLXHmLX2Z4W6pOMwLgVQsU4h27FXPXPT8TfGldiE9ECmASE97g7wa2
	 UEsG04kv9yppg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/17] iio: adc: Add AD7768 and AD7768-4 core support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-ad7768-driver-v6-5-e4378f946bfb@analog.com>
References: <20260904-ad7768-driver-v6-0-e4378f946bfb@analog.com>
 <20260904-ad7768-driver-v6-5-e4378f946bfb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 14:31:53 +0000
Message-Id: <20260904143153.9AF1A1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Overlapping active DMA mappings for the same memory buffer (`st->d=
16`) across concurrent SPI transfers violates the DMA API.
- [High] Incorrect channel bit mapping for CH_STANDBY and CH_MODE_SEL on AD=
7768-4 breaks logical-to-physical translation.
- [Medium] Hardware left powered on after device removal due to cancelled a=
sync suspend.
- [Medium] Incorrect polarity for reference buffer configuration (powers do=
wn instead of enabling).
- [Medium] Swapped POS and NEG bit assignments for precharge buffers.
- [Medium] Unbalanced IIO backend channel enablement on error path in `ad77=
68_update_scan_mode`.
- [Medium] Missing PM runtime idle notification at the end of probe leaves =
the device permanently active.
--

commit cad3d6d13491f167da3c31d541a31ac850d8d3b5
Author: Janani Sunil <janani.sunil@analog.com>

iio: adc: Add AD7768 and AD7768-4 core support
   =20
Add core support for the AD7768 and AD7768-4 simultaneous sampling ADCs.
Configure supplies, clock and reset, use a custom regmap bus for the SPI
protocol, and parse the enabled channels and input buffer settings from
devicetree.

> diff --git a/drivers/iio/adc/ad7768.c b/drivers/iio/adc/ad7768.c
> new file mode 100644
> index 0000000000000..c80056a9edd8c
> --- /dev/null
> +++ b/drivers/iio/adc/ad7768.c
> @@ -0,0 +1,1000 @@
> +// SPDX-License-Identifier: GPL-2.0

[ ... ]

> +#define AD7768_REG_PRECHARGE_BUF1			0x11
> +#define AD7768_REG_PRECHARGE_BUF2			0x12
> +#define   AD7768_PREBUF_POS_EN(ch)			BIT((ch) * 2)
> +#define   AD7768_PREBUF_NEG_EN(ch)			BIT(((ch) * 2) + 1)

[Severity: Medium]
Are these bit assignments for the precharge buffers swapped? According to t=
he
AD7768 datasheet, the positive (POS) precharge buffers are assigned to odd =
bits,
and the negative (NEG) precharge buffers are assigned to even bits.

> +
> +#define AD7768_REG_REFP_BUF				0x13
> +#define AD7768_REG_REFN_BUF				0x14

[ ... ]

> +static u8 ad7768_all_standby_mask(const struct ad7768_state *st)
> +{
> +	return GENMASK(st->chip_info->num_channels - 1, 0);
> +}

[Severity: High]
Does this generate the correct physical mask for the AD7768-4? The AD7768-4
maps its 4 logical channels to physical channels 0, 1, 4, and 5. This retur=
ns
GENMASK(3, 0) which is 0x0F, writing 0 to physical bits 4, 5, 6, and 7,
leaving them fully active.

[ ... ]

> +static int ad7768_regmap_read(void *context, const void *reg_buf,
> +			      size_t reg_size, void *val_buf, size_t val_size)
> +{
> +	struct ad7768_state *st =3D spi_get_drvdata(context);
> +	struct spi_device *spi =3D context;
> +	struct spi_transfer t[] =3D {
> +		{
> +			.tx_buf =3D &st->d16,
> +			.len =3D sizeof(st->d16),
> +			.cs_change =3D 1,
> +		}, {
> +			/*
> +			 * Register responses are delayed by one CS frame. While
> +			 * receiving the response to this read, the device also
> +			 * decodes another command on SDI. Repeat the read
> +			 * command to avoid sending an unspecified dummy
> +			 * command.
> +			 */
> +			.tx_buf =3D &st->d16,
> +			.rx_buf =3D &st->d16,
> +			.len =3D sizeof(st->d16),
> +		},
> +	};

[Severity: High]
Can this violate the DMA API? Both transfers use the same memory address
(&st->d16) for their buffers. When the SPI subsystem maps all transfers for
DMA concurrently, attempting to map the same memory region twice concurrent=
ly
(DMA_TO_DEVICE and DMA_BIDIRECTIONAL) can cause cache coherency issues on
non-coherent architectures.

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
> +	if (ret)
> +		return ret;
> +
> +	for (unsigned int c =3D 0; c < st->chip_info->num_channels; c++) {
> +		if (test_bit(c, scan_mask))
> +			ret =3D iio_backend_chan_enable(st->back, c);
> +		else
> +			ret =3D iio_backend_chan_disable(st->back, c);
> +		if (ret)
> +			return ret;
> +	}

[Severity: Medium]
Will this leave the backend hardware out of sync if an error occurs? If one
operation fails, it returns the error immediately without unwinding the
previously modified channels.

> +
> +	return 0;
> +}

[ ... ]

> +static int ad7768_buffer_postdisable(struct iio_dev *indio_dev)
> +{
> +	struct ad7768_state *st =3D iio_priv(indio_dev);
> +
> +	pm_runtime_put_autosuspend(regmap_get_device(st->regmap));
> +	return 0;
> +}

[Severity: Medium]
Could this leave the hardware powered on after device removal?

If the driver is unbound while the IIO buffer is active,
devm_iio_device_register unwinds first, calling iio_device_unregister(),
which disables the buffer and triggers ad7768_buffer_postdisable().

Immediately after, devm_pm_runtime_set_active_enabled unwinds, calling
pm_runtime_disable() which cancels the pending autosuspend work. The
driver should ensure synchronous suspend if the buffer is active during
removal.

[ ... ]

> +static int ad7768_configure_precharge_buffers(struct iio_dev *indio_dev,
> +					      struct ad7768_precharge_config *precharge_cfg)
> +{
> +	struct ad7768_state *st =3D iio_priv(indio_dev);
> +	u8 prebuf1_val, prebuf2_val;
> +	u16 prebuf_mask =3D 0;
> +	u8 refbufp_val =3D 0;
> +	u8 refbufn_val =3D 0;
> +	int ret;
> +
> +	for (unsigned int ch =3D 0; ch < indio_dev->num_channels; ch++) {
> +		u8 channel =3D indio_dev->channels[ch].channel;
> +
> +		if (precharge_cfg[channel].prebufp_en)
> +			prebuf_mask |=3D AD7768_PREBUF_POS_EN(channel);
> +
> +		if (precharge_cfg[channel].prebufn_en)
> +			prebuf_mask |=3D AD7768_PREBUF_NEG_EN(channel);
> +
> +		if (precharge_cfg[channel].refbufp)
> +			refbufp_val |=3D ad7768_channel_mask(st, channel);
> +
> +		if (precharge_cfg[channel].refbufn)
> +			refbufn_val |=3D ad7768_channel_mask(st, channel);
> +	}

[Severity: Medium]
Does this apply the incorrect polarity for the reference buffer configurati=
on?
When adi,refbuf-pos-enable or adi,refbuf-neg-enable are provided in the dev=
ice
tree, the driver sets the corresponding bit to 1. According to the AD7768
datasheet, setting a bit to 1 in the REFP_BUF and REFN_BUF registers powers=
 down
the buffer.

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
Does this use logical indices instead of physical bits for the AD7768-4? The
AD7768-4 uses physical channels 0, 1, 4, and 5. Using BIT(channel) will upd=
ate
physical bits 0-3 instead of the mapped hardware bits.

> +		if (ret)
> +			return ret;
> +

[ ... ]

> +	pm_runtime_set_autosuspend_delay(dev, 2000);
> +	pm_runtime_use_autosuspend(dev);
> +	ret =3D devm_pm_runtime_set_active_enabled(dev);
> +	if (ret)
> +		return ret;
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

[Severity: Medium]
Does this leave the device permanently active? This configures autosuspend =
and
enables runtime PM, which transitions the device to RPM_ACTIVE with a usage
count of 0, but fails to call pm_request_idle(dev). As a result, the autosu=
spend
timer is never triggered, leaving the device fully powered indefinitely unt=
il
a user explicitly accesses it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-ad7768-dri=
ver-v6-0-e4378f946bfb@analog.com?part=3D5
