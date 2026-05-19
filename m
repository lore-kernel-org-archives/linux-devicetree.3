Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B843E16B6
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179524; cv=none; b=MlAHb1vvMAO9Qkj/TLixmLZsHH2OrB0tB4psDGayeW5AVB3QcjGhUXO2LSjxR1sk/P73rK8kMn8YO5OlCV11SsM8f7NtQpl/WLCMZLdn8NtBATROcg+pcTTe6Xtz0OGXvFM+mbpT0YFtLMX3v5hGG40Vd1OMbjw6ZBES+RGHZLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179524; c=relaxed/simple;
	bh=0Ht9Ns/k5QcYIpUrpU67o7Giqr+XUZ/CpMDBeiHtKSc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LI923Nndk9PXZPPr1WsUbAVpCvTyygI0nkCLvX6ISSyymJ5a+4nhqD3qqlgEDZQmFEZqcTac/LLV8D7AmYutlyLf7cQy4DFrM/hPyiZzliRo9wU1Oh8ykGd0WwRpckqxxhuej90R0tQ4Zu4THMwsNc089hcrOwlH8158et0bpDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CANbVqxf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CANbVqxf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445EAC2BCB3;
	Tue, 19 May 2026 08:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779179524;
	bh=0Ht9Ns/k5QcYIpUrpU67o7Giqr+XUZ/CpMDBeiHtKSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CANbVqxfu8zH4Nw5v7pzkerPRihcLvE6rKzaQh4DqwnFSadv9TEx19GQ4tRUYgppq
	 QNOGEZtFkf4EGGDIHeCIwc917DewgPOKRj96TX5VAaBd9vPDEl7itY+SMgbATfG2Xj
	 p1NC5096gqnGkb/lmtLRghXySaCPHPR3+LVx0YS41El8q+u76E591VF5c+eyvShFUr
	 1n4cev8K6iUh/IF0ovY76+dOIEfEqPmEqBysP2koC7L62yL0N+IiMYLwNamX6UYDEW
	 Fg0jPMJGt1tPmtE8ZQ5vx4SXAAchymUmjFsT20PsvNuP5GLC2Q02ZMshVLvoQb42BF
	 qCENvhYxo+GtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-2-b8929af5e951@linaro.org>
References: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-2-b8929af5e951@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:32:03 +0000
Message-Id: <20260519083204.445EAC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] DCS initialization sequence sends SET_DISPLAY_ON before EXIT_SLEEP=
_MODE.
- [High] Incorrect hardware power sequencing during teardown risks hardware=
 damage.
- [High] Resource leak of `vdd_supplies` in the `renesas_r63419_prepare()` =
error path.
- [High] Panel is registered to DRM before DSI devices are attached, causin=
g a race condition.
- [High] Secondary DSI device is registered with the primary's `of_node`, c=
ausing an unintended re-probe.
- [Medium] Silent ignore of errors on the secondary DSI link in multi-conte=
xt DCS sequences.
--

commit 536a4ce2d0cffbeb00543674b725c12c37ef3272
Author: KancyJoe <kancy2333@outlook.com>

drm: panel: add support for the Renesas R63419 based dual-DSI video mode Di=
splay Panels
   =20
Implement support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

> diff --git a/drivers/gpu/drm/panel/panel-renesas-r63419.c b/drivers/gpu/d=
rm/panel/panel-renesas-r63419.c
> new file mode 100644
> index 0000000000000..1643a9c78c3fd
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-renesas-r63419.c
[ ... ]
> +static int renesas_r63419_on(struct renesas_r63419_panel *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi[0] };
> +	struct mipi_dsi_multi_context dsi_ctx1 =3D { .dsi =3D ctx->dsi[1] };
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx1);
> +	mipi_dsi_msleep(&dsi_ctx, 150);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx1);
> +	mipi_dsi_msleep(&dsi_ctx, 50);

Are the DCS commands sent in the correct order? Standard MIPI DCS sequences
require exiting sleep mode (0x11) and waiting for the hardware to wake up
before setting the display on (0x29). Sending a Display On command while
the panel is still in sleep mode can prevent the display from turning on.

Also, does this silently ignore errors on the secondary DSI link?
If a command fails on dsi_ctx1, the error doesn't seem to be captured or
checked here. Additionally, mipi_dsi_msleep() only checks the primary
context, so if a failure occurs on the primary, the sleep is bypassed, and
commands to the secondary are sent without the required delay.

> +
> +	return dsi_ctx.accum_err;

Should this return a combination of both dsi_ctx.accum_err and
dsi_ctx1.accum_err?

> +}
[ ... ]
> +static int renesas_r63419_prepare(struct drm_panel *panel)
> +{
> +	struct renesas_r63419_panel *ctx =3D to_renesas_r63419_panel(panel);
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(renesas_r63419_vdd_supplies),
> +				    ctx->vdd_supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	usleep_range(1000, 2000);
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(renesas_r63419_vcc_supplies),
> +				    ctx->vcc_supplies);
> +	if (ret < 0)
> +		return ret;

If regulator_bulk_enable() for vcc_supplies fails here, does this leak the
regulator reference for the already-enabled vdd_supplies?

> +
> +	usleep_range(1000, 2000);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +
> +	usleep_range(3000, 4000);
> +
> +	ret =3D renesas_r63419_on(ctx);
> +	if (ret < 0) {
> +		dev_err(panel->dev, "Failed to initialize panel: %d\n", ret);
> +		regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vcc_supplies),
> +				       ctx->vcc_supplies);
> +		regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supplies),
> +				       ctx->vdd_supplies);
> +
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);

Could this hardware power sequencing risk hardware damage? The power
regulators are disabled before the reset GPIO is asserted. Leaving a logic
high voltage driven on an IO pin of an unpowered IC can back-power the
chip through its ESD protection diodes. The reset GPIO should likely be
asserted before disabling the regulators.

> +
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int renesas_r63419_unprepare(struct drm_panel *panel)
> +{
> +	struct renesas_r63419_panel *ctx =3D to_renesas_r63419_panel(panel);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vcc_supplies), ctx->vc=
c_supplies);
> +	regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supplies), ctx->vd=
d_supplies);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);

The same power sequencing issue seems to exist here during teardown.

> +
> +	return 0;
> +}
[ ... ]
> +static int renesas_r63419_probe(struct mipi_dsi_device *dsi)
> +{
[ ... ]
> +	/* Copy current DSI info */
> +	strscpy(info.type, dsi->name, sizeof(info.type));
> +	info.channel =3D dsi->channel;
> +	info.node =3D dev_of_node(dev);
> +
> +	/* Register the second DSI device */
> +	ctx->dsi[1] =3D devm_mipi_dsi_device_register_full(dev, dsi1_host, &inf=
o);

Could setting info.node to dev_of_node(dev) for the secondary DSI device
cause an unintended re-probe loop? Because the secondary device shares the
same of_node as the primary device, the MIPI DSI bus driver matching logic
will match it against the same renesas_r63419_driver and invoke probe()
again for the secondary device.

> +	if (IS_ERR(ctx->dsi[1]))
> +		return dev_err_probe(dev, PTR_ERR(ctx->dsi[1]),
> +				     "Failed to register second DSI device\n");
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

Does registering the panel to DRM before attaching the DSI devices
introduce a race condition? Calling devm_drm_panel_add() makes the panel
immediately visible to consumers. If a consumer prepares the panel right
away, it will attempt to send DCS commands over unattached DSI links.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-topic-sm86=
50-ayaneo-pocket-s2-r63419-v4-0-b8929af5e951@linaro.org?part=3D2
