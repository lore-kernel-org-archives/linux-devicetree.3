Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6852230569E
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 06:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779864650; cv=none; b=IJI1Lare+FLXtH7akn5wlaKjdFXZ6TauhNlkaziCtgNrGc5qe2mSrP4zBg52L+MpxLLBMHXJ1ZvGEC5/jWjyXsyodux91BLha87dGcv+vy+qGy+DFDwDmkBMS7XnMQ1N8Lq91d4AXa2U+xeVWCYlcWJdoGjMY+4a9qm5vg0MNYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779864650; c=relaxed/simple;
	bh=n+HDfqvN8xB9O1HmQfuDq5j0YVBXfkNB41XBVjroJQo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CsGTj6QPqTFOT76GHZ6jSLspn/Ks9jz7z6NbWehCQzDAzuqGVj3MMTsc0Qm3BwLsJtJmiZm6BjhXyig1KyKRExy0DhLz51jEiLVNB9mFaaKfFAjdtzQOxAcOYvC/pazzauxsgQK3rwA7b0SzKPZom8DiyCZSa5zZiIXgl3lKjXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0rrRXFc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0rrRXFc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE021F000E9;
	Wed, 27 May 2026 06:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779864648;
	bh=g08b8Y+O04yg+AM9FtoNiEnuUv9zDvlV1CfNZGZTjTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K0rrRXFcLbH2AdbnzwuT0yOLp34M6G5h740qJ3Ql7ttWvB962Wz1lrb5LFjs+mSlX
	 rXLsYAOddHFARB7jTGs+x1lmfPLGBeTmCZkztQ/+PRPoVnDzf3rSCKM4JlsnE+g7we
	 iDWwkKmerZvfNq2XVTMiyKTYKnoI7BqulCAygEBxDl2DkKNI+Vazn7MOC2HC1LvbOD
	 C4GuSspSGS/vlnwNP97uSw53Ro6GnGeeba0dQrellTIa11kHXWdt4jPFsC4De75+oZ
	 5Th723lw6qMOhV6ms+fhWaa/+B2TQMt9supXET5igePxrX/q9we+FDLlOAadskTmg+
	 QjbbF1GjzRbUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] drm/panel: Add Ilitek ILI9488 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Reznichenko" <igor@reznichenko.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527062300.88928-3-igor@reznichenko.net>
References: <20260527062300.88928-3-igor@reznichenko.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 06:50:47 +0000
Message-Id: <20260527065048.7DE021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing NULL check for the return value of `device_get_match_data(=
)`, leading to a potential NULL pointer dereference.
- [Medium] Missing color depth (bpc) assignment in connector display_info.
- [Low] The MIPI DCS command `MIPI_DCS_ENTER_INVERT_MODE` (0x21) is incorre=
ctly sent with a superfluous parameter.
--

commit 8971cceb8f9149b896a3175bdf0f536b85a67eda
Author: Igor Reznichenko <igor@reznichenko.net>

drm/panel: Add Ilitek ILI9488 controller driver

This commit adds support for the Ilitek ILI9488 DSI controller used in
the FocusLCDs E35GH-I-MW800-CB panel. It includes the initialization
sequence and mode timings adjusted after STM32MP157 testing.

> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9488.c b/drivers/gpu/d=
rm/panel/panel-ilitek-ili9488.c
> new file mode 100644
> index 0000000000000..b2145cbe8c303
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9488.c

[ ... ]

> +static void e35gh_i_mw800cb_init(struct mipi_dsi_multi_context *ctx)
> +{

[ ... ]

> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xE9, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xF7, 0xA9, 0x51, 0x2C, 0x82);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x00);

[Severity: Low]
Is the extra parameter intended here? The 0x21 command corresponds to the
standard MIPI DCS enter invert mode command, which typically takes 0
parameters. Providing 0x00 creates a DCS short write with 1 parameter, which
might be rejected by strictly compliant hardware.

> +}

[ ... ]

> +static int ili9488_get_modes(struct drm_panel *panel, struct drm_connect=
or *connector)
> +{
> +	struct ili9488 *ili =3D panel_to_ili9488(panel);
> +	const struct drm_display_mode *mode =3D ili->desc->display_mode;
> +

[Severity: Medium]
Should this function also set connector->display_info.bpc? The panel
is configured for the 18-bit RGB666 pixel format (MIPI_DSI_FMT_RGB666_PACKE=
D),
but the bpc isn't explicitly assigned to 6. Without this, the DRM core might
assume a default 8 bpc color depth and cause upstream controllers to output
the wrong format.

> +	return drm_connector_helper_get_modes_fixed(connector, mode);
> +}

[ ... ]

> +static int ili9488_dsi_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev =3D &dsi->dev;
> +	struct ili9488 *ili;
> +	int i, ret;
> +
> +	ili =3D devm_drm_panel_alloc(dev, struct ili9488, panel, &ili9488_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ili))
> +		return PTR_ERR(ili);
> +
> +	ili->desc =3D device_get_match_data(dev);
> +	mipi_dsi_set_drvdata(dsi, ili);
> +	ili->dsi =3D dsi;
> +
> +	dsi->mode_flags =3D ili->desc->mode_flags;

[Severity: High]
Can device_get_match_data() return a null pointer here if the driver is
bound manually via sysfs? If it does, dereferencing ili->desc for
dsi->mode_flags will cause a null pointer dereference. Is a check needed
before accessing ili->desc?

> +	dsi->format =3D ili->desc->format;
> +	dsi->lanes =3D ili->desc->lanes;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527062300.8892=
8-1-igor@reznichenko.net?part=3D2
