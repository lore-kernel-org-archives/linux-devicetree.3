Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAF72F8E8F
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 21:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778360965; cv=none; b=RJO3ndLgkH7HDd+t0lm/0o2sNh/FQxvC/6VkMpjyPwPtejlK2um9eVlktKLDlNMXnW3ly0S8gMQNJ9/rCsHOKH7UjwngBwPYo6rVb+d5xv/vNPVgKQYIWlbEwiz/gCBiuAfkye8BLW7Wwbw7OSPPLiuq/yaDxf7254CoL64vw90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778360965; c=relaxed/simple;
	bh=zyjOnPkff3IaF49sMt/MPb42ZzYXZO32I82H3jnMLMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RCua3sIvmh/8fD849udxRkcpg/s5Ihd0rTvC2xT1OXveDHJKtd69TX8hmuJ3J7vE8PEMslQsnGsz0FxNUGkgjqyl91sNXyFmQALDhCgQyVkRz2VYa5gvtA6oWaXtmzpJqq96MD5+EUgm2tnm2pcKEIc+LmMGmCy5UJ9hNQEK/kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qoFXbai8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qoFXbai8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E08C2BCB2;
	Sat,  9 May 2026 21:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778360964;
	bh=zyjOnPkff3IaF49sMt/MPb42ZzYXZO32I82H3jnMLMU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qoFXbai87tEbkK60y+c8KGCIVVVZxEtmYYObPiyi3oUsxANoSNSVIeNRc0UFOUvFR
	 q2UO3BFMPobNO96TKawI/vBdH91/CojFIVkOaYuhRjFaOxI3Yy6H4xWlck5PRiM9eE
	 JYk0jO8BggSGqwUNpWph0bNuNrEG8ulcAO4BpxfEpRHrNeUGYVIU4ojqrY/eQRgOeM
	 zWhEdb/T/gpFNNtf4xFOek0lvodRrrduUC09SDE+uhdyXq7LeXH31Yowt6rxf0v3YS
	 h5AfBanUwoUto5Hnq79NCYma9iHnm2Y9ptlsV3MScZQ/NT53TW/FuPWbQm1D8KnaBP
	 FuJydzsO7WIGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/panel: Add panel driver for Chipone ICNA35XX
 based panels
Reply-To: sashiko@lists.linux.dev
To: "Aaron Kling via B4 Relay" <devnull+webgeek1234.gmail.com@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260509-icna35xx-v1-2-688d3d4e10f9@gmail.com>
References: <20260509-icna35xx-v1-2-688d3d4e10f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 21:09:23 +0000
Message-Id: <20260509210924.69E08C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] NULL pointer dereference of `connector` in `icna35xx_get_current_m=
ode()`
- [High] Mutation of shared global static data (`dsi->dsc`)
- [High] Data races, state leaks, and unprotected hardware access in backli=
ght operations
- [Medium] Reset GPIO left deasserted on `icna35xx_prepare` error path
- [Low] Missing Kconfig dependency for DRM_DISPLAY_DSC_HELPER
--

commit c36140d9bdc899b722496ec403d1552b4c5aaf5a
Author: Teguh Sobirin <teguh@sobir.in>

drm/panel: Add panel driver for Chipone ICNA35XX based panels

This commit adds support for the ICNA3512 and ICNA3520 DDICs used in the AYN
Odin 2 Portal, Odin 3, and Thor top panels.

> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 7450b27622a23..1368b5a0b6c91 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -105,6 +105,17 @@ config DRM_PANEL_BOE_TV101WUM_LL2
>  	  Say Y here if you want to support for BOE TV101WUM-LL2
>  	  WUXGA PANEL DSI Video Mode panel
> =20
> +config DRM_PANEL_CHIPONE_ICNA35XX
> +	tristate "Chipone ICNA35XX panel driver"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_HELPER

Since the driver calls drm_dsc_pps_payload_pack(), should this also select
DRM_DISPLAY_DSC_HELPER? Otherwise, it might cause unresolved symbol linker
errors if the DSC helper isn't pulled in by another driver.

