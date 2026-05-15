Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F07F1DED5C
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 23:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778886636; cv=none; b=CoFR0Fu8Ex5ZVLO4AOSLU8gE5aRakNAwc1+wwaKoSpBmRnDDTIhCzYuFLFl0/SnEGCESwK10OW/IzmqlSfOijSSKakeco5c+sx3+RVpiQhTmLHJYhsgkH7g4arub4kFsDdYgX61jRDtqFNegoMioxgJOCecLAGa+4PDieQKmiow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778886636; c=relaxed/simple;
	bh=wR2NeTEdNLRmu5RIoAUcBF2xvfP+9PVBdZAZHlHb3bs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ulGVNOBnuEm7k8nmI8+mkSEhvndNvc6kZAplO3MWQIdkEGkO85sbWbuHYyNKJ2HyGfRyFTVXMQSDN/rgUgtUSyztWCy5N0cX+mxToDYpZpZLfHzAe4EIwYqQHiRF2Su1EJ1vcN5lO8LxTOUfP1YKUe9uSEw+jBiF4IRIq86eJrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwUCsyR9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwUCsyR9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E181C2BCB0;
	Fri, 15 May 2026 23:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778886636;
	bh=wR2NeTEdNLRmu5RIoAUcBF2xvfP+9PVBdZAZHlHb3bs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DwUCsyR9HHu2sccbvg+4VW7WMo6U6hDYpXyuCJqO0kHqNB0ifA4B8C5O8xxosWIFt
	 0r33c/LaprJ7dfdxwnXkUHkYiX40yZhNfkwndshTiKE3I0TYvx2IuA2kMeaDKlTtC6
	 dC700sV7QRPGdFOFQ5vFuEQdn/s2EKcvw3YsYtfz9KekTKOh5TUcneVyFuMUMwWMuv
	 pUWFYomrollkPKD8z2qGhCz0zN8SePLnYYWlaaPgnUrD8myyNZm9bPSNTLewaUaRBi
	 Isv3OCYKKZImTYRG4P07nXI7H3r60vyD8DpgldE8a5lDwVS6DC5PFIdiCc2hOWDZ8x
	 JREV72N3LzVhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 4/6] drm/panel: anbernic-td4310: Add RG Vita Pro
 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515221947.299229-5-macroalpha82@gmail.com>
References: <20260515221947.299229-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 23:10:33 +0000
Message-Id: <20260515231034.9E181C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Resource leak and hardware state mismatch on prepare error path.
- [High] Enable GPIO is incorrectly asserted during probe before the VDD re=
gulator is enabled.
- [Medium] Panel-specific delay configuration fields are ignored in favor o=
f hardcoded values.
- [Low] Extraneous semicolon after if-statement block.
--

commit b88e27c6a433bac0f5f02ad289ba084e02f359ed
Author: Chris Morgan <macromorgan@hotmail.com>

drm/panel: anbernic-td4310: Add RG Vita Pro panel

This commit adds support for the TD4310 DSI panel used in the Anbernic RG
Vita Pro handheld console. It introduces a new panel driver with power
sequencing, DCS initialization, and display mode definitions.

> diff --git a/drivers/gpu/drm/panel/panel-anbernic-td4310.c b/drivers/gpu/=
drm/panel/panel-anbernic-td4310.c
> new file mode 100644
> index 0000000000000..733c68ff9771b
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-anbernic-td4310.c
[ ... ]
> +static int panel_anbernic_td4310_prepare(struct drm_panel *panel)
> +{
> +	struct anbernic_panel_td4310 *ctx =3D panel_to_anbernic_panel_td4310(pa=
nel);
> +	struct mipi_dsi_device *dsi =3D ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> +	int ret;
> +
> +	ret =3D regulator_enable(ctx->vdd);
> +	if (ret)
> +		return ret;
> +
> +	if (ctx->enable_gpio) {
> +		ret =3D gpiod_set_value_cansleep(ctx->enable_gpio, 1);
> +		if (ret)
> +			goto err_enable;
> +	};

This isn't a bug, but is there an extra semicolon here after the if block?

> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	mipi_dsi_msleep(&dsi_ctx, 10);
> +
> +	ret =3D gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	if (ret)
> +		goto err_reset;
> +	if (ctx->panel_info->reset_delay)
> +		mipi_dsi_msleep(&dsi_ctx, ctx->panel_info->reset_delay);
> +	ret =3D gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	if (ret)
> +		goto err_reset;
> +
> +	if (ctx->panel_info->enable_delay)
> +		mipi_dsi_msleep(&dsi_ctx, ctx->panel_info->enable_delay);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 100);

Does this code ignore the prepare_delay and init_delay fields defined in
anbernic_panel_td4310_info by using a hardcoded 100ms sleep?

> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 100);
> +
> +	return dsi_ctx.accum_err;

If mipi_dsi_dcs_exit_sleep_mode_multi or mipi_dsi_dcs_set_display_on_multi
encounters an error and populates dsi_ctx.accum_err, does this return bypass
the err_reset and err_enable cleanup paths?

If the DRM framework does not call unprepare when prepare fails, does
this leave the vdd regulator enabled indefinitely and the GPIOs in their
active states?

> +
> +err_reset:
> +	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
> +err_enable:
> +	regulator_disable(ctx->vdd);
> +	return ret;
> +}
> +
> +static int panel_anbernic_td4310_unprepare(struct drm_panel *panel)
> +{
> +	struct anbernic_panel_td4310 *ctx =3D panel_to_anbernic_panel_td4310(pa=
nel);
> +	struct mipi_dsi_device *dsi =3D ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);

Are the disable_delay and unprepare_delay fields defined in
anbernic_panel_td4310_info intended to be used here instead of the hardcoded
120ms sleeps?

[ ... ]
> +static int panel_anbernic_td4310_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev =3D &dsi->dev;
> +	struct anbernic_panel_td4310 *ctx;
> +	int ret;
[ ... ]
> +	ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Cannot get reset gpio\n");
> +
> +	ctx->enable_gpio =3D devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_H=
IGH);

Does initializing enable_gpio with GPIOD_OUT_HIGH assert the GPIO
immediately during probe, before the vdd regulator is enabled in
panel_anbernic_td4310_prepare?

Could driving control pins active while the main IC power supply is off
cause leakage current or latch-up through ESD diodes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515221947.2992=
29-1-macroalpha82@gmail.com?part=3D4
