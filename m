Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A44746EF8D
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314334; cv=none; b=rxIFGHKutcKc3ra6MDynDi9cMD+pU3NQ25hznxeItZMFGXdmrm2jDb1WUv3mxaPVFwY+trmju1DY8PhN3SNDrhKqXSEibJkgQStg8HKeyhVBUGauolPHUBMIX0saG9FY+x2S9OXp/DQhw0TynkvTy1Lha0IV9dQQsARSe+Bbu0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314334; c=relaxed/simple;
	bh=BqDZpai3aLPrat1iD1rPPDIwstFtlcpVrAOgDeo3D2E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=REOKqcMs6kNmQ/jdoE4xepcyCEutMK2c1HmdS6vmZcqN8nNmRSRHA4BIn09595JvZAsTpC5DXoOgiQSh2qrboB6pPJRTPPRoQF61f61pTF9Mc+SxbpSKcGSdGJOToAnK5qIsrAsurqbTe5WNq9jJLuJPTgeZSL0nPmKafckHD8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuerDm/I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuerDm/I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730DF1F000E9;
	Fri, 21 Aug 2026 12:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787314331;
	bh=J72MWjR0XS4QWfoVeZTyj7i7PVd15FUjsL9YSYW6IAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fuerDm/IgNKe/20+DjVnhaYz2K2DWObryhSMaCftU30RILO/oLCg+fPUt9qqS1+IY
	 P3hzeoylYq+gHQ/gnq0QAH9Hxf2Ms92nRm78T4Db0euhVPAsBRJrSRDhVDziOukD0W
	 IuK/fN5vfsvmpvjIsRkvFMyLiSYIkjfjP+DBh9Mw8U3oDdBMQRljodiFNWJHcCSq1y
	 q365cbx11pSM00mb/08zSP9ywl8ssdm/wCLltRHp58hT112PltfbVQDYYnNWJ27Yz4
	 8oeqhxcrZptEhzFgK3XBnXJ+QwJR+XJdO3d7PPlVAtKnY2bef+q+oNAezV+ykwtWX9
	 a2f/Re4tlXdbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 03/18] spi: parse spi-max-post-config-frequency-hz
 into post_config_max_speed_hz
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, devicetree@vger.kernel.org, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Richard Weinberger" <richard@nod.at>, conor+dt@kernel.org, robh@kernel.org, "Michael
 Walle" <mwalle@kernel.org>
In-Reply-To: <20260821114822.4040338-4-s-k6@ti.com>
References: <20260821114822.4040338-1-s-k6@ti.com>
 <20260821114822.4040338-4-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:12:09 +0000
Message-Id: <20260821121210.730DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] `spi->post_config_max_speed_hz` is not clamped against the contr=
oller's maximum supported speed (`spi->controller->max_speed_hz`).
- [Medium] `spi_new_ancillary_device()` does not copy `post_config_max_spee=
d_hz` from the primary SPI device, breaking the feature for secondary chip =
selects.
--

--- Patch [3]: [PATCH v8 03/18] spi: parse spi-max-post-config-frequency-hz=
 into post_config_max_speed_hz ---
commit c2f1be0c2debf6f375fd36183b8ae8c58dccdc03
Author: Santhosh Kumar K <s-k6@ti.com>

spi: parse spi-max-post-config-frequency-hz into post_config_max_speed_hz

Add post_config_max_speed_hz to struct spi_device and parse it from
the spi-max-post-config-frequency-hz DT property. This supports SPI
devices that operate at two distinct clock rates.

> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 5b5b3bc5f0d8c..6b01ddb7cc324 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2800,6 +2800,8 @@ static int of_spi_parse_dt(struct spi_controller *c=
tlr, struct spi_device *spi,
>  	/* Device speed */
>  	if (!of_property_read_u32(nc, "spi-max-frequency", &value))
>  		spi->max_speed_hz =3D value;
> +	if (!of_property_read_u32(nc, "spi-max-post-config-frequency-hz", &valu=
e))
> +		spi->post_config_max_speed_hz =3D value;

[Severity: Medium]
Does this new property also need to be clamped to the controller's maximum
supported speed?

In drivers/spi/spi.c:__spi_setup(), the pre-configuration speed is clamped:

__spi_setup() {
    ...
    if (spi->controller->max_speed_hz &&
        (!spi->max_speed_hz ||
         spi->max_speed_hz > spi->controller->max_speed_hz))
        spi->max_speed_hz =3D spi->controller->max_speed_hz;
    ...
}

Since post_config_max_speed_hz is not clamped here, could SPI-MEM request
an invalid post-configuration speed that the SPI controller physically
cannot support?

[ ... ]

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
Should this new field be copied to ancillary devices?

When creating secondary chip selects for multi-die packages,
drivers/spi/spi.c:spi_new_ancillary_device() clones the main device propert=
ies:

spi_new_ancillary_device() {
    ...
    /* Take over SPI mode/speed from SPI main device */
    ancillary->max_speed_hz =3D spi->max_speed_hz;
    ancillary->mode =3D spi->mode;
    ...
}

If post_config_max_speed_hz is not copied here, will ancillary devices
have a value of 0 and silently fail to apply the higher speed during
PHY tuning?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821114822.4040=
338-1-s-k6@ti.com?part=3D3
