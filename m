Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ECB34E766
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 08:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153946; cv=none; b=tzDUyhvSi86s/YGwPu36GLfIDSL8h2gOa7yQesqWucAYXmP4K/2WEOdPeZNePc0ykRnMchIeVCUZ/1ncszFpbHlzpLW3QvquY93jnVfmjPqplq1SAwdTpFup3/vIaLjxk0k+PdCZRxdxZU7eO6Hcwax+biOkCxb8YIfHzf+lqxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153946; c=relaxed/simple;
	bh=2PeJHQI3VcCekqs2I8TbEAfz8LFTgWBxCAZQT7ltFtA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Al90tGce2x7l8PvwhtkBJFcqGyFDsjHJdSUyygPN/hVb6fbD6nvag2vvLxF5UhvQ096VSFQN5vHGAktP2K4UtYWM3b899tRoWaafhPAAP9Gn1QVjuBQho5p0GRjDdBk/meCcahShz6//EbXGH5Mu1v9kCaq2oYV9zBI7A6wOqzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rfethyqa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rfethyqa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E8E1F000E9;
	Sat,  4 Jul 2026 08:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783153942;
	bh=fKKY8Dv+JE/FoKt6Zujr7OX1zMQyY2k8p2lCacCAgpo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RfethyqamUPXELeomq/kv117OM19xYVon64YFsfwSCAp0tIoI4crg3YlEj4gj/u11
	 OyhrR2Y1T8IxuCliawoZpn12DNVWKA0e+ml4fEAT2D+FkF1Zr3l1yUUzwAFgcvGt0y
	 paNcFnIrdxGzq4RjKXr2LGvvJdWNWcPlsvWEaDzmmlf12RWjkAUL8l+ejtgloTDJFw
	 elInqWdhFlDucUy0HWkPggXnj4AAqwakzdmNCyiFPT4NOQQ+uZvjLhCETnLU90BkYx
	 7nCA16bow/ufS5KnmnniinEZcHD/6GVqHAKeZSDA7JJDhHU+rUtDZHeHJkOrghzc7r
	 xvrz35R68kQeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] drm/panel: Add driver for Raydium RM69220 DDIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Koskovich" <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260704-asteroids-panel-support-v3-2-38dc92570579@pm.me>
References: <20260704-asteroids-panel-support-v3-0-38dc92570579@pm.me>
 <20260704-asteroids-panel-support-v3-2-38dc92570579@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 08:32:22 +0000
Message-Id: <20260704083222.91E8E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The panel reset GPIO is initialized to a de-asserted state during =
probe, violating power sequencing and potentially back-powering the display=
 controller.
- [Medium] The backlight update status function permanently clears the `MIP=
I_DSI_MODE_LPM` flag on error.
--

commit ff679a020d6cdcdc5214b83056b055c35077760d
Author: Alexander Koskovich <akoskovich@pm.me>

drm/panel: Add driver for Raydium RM69220 DDIC

This patch adds a new DRM panel driver for the Raydium RM69220 display driv=
er
IC, primarily supporting the BOE BF068MWM-TD0 panel.

> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm69220.c b/drivers/gpu/=
drm/panel/panel-raydium-rm69220.c
> new file mode 100644
> index 0000000000000..4fa3036c4b5fb
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm69220.c
[ ... ]
> +static int raydium_rm69220_bl_update_status(struct backlight_device *bl)
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

[Severity: Medium]
If mipi_dsi_dcs_set_display_brightness_large() fails here, does this return
path leave MIPI_DSI_MODE_LPM permanently cleared? It seems this might cause
all subsequent DSI commands to be sent in High Speed mode.

> +
> +	dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
[ ... ]
> +static int raydium_rm69220_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev =3D &dsi->dev;
> +	struct raydium_rm69220 *ctx;
> +	int ret;
[ ... ]
> +	ret =3D devm_regulator_bulk_get_const(dev,
> +					    ARRAY_SIZE(raydium_rm69220_supplies),
> +					    raydium_rm69220_supplies,
> +					    &ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);

[Severity: High]
Does initializing the reset GPIO to GPIOD_OUT_LOW (logically de-asserted)
during probe risk back-powering the display controller? Since the panel's
power regulators are not enabled yet, could this drive current through the
internal ESD diodes into the unpowered rails?

> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704-asteroids-=
panel-support-v3-0-38dc92570579@pm.me?part=3D2
