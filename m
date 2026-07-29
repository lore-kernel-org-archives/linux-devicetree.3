Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C98455179
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 16:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785342530; cv=none; b=tnqW52EEeb0lDQSF/YRoCMRbcgwXxLwuI9ca33gjU2zoX1rLsdKkyoadTQHJH9TxY0+Ok0bo0B9kn8s5mA+omkcvRAc6KcjMwQsWpJQueLQ2TnZgkHr5FIQBc8lTVh4OaYt4vz3uZYvpUHzcbP1Dp15R3Z0Jr9bR5kQxGNmWrXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785342530; c=relaxed/simple;
	bh=lKWJHyM4RSy0TdHGEFijpf+Z8oRzdo7rbppA8qtlHC4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LX8g4rxgewWoMBpCymnfUfMAnb4dgNvACVGILkijf6Ep+TMopvx+Nw8dEw2PjyjU6XD8X2ILMJapbGfN3xZCSYMa8q/Z1++YIWcEUH9Dd8lQWXKtaZWNNGNjiGiP4nUxQLQtoWNyqbupb2N8z8x1K13+/+sd6eRjPYXappKtR/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0deiFLW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0deiFLW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4A51F00A3A;
	Wed, 29 Jul 2026 16:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785342528;
	bh=2ZU4MmTRl7NLFp03kgOgYgDfEBP86YKKpiJ3J2MyIxA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X0deiFLW+vXSji7NMItzRn62n7YBk1LhsCr77N3E4SSr70rrAp7d5ctjvK1XkFM5Z
	 yt/hcvdYFXMyuF1ab9qv8kGKD6cn03KWX7nTnP1L7ZhwMVJFiQIJJKTX7oIBV7bNN4
	 1S2n732kwQz9IOrQmoSaCaZEtsgzUXlQdsJGlm0E8k+IbPrdL+W5wFi0Kf3vd7V5I/
	 yDhFSPyt83dxb/puQBocJ9KlJQIUH6EoEGC9LKvEvV3dzL0qrSNJrVN/c7UTx8J1jw
	 m0VrCoPsg4vUb6BLFikDwyMQuMWfPu0Y0p8iCL5vGlTk86pXzF4rnTNNBA+ufTw20o
	 lcqsl8vWXUtEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: Add Novatek NT36532 panel driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junjie Cao" <junjie.cao@linux.dev>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729160804.912826-3-junjie.cao@linux.dev>
References: <20260729160804.912826-1-junjie.cao@linux.dev>
 <20260729160804.912826-3-junjie.cao@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 16:28:47 +0000
Message-Id: <20260729162847.9F4A51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing Kconfig dependency for DRM_DISPLAY_DSC_HELPER leads to lin=
ker errors.
- [High] Improper use of DCS brightness helper inside a vendor sequence cor=
rupts the initialization payload.
- [Medium] Global static DSC configuration structure is assigned to device =
context and mutated by host drivers.
- [Medium] Missing DRM backlight device registration and OF backlight mappi=
ng.
- [Low] Panel physical dimensions are defined but not reported to DRM users=
pace.
--

--- Patch [2]: [PATCH v2 2/2] drm/panel: Add Novatek NT36532 panel driver -=
--
commit 5fca5767ad8caef139f4cb6c683a24fe7d77f970
Author: Junjie Cao <junjie.cao@linux.dev>
Subject: drm/panel: Add Novatek NT36532 panel driver

This commit adds a driver for panels using the Novatek NT36532 Display
Driver IC, specifically the CSOT PPC100HB1-1 found in the OnePlus Pad 2
tablets.

> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index cbdf7b8f7f7af..e88211e6859d7 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -664,6 +664,16 @@ config DRM_PANEL_NOVATEK_NT36523
>  	  around the Novatek NT36523 display controller, such as some
>  	  Boe panels used in Xiaomi Mi Pad 5 and 5 Pro tablets.
> =20
> +config DRM_PANEL_NOVATEK_NT36532
> +	tristate "Novatek NT36532-based MIPI-DSI panels"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	help
> +	  Say Y here if you want to enable support for the panels built
> +	  around the Novatek NT36532 display controller, such as some
> +	  CSOT panels used in OnePlus Pad 2 tablets. These panels are
> +	  typically dual-DSI and may use DSC (Display Stream Compression).
> +

