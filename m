Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B47B3438BD
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784315222; cv=none; b=BM3+3tYbuETuEI3HDJjgyiJseZQDLH/NxzNC4Q8lCWXRv9hEqjhX+c5R2SxTwwkJ/eC2mEaO/Rn2mBxjgplQFxbUxi1/K5K20Mye9Fk37Y28KIbGimGuw4yPHsoDrDe1LIQcIHiP2WX5G8HfIw27hLSjh0Ww/aKb6PmckLN3BI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784315222; c=relaxed/simple;
	bh=rAs+iLZnKFLPmM59uJGJk/XeckLfzFqYyrgfl0B3IfQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tGnjsFZdgwgz3vQZN0yfhYflGSDGB8tOtpMbhyAZC/YC44e04bfDVVzDNa4jIKks5u6+ZfGy5Ig39TzuNC2qkjvjobwk5qQV0Sb522HKqAhydBdvt/g4eubDgX2AzXZTgCgdEe9nZG0YjPwTL/KMyX3eO+UgSNnkXuTHE3J3fcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5smeDfY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5smeDfY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686DE1F000E9;
	Fri, 17 Jul 2026 19:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784315220;
	bh=kY+s/a3gZUQ5i7jFsCKbKonhMlug/KqzOFPU2p354LM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e5smeDfYPzP/vU9oFD67G7Ih3brm2XihBn5ax1Wh2wu2pwWBC95WewsiyUutDlPsR
	 TVMoo3zx07WGnX8WCdqf41bjBu+e9TJJKNfpoZu/A0QalN4HKkV/DrEIL7wEN183Mb
	 Tv5+Wxp+E5YPEdvzdiQy+Fs4ZJCO2rA0cy0/hQSnQEXwicyJKgsT6svw2tYQW2CqcO
	 GFrGb73PNY8enFQo/0B5GPF0eP9Lj0RP0KC8A/OnEaasZ++pmSahXuvgZFw8C875ph
	 AoSkfFAEdLrSR3tDSW2WcBMuIqxj+6MwAFxsi0F7wR7bcPkZwZ6qisz20x41EF8QnT
	 pTrI2rPYAYC3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/17] spi: parse spi-max-post-config-frequency-hz
 into post_config_max_speed_hz
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717185116.2065505-4-s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-4-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 19:06:59 +0000
Message-Id: <20260717190700.686DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The newly added `post_config_max_speed_hz` property is not copie=
d when cloning `spi_device` structures for ancillary or muxed devices.
- [Medium] `spi->post_config_max_speed_hz` is not clamped to the SPI contro=
ller's maximum supported frequency.
--

--- Patch [3]: [PATCH v5 03/17] spi: parse spi-max-post-config-frequency-hz=
 into post_config_max_speed_hz ---
commit 96b305610a39094bde249080c339e160beaa3e60
Author: Santhosh Kumar K <s-k6@ti.com>

spi: parse spi-max-post-config-frequency-hz into post_config_max_speed_hz

Add post_config_max_speed_hz to struct spi_device and parse it from
the spi-max-post-config-frequency-hz DT property in of_spi_parse_dt().

> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index d9e6b4b87c899..7e7393d25810d 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2602,6 +2602,8 @@ static int of_spi_parse_dt(struct spi_controller *c=
tlr, struct spi_device *spi,
>  	/* Device speed */
>  	if (!of_property_read_u32(nc, "spi-max-frequency", &value))
>  		spi->max_speed_hz =3D value;
> +	if (!of_property_read_u32(nc, "spi-max-post-config-frequency-hz", &valu=
e))
> +		spi->post_config_max_speed_hz =3D value;

[Severity: Medium]
Does this code need to clamp post_config_max_speed_hz to the controller's
maximum supported frequency?

During device setup in __spi_setup(), max_speed_hz is safely clamped:

drivers/spi/spi.c:__spi_setup() {
    ...
    if (spi->controller->max_speed_hz &&
        (!spi->max_speed_hz ||
         spi->max_speed_hz > spi->controller->max_speed_hz))
        spi->max_speed_hz =3D spi->controller->max_speed_hz;
    ...
}

Will controller drivers directly reading spi->post_config_max_speed_hz see =
an
unvalidated value if the DT property exceeds the controller's max speed?

[ ... ]

> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index 4c285d3ede1d8..aa7b1b34a594f 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h

[ ... ]

> @@ -193,6 +195,7 @@ struct spi_device {
>  	struct device		dev;
>  	struct spi_controller	*controller;
>  	u32			max_speed_hz;
> +	u32			post_config_max_speed_hz;

[Severity: Medium]
Should this new property be copied when cloning spi_device structures for
ancillary or muxed devices?

In spi_new_ancillary_device(), the parent device's speed and mode constrain=
ts
are copied to the ancillary device:

drivers/spi/spi.c:spi_new_ancillary_device() {
    ...
    ancillary->max_speed_hz =3D spi->max_speed_hz;
    ancillary->mode =3D spi->mode;
    ...
}

A similar copy happens in spi_mux_select():

drivers/spi/spi-mux.c:spi_mux_select() {
    ...
    priv->spi->max_speed_hz =3D spi->max_speed_hz;
    ...
}

Will ancillary or multiplexed SPI devices fail to inherit the
post_config_max_speed_hz property, resulting in a value of 0?

>  	u8			bits_per_word;
>  	bool			rt;
>  #define SPI_NO_TX		BIT(31)		/* No transmit wire */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717185116.2065=
505-1-s-k6@ti.com?part=3D3
