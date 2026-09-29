Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B468439060B
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664536; cv=none; b=Syz8fC7ZXkOJBS7CoKDV1cOCW8DXWZg2KgLXQU2vZ+2EYNA+PKbMp9aV3jqhB3Q4i1JL4JNjepdeUheaviAlxCgAcom1vwkomlu3e2h9eVz4G/gY/GJ713FeP4gyT9+FlvANDFfRYoXNJX2CAFtZ1zHHepFSvgzW4lRCRAZkww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664536; c=relaxed/simple;
	bh=BrFNl17BnYQLHkbBxtTHFZ11w/tOeLmoZdXCF9RvD8g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U6yCp9E2Uept5oaIza2VxtGr7G9rXDP1kw2VgDR6c6cCg7EU5Su+GstQUotIAzZtNKTP/TiPnaOIzdB7tCoFRam1H0rqZgUlcoA6z8mVz/B5vfIB7x0M4EuAt8Afw722D2RQiGgYLMHK2YeyQ/84awnVB3pMDRNGoK+hOxTLIs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZURba6A2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZURba6A2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB271F000FF;
	Tue, 29 Sep 2026 06:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664535;
	bh=0l7IuhJScCcPwPCjh+fbrMnMGHX3dtOX4rFairyqTL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZURba6A2Lte1CQnpLXnCMyy4BVavyQsi+xi8AkH2/bTTerEfBsbyFjG6uKH4nK/g8
	 Ie+xdes5H7wJy1YYjeGNMXijvTmpbAVNis7d0zx2BJupKaGZTnBG0g3TzjbTBVX0M7
	 HA0gpLvSV6gxG9eaBWAM1XkroB1bWYdm0slgl4/yY6ik11NmPsZAv2iobJSOtH77UI
	 RHRlFYRHnvcDbYWgn3LKRwlCGGRw15ukJfMOI5+ei8eteSovQgG8TZvA6+JI0EVNTQ
	 2p+/yfwjRWI9eVxqLyYrhr9jVwFW3AxMIp6w8zU3KDHyMSYV3ntngIFWbtexaHyLdt
	 I0tsYEeJNFZUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 03/19] spi: parse spi-max-post-config-frequency-hz
 into post_config_max_speed_hz
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260929063529.1235417-4-s-k6@ti.com>
References: <20260929063529.1235417-1-s-k6@ti.com>
 <20260929063529.1235417-4-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 06:48:54 +0000
Message-Id: <20260929064855.0FB271F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] spi: missing bounds check for post_config_max_speed_hz
- [Medium] spi: missing propagation of post_config_max_speed_hz to non-DT i=
nstantiations
- [Medium] spi: proxy and ancillary devices drop post_config_max_speed_hz
--

commit a54a647ebbac4cf4a270dd8915b629161a216725
Author: Santhosh Kumar K <s-k6@ti.com>
Subject: spi: parse spi-max-post-config-frequency-hz into post_config_max_s=
peed_hz

This patch adds post_config_max_speed_hz to struct spi_device and parses
it from the spi-max-post-config-frequency-hz device tree property. This
supports SPI devices that operate at a conservative rate before
configuration and a higher rate after controller-side configuration.

> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 015d93680e5d0..97bf58dacd06d 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2809,6 +2809,8 @@ static int of_spi_parse_dt(struct spi_controller *c=
tlr, struct spi_device *spi,
>  	/* Device speed */
>  	if (!of_property_read_u32(nc, "spi-max-frequency", &value))
>  		spi->max_speed_hz =3D value;
> +	if (!of_property_read_u32(nc, "spi-max-post-config-frequency-hz", &valu=
e))
> +		spi->post_config_max_speed_hz =3D value;

[Severity: Medium]
Does limiting this new property to device tree via of_property_read_u32()
prevent ACPI and software nodes from using it? The core pattern usually
relies on device_property_read_u32() in __spi_add_device() to support
these automatically.

Also, should spi_board_info be updated to propagate this configuration to
non-DT SPI instantiations? Currently, spi_new_device() maps fields from
spi_board_info to spi_device like this:

drivers/spi/spi.c:spi_new_device() {
    ...
    proxy->max_speed_hz =3D chip->max_speed_hz;
    proxy->mode =3D chip->mode;
    proxy->irq =3D chip->irq;
    ...
}

Does this omission mean devices instantiated via spi_register_board_info()
or ACPI cannot configure post-configuration high-speed capabilities?

[Severity: High]
Is a bounds check needed for post_config_max_speed_hz against the
controller's maximum speed? In __spi_setup(), spi->max_speed_hz is correctly
capped:

drivers/spi/spi.c:__spi_setup() {
    ...
    if (spi->controller->max_speed_hz &&
        (!spi->max_speed_hz ||
         spi->max_speed_hz > spi->controller->max_speed_hz))
        spi->max_speed_hz =3D spi->controller->max_speed_hz;
    ...
}

Without a similar check for post_config_max_speed_hz, could a device tree
misconfiguration instruct the SPI controller to drive a clock frequency
exceeding its physical hardware limits, potentially leading to invalid
divider calculations or hardware lockups?

[Severity: Medium]
Should post_config_max_speed_hz also be propagated to proxy and ancillary
devices? When an ancillary device is created, max_speed_hz and mode are
copied, but post_config_max_speed_hz is omitted:

drivers/spi/spi.c:spi_new_ancillary_device() {
    ...
    ancillary->max_speed_hz =3D spi->max_speed_hz;
    ancillary->mode =3D spi->mode;
    ...
}

Similarly, in drivers/spi/spi-mux.c, the child device's settings are copied
to the multiplexed proxy device:

drivers/spi/spi-mux.c:spi_mux_select() {
    ...
    priv->spi->max_speed_hz =3D spi->max_speed_hz;
    priv->spi->mode =3D spi->mode;
    priv->spi->bits_per_word =3D spi->bits_per_word;
    ...
}

Will this omission silently break the ability of multiplexed or ancillary
devices to use PHY tuning and high-speed post-config rates?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929063529.1235=
417-1-s-k6@ti.com?part=3D3
