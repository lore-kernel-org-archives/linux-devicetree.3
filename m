Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F6424643
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007244; cv=none; b=QIG+oqGMKwlxWBNIBi9dTAwaFmSc6i3lBanzbsjBFO3iz5nApitEmYLEfltQkG+H0hsQQ0DZTBUMiMFctqOvbOcsKlO93uEUlkWSoGzR+w34gWEjIP+tw1u28gjZNdoNdyrnpqK9lV1OecEKmssyW9yHwkw1rA8tfrCsD1pJRdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007244; c=relaxed/simple;
	bh=N2UIDeaa01X7nyEC844NJAzySmXQlEoD30wwkj/4s8U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hn7HkRTE4DbTh0/tZpFREMYVRENR8n0A/ZNuAQlZQ+ocQgUTJJHai98iFB9VRgs3zElHq+oe9rwGlfjfs9/uJEzkpRyCxy72udgFnqL/YWXiScTGYQ0F5q3Mw3GH69Ds8mYwPIBZJbRwxvCxdlq+dmvXw5kDFi50iRGP+gI4opM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEZiqu9N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEZiqu9N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B8A1F000E9;
	Thu,  6 Aug 2026 09:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786007243;
	bh=ts9Ogp0DEFsY+F9cABPzhrkGrp/DCGG6eWuoaICZQmc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PEZiqu9NNF4f/5Pkg0in4m8DQBDyqJXGiWMeelkgzlHP1NjRTxAORapd7Cdipvjz1
	 U/0JuZ3cJw0H2cX1oIHcZoj1KwejJpcQvOihh1lzuA446O39T6EnjlbinzIS9f9dU0
	 /vtybyL3++8+4klY9jp96gdwG+AXHglREBnwEUxrFjSTtvvNcCFhDuddJhNbwyGm4S
	 nwgc2cib4cVBCuS6zmemH4o0Zns0BukV6BHB3xt33BtlTi7NAeMRWaxY5UDW4Y3ifZ
	 xSxiP6A+p8Na6eKtEzZOumB6+BUSyuT+0Kopyod4KXP3hFwW41Xi/jRW305hsoHz/E
	 EYpWQ5x61sjnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/17] iio: adc: at91-sama5d2_adc: rework temp
 calibration layout handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806074024.531259-5-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-5-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:07:22 +0000
Message-Id: <20260806090722.C1B8A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete implementation and potential endianness mismatch for =
temperature calibration tag validation.
--

--- Patch [4]: [PATCH v6 04/17] iio: adc: at91-sama5d2_adc: rework temp cal=
ibration layout handling ---
commit 65bb1c4cb4dea2cd195d1f4ea57709e80f9fb56a
Author: Varshini Rajendran <varshini.rajendran@microchip.com>
Date:   Thu Aug 6 07:40:11 2026 +0000

    iio: adc: at91-sama5d2_adc: rework temp calibration layout handling

This commit extends support to handle different temperature calibration lay=
outs.
It introduces a structure to describe indexes for calibration factors and
scaling details, preparing the driver to handle SoC-specific differences.

> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sa=
ma5d2_adc.c
> index 09390f082fc48..82db8f2f4db03 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c

[ ... ]

> @@ -444,6 +445,27 @@ static const struct at91_adc_reg_layout sama7g5_layo=
ut =3D {
>  #define at91_adc_writel(st, reg, val)					\
>  	writel_relaxed(val, (st)->base + (st)->soc_info.platform->layout->reg)
> =20
> +/* Temperature calibration tag "ACST" in ASCII */
> +#define AT91_TEMP_CALIB_TAG_ACST	0x41435354
> +

[Severity: Medium]
This macro is defined here but doesn't seem to be used anywhere in this pat=
ch.=20

Also, if it were used directly for a u32 comparison against a memory buffer,
would it cause an endianness mismatch? On Little-Endian systems (like
SAMA5/SAMA7), reading the ASCII string "ACST" into a u32 would result in
0x54534341 rather than 0x41435354.

> +/**
> + * struct at91_adc_temp_calib_layout - temperature calibration packet la=
yout
> + * @tag_idx:	index of Packet tag in the NVMEM cell buffer
> + * @p1_idx:	index of FT1_TEMP, equivalent to P1 in the NVMEM cell buffer
> + * @p4_idx:	index of FT1_VPAT, equivalent to P4 in the NVMEM cell buffer
> + * @p6_idx:	index of FT2_VBG, equivalent to P6 in the NVMEM cell buffer
> + * @min_len:	minimum number of u32 words expected in the NVMEM cell buff=
er
> + * @p1_scale:	scaling factor applied to P1 to convert to millicelcius
> + */
> +struct at91_adc_temp_calib_layout {
> +	unsigned int tag_idx;
> +	unsigned int p1_idx;
> +	unsigned int p4_idx;
> +	unsigned int p6_idx;
> +	unsigned int min_len;
> +	struct u32_fract p1_scale;
> +};

[ ... ]

> @@ -2270,20 +2297,23 @@ static int at91_adc_temp_sensor_init(struct at91_=
adc_state *st,
>  		return dev_err_probe(dev, PTR_ERR(buf),
>  				     "Failed to read calibration data!\n");
> =20
> -	if (len < AT91_ADC_TS_CLB_IDX_MAX * sizeof(*buf)) {
> +	if (len < layout->min_len * sizeof(*buf)) {

[Severity: Medium]
The commit message mentions adding a layout structure to describe the index
of the tag, but the tag validation using layout->tag_idx and
AT91_TEMP_CALIB_TAG_ACST appears to be omitted here. Was this check
unintentionally left out?

>  		dev_err(dev, "Invalid calibration data!\n");
>  		return -EINVAL;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806074024.5312=
59-1-varshini.rajendran@microchip.com?part=3D4
