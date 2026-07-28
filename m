Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C96400969
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232279; cv=none; b=IRtOcaBF/StRt9HoFpb9flDwmDiDfGYvUm2Rq3bPafzkuS6kbICUea6EDHNPAlEWlcI0F8YccSOvjkoYJmNkfv1RQPPrEZjW0YkWZeDsL080QRSz4O9hm8rjVjdQDN0lEjlajTAYJoSFURbAeqFUC/zIFXdRBDhyIRKJRTbJ3JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232279; c=relaxed/simple;
	bh=mL+z3shnthRRIq+8ZXQtErBAba0ZM/LsaPNVgeV9474=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HTKAgvcPMgfMNW0M9mUdn7C+LFNcaXiIiv/S5LFISBp/yfgJF7S1R1mtxhn8ObNf5BNCjkpd6KN5YCOq1KQkebWHkLKlpZLJb3UBhtYEhl3HZ/CkBGYFJcl/IQdoYMlUGYyRedqYtPSkh2bZ8U9eC/cu+Y8zXdJIwgQcPzs8WDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXvTEfzL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXvTEfzL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5B21F00A3A;
	Tue, 28 Jul 2026 09:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785232278;
	bh=MNoyTRDHpsEQiazj5ATV/QhrVdVERcgVbK95ol9/TDs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oXvTEfzLZmDiHTBverNfTt0s2P5OnS1S7kdUeGfNO2rEI5bxJ0pYOOd36sQsvusFV
	 LhqXnd5EELLiLlxEPTl1hfOwiuv48G8cTRGXBBJyK3rRBQU0UUrlz07yIdMbyC2UaA
	 LbKVzJEEqGJvUwWgoUWhYIVaytREQ4biEbJ5TXOIoJvIS4DbiZMpCIzEhsRHwmYXTT
	 Ex5GQwyaPvTgBEgrmlBlJpsShORG9jhLkT/TXmEmF0g7N35DHZC/KDJ6df/4bY6g4e
	 Atcvq4dsv6MjfJDBJme09x/n8jKjQeysDFUxykg1bYwq8svw1uWioVcWPcpnaI106h
	 GL+yqjo6Q+pAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: vkoul@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, olteanv@gmail.com, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:51:17 +0000
Message-Id: <20260728095117.AE5B21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The Kconfig symbol VIDEO_QCOM_CAMSS selects a non-existent symbo=
l PHY_QCOM_MIPI_CSI2.
- [Medium] Missing phy_exit() calls on probe error paths leak initialized P=
HY hardware states.
- [Medium] The return value of phy_mipi_dphy_get_default_config_for_hsclk()=
 is ignored.

Pre-existing issues:
- [High] Dereferencing csiphy->cfg.csi2 without checking causes a NULL poin=
ter dereference if no sensor is bound.
--

--- Patch [3]: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API =
devices ---
commit 7ad9edf4c6cb1def82d912d6116e4eddc0da65e4
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Add support for PHY API devices
   =20
Add the ability to use a PHY pointer which interacts with the standard PHY
API. In the first instance the code will try to use the new PHY interface.=
=20
If no PHYs are present in the DT then the legacy method will be attempted.

> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index 4eda48cb1adf0..1edc5e5a1829e 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_SG
>  	select V4L2_FWNODE
> +	select PHY_QCOM_MIPI_CSI2

[Severity: Medium]
Does the PHY_QCOM_MIPI_CSI2 config symbol exist in the tree?

It looks like VIDEO_QCOM_CAMSS selects a non-existent symbol here, which
could lead to unmet dependencies or silent configuration issues where the
feature remains disabled.

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 539ac4888b608..e00748dd83b02 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c

[ ... ]

> +static int csiphy_stream_on(struct csiphy_device *csiphy)
> +{
> +	u8 bpp =3D csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->f=
ormats->nformats,
> +				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> +	struct csiphy_lanes_cfg *lncfg =3D &csiphy->cfg.csi2->lane_cfg;

[Severity: High]
This is a pre-existing issue, but can this dereference csiphy->cfg.csi2
while it is NULL if no remote sensor endpoint is defined in the Device Tree?

Since csiphy->cfg.csi2 is populated exclusively in the async notifier's
bound callback (camss_subdev_notifier_bound), if no sensor is bound, could
an unprivileged user trigger a NULL pointer dereference by calling the
VIDIOC_SUBDEV_S_STREAM ioctl on the /dev/v4l-subdevX node?

> +	struct phy_configure_opts_mipi_dphy *dphy_cfg;
> +	union phy_configure_opts dphy_opts =3D { 0 };
> +	struct device *dev =3D csiphy->camss->dev;
> +	u8 num_lanes =3D lncfg->num_data;
> +	s64 link_freq;
> +	int ret;
> +
> +	dphy_cfg =3D &dphy_opts.mipi_dphy;
> +
> +	link_freq =3D camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lane=
s);
> +
> +	if (link_freq < 0) {
> +		dev_err(dev,
> +			"Cannot get CSI2 transmitter's link frequency\n");
> +		return -EINVAL;
> +	}
> +
> +	phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes, dphy_c=
fg);

[Severity: Medium]
Does phy_mipi_dphy_get_default_config_for_hsclk() return an error code that
should be checked here?

If it fails, dphy_opts might remain zero-initialized when passed to
phy_configure() below.

> +
> +	phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
> +
> +	ret =3D phy_configure(csiphy->phy, &dphy_opts);

[ ... ]

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..84097d82d99c9 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c

[ ... ]

> @@ -5131,8 +5207,10 @@ static int camss_register_entities(struct camss *c=
amss)
> =20
>  	i =3D camss->res->csiphy_num;
>  err_reg_csiphy:
> -	for (i--; i >=3D 0; i--)
> -		msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +	for (i--; i >=3D 0; i--) {
> +		if (csiphy_enabled(camss, &camss->csiphy[i]))
> +			msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +	}
> =20
>  	return ret;
>  }

[Severity: Medium]
Does this error path leak the PHY hardware states?

In camss_init_subdevices(), phy_init() is called for each CSIPHY port.
If camss_register_entities() fails on index 'i', this rollback loop starts
at 'i--', skipping the unregistration (and therefore phy_exit()) for the
failing index 'i' and any other initialized PHYs that hadn't been processed
yet.

Likewise, if probe fails later and jumps to err_genpd_cleanup in
camss_probe(), are the previously initialized PHY states properly cleaned u=
p?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org?part=3D3
