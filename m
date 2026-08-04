Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA8437F33B
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844587; cv=none; b=uxtGEx3ZCqyIixGN9aJUl0ehMjTI4qOvesA6SzKwjywihLEhcCoTfh5hDJapyJhD0zwuDBgdyKdsqF2KVFlNaTsyfa2wBAaC+y9aXGVOUKZSceFAPu4U2SNCb62mpM82lE859uk5+TDbfmKqRdN6//MHsC7i2q1jHGDC5yugL0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844587; c=relaxed/simple;
	bh=fToJH8a5N7QomBYboAPvKAxx6QGB654lPvy7jEc0hJQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qhxZog5agP126tdIfM9RH8s8I7z43BBHTrPmKDY8lNkNQL3MSpcOYAOjIYOoT+bsTpyNfM3l9KvjVuKEjcn7IiYVGIN7+2bO5ZY/OvwNrVD29DjLwVQ5kURwgV1VT1RZfI2CSpNLu5hvNd+8DEV5OpdtRn8HrTRhHSezl8+tCEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKoVzxcs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKoVzxcs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA691F000E9;
	Tue,  4 Aug 2026 11:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785844585;
	bh=/bintSWomay0sVFy00/4iYLWNhpwTO/XMHD2QTXtuXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eKoVzxcsGHdRRZMM8NSo7HbjeJ07EPVYu6yI4IZwoIXnJBdI3zse7550WhQpJraOt
	 sMNfrTW78VmfFG4yNurBFoYG5VIZj8pAC+LAnYGIAMGnR7lNRgGHZ737CgpFF5jfDC
	 blGGSRYNQ8fYWSDYtt9lBTOV5Uh+yfvjtJBs1RiR/kuv3UmAqSxvNwjeDrLo4LYg0z
	 z/nJg8PrVNaeTb17eJUPZW5kmlbR4KJ8sxeqwEzpTo+2d//qS74UNaajgm42yxdOsi
	 g42FywvW2TvBZMgLm6hZOn30yY+lWErN384BJBDsFvbU/domLHeIZMVzbBSbFFgF8C
	 vgIizoLq+Xipw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/17] iio: adc: at91-sama5d2_adc: rework temp
 calibration layout handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804113338.261782-5-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
 <20260804113338.261782-5-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 11:56:24 +0000
Message-Id: <20260804115625.8BA691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The calibration data tag is defined and its layout index is conf=
igured, but it is never checked against the NVMEM data.
--

--- Patch [4]: [PATCH v5 04/17] iio: adc: at91-sama5d2_adc: rework temp cal=
ibration layout handling ---
commit 49b1bddcd8cc36f48960bba2752d5b3937516cd8
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

iio: adc: at91-sama5d2_adc: rework temp calibration layout handling

Extend support to handle different temperature calibration layouts. Add a
temperature calibration data layout structure to describe indexes of the
factors P1, P4, P6, tag, minimum length of the packet and the scaling
factors for P1 (p1_scale) which are SoC-specific instead of the older non
scalable id structure.

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
> +
[ ... ]
> @@ -2270,20 +2297,23 @@ static int at91_adc_temp_sensor_init(struct at91_=
adc_state *st,
>  		return dev_err_probe(dev, PTR_ERR(buf),
>  				     "Failed to read calibration data!\n");
> =20
> -	if (len < AT91_ADC_TS_CLB_IDX_MAX * sizeof(*buf)) {
> +	if (len < layout->min_len * sizeof(*buf)) {

[Severity: Medium]
Should there be a check here to validate the packet tag?

The commit defines AT91_TEMP_CALIB_TAG_ACST and adds tag_idx to the layout
struct, but they do not appear to be used to validate the NVMEM buffer
content before it is parsed.

>  		dev_err(dev, "Invalid calibration data!\n");
>  		return -EINVAL;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804113338.2617=
82-1-varshini.rajendran@microchip.com?part=3D4
