Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B561F8755
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156002; cv=none; b=rBiDpRpRDPC6gbupLiZNzAbCZJsNH005kzOjBpBqFU+lFoYq41ZJ+S+M2lxf9zw5giUgYODTjXg/kkyhzVPWYeIvPOz+y9v1vD1m7IPVGcQyZTlnyWfP7t4SMtSASTng6nkbCUfI+BhrYcGCCLHYwDs413Vr8b2vOqO/NZy8LR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156002; c=relaxed/simple;
	bh=2Gty4GRlHbZaSKMKypOfkEqTEjnFTlkEwDop952KOOM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uEh4+8OaaduhY00ix4OFb+sA9HsZCW/3nQcOqP0ncxS/vtw9txZld/WLxIABGIIey7k/jPl0mVVuwEsheEy0j3kOTYuh+pCkua+z1/A9fn7gYVvNLTwALH1bMOsIQG5zZjYRlED0ZeuECPzxuaTMM9tXUhUwG/CmZQfChxLG2RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zb7T+K5G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zb7T+K5G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909C91F000E9;
	Mon, 27 Jul 2026 12:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785156000;
	bh=u4dHzf2JsPKNM0gFDhPWrpJkBm55lmN3Jk188VNTFf8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zb7T+K5GRA6eV9l+QOfGkLk+uNE2pUSSJqJjIxDaOjI1Cyggfur7Ft9f3/IDP1eLu
	 FON1HGeoOZzUth/bTzwC6lPL14Y0VecooVCMIy1exd+Bw57m6rv2rThKl/Gmh3HD9B
	 0I8HEwVgP2TgWj9737cCnGC5Tng0iTtoC0GRSEda+WwGzBGdp8R7jwnRHWKEAo13Zl
	 xIGo+X2wSAD5/nSkHCPX/8wn25s7/vaxxXWNLrrZ7CHvaueUnA0nTCDQQjhkbHBm4K
	 BAcnRA57hinVekmzb25w78qXsaCrVr5RziZPzEAKFcbdRZh13uEIgNnPJkJRcKj9zg
	 3n2dl6PJNvdvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/16] iio: adc: at91-sama5d2_adc: rework temp
 calibration layout handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727122633.117435-4-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
 <20260727122633.117435-4-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 12:39:59 +0000
Message-Id: <20260727124000.909C91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `DEFINE_FREE` wrapper for `nvmem_cell_put` incorrectly handles=
 error pointers, leading to a kernel crash when `nvmem_cell_get()` fails.
- [Medium] The introduced temperature calibration tag index and expected ta=
g macro are never used to validate the NVMEM packet.
--

--- Patch [3]: [PATCH v4 03/16] iio: adc: at91-sama5d2_adc: rework temp cal=
ibration layout handling ---
commit 859125ad776a3a3f2a744e65f324ef58a384982e
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

    iio: adc: at91-sama5d2_adc: rework temp calibration layout handling
   =20
    Extend support to handle different temperature calibration layouts.
   =20
    Add a temperature calibration data layout structure to describe indexes
    of the factors P1, P4, P6, tag, minimum length of the packet and the
    scaling factors for P1 (p1_scale) which are SoC-specific instead of the
    older non scalable id structure. This helps handle the differences in t=
he
    same function flow and prepare the calibration data to be applied.

> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sa=
ma5d2_adc.c
> index 4a4a25f3c715a..798e4d60bf697 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
[ ... ]
> @@ -2251,11 +2271,18 @@ static int at91_adc_temp_sensor_init(struct at91_=
adc_state *st,
>  				     struct device *dev)
>  {
>  	struct at91_adc_temp_sensor_clb *clb =3D &st->soc_info.temp_sensor_clb;
> +	const struct at91_adc_temp_calib_layout *layout;
>  	size_t len;
> =20
>  	if (!st->soc_info.platform->temp_sensor)
>  		return 0;
> =20
> +	layout =3D st->soc_info.platform->temp_calib_layout;
> +	if (!layout)
> +		return -ENODEV;
> +	if (!layout->p1_scale.denominator)
> +		return -EINVAL;
> +
>  	/* Get the calibration data from NVMEM. */
>  	struct nvmem_cell *temp_calib __free(nvmem_cell_put) =3D
>  		nvmem_cell_get(dev, "temperature_calib");

[Severity: High]
Does the DEFINE_FREE() wrapper for nvmem_cell_put() properly handle error
pointers?

If nvmem_cell_get() returns an ERR_PTR (e.g. if the NVMEM cell is missing
or defers probe), the error pointer will be truthy. If the custom
DEFINE_FREE(nvmem_cell_put) wrapper only checks "if (_T)" instead of
using IS_ERR_OR_NULL(), the truthy ERR_PTR can bypass the guard and be
passed to nvmem_cell_put(). This would unconditionally dereference the
error pointer and cause a kernel panic.

[ ... ]
> @@ -2270,20 +2297,23 @@ static int at91_adc_temp_sensor_init(struct at91_=
adc_state *st,
>  		return dev_err_probe(dev, PTR_ERR(buf),
>  				     "Failed to read calibration data!\n");
> =20
> -	if (len < AT91_ADC_TS_CLB_IDX_MAX * sizeof(*buf)) {
> +	if (len < layout->min_len * sizeof(*buf)) {
>  		dev_err(dev, "Invalid calibration data!\n");
>  		return -EINVAL;
>  	}

[Severity: Medium]
Are we missing the expected packet tag validation here?

The commit introduces the AT91_TEMP_CALIB_TAG_ACST macro and the tag_idx fi=
eld
specifically to validate the NVMEM cell content, but the actual validation
check seems omitted.

This might allow the driver to accept corrupted or invalid NVMEM calibration
data as long as it meets the minimum length requirement.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727122633.1174=
35-1-varshini.rajendran@microchip.com?part=3D3
