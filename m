Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAC445038
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783132; cv=none; b=mHPETiDKWqPQiK/HhCIulTbOIgYLSTmn/y4GYa3l79PGEwqOhJpS5HLF5fzbWMeF0Ev95STjmL27SL1iEdQNjHcr8SQorUSHienFigKKevBVqXsWQEeRFCLYMwhm4Vrw74+GNPfSO7gYcmybniBEQXY056AwpKTR4VoT6lJZ5Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783132; c=relaxed/simple;
	bh=co3RCCO7eFK2KIjsb4EKERjk7hdcs063bil3XVPRW8I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sqgbq1iZsxvFiRyoayplHeOFQ3DWZnF4gtY7OpQK7RBWxghlyPe7A6P42dzJ0PGdJGiObWxvmHb6R29r1F9MlO09olyGtcaY/R3X55PUxvtVlt2O1PKYKoZ0ZVqe/Zp6JHaQtphc25pKTQfZidXFZvg2B+EFjU+Oo+hv5UCIXEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuEPpTpo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuEPpTpo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C741F00A3A;
	Mon,  7 Sep 2026 12:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788783131;
	bh=CMmFb/XRENoFIfvBuML1/OcZrfsbwii74w0nV3zYYwM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KuEPpTpobgToFIQCc9fqGca9OyJRGHVOK3JhNssIV/y3rO3HhTkoLUqPoVt6HcrmS
	 gHswSdZWqqtgYbDk0CSVR56BGrOOTFoRZkfu4+MbPT/t+yEd/XgsgOVUifhUZ5DnKg
	 KNMU3A+Rcw0KTFcitda0X+IKn3+mWW3F3WnaMWH4zeIAXdsQ+Lyj7I8k9efA0Snqak
	 TVkfHjF/FdRUt6SmSa+9B4HJK11hBFXnYE+rAKf0DY/ZsEqA19/v+3UqSsUdmkZ8RV
	 D5RTX0P19v3AkRFinkT8pb++Z6WHbwwvYRc31xhDX1Fl7tc5I9Ph+x5yxg5B4YQt9O
	 Zo2TAk585kQ2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/panel: Add Samsung AMS662ZS01 panel driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vsevolod Nevorotov" <sevanevorotov29@gmail.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907115130.95394-3-sevanevorotov29@gmail.com>
References: <20260907115130.95394-1-sevanevorotov29@gmail.com>
 <20260907115130.95394-3-sevanevorotov29@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 12:12:10 +0000
Message-Id: <20260907121210.A4C741F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Panel reset GPIO is initialized to physical HIGH while regulators =
are off, causing hardware back-powering.
- [Medium] Data race on shared `dsi->mode_flags` due to non-atomic modifica=
tion in sysfs backlight update callback.
- [Medium] The backlight sysfs interface issues DSI transfers to an unpower=
ed panel.
--

commit df8bf199977cc597d9cc38caadd2457c9f44d341
Author: Vsevolod Nevorotov <sevanevorotov29@gmail.com>

    drm/panel: Add Samsung AMS662ZS01 panel driver
   =20
    Add support for the Samsung AMS662ZS01 AMOLED display panel used in the
    OnePlus 9RT (martini) smartphone.
   =20
    The panel operates in Command Mode with DSC (Display Stream Compression)
    enabled at 1080x2400 resolution at 60Hz.

> diff --git a/drivers/gpu/drm/panel/panel-samsung-ams662zs01.c b/drivers/g=
pu/drm/panel/panel-samsung-ams662zs01.c
> new file mode 100644
> index 0000000000000..52e7e75c08b13
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-ams662zs01.c
> [ ... ]
> @@ -267,11 +267,10 @@ static int ams662zs01_bl_update_status(struct backl=
ight_device *bl)
>  {
>  	struct mipi_dsi_device *dsi =3D bl_get_data(bl);
>  	u16 brightness =3D backlight_get_brightness(bl);
>  	int ret;
> =20
>  	dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
>  	ret =3D mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
>  	dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;

[Severity: Medium]
Could this create a data race on dsi->mode_flags?

The backlight subsystem uses bl->update_lock while DRM uses
drm_modeset_lock, providing no mutual exclusion between these paths. A
concurrent sysfs write to the backlight brightness node during
ams662zs01_prepare() could race on dsi->mode_flags. This might cause
display initialization commands to be sent in the wrong power mode.

[Severity: Medium]
Does this function lack a check to ensure the panel is prepared and powered
on before attempting DSI communication?

If userspace writes to the backlight sysfs node while the panel is
unprepared (screen off or system suspended), this unconditionally sends DCS
commands. Attempting a DSI transfer while the panel's regulators are
disabled could cause hardware timeouts, bus errors, or host driver failures.

> =20
>  	return ret;
>  }
> [ ... ]
> @@ -311,9 +310,10 @@ static int ams662zs01_probe(struct mipi_dsi_device *=
dsi)
>  	if (IS_ERR(ctx))
>  		return PTR_ERR(ctx);
> =20
>  	ret =3D devm_regulator_bulk_get_const(dev, ARRAY_SIZE(ams662zs01_suppli=
es),
>  					    ams662zs01_supplies, &ctx->supplies);
>  	if (ret < 0)
>  		return ret;
> =20
>  	ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);

[Severity: High]
Does this initialize the active-low reset GPIO to physical HIGH before the
panel's regulators are turned on?

Calling devm_gpiod_get() with GPIOD_OUT_LOW on an active-low GPIO
immediately drives the pin physically HIGH. Driving the reset GPIO high
while the panel's main power rails (VDDIO/VDD) are off could forward-bias
the ESD protection diodes inside the panel driver IC. This back-powers the
IC logic domain, which might cause permanent hardware damage or latch-up
preventing panel initialization.

>  	if (IS_ERR(ctx->reset_gpio))
>  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
>  				     "Failed to get reset-gpios\n");
> [ ... ]
> @@ -330,9 +330,10 @@ static int ams662zs01_probe(struct mipi_dsi_device *=
dsi)
>  	dsi->format =3D MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags =3D MIPI_DSI_MODE_NO_EOT_PACKET |
>  			  MIPI_DSI_CLOCK_NON_CONTINUOUS |
>  			  MIPI_DSI_MODE_LPM;
> =20
>  	ctx->panel.prepare_prev_first =3D true;
> =20
>  	ctx->panel.backlight =3D ams662zs01_create_backlight(dsi);
>  	if (IS_ERR(ctx->panel.backlight))
>  		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
>  				     "Failed to create backlight\n");

[Severity: Medium]
Is it safe to expose the backlight sysfs interface here before the DSI
device is attached to the host?

Because the backlight device is registered here, it is exposed to userspace
while the panel is unprepared and before mipi_dsi_attach() is called. This
makes the unprotected DSI transfers in ams662zs01_bl_update_status()
reachable immediately, even while the panel is suspended.

> =20
>  	drm_panel_add(&ctx->panel);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907115130.9539=
4-1-sevanevorotov29@gmail.com?part=3D2
