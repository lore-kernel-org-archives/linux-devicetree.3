Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F93E3AB27D
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 21:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778792544; cv=none; b=OO15s5P5SUrErB/8bwEIYJ0Oh3MBw6Dz+ckq7qYG3KisPq7OVLB8AR/NEDb6TwnWlpHl1luJXdAHi2/2QNkxp/g3oKSi/vzj5phltSGfH8QIbFQt5gT0/Xs1Tv8EgMnoYo57d4TEczZIOjIebmZbkS3PYPFnSED6eaXNP37J5X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778792544; c=relaxed/simple;
	bh=eHRN/rmLxe0PUoH1MeSV+i8mbVD52E1PUGHu1kBDfGk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fFkFuPQQya4ovj2JdDHqWsxoSfbXy5xgLaVpng068qmm7VHLttvPjf37iOFesQRY+Gx4avcjH4mtHzp4tH83HgGqBltnKbYhjnrvAhW1ieNEMfVDaLlhgnoru5bGieVyowAK50NAkTvz3jc9eJks9fa/zBs1GVkLdJZ96TckeNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyqkff3v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyqkff3v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D01AC2BCB3;
	Thu, 14 May 2026 21:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778792543;
	bh=eHRN/rmLxe0PUoH1MeSV+i8mbVD52E1PUGHu1kBDfGk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qyqkff3vKBKeuuP0AWapHTlu/nh+OEQMzaF2801fvUyx5XHq21ZVjSxFpbDfx9EYv
	 PNfs4opuQoaOLwMUzdod9F+MgvzwgdUgFAYovYYMgqXdL7yXz3AkiAo6Pjql17NQrX
	 K7f8xA6ilm4XLQYRxNSqWMVQXwEixujL4L8y+C1a52HZBkiv5OZyIhn2mAufJUvlWV
	 GtMEHcln7Ef2aMQRoKpbW4BO51Xuk0Zi7il2zEil6+cWrN0PCzZO2oX7e4TfXlGJpH
	 8Jx9yeL9Hk+Pil28mbv0fcZx29hVuwtY86aGA0zQPeXyAkpXurJbuCu+ZTpBEc/bB/
	 ki93NfS6E+nsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: Add panel driver for Chipone ICNA35XX
 based panels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling via B4 Relay" <devnull+webgeek1234.gmail.com@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514-icna35xx-v2-2-45acd1dfa566@gmail.com>
References: <20260514-icna35xx-v2-2-45acd1dfa566@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 21:02:23 +0000
Message-Id: <20260514210223.8D01AC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Missing DRM_DISPLAY_DSC_HELPER select causes link errors.
- [High] Missing NULL pointer check for `connector` in `icna35xx_get_curren=
t_mode()`.
- [High] Backlight operations send DCS commands without verifying panel pow=
er state.
- [High] Data race on `dsi->mode_flags` between sysfs backlight operations =
and DRM panel operations.
- [Medium] Failure to restore `MIPI_DSI_MODE_LPM` flag on error paths in ba=
cklight operations.
- [Medium] The error path in `icna35xx_prepare()` disables regulators witho=
ut first asserting the reset GPIO.
--

commit 39fa40429bef32de4454951a077f1a44f88692ba
Author: Teguh Sobirin <teguh@sobir.in>

drm/panel: Add panel driver for Chipone ICNA35XX based panels

This adds support for the ICNA3512 and ICNA3520 DDICs used in the AYN Odin 2
Portal and for both the AYN Odin 3 and the AYN Thor top panel respectively.

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

The driver code explicitly calls drm_dsc_pps_payload_pack(), which is
exported by drivers/gpu/drm/display/drm_dsc_helper.c. Should this config
also select DRM_DISPLAY_DSC_HELPER to avoid undefined reference link errors?

[ ... ]

> diff --git a/drivers/gpu/drm/panel/panel-chipone-icna35xx.c b/drivers/gpu=
/drm/panel/panel-chipone-icna35xx.c
> new file mode 100644
> index 0000000000000..958f205a7f4f9
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-chipone-icna35xx.c
> @@ -0,0 +1,619 @@

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

Can connector be NULL here? It appears pinfo->connector is only initialized
during get_modes(). If the panel's prepare() callback is invoked before
get_modes() (for instance, if userspace forces a modeset without querying
modes), dereferencing connector->state when connector is NULL could cause a
kernel panic.

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

Does this error path need to assert the reset GPIO before disabling the
regulators? The icna35xx_reset() function leaves the reset_gpio deasserted,
and properly powering down the panel usually requires asserting the reset
GPIO (driving it to 1, as done in icna35xx_unprepare()) to avoid backpoweri=
ng
and leakage current.

> +		dev_err(panel->dev, "failed to initialize panel: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int icna35xx_disable(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo =3D to_panel_info(panel);
> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D pinfo->dsi };
> +
> +	pinfo->dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;

Could this non-atomic modification of dsi->mode_flags race with the sysfs
backlight callbacks?

Sysfs operations are protected by the backlight subsystem's ops_lock, while
DRM panel callbacks use modeset locks. Concurrent execution could lead to
interleaved read-modify-write operations, potentially corrupting flags like
MIPI_DSI_CLOCK_NON_CONTINUOUS.

> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 50);

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

Since userspace can trigger sysfs callbacks at any time, can this send DCS
commands when the panel is suspended or disabled?

Sending commands to an unpowered panel could cause DSI bus transfer timeouts
or hardware hangs. Does the driver need to check if the panel is prepared
before accessing the hardware?

> +	if (ret < 0)
> +		return ret;

If mipi_dsi_dcs_set_display_brightness_large() fails, the function returns
early without restoring the MIPI_DSI_MODE_LPM flag. Will this leave the
hardware in High Speed mode for all subsequent communications?

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

The same concerns about unpowered panels apply here.

> +	if (ret < 0)
> +		return ret;

The same flag restoration issue on the error path also appears here.

> +
> +	dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +	return brightness;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-icna35xx-v=
2-0-45acd1dfa566@gmail.com?part=3D2
