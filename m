Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C2E282F14
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 17:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333556; cv=none; b=UhM5CSyXhGzqsFZ66kUZCXOQNhA64L9te0s2tPkLIy2qXtRW4PuxX5N+btEEvtsXUAU7s2nVFx7T2VLoiTEqfBUFxikz08XEGtH1nxIkYntJ196U+9uUgYMxtGYCLmYf3AQbMGVdTFXHSZmK2IILxEi+wmpRChES6vhFHE0D7gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333556; c=relaxed/simple;
	bh=NoPhZNXKyYUVeuknIHDJEUuxBa3Q/OVNKknOuwaHHIU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y4sPN7k7BiqGYCA/MotNL3jISB5c7c9zyTDY1c1xMnVI3c98fcRx+asbXky1A9lBpVTVQTGaBFm9JVq6zjgNXekNtle9MeoyU8SIRQrBWbntBMjiYLdm7k8XSvTe7l/OpLrqobFBTrBbjcUpMbuVw2z55NUs1jHntx7tBCngwx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lraGhaWh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lraGhaWh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238711F00893;
	Mon,  1 Jun 2026 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780333555;
	bh=ppt7pr8oDuqNWgjj9XkQ+6liCD9+cv9tfdNmCKM/eTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lraGhaWhVWrz6Fi+9cS84y5gvnySoXCAgWIhfqOK32PL1HKdso5HQrbvnl4gy5YGT
	 FbS7YKhX4MDWuIWgDOvVoJTSZ8gWLqdLVt431+KzrOzMSohjK06MRJqp3gh9/eSRQ/
	 hV6w5sTE7gAGN6cVas5oeU+LR3LFY1Pbbdmz9SrHTwKlm6y63NVubzt3VrWQ4BWxyI
	 vL0C0DH01fy5DSJRot0WWG+VsFKeiaKjCt6R1aYpQIAcTJbtfoQmO4TJDSyG4F2gBm
	 GoYCJcfuUcODcsW3c4a4lGyF95jIlPEXmemHHNzpedy9u/1zjijpZ/Hn+/X5miED3a
	 1a+7Eqegxy2pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 4/6] drm/panel: anbernic-td4310: Add RG Vita Pro
 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260601162951.254968-5-macroalpha82@gmail.com>
References: <20260601162951.254968-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 17:05:52 +0000
Message-Id: <20260601170554.238711F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The `enable` GPIO is incorrectly requested with an active state du=
ring `probe()`, violating typical power sequencing.
- [Medium] Missing cleanup of regulator and GPIOs in `prepare()` when MIPI =
DCS commands fail.
- [Medium] Panel-specific delay configuration fields are ignored in favor o=
f hardcoded values.
- [Low] The driver calls an undeclared function `devm_drm_panel_add()`, cau=
sing a build failure.
--

commit 574d8ed3e47c2bbb643d4d50b515ef3c4d8fd16e
Author: Chris Morgan <macromorgan@hotmail.com>

drm/panel: anbernic-td4310: Add RG Vita Pro panel

This commit adds support for the TD4310 MIPI DSI panel controller
used in the Anbernic RG Vita-Pro handheld gaming console.

> diff --git a/drivers/gpu/drm/panel/panel-anbernic-td4310.c b/drivers/gpu/=
drm/panel/panel-anbernic-td4310.c
> new file mode 100644
> index 0000000000000..d277682f63a3a
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-anbernic-td4310.c

[ ... ]

> +static int panel_anbernic_td4310_prepare(struct drm_panel *panel)
> +{

[ ... ]

> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 100);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 100);
> +
> +	return dsi_ctx.accum_err;

[Severity: Medium]
Does this code leave the vdd regulator and enable_gpio enabled if a DCS
command fails?

If dsi_ctx.accum_err is non-zero, this returns immediately instead of
jumping to the err_reset and err_enable cleanup labels.

> +
> +err_reset:
> +	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
> +err_enable:
> +	regulator_disable(ctx->vdd);
> +	return ret;
> +}
> +
> +static int panel_anbernic_td4310_unprepare(struct drm_panel *panel)
> +{
> +	struct anbernic_panel_td4310 *ctx =3D panel_to_anbernic_panel_td4310(pa=
nel);
> +	struct mipi_dsi_device *dsi =3D ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);

[Severity: Medium]
Is it intentional to use a hardcoded 120ms delay here instead of using
the panel-specific disable_delay or unprepare_delay fields defined in
the panel_info struct?

[ ... ]

> +static int panel_anbernic_td4310_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev =3D &dsi->dev;

[ ... ]

> +	ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Cannot get reset gpio\n");
> +
> +	ctx->enable_gpio =3D devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_H=
IGH);

[Severity: High]
Could requesting this GPIO with GPIOD_OUT_HIGH drive the signal active
before the vdd regulator is enabled in panel_anbernic_td4310_prepare()?

This might violate hardware power sequencing by driving control signals
active while the main panel IC is unpowered.

> +	if (IS_ERR(ctx->enable_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio),
> +				     "Cannot get enable gpio\n");
> +
> +	ctx->vdd =3D devm_regulator_get(dev, "vdd");

[ ... ]

> +	ret =3D drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return ret;
> +
> +	devm_drm_panel_add(dev, &ctx->panel);

[Severity: Low]
Is devm_drm_panel_add available in the DRM subsystem?

It looks like this might cause a build failure due to an implicit
function declaration.

> +
> +	ret =3D devm_mipi_dsi_attach(dev, dsi);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601162951.2549=
68-1-macroalpha82@gmail.com?part=3D4
