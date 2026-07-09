Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8EC365A12
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608511; cv=none; b=MtQLrym+MT7nq4VS7xsg7EP01xVzEUGI7guhrbZymGvv8m27F0p3L33Tg6GBInoiD0dRXBS0hyhiRgndZHyTlNpZMLyGZ0Dl22KC18Jy4ahCIYo1V+CJQHFjKJs07+lknC4uGetZaWf9DhhZmViD8zZ/OBPGcAd82AWcH8Rm7NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608511; c=relaxed/simple;
	bh=uVkwusOQ5ExywF/pjcMFHsQB0KXBKUYc0T6wca9R4Sw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qV/HtcKvCASxRmvpGQ+1gE+Kx1lqQuRa717kcJA98s/ZajsOHYyrx2VKJINCqKhvBeSoR4/V4wZl0bHfZ5VsyAA6K0esDAtQfrN/S9P3+IHZxjZs5ILo+OEFmA29jQY+ITZ3FZe7F7spwqWr3Cy+fmoSyDU50+iVxTj8inl5wz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ckv/kRy1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ckv/kRy1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EE11F000E9;
	Thu,  9 Jul 2026 14:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783608509;
	bh=bbrylS/rmFKoAiTtEzOfQbjDTjYppF/9nkD34M2HetQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ckv/kRy1K4y+eG+f9tA5TARzGolpVpTlFG1r2RNBoK+dDE1NHN4G3wWk8xE5okEIN
	 +g2G1FQgIRjJHK6drqk5wVIZMyjAv4dYzLs5wk+p8572HEy8RxW8r7mjlz4MjuDIRn
	 l5GT/IAnmuU2kY2eNGzaLYyqBUhTw0SbqpCmLemfM+Se1xsrwPM6v2GTXzXTHV0XHv
	 J2GrN43m1mrFwRRoavyayPnSd/wh8lrPmMMkiawjYCiCbWi4kAiwpDWSI+QpN6jn/k
	 GmOVHX69xZNetcX9S2IKpCKtOAvggHyigpWhymWQP8ilOjEewJc1fVluup0drVkUbq
	 hzjaMho89a03A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] drm/panel: Add Novatek NT36536 panel driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260709142846.12463-3-mitltlatltl@gmail.com>
References: <20260709142846.12463-1-mitltlatltl@gmail.com>
 <20260709142846.12463-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:48:28 +0000
Message-Id: <20260709144829.15EE11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Unrolled resource leak and ignored DSI errors in `novatek_prepare(=
)`.
- [Medium] DCS commands are sent unconditionally in backlight update handle=
r.
- [Low] Missing Kconfig dependency for DSC helpers causes build failures.
- [Low] Manual call to `drm_panel_remove()` circumvents devres cleanup cont=
ract.
--

--- Patch [2]: [PATCH v3 2/2] drm/panel: Add Novatek NT36536 panel driver -=
--
commit c0321dc5c18b4a1a33b6415a4883e16993cea388
Author: Pengyu Luo <mitltlatltl@gmail.com>
drm/panel: Add Novatek NT36536 panel driver

This commit adds support for Novatek NT36536-based display panels,
specifically enabling the CSOT PP8807HB1-1 dual-link 10-bit panel found
in the LENOVO Legion Y700 Gen4.

> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index c0cc2bb4a3eb7..37b0938615673 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -650,6 +650,17 @@ config DRM_PANEL_NOVATEK_NT36523
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
Does this Kconfig entry need to select DRM_DISPLAY_DSC_HELPER?

Because the driver unconditionally uses drm_dsc_pps_payload_pack(), compili=
ng
the driver without DSC helpers enabled globally will result in undefined
reference linker errors. It seems this should also select DRM_DISPLAY_HELPE=
R.

> +	help
> +	  Say Y here if you want to enable support for Novatek NT36536-based
> +	  display panels, such as the one found in the LENOVO Legion Y700
> +	  Gen4.

[ ... ]

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36536.c b/drivers/gpu/=
drm/panel/panel-novatek-nt36536.c
> new file mode 100644
> index 0000000000000..2a82b54880c30
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

[Severity: High]
Does this error path leak resources and ignore DSI errors?

If backlight_enable() fails, it returns an error code directly. At this poi=
nt,
the panel regulators are still enabled and the reset GPIO is asserted.
Returning an error causes the DRM core to consider the prepare phase failed,
meaning novatek_unprepare() will never be called. This results in a permane=
nt
power leak.

Additionally, dsi_ctx.accum_err is completely ignored after sending DSC
configuration commands, silently masking DSI transmission failures.

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
Can this send DCS commands unconditionally while the panel is unpowered?

Because the backlight brightness can be modified via sysfs at any time, this
can execute when the panel is suspended, unpowered, and regulators are
disabled. Sending DSI commands in this state typically results in DSI host
controller timeouts and kernel error logs. Should the driver verify the pan=
el
is prepared before sending DCS commands?

> +}

[ ... ]

> +static int novatek_probe(struct mipi_dsi_device *dsi)
> +{

[ ... ]

> +	ret =3D devm_drm_panel_add(dev, &ctx->panel);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to add panel\n");
> +
> +	for (i =3D 0; i < num_dsi; i++) {
> +		ctx->dsi[i]->lanes =3D desc->lanes;
> +		ctx->dsi[i]->format =3D desc->format;
> +		ctx->dsi[i]->mode_flags =3D desc->mode_flags;
> +		ctx->dsi[i]->dsc =3D &ctx->dsc;
> +		ret =3D devm_mipi_dsi_attach(dev, ctx->dsi[i]);
> +		if (ret < 0) {
> +			drm_panel_remove(&ctx->panel);

[Severity: Low]
Is this manual call to drm_panel_remove() redundant?

The panel is registered via devm_drm_panel_add(), which schedules
drm_panel_remove() to run automatically via devres on failure. Manually
calling drm_panel_remove() in the devm_mipi_dsi_attach() error path
circumvents the devres cleanup contract and leads to duplicate removal
attempts by the driver core.

> +			return dev_err_probe(dev, ret,
> +					     "Failed to attach to DSI host\n");
> +		}
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709142846.1246=
3-1-mitltlatltl@gmail.com?part=3D2
