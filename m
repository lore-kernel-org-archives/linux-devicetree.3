Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94756282F39
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492512; cv=none; b=c5n4RbcFBmVOAZuNjpDDDIKCmpsRCJ7/myFyxJCzgKPv4K3k8OHM/X3dl6fwzG4wbnBwdBwfQ2szUgHom/UxzPo+/TinzJq4TWU+9Ahn25foNA/f9YPkhaX8uL3R5HIeHU0KQj+k72v+gHnvLJ2CI0mAS64BRX2d237kNwvtRJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492512; c=relaxed/simple;
	bh=9Ka28VBnBHbOCZs2xk+dhQ9dZNrYGTpmWTmOpy9Y5Ak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gfhNDbC08llesjzxGxRUwTWMpkm+mh0U8r1MUJEs/YPNbCKRyDJ8RIqdZNdR8KP/7NFKlAKP3UsTF1plqV2yW1gYNAmde4GZqRdsBuLnttNU/ZIfhxaj4HP5t+K0fT4xu43N3CZ7tLnhqlSNJ1qH1Guvjqw8XT2h4qwuB43dg3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0FcG77Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0FcG77Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB461F00898;
	Wed,  3 Jun 2026 13:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780492511;
	bh=nQNQ9YkLFQtxS5oxLy9KTjWwLnIm9mOVDOGfHDePJ7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c0FcG77Z43Yd3oG4yVuqTkZY0fcHrTbffhRck/njgRsHGenvrMfnsf2DRqyCtr01g
	 V6sextLEgdfSQZFMwXx+86Qi5BV2v5sKvqjbzYrW4g0KilpxLHBgBpG+mRt1TrkCcL
	 9rKKNL0UpDqZUJWxI08P2o2AOjdS6LNOSIH8JdgSN4G0O1Ukbk1/lcT3IbJW/4HeSr
	 3z8/bqZpsYhAN3niTSdIYzfFjc+9LRqrfcEtYs6jYTqOQOygCC3xbZzeFm3VUDlEyl
	 T+fbhKTU6uuuwIMI9tKEkhWdqLBnCYgNFPISeFkCMU8xoh5f90JwFfSrBnRWsgD8Fi
	 FB7ltXTi+JLnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/panel: Add BOE BF068MWM-TD0 panel driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Koskovich" <akoskovich@pm.me>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-asteroids-panel-support-v1-2-109c6ac81c8f@pm.me>
References: <20260603-asteroids-panel-support-v1-2-109c6ac81c8f@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 13:15:10 +0000
Message-Id: <20260603131510.BDB461F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] State corruption due to un-restored MIPI_DSI_MODE_LPM flag on erro=
r path
- [High] Uninitialized core DSC parameters result in malformed PPS payload
- [High] Concurrent unprotected bitwise modification of dsi->mode_flags
- [High] DCS commands sent to unpowered hardware due to missing state check
- [Medium] Resource leak on failure to setup DCS PPS or compression mode
- [Medium] Race condition exposing incomplete panel configuration during pr=
obe
- [Low] Missing Kconfig dependency for DRM_DISPLAY_DSC_HELPER
--

commit f349a000202648026372e12253353f6e49977419
Author: Alexander Koskovich <akoskovich@pm.me>
Subject: drm/panel: Add BOE BF068MWM-TD0 panel driver

Add the panel driver for BOE BF068MWM-TD0 support found in the Nothing
Phone (3a).

> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d592f4f4b939a..1e257657ef9ec 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
[ ... ]
> @@ -56,6 +56,17 @@ config DRM_PANEL_BOE_BF060Y8M_AJ0
>  	  uses 24 bit RGB per pixel. It provides a MIPI DSI interface to
>  	  the host and backlight is controlled through DSI commands.
> =20
> +config DRM_PANEL_BOE_BF068MWM_TD0
> +	tristate "BOE BF068MWM-TD0 panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE

[Severity: Low]
Since the driver invokes drm_dsc_pps_payload_pack(), should this config
select DRM_DISPLAY_DSC_HELPER to prevent potential build failures when the
DSC helper subsystem isn't enabled?

