Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DA03859D4
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 20:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788034773; cv=none; b=j/pRba6IPS1HVLt0BMbsdPi+V+KkC+oU2w1wtd7PUj/cxQXbePESFQcwJtYSuLLfjmNHYQWccoUMI3FgF39F0hVssOo4lUe4y80n9UezFZdxBTMhyL0uyFgVQ3p2SClOlbGVXMF1ya3tF1eF7BB5fochX3cKaQz2JsH0WKEcfFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788034773; c=relaxed/simple;
	bh=A4T7O94eJqgmVZzZtBILsxdaKnRW7+g99Oke6vvPiFY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=me4gqvGBVOiN3hm+dqhACXp33nnxloyGKcmQYQwSjUN6UXi60snZdPMuIMZiH/DYmYGQR69T8i36HP6CkL1n1VGA5uduqf33QltbFDx3k6U5lMEsuu2FgVxmzSJzZpybIIRQf1bC1PwtmBD4hJ3aQYoQMRETfP2/b95WijIa83Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oStZnHOF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oStZnHOF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFEB1F000E9;
	Sat, 29 Aug 2026 20:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788034772;
	bh=V9g6jw5gZW5KjCw3iwR4hXwT7Cp6yjG8hnHrPCPDBAM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oStZnHOFNwCwa9ylNl9m3CtdlHahl9O7tv8t/1w27KCBM3d2fGvWtwEvY+NOGwmoB
	 pCEyGzpBjgP8/hZV6rWGMUgYewyrtxHhgYknH1PgplcnD90/gLq+ZBEo3ARXHQYnMF
	 Ed0GJuMDgGdqlRF5kT16benwSMzlBdut6UNiqKGtwbU3iLtDqvClXB2cKAv926JkTO
	 4gQNCDLkCwAkz9Y5uGrdURYDQXoPh8LCmQ3mEqZwwKdNB0WlG70CxkxWJQlB+59JMA
	 YjTuPbs9pGveIQaGj2YBAeUmIzxj8ohrwEj8t5vM2QbCFGxAEFOUO8rdMOrepmaSs0
	 OOga8tOy0M99g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/2] drivers: gpu: drm: panel: Add BOE NT51021
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nickolay Goppen" <setotau@mainlining.org>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260829-qcom-novatek-nt51021-panels-v1-2-cc1ca61bd261@mainlining.org>
References: <20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org>
 <20260829-qcom-novatek-nt51021-panels-v1-2-cc1ca61bd261@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 20:19:31 +0000
Message-Id: <20260829201932.1BFEB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The panel initialization sequence lacks the DCS 'Set Display On'=
 (0x29) command.
- [Medium] Missing reset assertion and stabilization delay during panel pre=
paration.
--

commit 864f3dccc86bc8a97845ebafd73a7df32e9d6b9e
Author: Nickolay Goppen <setotau@mainlining.org>

drivers: gpu: drm: panel: Add BOE NT51021 driver

This commit adds support for the BOE NT51021-based 8-inch and 10-inch DSI
video mode panels used in Xiaomi Mi Pad 4 tablets. It includes panel
initialization sequences and content-adaptive brightness control.

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt51021.c b/drivers/gpu/=
drm/panel/panel-novatek-nt51021.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt51021.c
[ ... ]
> +static void nt51021_boe_reset(struct boe_nt51021_desc *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}

[Severity: Medium]
Does the panel require an explicit reset assertion pulse before de-asserting
the reset line? The current code only de-asserts the reset line here. Witho=
ut
an explicit assertion pulse and delay prior to de-assertion, the hardware
might not be guaranteed a valid minimum reset pulse width once power is sta=
ble.

[ ... ]
> +static int nt51021_boe_8_init(struct boe_nt51021_desc *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
[ ... ]
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_usleep_range(&dsi_ctx, 5000, 6000);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x8f, 0x00);
> +	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
> +
> +	nt51021_cabc_on(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
> +}

[Severity: Medium]
Does this initialization sequence miss a DCS "Set Display On" command?
The panel is awakened from sleep mode via mipi_dsi_dcs_exit_sleep_mode_mult=
i(),
but it is never explicitly instructed to turn on the display output here in
nt51021_boe_8_init(). This could cause the panel to remain blank on some DSI
hosts.

[ ... ]
> +static int nt51021_boe_10wu_init(struct boe_nt51021_desc *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
[ ... ]
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_usleep_range(&dsi_ctx, 5000, 6000);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x8f, 0x00);
> +	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
> +
> +	nt51021_cabc_on(&dsi_ctx);
> +	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
> +
> +	return dsi_ctx.accum_err;
> +}

[Severity: Medium]
Similarly to nt51021_boe_8_init(), the 10-inch variant initialization path
also appears to omit the mipi_dsi_dcs_set_display_on_multi() command.

> +static int nt51021_boe_off(struct boe_nt51021_desc *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
> +
> +	nt51021_cabc_off(&dsi_ctx);
> +
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x8f, 0xa5);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);

[Severity: Medium]
The power-off sequence explicitly turns the display off using
mipi_dsi_dcs_set_display_off_multi(). Should there be a matching turn-on
command in the initialization sequences to ensure the display activates
correctly across power cycles?

[ ... ]
> +static int nt51021_boe_prepare(struct drm_panel *panel)
> +{
> +	struct boe_nt51021_desc *ctx =3D to_boe_panel(panel);
> +	struct device *dev =3D &ctx->dsi->dev;
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(nt51021_boe_supplies), ctx->su=
pplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +	nt51021_boe_reset(ctx);

[Severity: Medium]
Does the panel require a stabilization delay after enabling the regulators
and before de-asserting the reset line? The current code immediately calls
nt51021_boe_reset(ctx). Without a delay, the reset logic might execute
before the regulators have fully ramped up, potentially leading to unstable
hardware initialization.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829-qcom-novat=
ek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org?part=3D2
