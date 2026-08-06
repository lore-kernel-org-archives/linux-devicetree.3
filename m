Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17E3426D2B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007374; cv=none; b=jSFWL8DdicNpYMDQhP4DcX3pOENO1g+9vGIDoaGIlgjwbEDVqBJ2VULBcNOSyt+tWt9JM9tLTZfTQ4Xkkxgx3KvBX9aL88+PCY+m1CagB1ZOeB8ZsvrTGDcmlFuAqbws8QP2ZuNPS++EWksim7xxVoHmwa5o/Lcr2qczFOuLChg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007374; c=relaxed/simple;
	bh=vyvN5XfgdwjcPEJxdEkfPr/bFt9HtA3tpH3NB3xGITQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kEojacPxSz1/NBcfLuQCsgW/Wuv2UJkW/gIz16J17REXGiesLL2lQXsrtK4fWbv7Jn1Cmj2h3iWcBgFmk7dZaAigmvAMumCx7RNHrYhFOBPf/OhQyO0lmqedBSgYHbNiKwF0NfzxpuUp5KcHnXYmrb4AythISfudj63yV3sLxyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f34s/Z9+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f34s/Z9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5724D1F00A3A;
	Thu,  6 Aug 2026 09:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786007372;
	bh=bUroB+4lJGb8nted9g2HCmfx77TRbQWxMdpewSXlVig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f34s/Z9+lXmTpfdSqkI683oNpYyKR4rvwKHzZcEhYGpZKzUZQd+v2cT+bQM8VUUx6
	 xWtDZyh8pq3GXofXY/plnGz5yVnaCs4OGZBmiR+cAGdIn7CGikbhwub/KxKoDcMm6Q
	 6KMi5oXI8v4TJ11mgvrwK5Hy5OpVofEjEdh29AXxNXLLz0R13lxEZsRob1jj+3HucK
	 livRAF64bM+OdYiA9iX1n7gbYoZ2i1HujVzRvaUBn1WcEKF8XqEAjZy+c3iAYJNPs8
	 j1MvuEN6vJFSX7OP8G0aznS/QkDQf1m4PMDYFAWHQfD4qK9BfSzfSwOAEHnXMkIIG3
	 Q2b3TDn/OsFCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/17] iio: adc: at91-sama5d2_adc: adapt the driver
 for sama7d65
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806074024.531259-8-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-8-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:09:31 +0000
Message-Id: <20260806090932.5724D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The temperature channel on SAMA7D65 (and SAMA7G5) is broken for bu=
ffered IIO capture and causes hardware corruption when enabled.
- [High] Channel 0 is incorrectly treated as a touchscreen channel for SAMA=
7D65 (and SAMA7G5), causing invalid register writes and hardware corruption.
--

--- Patch [7]: [PATCH v6 07/17] iio: adc: at91-sama5d2_adc: adapt the drive=
r for sama7d65 ---
commit d121e4a04e57309a9a2c8f55746f85c0f6a300ed
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

iio: adc: at91-sama5d2_adc: adapt the driver for sama7d65
   =20
This commit adds support for the sama7d65 ADC by introducing a new
compatible string and platform data struct. It also updates the Kconfig
help text to mention the SAMA7 SoC family. The main difference highlighted
is the calibration data layout.

> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sa=
ma5d2_adc.c
> index 3e9feb824a66f..c1e5139a058ca 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c

[ ... ]

> @@ -766,6 +775,24 @@ static const struct at91_adc_platform sama7g5_platfo=
rm =3D {
>  	.temp_calib_layout =3D &sama7g5_temp_calib,
>  };
> =20
> +static const struct at91_adc_platform sama7d65_platform =3D {
> +	.layout =3D &sama7g5_layout,
> +	.adc_channels =3D &at91_sama7g5_adc_channels,
> +	.nr_channels =3D AT91_SAMA7G5_SINGLE_CHAN_CNT +
> +		       AT91_SAMA7G5_DIFF_CHAN_CNT +
> +		       AT91_SAMA7G5_TEMP_CHAN_CNT,
> +	.max_channels =3D ARRAY_SIZE(at91_sama7g5_adc_channels),
> +	.max_index =3D AT91_SAMA7G5_MAX_CHAN_IDX,

[Severity: High]
This is a pre-existing issue, but it appears to be propagated to the new
sama7d65 SoC. Can this max_index value break buffered IIO capture for the
temperature channel?

The driver sets max_index to 25 (AT91_SAMA7G5_MAX_CHAN_IDX), but the
temperature channel uses scan_index 31.

When a user enables only the temperature channel (scan_index 31),
at91_adc_current_chan_is_touch() checks only up to max_index + 1 (26):

drivers/iio/adc/at91-sama5d2_adc.c:at91_adc_current_chan_is_touch() {
    ...
	return !!bitmap_subset(indio_dev->active_scan_mask,
			       &st->touch_st.channels_bitmask,
			       st->soc_info.platform->max_index + 1);
}

Since bit 31 is beyond this size, the first 26 bits of active_scan_mask are=
 0,
making bitmap_subset() incorrectly return true.

This misidentifies the temperature channel as a touchscreen, invoking
at91_adc_configure_touch() which writes to TSMR (offset 0 on this SoC),
corrupting the ADC Control Register (CR) and breaking the device.

> +	.hw_trig_cnt =3D AT91_SAMA7G5_HW_TRIG_CNT,
> +	.osr_mask =3D GENMASK(18, 16),
> +	.oversampling_avail =3D { 1, 4, 16, 64, 256 },
> +	.oversampling_avail_no =3D 5,
> +	.chan_realbits =3D 16,
> +	.temp_sensor =3D true,
> +	.temp_chan =3D AT91_SAMA7G5_ADC_TEMP_CHANNEL,
> +	.temp_calib_layout =3D &sama7d65_temp_calib,
> +};

[Severity: High]
This isn't a bug introduced by this patch, but the same pattern is copied
here. Could leaving the touch channel fields uninitialized incorrectly treat
ADC channel 0 as a touchscreen?

The sama7d65_platform struct does not initialize touch_chan_x, touch_chan_y,
or touch_chan_p, so they default to 0.

During at91_adc_probe(), bitmap_set() unconditionally sets these bits in the
touchscreen channels_bitmask:

drivers/iio/adc/at91-sama5d2_adc.c:at91_adc_probe() {
    ...
	bitmap_set(&st->touch_st.channels_bitmask,
		   st->soc_info.platform->touch_chan_x, 1);
    ...
}

When channel 0 is used for buffered capture, at91_adc_current_chan_is_touch=
()
incorrectly evaluates to true.

This misconfigures the ADC and causes writes to touchscreen registers which
are undefined for this SoC (evaluating to offset 0x0), corrupting the ADC
Control Register (CR).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806074024.5312=
59-1-varshini.rajendran@microchip.com?part=3D7
