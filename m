Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB97E3CF1FA
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782787661; cv=none; b=ahDS2zb+myXqcSm7vbfe9qoJp35cQ2jRsgLxxtz+A0xfWhtDj0QYg8imK1wkR8W1EIBm5QhEPseRz6t7/N4QrOoiPvc4TbM7qIhIzqeBvk9ToZ0o6MjbznJLXvSwialXfpkHCaoYil95X1m458ti1QWcijiBQi8lB9qcFQXmvHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782787661; c=relaxed/simple;
	bh=UIfNhEvhtRw4oYxLQ4Jo6TdwWoD5YNFeJMW7uhMOcqY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E9Jp66yzog7fPG3//AZBBeD0lT7oGIc/7kYInsxKbxLv0FiXyvIxB0INHIzXpI52cYtj4nArj/Kct3VAMk4oN8PDEBbaqga5PmAH0rFOtyi2WVpqjPxuDHHDYNcRV6yvQ8WVOMr0nEad3rSt3fAIRyIo6/Y6pJEYxgceV/IUNus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nf2C7o6i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nf2C7o6i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684231F000E9;
	Tue, 30 Jun 2026 02:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782787659;
	bh=kNhcYq7dXKcWI+YTnj5UlFa+m8enRtVVXhSDjp8kDss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nf2C7o6iEb6xGd7Pw6yZ2x7+kyvi/V7MqTqDDRU5Ekg/+1KvF6h0DxXhFrDVFcOyW
	 DxGwPh14Kv1h8Mgnf2Ugh4cRMwfzOEZAbMwkv1W5ajnZus5eUn8ZUvqlCUbuxGigYJ
	 aUNCLA8l00ZsTCBN+iJwDTLZw8FgLkMmMMEZpfbNn9+E4ba5Y79MLZJRhTWgIgAVoF
	 qxLp4GyC3qAJe5L+h7JArfqlqoOIYDrlgLG479OyRl6mPZVApulE5TNpvvjQ6IWKEM
	 sBd605XjbO0YNu07Q1DQ5QFMCeJS/bKxtgS2aIE4jOamIEydrysbgZL+L5EaDmH3VE
	 8vtQX6QKfAAIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/panel: Add Novatek NT36536 panel driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260630023439.248861-3-mitltlatltl@gmail.com>
References: <20260630023439.248861-1-mitltlatltl@gmail.com>
 <20260630023439.248861-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 02:47:39 +0000
Message-Id: <20260630024739.684231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Missing drm_panel_remove() in the probe error paths for backlight =
initialization leads to a use-after-free on the global panel list.
- [High] The panel is registered and exposed to the system via `drm_panel_a=
dd()` before its initialization is complete, causing a race condition.
- [High] Incomplete `drm_dsc_config` static definition leaves critical para=
meters like `pic_width`, `pic_height`, and rate-control values as 0, breaki=
ng DSC.
- [Medium] Unchecked DSI multi-context accumulated error in `novatek_prepar=
e()` during DSC configuration masks transmission failures.
- [Medium] Missing rollback of hardware state and regulators when `backligh=
t_enable()` fails in `novatek_prepare()`.
- [Medium] DCS backlight commands issued in `novatek_bl_update_status()` wi=
thout verifying the panel power state.
- [Low] Missing Kconfig dependency on `DRM_DISPLAY_DSC_HELPER`.
--

commit 86b2b70476faa9f551d7227512ce180811421366
Author: Pengyu Luo <mitltlatltl@gmail.com>

drm/panel: Add Novatek NT36536 panel driver

Add a driver for panels using the Novatek NT36536 Display Driver IC,
including support for the CSOT PP8807HB1-1, a 10-bit panel found in
LENOVO Legion Y700 Gen4.

> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 7450b27622a23..3912b79a2ebb2 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -620,6 +620,17 @@ config DRM_PANEL_NOVATEK_NT36523
>  	  around the Novatek NT36523 display controller, such as some
>  	  Boe panels used in Xiaomi Mi Pad 5 and 5 Pro tablets.
> =20
> +config DRM_PANEL_NOVATEK_NT36536
> +	tristate "Novatek NT36536 panel driver"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_KMS_HELPER

[Severity: Low]
Does this config also need to select DRM_DISPLAY_DSC_HELPER? The driver
utilizes DSC helper functions like drm_dsc_pps_payload_pack(), which could
cause a linker error if DRM_DISPLAY_DSC_HELPER is not selected by another
module.

