Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1D3FF8A4
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156084; cv=none; b=uvxveAZpU5NpGZJJiWQaRgQjq/Zvh2wc5teFiyx0sWkQ4dRJQUGwRJdjSDHnBS5qcFMHGIzr5BPSaPDOfnGe2Qx9pfMKDkHtouDy8CMebuVvjYAiws3yCf27qTUEUfFJ2675GsxSRWF1YVGOqgWAizEVK/fRcAY+h118se6Lx18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156084; c=relaxed/simple;
	bh=iv4JEi2o4H568SqfL5p239FYLss4z5SC6P58wvGR14I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rq+lvgt6oJszjoFkLd5tdCynGfqVUt/bPHgIFO/PSwQWgv56OSMN07DXl0G8rJvL0dVqoDWzyUQsvf92CfiKhcaDAIVZgo2xm4P0D+5eynmEGd+m2bchcg7z5gmAiCEa+FrfVVsV11QgZbnp0G49H+4X7LyuvDLUSz5TuXaJznI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f4CxgOzj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4CxgOzj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B394A1F000E9;
	Mon, 27 Jul 2026 12:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785156083;
	bh=0wYK53ewoRWYTx3oAMJiZ17rAH5rNIN9TbRj9Ox0tAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f4CxgOzjPV20GN0gLCFST3gnJCPdfDRpjH1x8CGH1oNtoeaW0/mk6Id5hBiRVY+Wj
	 2mE5eNKEvGjlAVYiCOsGllZfNCzDU/ABf8EJoMAGJ0AvcAE4mpS5ugDmZq8oP5xbu/
	 eQ/nH2qPAhINb5N/s4uJnJJI6N1rFuqBtPGuYkC+0HGxeXtn7WtPAIECAAaV5ecAuQ
	 CjS14BuhPNw1geAxRWDfsIE/OokweMLBnuxHXxOF85R0ziW71/lC4w15EL3ktNUYWu
	 ulD0G0SlmxDTdCtBzFpWhEn3H+4Z3luAv8KJ9Q0Rb0V6JGpZEHaI69a0M3ctC0VKS2
	 jJm6LGa29XkLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/16] iio: adc: at91-sama5d2_adc: adapt the driver
 for sama7d65
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727122633.117435-7-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
 <20260727122633.117435-7-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 12:41:22 +0000
Message-Id: <20260727124122.B394A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The custom `DEFINE_FREE` implementation for `nvmem_cell_put` fails=
 to check for error pointers, causing a kernel panic when `nvmem_cell_get` =
fails.
--

--- Patch [6]: [PATCH v4 06/16] iio: adc: at91-sama5d2_adc: adapt the drive=
r for sama7d65 ---
commit ded9daef979dc15e3d8816ca33992bea7aa02c01
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

    iio: adc: at91-sama5d2_adc: adapt the driver for sama7d65
   =20
    Add support for sama7d65 ADC. The differences are highlighted with the
    compatible. The calibration data layout is the main difference.

> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sa=
ma5d2_adc.c
> index 63481ecb94f5e..a54691b38244f 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
[ ... ]
> @@ -768,6 +777,24 @@ static const struct at91_adc_platform sama7g5_platfo=
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
> +	.hw_trig_cnt =3D AT91_SAMA7G5_HW_TRIG_CNT,
> +	.osr_mask =3D GENMASK(18, 16),
> +	.oversampling_avail =3D { 1, 4, 16, 64, 256 },
> +	.oversampling_avail_no =3D 5,
> +	.chan_realbits =3D 16,
> +	.temp_sensor =3D true,

[Severity: High]
Could enabling the temperature sensor here expose this new platform to a pa=
nic
during probe?

When at91_adc_temp_sensor_init() is called for platforms with a temperature
sensor, it uses nvmem_cell_get() which returns an error pointer on failure:

	struct nvmem_cell *temp_calib __free(nvmem_cell_put) =3D
		nvmem_cell_get(dev, "temperature_calib");
	if (IS_ERR(temp_calib)) {
		if (PTR_ERR(temp_calib) !=3D -ENOENT)
			dev_err(dev, "Failed to get temperature_calib cell!\n");
		return PTR_ERR(temp_calib);
	}

Because DEFINE_FREE for nvmem_cell_put is implemented with a simple check
instead of verifying for error pointers:

DEFINE_FREE(nvmem_cell_put, struct nvmem_cell *, if (_T) nvmem_cell_put(_T))

If nvmem_cell_get() fails, the ERR_PTR is evaluated as true by the cleanup
macro and passed directly to nvmem_cell_put(). This will immediately attempt
to dereference the error pointer, causing a kernel panic.

> +	.temp_chan =3D AT91_SAMA7G5_ADC_TEMP_CHANNEL,
> +	.temp_calib_layout =3D &sama7d65_temp_calib,
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727122633.1174=
35-1-varshini.rajendran@microchip.com?part=3D6