> +	help
> +	  Say Y here if you want to enable support for BOE BF068MWM-TD0
> +	  6.77" AMOLED modules. The panel has a 1080x2392 resolution and
> +	  uses 30 bit RGB per pixel. It provides a MIPI DSI interface to
> +	  the host and backlight is controlled through DSI commands.
> +
>  config DRM_PANEL_BOE_HIMAX8279D
>  	tristate "Boe Himax8279d panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/panel-boe-bf068mwm-td0.c b/drivers/gpu=
/drm/panel/panel-boe-bf068mwm-td0.c
> new file mode 100644
> index 0000000000000..bbf7aed196161
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-boe-bf068mwm-td0.c
[ ... ]
> +static int boe_bf068mwm_td0_prepare(struct drm_panel *panel)
> +{
> +	struct boe_bf068mwm_td0 *ctx =3D to_boe_bf068mwm_td0(panel);
> +	struct device *dev =3D &ctx->dsi->dev;
> +	struct drm_dsc_picture_parameter_set pps;
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(boe_bf068mwm_td0_supplies), ct=
x->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	boe_bf068mwm_td0_reset(ctx);
> +
> +	ret =3D boe_bf068mwm_td0_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(boe_bf068mwm_td0_supplies), ctx->sup=
plies);
> +		return ret;
> +	}
> +
> +	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
> +
> +	ret =3D mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
> +	if (ret < 0) {
> +		dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D mipi_dsi_compression_mode(ctx->dsi, true);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable compression mode: %d\n", ret);
> +		return ret;
> +	}

[Severity: Medium]
Will this error path leave the regulators enabled and the reset gpio unasse=
rted?

If mipi_dsi_picture_parameter_set() or mipi_dsi_compression_mode() fails, t=
he
function returns early but does not seem to clean up the hardware resources
enabled earlier in the prepare routine, potentially leading to a resource l=
eak
while leaving the hardware powered.

> +
> +	msleep(28);
> +
> +	return 0;
> +}
[ ... ]
> +static int boe_bf068mwm_td0_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> +	u16 brightness =3D backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;

[Severity: High]
Could this unprotected bitwise modification of dsi->mode_flags lead to data
races?

Since userspace can adjust backlight concurrently with display modeset
operations, altering these flags without synchronization might corrupt the
DSI mode state if read or written to by other threads.

> +
> +	ret =3D mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);

[Severity: High]
Does this code send DSI commands to hardware that might be powered off?

The backlight update_status callback doesn't appear to check if the panel h=
as
been prepared before sending DCS commands, which could result in bus timeou=
ts
and controller errors if triggered via sysfs while unpowered.

[Severity: High]
If mipi_dsi_dcs_set_display_brightness_large() fails, will the
MIPI_DSI_MODE_LPM flag remain permanently cleared?

> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
[ ... ]
> +static int boe_bf068mwm_td0_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev =3D &dsi->dev;
> +	struct boe_bf068mwm_td0 *ctx;
> +	int ret;
[ ... ]
> +	drm_panel_add(&ctx->panel);
> +
> +	/* This panel only supports DSC; unconditionally enable it */
> +	dsi->dsc =3D &ctx->dsc;

[Severity: Medium]
Is it safe to register the panel via drm_panel_add() before the DSC
parameters are configured and before attaching to the DSI host?

This exposes the panel globally while it's still structurally incomplete,
potentially leading to a race condition if another driver attempts to resol=
ve
the panel early.

> +
> +	ctx->dsc.dsc_version_major =3D 1;
> +	ctx->dsc.dsc_version_minor =3D 1;
> +	ctx->dsc.slice_height =3D 13;
> +	ctx->dsc.slice_width =3D 540;
> +
> +	ctx->dsc.slice_count =3D 1080 / ctx->dsc.slice_width;
> +	ctx->dsc.bits_per_component =3D 10;
> +	ctx->dsc.bits_per_pixel =3D 8 << 4; /* 4 fractional bits */
> +	ctx->dsc.block_pred_enable =3D true;

[Severity: High]
Will the absence of pic_width, pic_height, and rate control parameters here
result in a malformed PPS payload?

The drm_dsc_config struct is zero-initialized by devm_drm_panel_alloc().
Because these fields are omitted during probe, drm_dsc_pps_payload_pack()
will construct a zero-dimension PPS payload later, which may break display
compression.

> +
> +	ret =3D mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		drm_panel_remove(&ctx->panel);
> +		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-asteroids-=
panel-support-v1-0-109c6ac81c8f@pm.me?part=3D2
