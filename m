Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E64221277
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455861; cv=none; b=ZsjDNozj3g02h+QgldeSphbfkoEW3jAIAhs4n5OEjAoqEwpINEpPh8TrtLWCcJoGIcXgtTKbE8nxknd0LDtUUJ157keRj5X3RcwQlXJ17IhGwgQ56u9KQPi329q7TTn4ezrY2uS6KjcpRbExRBShGqd/gVa5OxeCB3Bqdx1nX+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455861; c=relaxed/simple;
	bh=Str2Zy28AHMnejyNSRT1m9LezYNbZTqlcNbj6OhXkUY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IevTKZQxyQDv2A0mo38Ax/gzFa1XaJf9DYRt/QIhpL694Y/W7A1eyFHj9Aeh/PL/3eOSCV5HQbkk8Rz6YZjXRYFFNrOvf1iqSliG8rS6L5ydcMgXJw2GptMzuRam8fdOJozljUA9pTJdoTU/+mup6asftgFt3HfBAuQpihzJffg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUOi5agJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUOi5agJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D92D1F000E9;
	Fri, 22 May 2026 13:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779455859;
	bh=pEskO8jgAKir34h9TeA/kQeqYXSL87bggGAwMD0neTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LUOi5agJtnehpZ2sId9bcbkuCQbUGrv4NEqlHB0C0MuWFB5zIjDHJjl23wbVUY9C4
	 TjfjRK7qQr7l5vVOIzmbNZtDxcUGh4IfD6x1RbyClDOm/8di8FBo734P2MvMK8vbfL
	 xCjkbIUMlMK7/6y7Rk52QGNXgUwkciwyCU40ePyvPPn5v3cm6cezVbe/On5yzOaH3V
	 lJ24qUfX8rj5hKerh0fQ0vlLFBNiQLhZh8Q+UHtBei2VpqU5anszeRH/WaHD2nTs07
	 SPJK8+oqAZu6YVoVrd832PmUnwAAN5M4s+PRjVHLeCmMfUICbn1RfWPpAGDAS5tkll
	 IJ0Q8Y3IOskOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-2-16edddda9951@linaro.org>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-2-16edddda9951@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 13:17:38 +0000
Message-Id: <20260522131739.5D92D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The MIPI DCS initialization sequence in `renesas_r63419_on()` is i=
nverted, sending 'Set Display On' before 'Exit Sleep Mode'.
- [High] Missing device link between the panel and the secondary DSI host c=
reates a Use-After-Free risk.
- [High] The panel is published to the DRM subsystem before its DSI device =
properties are initialized and attached.
- [Medium] Asymmetrical DRM panel callbacks: DCS ON logic is in `.prepare` =
while DCS OFF logic is in `.disable`.
--

commit 2dc8ee5a664e9e795b047b17cd7126c4bd9d27d8
Author: KancyJoe <kancy2333@outlook.com>

drm: panel: add support for the Renesas R63419 based dual-DSI video mode Di=
splay Panels
   =20
Implement support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

> diff --git a/drivers/gpu/drm/panel/panel-renesas-r63419.c b/drivers/gpu/d=
rm/panel/panel-renesas-r63419.c
> new file mode 100644
> index 0000000000000..dba156f8427cd
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-renesas-r63419.c

[ ... ]

> +static int renesas_r63419_on(struct renesas_r63419_panel *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx =3D { 0 };
> +
> +	dsi_link_switch(ctx, &dsi_ctx, 0);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	dsi_link_switch(ctx, &dsi_ctx, 1);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 150);
> +
> +	dsi_link_switch(ctx, &dsi_ctx, 0);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	dsi_link_switch(ctx, &dsi_ctx, 1);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 50);

[Severity: High]
Does this send the MIPI DCS commands in the correct order?

The MIPI DCS specification requires a display module to be taken out of sle=
ep
mode (0x11 command) and allowed to wake up before the display on command
(0x29) is sent.=20

Here the display on command is sent while the panel is still in sleep mode,
which typically results in the command being ignored by the display
controller.

[ ... ]

> +static const struct drm_panel_funcs renesas_r63419_panel_funcs =3D {
> +	.disable =3D renesas_r63419_disable,
> +	.prepare =3D renesas_r63419_prepare,
> +	.unprepare =3D renesas_r63419_unprepare,
> +	.get_modes =3D renesas_r63419_get_modes,
> +	.get_orientation =3D renesas_r63419_get_orientation,
> +};

[Severity: Medium]
Should the DCS ON/OFF logic be symmetrical in these callbacks?

The driver executes its DCS turn-on sequence inside .prepare via
renesas_r63419_on(), but assigns its DCS turn-off sequence to the .disable
callback.

If the DRM core aborts display initialization after .prepare but before
.enable would logically occur, it will call .unprepare. However, .unprepare
only powers off the regulators and skips the DCS OFF sequence.

[ ... ]

> +	/* Register the second DSI device */
> +	ctx->dsi[1] =3D devm_mipi_dsi_device_register_full(dev, dsi1_host, &inf=
o);
> +	if (IS_ERR(ctx->dsi[1]))
> +		return dev_err_probe(dev, PTR_ERR(ctx->dsi[1]),
> +				     "Failed to register second DSI device\n");

[Severity: High]
Is a device link needed between the panel and the secondary DSI host?

The driver registers a secondary DSI device on a remote host, but it does
not establish a device link (e.g., via device_link_add()) to enforce
consumer-supplier unbind ordering.

If the secondary DSI host is unbound independently, the panel driver will
not be unbound along with it, leaving ctx->dsi[1] pointing to a freed or
unregistered host. Subsequent DRM atomic operations would dereference this
dangling pointer.

> +
> +	ctx->dsi[0] =3D dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	/* Get panel orientation */
> +	ret =3D of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
> +	if (ret < 0 && ret !=3D -ENODEV)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get panel orientation\n");
> +
> +	ctx->panel.prepare_prev_first =3D true;
> +
> +	ret =3D drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	ret =3D devm_drm_panel_add(dev, &ctx->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add panel\n");
> +
> +	/* Configure and attach both DSI devices */
> +	for (i =3D 0; i < ARRAY_SIZE(ctx->dsi); i++) {
> +		ctx->dsi[i]->lanes =3D ctx->desc->lanes;
> +		ctx->dsi[i]->format =3D ctx->desc->format;
> +		ctx->dsi[i]->mode_flags =3D ctx->desc->mode_flags;
> +
> +		ret =3D devm_mipi_dsi_attach(dev, ctx->dsi[i]);

[Severity: High]
Could the panel be probed by the DRM subsystem before it is fully initializ=
ed?

devm_drm_panel_add() adds the panel to the global DRM panel list, making it
visible to other drivers. However, critical DSI device properties like
lanes and format are set and devm_mipi_dsi_attach() is executed after this
call.

A concurrent display controller probing the panel could find it and attempt
to send DCS commands before the DSI physical links are attached.

> +		if (ret < 0)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to attach DSI device %d\n", i);
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-topic-sm86=
50-ayaneo-pocket-s2-r63419-v6-0-16edddda9951@linaro.org?part=3D2
