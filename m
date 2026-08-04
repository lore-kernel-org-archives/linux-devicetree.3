Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA533AF656
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845335; cv=none; b=rBXq/RIjPvDaamrI5rl1QWFBMRuVL4TQMHYsLdNjwcCUfC3GSUNegcPukRBLLx19pxjuKf+uuEG7i7MzXZ6NVljYdev3Ay8gJAVU/EtTs49FjvPB6Hw1seKki64m6N5BBtlp/5123sHguPQkM8+9y8SaaS7dBj3oXEd2OQnF6AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845335; c=relaxed/simple;
	bh=rGZID/1D35HR/30Li2M9KBZTZRtG7ra5hgUmU2nMHVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uetpHcSuuudQSAzVAbk9g5AuWdOJGlBvRslQUECXTW5o2xWZDPLPi0PDIvo44FmCeXPkg9eCU/nY+0/xIQ4La7iif7lZcX7wXHFUrvTXK0BHiukyoslMFCGTdHwY4skR7Wg8bxTMEOIaKN0JtnDdmiZ1CXWOhycVlnFTzLrfu+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJgL1n5I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJgL1n5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D5B1F000E9;
	Tue,  4 Aug 2026 12:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785845329;
	bh=Gzi8hvO7o4D4gJkAJnHSPHM2lfpdoBvWkcQib0uGuFE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fJgL1n5IdAwcSuMxFgm0cQE3xjOyJKiOcK63hGSTIEiFYzR7xaxsL1ylCEclCqu1K
	 Hk4O4ltnWqLOW74ZfFCiPCZGFcM5sMwUJGLBAzxw7um/j7DEBU44nlaZCOcH73kK9C
	 YakBeJybfDHA5KtyQTKa6cjTVuf/uPw1W/wgDNAEAQJ9sEnmNZ0uOU7tQn1+alzKE7
	 TOIOKade/GFKRqh+IgP2a0PYst0Qr1PSKs4ftZVk4QS0I1TlXFT/hBjdZsHTIa3yJ8
	 xSXoZ+Tu07JWigPkiBQuXUSIDpljd8epb8UdKAeHwZXeQ9oH5tIjD8/vNlr3+BURg6
	 2/uCxHXpxCGBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/17] iio: adc: at91-sama5d2_adc: adapt the driver
 for sama7d65
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260804113338.261782-8-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
 <20260804113338.261782-8-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:08:49 +0000
Message-Id: <20260804120849.92D5B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect scaling factor `p1_scale` for sama7d65 temperature calib=
ration data, likely due to swapped numerator and denominator.
--

--- Patch [7]: [PATCH v5 07/17] iio: adc: at91-sama5d2_adc: adapt the drive=
r for sama7d65 ---
commit ea05a7089eb84578f2d6135b1c963b5c2be91fdd
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

iio: adc: at91-sama5d2_adc: adapt the driver for sama7d65

Add support for sama7d65 ADC. The differences are highlighted with the
compatible. The calibration data layout is the main difference.

Update Kconfig help text to mention SAMA7 SoC family support.

> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sa=
ma5d2_adc.c
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c

[ ... ]

> @@ -528,6 +528,15 @@ static const struct at91_adc_temp_calib_layout sama7=
g5_temp_calib =3D {
>  	.p1_scale =3D { .numerator =3D 1000, .denominator =3D 1 },
>  };
> =20
> +static const struct at91_adc_temp_calib_layout sama7d65_temp_calib =3D {
> +	.tag_idx =3D 1,
> +	.p1_idx =3D 3,
> +	.p4_idx =3D 2,
> +	.p6_idx =3D 5,
> +	.min_len =3D 11,
> +	.p1_scale =3D { .numerator =3D 1, .denominator =3D 1000 },
> +};

[Severity: High]
Is this scale correct for the p1 value?

In at91_adc_temp_sensor_init(), the calibration value is scaled like this:

clb->p1 /=3D layout->p1_scale.denominator;

With a denominator of 1000, the raw NVMEM calibration value will be divided
by 1000. Later in at91_adc_read_temp(), this scaled p1 value is added
directly to a milli-Celsius delta.

If the NVMEM stores p1 in Celsius (like it does for SAMA7G5), dividing by
1000 yields 0 due to integer truncation. If it is already in milli-Celsius,
dividing by 1000 converts it back to Celsius. In either case, adding Celsius
or 0 to a milli-Celsius delta results in an incorrect temperature reading.

Could the numerator and denominator have been accidentally swapped here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804113338.2617=
82-1-varshini.rajendran@microchip.com?part=3D7
