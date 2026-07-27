Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD1A3FF883
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155817; cv=none; b=JDl4YYW3FWWj0SNhX5pIMB6W1KeQBa9npe0bjt5MCpiegJoUtPzm8FglPixWoytPLzZjvP2BwJLOdF1IbSBP+9CSmyHGFyLxrMLNKFzATVVlz1RNIabCJJri2TJ5+28TEwAyjez/pJmra08rr4gy4H9OqdM+DVfsw+J3Wlx1grU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155817; c=relaxed/simple;
	bh=7FC4edqsoAoA3XC6InykooCQcFCu2hMCRWWFFOr4B/s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bNAaT9qqDj5OZPTMcRNZS4vPeWehP9La+MRj2WKNoMgOg6+taL3h+CYnxXh/QncyuER/BWL3nKpdb0qvsNnGIWBkiGFpnnDdBmblWVV9KhNuOOP8IEU9Ocd9+hD9sD982B7fEJlxCu5xPYkAHHjEQIb9zYHjzD/zRdQUKqhUEj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQ8+cwNZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQ8+cwNZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8FD1F000E9;
	Mon, 27 Jul 2026 12:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785155815;
	bh=cVA2bcgdHLJyvKpxUimkoPMaQqdAXpQ+kBWTemkqSFs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mQ8+cwNZYXltUDNADncrhN4TAdvMFeEDE531RKVaeJ8T527dB0KwzK7bJWayfZQhy
	 T1G7xK0Vz/4/6huIlXcO0IR6C0KcG0JrT9KlNVe9RoDl8/Waa8PzWeLoC/8qF9yCR/
	 tJxFv21Uw0pdFq/wki6KZrFnp9IuMqY28lfhSkjOu7kHhV35d2GDIVwrhv/76k+5iS
	 4AUFl+vkPQnfOrChJOcJW9LK1xvG0SmFUwUqHIhnHzDTM5HLw7e7AakYKkWpYwGRZ1
	 5c+vcU92so9zCTzSjKbOFhtUGXeDdbf7D2Whozek6LZNyzcKePUR8H6ZrCb+QE+C3T
	 Sfk1Gn6J2BsWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/16] iio: adc: at91-sama5d2_adc: use cleanup.h for
 NVMEM buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727122633.117435-3-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
 <20260727122633.117435-3-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 12:36:54 +0000
Message-Id: <20260727123655.7B8FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The custom `DEFINE_FREE(nvmem_cell_put)` wrapper does not guard ag=
ainst `ERR_PTR` values, leading to a kernel panic when `nvmem_cell_get()` f=
ails.
--

--- Patch [2]: [PATCH v4 02/16] iio: adc: at91-sama5d2_adc: use cleanup.h f=
or NVMEM buffer ---
commit dbed20984526e19bec7734326990be3251fc20e1
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

iio: adc: at91-sama5d2_adc: use cleanup.h for NVMEM buffer

This commit updates at91_adc_temp_sensor_init() to use scope-based cleanup
helpers. It introduces a custom DEFINE_FREE wrapper for nvmem_cell_put
and uses __free(kfree) to simplify the error handling paths.

> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sa=
ma5d2_adc.c
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -35,6 +35,8 @@
> =20
>  #include <dt-bindings/iio/adc/at91-sama5d2_adc.h>
> =20
> +DEFINE_FREE(nvmem_cell_put, struct nvmem_cell *, if (_T) nvmem_cell_put(=
_T))

[ ... ]

> @@ -2249,33 +2251,28 @@ static int at91_adc_temp_sensor_init(struct at91_=
adc_state *st,
>  				     struct device *dev)
>  {
[ ... ]
>  	/* Get the calibration data from NVMEM. */
> -	temp_calib =3D nvmem_cell_get(dev, "temperature_calib");
> +	struct nvmem_cell *temp_calib __free(nvmem_cell_put) =3D
> +		nvmem_cell_get(dev, "temperature_calib");
>  	if (IS_ERR(temp_calib)) {
> -		ret =3D PTR_ERR(temp_calib);
> -		if (ret !=3D -ENOENT)
> +		if (PTR_ERR(temp_calib) !=3D -ENOENT)
>  			dev_err(dev, "Failed to get temperature_calib cell!\n");
> -		return ret;
> +		return PTR_ERR(temp_calib);
>  	}

[Severity: High]
Can returning early here cause a panic when the cleanup function runs?

nvmem_cell_get() returns an ERR_PTR on failure, such as -ENOENT or
-EPROBE_DEFER. Because the DEFINE_FREE wrapper for nvmem_cell_put only
checks if the pointer is non-zero (if (_T)), an ERR_PTR evaluates to true.

This means that nvmem_cell_put() will be called with an invalid pointer,
which can trigger a kernel panic when it attempts to dereference it.

Could the DEFINE_FREE macro be updated to use if (!IS_ERR_OR_NULL(_T)) to
safely handle these error codes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727122633.1174=
35-1-varshini.rajendran@microchip.com?part=3D2