> +	help
> +	  Say Y here if you want to enable support for Novatek NT36536-based
> +	  display panels, such as the one found in the LENOVO Legion Y700
> +	  Gen4.
> +
>  config DRM_PANEL_NOVATEK_NT36672A
[ ... ]
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36536.c b/drivers/gpu/=
drm/panel/panel-novatek-nt36536.c
> new file mode 100644
> index 0000000000000..3ad21fcdf9f02
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36536.c
[ ... ]
> +static int novatek_prepare(struct drm_panel *panel)
> +{
> +	struct novatek *ctx =3D to_novatek(panel);
> +	struct mipi_dsi_device *dsi =3D to_primary_dsi(ctx);
> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> +	struct drm_dsc_picture_parameter_set pps;
> +	struct device *dev =3D &dsi->dev;
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(novatek_supplies),
> +				    ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	novatek_reset(ctx);
> +
> +	ret =3D ctx->desc->init_sequence(&dsi_ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(novatek_supplies),
> +				       ctx->supplies);
> +		return ret;
> +	}
> +
> +	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
> +	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
> +	mipi_dsi_compression_mode_multi(&dsi_ctx, true);
> +	mipi_dsi_msleep(&dsi_ctx, 28);
> +
> +	return backlight_enable(ctx->backlight);

[Severity: Medium]
Will the DSI command failures accumulated in dsi_ctx.accum_err be silently
ignored here? The mipi_dsi_*_multi() macros capture errors in the context,
but the function returns the result of backlight_enable() without checking
the accumulated error state.

[Severity: Medium]
If backlight_enable() returns an error, will the hardware state leak? The
function exits without rolling back the regulators or the reset GPIO state
that were enabled earlier in the function, and the DRM core will not call
novatek_unprepare() on a prepare failure.

> +}
[ ... ]
> +static int novatek_bl_update_status(struct backlight_device *bl)
> +{
> +	struct novatek *ctx =3D bl_get_data(bl);
> +	u16 brightness =3D backlight_get_brightness(bl);
> +
> +	return mipi_dsi_dcs_set_display_brightness_large(to_primary_dsi(ctx),
> +							 brightness);

[Severity: Medium]
Could this send DCS commands over a disabled DSI bus? If userspace modifies
the backlight brightness via sysfs while the panel is off (such as after
novatek_unprepare() has run), it looks like the commands are sent without
verifying if the panel is currently prepared and powered.

> +}
[ ... ]
> +static struct drm_dsc_config csot_pp8807hb1_1_dsc_cfg =3D {
> +	.dsc_version_major =3D 1,
> +	.dsc_version_minor =3D 2,
> +	.slice_height =3D 20,
> +	.slice_width =3D 476,
> +	.slice_count =3D 2,
> +	.bits_per_component =3D 10,
> +	.bits_per_pixel =3D 8 << 4,
> +	.block_pred_enable =3D true,
> +};

[Severity: High]
Is this DSC configuration missing dynamic parameters? Fields like pic_width,
pic_height, and rate-control parameters default to 0 and don't appear to be
dynamically populated by the driver via drm_dsc_compute_rc_parameters()
before being packed in novatek_prepare().

[ ... ]
> +static int novatek_probe(struct mipi_dsi_device *dsi)
> +{
[ ... ]
> +	ctx->panel.prepare_prev_first =3D true;
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	for (i =3D 0; i < num_dsi; i++) {
> +		ctx->dsi[i]->lanes =3D desc->lanes;

[Severity: High]
Is it safe to expose the panel via drm_panel_add() before its initialization
is complete? Calling this early allows consumers like DRM bridges to access
the panel before ctx->dsi[i]->lanes is configured, devm_mipi_dsi_attach() is
executed, or the backlight is set up.

> +		ctx->dsi[i]->format =3D desc->format;
> +		ctx->dsi[i]->mode_flags =3D desc->mode_flags;
> +		ctx->dsi[i]->dsc =3D &ctx->dsc;
> +		ret =3D devm_mipi_dsi_attach(dev, ctx->dsi[i]);
> +		if (ret < 0) {
> +			drm_panel_remove(&ctx->panel);
> +			return dev_err_probe(dev, ret,
> +					     "Failed to attach to DSI host\n");
> +		}
> +	}
> +
> +	if (desc->has_dcs_backlight) {
> +		ctx->backlight =3D novatek_create_backlight(ctx);
> +		if (IS_ERR(ctx->backlight))
> +			return dev_err_probe(dev, PTR_ERR(ctx->backlight),
> +					     "Failed to create backlight\n");

[Severity: High]
Does this leak the panel registration on error? The function returns
directly without calling drm_panel_remove(&ctx->panel), leaving a dangling
pointer in the global panel_list.

> +	} else {
> +		ret =3D drm_panel_of_backlight(&ctx->panel);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to get backlight\n");

[Severity: High]
Similarly, does this alternative error path also need to remove the panel
from the global list to prevent a use-after-free?

> +	}
> +
> +	return 0;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630023439.2488=
61-1-mitltlatltl@gmail.com?part=3D2
