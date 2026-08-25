Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2709632D0FC
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 17:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787679050; cv=none; b=NbZeR6tzK9NpZCZcAJPAq+R5/zeNRdrHiiX8832xk3fkHvd8kh3gGaID6NmhJMY5K2QzdfRQ5uvW1S5076TOjVTzZFTJkySRtGyPhT5eIoWF0dC0nS4263sdwyG37SS0DIxZN5kxlDtruO1Jxi9/Y1zCmJ9aLmYn+CJ6rjwhQbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787679050; c=relaxed/simple;
	bh=Zh5ocdFCKqohnPk8LeeV3jqVH7IPRn45S1jqpiz59Mw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hvZsGlgLV6Bq2HYyqmt2hT6hn7tUPUpFqL/ScPJimdbKeDZXzTmtCEVXf6WAVSSW2DLtj3zKwA/e13F6lbhGtzSLBD+oV3YjF7UiQ1ixgnVsyMkepRppQrjqAlbX4/IOaFsQVnsDxI23LEEaENkn9Rp/HanFPfLvpCgydXHSBEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kaiqIsuX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kaiqIsuX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21CA1F00A3A;
	Tue, 25 Aug 2026 17:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787679044;
	bh=yPAv2s/qbT1BWaEbkVizNyrdV4WAEMBTPwVK9eEsW/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kaiqIsuXCMxA5AbAHrBgdzDFEb7LQDLJJtDx0jXSo1u1LGxoOJlcL8VPRsepU/JZa
	 WfgE4YhsN1x9un/tOY70M7XqCMdKAkjcyB/NvWMelSABCJtjODUu4qqPrDRqZZS9Dv
	 2+QpwlQhcqeJw+U/MeRk2G9C5lhtux9GgiWPWuOq7UzLuXxPQczA4dsNkIdQ6bcZ7i
	 6vbU1Rv4YzzDTFIFl1kcPDGP6vPrFVviz0eGjJW4xtGAGe5lLAjKuwWw87h/PlnoI1
	 kCiW8wE+V17/Er0p7e7DdfPoNc46HYYZxWEPBtV8a9b3eDvTG+E3kbA0X57nGC8+o9
	 eYPBIthtTPNtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 03/18] spi: parse spi-max-post-config-frequency-hz
 into post_config_max_speed_hz
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, robh@kernel.org, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, conor+dt@kernel.org, "Richard
 Weinberger" <richard@nod.at>, devicetree@vger.kernel.org, "Vignesh
 Raghavendra" <vigneshr@ti.com>
In-Reply-To: <20260825171737.776052-4-s-k6@ti.com>
References: <20260825171737.776052-1-s-k6@ti.com>
 <20260825171737.776052-4-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:30:43 +0000
Message-Id: <20260825173043.F21CA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The new `post_config_max_speed_hz` property is not clamped to th=
e SPI controller's maximum supported speed during device setup.
- [Medium] `post_config_max_speed_hz` is not copied to ancillary or multipl=
exed SPI devices, breaking high-speed operations for multi-die packages and=
 proxy devices.
--

commit 5705672f7b6c77c877910c5996844e5029e278fd
Author: Santhosh Kumar K <s-k6@ti.com>

spi: parse spi-max-post-config-frequency-hz into post_config_max_speed_hz

This commit adds a post_config_max_speed_hz field to struct spi_device to
support SPI devices operating at distinct pre- and post-configuration clock
rates. The new property is parsed from the spi-max-post-config-frequency-hz
Device Tree property.

> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index 88d17fce02dcb..02fd602f29e8b 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
[ ... ]
> @@ -195,6 +197,7 @@ struct spi_device {
>  	struct device		dev;
>  	struct spi_controller	*controller;
>  	u32			max_speed_hz;
> +	u32			post_config_max_speed_hz;

[Severity: Medium]
Does the new post_config_max_speed_hz need to be clamped to the controller's
maximum supported speed during device setup?

Looking at drivers/spi/spi.c:__spi_setup(), the existing max_speed_hz is
strictly validated against the hardware capabilities:

	if (spi->controller->max_speed_hz &&
	    (!spi->max_speed_hz ||
	     spi->max_speed_hz > spi->controller->max_speed_hz))
		spi->max_speed_hz =3D spi->controller->max_speed_hz;

Without similar clamping for post_config_max_speed_hz, a misconfigured
Device Tree could inject an arbitrarily large frequency, causing the
underlying controller to configure hardware for an unsupported rate.

[Severity: Medium]
Should post_config_max_speed_hz also be cloned for ancillary or multiplexed
SPI devices to ensure multi-die packages can use post-config speeds?

Looking at drivers/spi/spi.c:spi_new_ancillary_device(), only the primary
max_speed_hz is copied to secondary logical devices:

	/* Take over SPI mode/speed from SPI main device */
	ancillary->max_speed_hz =3D spi->max_speed_hz;
	ancillary->mode =3D spi->mode;

A similar omission exists in drivers/spi/spi-mux.c:spi_mux_select():

	/* copy the child device's settings except for the cs */
	priv->spi->max_speed_hz =3D spi->max_speed_hz;
	priv->spi->mode =3D spi->mode;

Without cloning this new property, these proxy devices will have a zero
post-config frequency, forcing secondary dies to operate at the slower
pre-configuration rate.

>  	u8			bits_per_word;
>  	bool			rt;
>  #define SPI_NO_TX		BIT(31)		/* No transmit wire */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825171737.7760=
52-1-s-k6@ti.com?part=3D3