[Severity: High]
Since the driver's csot_init_sequence() calls drm_dsc_pps_payload_pack(),
does this Kconfig entry need to select DRM_DISPLAY_DSC_HELPER? Building
this as a module without other DSC drivers enabled might result in
linker errors for the missing symbol.

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36532.c b/drivers/gpu/=
drm/panel/panel-novatek-nt36532.c
> new file mode 100644
> index 0000000000000..03f9a1b6aa5a4
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36532.c

[ ... ]

> +static int nt36532_get_modes(struct drm_panel *panel,
> +			     struct drm_connector *connector)
> +{
> +	struct nt36532 *ctx =3D to_nt36532(panel);
> +	const struct panel_info *panel_info =3D ctx->panel_info;
> +
> +	return drm_connector_helper_get_modes_fixed(connector,
> +						    &panel_info->display_mode);
> +}

[Severity: Low]
The function drm_connector_helper_get_modes_fixed() relies on the width_mm
and height_mm properties of the drm_display_mode passed to it. Since
csot_display_mode does not set these fields, the dimensions will remain 0x0.

Should nt36532_get_modes() manually set connector->display_info.width_mm
and height_mm using the physical dimensions defined in csot_panel_info?

[ ... ]

> +static int csot_init_sequence(struct nt36532 *ctx)
> +{
> +	struct mipi_dsi_device *dsi =3D to_primary_dsi(ctx);
> +	struct drm_dsc_picture_parameter_set pps;
> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };

[ ... ]

> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0xde);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0xd9);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0xd6);
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x00d4);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0xc2);

[Severity: High]
The surrounding sequence appears to use 1-byte payload writes to sequential
registers. The mipi_dsi_dcs_set_display_brightness_multi() helper transmits
a 2-byte payload.=20

Could this extra byte shift subsequent commands out of alignment and cause
parsing errors in the display IC firmware? Should this just be a standard
1-byte mipi_dsi_dcs_write_seq_multi() call for register 0x51?

[ ... ]

> +static struct drm_dsc_config csot_dsc_cfg =3D {
> +	.dsc_version_major =3D 1,
> +	.dsc_version_minor =3D 2,
> +	.slice_height =3D 20,
> +	.slice_width =3D 750,
> +	.slice_count =3D 2,
> +	.bits_per_component =3D 8,
> +	.bits_per_pixel =3D 8 << 4,
> +	.block_pred_enable =3D true,
> +};

[ ... ]

> +static int nt36532_probe(struct mipi_dsi_device *dsi)
> +{

[ ... ]

> +	for (i =3D 0; i < num_dsi; i++) {
> +		ctx->dsi[i]->lanes =3D panel_info->lanes;
> +		ctx->dsi[i]->format =3D panel_info->format;
> +		ctx->dsi[i]->mode_flags =3D panel_info->mode_flags;
> +		ctx->dsi[i]->dsc =3D panel_info->dsc_cfg;

[Severity: Medium]
This assigns a pointer to the global static structure csot_dsc_cfg directly
to the device context.

Because DSI host drivers (like the MSM DPU driver) actively mutate the
DSC parameters at runtime by calling drm_dsc_compute_rc_parameters(),
can this cause concurrent mutation of global state, especially on dual-DSI
setups?

[ ... ]

> +	ctx->panel.prepare_prev_first =3D true;
> +
> +	ret =3D devm_drm_panel_add(dev, &ctx->panel);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to add panel\n");

[Severity: Medium]
Is a call to drm_panel_of_backlight() or devm_backlight_device_register()
missing here? Without it, userspace might be unable to change the screen
brightness, or an external backlight might fail to turn on when the
panel is enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729160804.9128=
26-1-junjie.cao@linux.dev?part=3D2