> +	help
> +	  Say Y here if you want to enable support for the panels built
> +	  around the Chipone ICNA3512 and ICNA3520 display controllers,
> +	  such as some Tianma panels used in AYN Odin2 Portal and Thor.

[ ... ]
> diff --git a/drivers/gpu/drm/panel/panel-chipone-icna35xx.c b/drivers/gpu=
/drm/panel/panel-chipone-icna35xx.c
> new file mode 100644
> index 0000000000000..1be903270db8e
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-chipone-icna35xx.c
[ ... ]
> +static int icna35xx_get_current_mode(struct panel_info *pinfo)
> +{
> +	struct drm_connector *connector =3D pinfo->connector;
> +	struct drm_crtc_state *crtc_state;
> +	int i;
> +
> +	/* Return the default (first) mode if no info available yet */
> +	if (!connector->state || !connector->state->crtc)
> +		return 0;

Can connector be NULL here? The pinfo->connector field is only populated
when icna35xx_get_modes() is invoked. If drm_panel_prepare() is called
before modes are probed, connector will be NULL and this will cause a NULL
pointer dereference.

[ ... ]
> +static int icna35xx_prepare(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo =3D to_panel_info(panel);
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(panel_supplies), pinfo->suppli=
es);
> +	if (ret < 0) {
> +		dev_err(panel->dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	icna35xx_reset(pinfo);
> +
> +	ret =3D pinfo->desc->init_sequence(pinfo);
> +	if (ret < 0) {
> +		regulator_bulk_disable(ARRAY_SIZE(panel_supplies), pinfo->supplies);

Does this error path leave the reset GPIO deasserted? When initialization
fails, it might be necessary to assert the reset GPIO
(gpiod_set_value_cansleep(pinfo->reset_gpio, 1)) before disabling the
regulators, similar to what icna35xx_unprepare() does.

> +		dev_err(panel->dev, "failed to initialize panel: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int icna35xx_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> +	u16 brightness =3D backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> +
> +	ret =3D mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (ret < 0)
> +		return ret;

Are there potential data races or state leaks here? The mode_flags are modi=
fied
using non-atomic bitwise operations without any locking, which could race w=
ith
icna35xx_disable() and icna35xx_prepare().

Also, if mipi_dsi_dcs_set_display_brightness_large() fails, the function
returns early without restoring MIPI_DSI_MODE_LPM, which permanently alters=
 the
panel's mode state for subsequent operations.

Finally, could this send DCS commands to a suspended panel? If userspace
alters brightness while the panel is off, there is no check ensuring the
hardware is powered on, which might trigger DSI bus timeouts.

> +
> +	dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +static int icna35xx_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> +	u16 brightness;
> +	int ret;
> +
> +	dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> +
> +	ret =3D mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
> +	if (ret < 0)
> +		return ret;

Similar to icna35xx_bl_update_status(), does this early return leak the
MIPI_DSI_MODE_LPM state? And is it safe to modify mode_flags here without
locking or checking if the panel is powered on?

> +
> +	dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +	return brightness;
> +}
[ ... ]
> +static int icna35xx_probe(struct mipi_dsi_device *dsi)
> +{
[ ... ]
> +	pinfo->dsi->lanes =3D pinfo->desc->lanes;
> +	pinfo->dsi->format =3D pinfo->desc->format;
> +	pinfo->dsi->mode_flags =3D pinfo->desc->mode_flags;
> +	pinfo->dsi->dsc =3D &pinfo->desc->dsc;

Is it safe to point dsi->dsc directly to the static global pinfo->desc->dsc?
DSI host drivers like MSM call drm_dsc_compute_rc_parameters(dsi->dsc), whi=
ch
computes and writes Rate Control parameters directly into the struct. This
modifies the globally shared descriptor in the .data section, potentially
corrupting state if multiple panels exist or if the driver is unbound and
rebound. Consider copying the DSC configuration to a dynamically allocated
structure.

> +
> +	ret =3D mipi_dsi_attach(pinfo->dsi);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +		drm_panel_remove(&pinfo->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-icna35xx-v=
1-0-688d3d4e10f9@gmail.com?part=3D2
