Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786C4158DCF
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 20:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780863921; cv=none; b=bjdh738sz8ogPuitIGl70CbdnI6d1dY+UiCovClC0PMbvpk3T+nqj54T4eCFPXrmPy4c1oTM7fVTICqmSfYyjMBAc/HktO0fP9WLZQLWrCeHSx7Xo1n2QxvOvvwV8pGQeYYamXoPxt2rLqAAfoaIqR93vFv6MHaGbL5Mfs6yuNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780863921; c=relaxed/simple;
	bh=LmfFsXmAlyfWixOjOsnqeyXAMkC9anjK0GifNHRiyQQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bqIzUn785mEWv0fx/eFGglCWqitGr9s8pv56LvLuMUNeqNX1hByPb+JN8UuwuVYNr4TZQyqsk10Igzj0UXxL6nPKhM3kSufK4CWxBAeNjXt1S3em5cAMmf4bT5V+lrzN+B3oFZZUdkIS9B0cOREc/Ksop6sRFA0L/OSyp6DheD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjAohl+b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjAohl+b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7355A1F00893;
	Sun,  7 Jun 2026 20:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780863920;
	bh=pe1fpB+5lYrRoR2jTFmpyFcx6mcbHWxaEz+Nofft1EQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OjAohl+bOWjytAuxfHcLEJNEwp/c8OOdOJkM5TlicueCaWRuKSJuCJCT0pR6s54dc
	 eUuTBxvD6pN1sEuTdjiDzRhVk2QxuG/tFE49Qn0w7fDaQ6id9LourNtqXxPdalUwhe
	 j+/4/vB83fPtkqV97t6Aevx8efaUMCkMq9TklA0fuceh1H1MipZTB/N/yBjocjLCg0
	 BwyR8+WUTnkJ7K1KYKpkyTnVW1P8zpS8RkUDg6IzxP7I1wyr9aEGaL51f4lbB2tdSK
	 oNDs5FCrdZgNWmtQetgNT14D2kXVlZd86ZHD1N/dlbxpnx6pSPZYDrmrHsDnoWP5O3
	 G2Fd4b+v35JjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] drm/panel: Add panel driver for Chipone ICNA35XX
 based panels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling via B4 Relay" <devnull+webgeek1234.gmail.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260607-icna35xx-v4-2-64de514add34@gmail.com>
References: <20260607-icna35xx-v4-2-64de514add34@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 20:25:19 +0000
Message-Id: <20260607202519.7355A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Hardware back-powering due to incorrect reset GPIO initialization =
and error handling.
- [High] Backlight sysfs callbacks send MIPI DCS commands to an unpowered p=
anel.
- [High] Data race on `dsi->mode_flags` corrupts hardware state configurati=
on.
- [Medium] Shared static data mutation in DSI DSC configuration.
- [Low] Missing Kconfig Dependency for DRM_DISPLAY_DSC_HELPER causes a buil=
d failure.
--

commit cb6f31a048e6cc4b007cabd737760b76820c7eb7
Author: Teguh Sobirin <teguh@sobir.in>

drm/panel: Add panel driver for Chipone ICNA35XX based panels

This commit adds support for the ICNA3512 and ICNA3520 display controllers
used in the AYN Odin 2 Portal, Ayaneo Pocket DS, AYN Odin 3, and Thor top
panels. It introduces unique compatibles for each panel while sharing the
common DDIC driver handling.

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

[Severity: Low]
Will this cause a build failure if DRM_DISPLAY_DSC_HELPER isn't enabled
elsewhere?

The panel driver unconditionally calls drm_dsc_pps_payload_pack() in its
initialization sequence, such as in icna3512_init_sequence().

Without explicitly selecting the DSC helper here, building the kernel with
this panel driver could result in an undefined reference linker error.
Should we add a select for DRM_DISPLAY_DSC_HELPER?

> diff --git a/drivers/gpu/drm/panel/panel-chipone-icna35xx.c b/drivers/gpu=
/drm/panel/panel-chipone-icna35xx.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-chipone-icna35xx.c
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

[Severity: High]
Does this error path need to assert the reset GPIO before disabling the
regulators?

If the initialization sequence fails, the regulators are turned off while t=
he
reset GPIO remains deasserted. Leaving the unpowered panel driven by the GP=
IO
signal could cause hardware back-powering issues.

[ ... ]
> +static int icna35xx_disable(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo =3D to_panel_info(panel);
> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D pinfo->dsi };
> +
> +	pinfo->dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;

[Severity: High]
Can this non-atomic modification to dsi->mode_flags race with the backlight
sysfs callbacks?

Since icna35xx_bl_update_status() also dynamically toggles MIPI_DSI_MODE_LPM
using non-atomic bitwise operations, a data race could occur if backlight
sysfs callbacks execute concurrently with DRM atomic modeset operations.

Could this silently corrupt the DSI host configuration by leaving the mode
flags in the wrong state? Is locking needed to serialize access to these
flags?

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

[Severity: High]
Could this dispatch MIPI DCS commands to an unpowered panel?

Because the backlight device is registered manually, it remains accessible =
to
userspace even when the panel is unprepared and suspended. If userspace
writes to the sysfs brightness attribute at that time, it might trigger bus
timeouts or host controller crashes.

Should this callback, along with icna35xx_bl_get_brightness(), verify the
panel's power state before sending DCS transactions?

[ ... ]
> +static int icna35xx_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev =3D &dsi->dev;
> +	struct panel_info *pinfo;
> +	int ret;
[ ... ]
> +	pinfo->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);

[Severity: High]
Could requesting this GPIO with GPIOD_OUT_LOW cause back-powering during
probe?

For a typical active-low reset pin, this logically deasserts it, potentially
driving a high voltage into the panel IC immediately during probe while its
regulators are still turned off.

Should it be initialized to a safe asserted state like GPIOD_OUT_HIGH
instead?

[ ... ]
> +	pinfo->dsi->lanes =3D pinfo->desc->lanes;
> +	pinfo->dsi->format =3D pinfo->desc->format;
> +	pinfo->dsi->mode_flags =3D pinfo->desc->mode_flags;
> +	pinfo->dsi->dsc =3D &pinfo->desc->dsc;

[Severity: Medium]
Since DSI host drivers dynamically compute and write DSC parameters into
dsi->dsc, will assigning this to the statically allocated pinfo->desc->dsc
mutate global data?

This could lead to state leakage across driver unbind and rebind cycles, or
cause race conditions if multiple panels of the same type are instantiated.
Should the driver allocate a per-instance struct drm_dsc_config instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607-icna35xx-v=
4-0-64de514add34@gmail.com?part=3D2
