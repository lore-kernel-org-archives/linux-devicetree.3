Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E681A3A71A8
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352713; cv=none; b=HQ2FuAu+Qvcsq75gaWLcjF24UnkeFGOfFdgnW2xpJu7oKk1ZCnTFWlMuszdSmEAfAnyU+v7hQcary/zCErQRoV97erb4D1hOmMKpUqNDpb4CU3NTczS+FGesrsAMx7waEm3aRkEkGJJidsIJAQ/SVfEARZ8ervyIvjCLbr1ufOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352713; c=relaxed/simple;
	bh=k4+HJdHvoocEm7/dX1kXkWNmiwFiahSrm+fwJGf8vfA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fHneSkecJg3cSuFJ/aWqMhiH71BFW+wmHC+e4n51ljREL4PQ+FHRNLTf7Rk2NW9JL+4vGCVgYYb+GFvkJqqrcf894N0OB3SGuKgKL3UfwUCuEXGxg7dpSyvd65frRwtuIAup8agOTSYW6KC1rgtO6TbgtwDChOHC/OXLfoSn5gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mO5xywU9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mO5xywU9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998661F000E9;
	Thu, 21 May 2026 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779352702;
	bh=JDypL139UJF0B2UPszaw08UcrGR8O+emky234XEENhs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mO5xywU9aaMVZc72qKg2yh3K4cJIHNfsb2VVoV+6smfv95+pDN1GoZYZsDqZjHpBN
	 qBeq9zPHoVwMiQHyUyWQJP9HBDrkdZ/YndNYBPesD8eH1bQmIPK8QtES23LCMSb3H2
	 Hco9n/rYK2CdUHTpey2Y9q46Vml/RbYY0Gr7GN/OFN6RBqgo7NJz2Fhb7ZUs4F8jO8
	 lzmvgzdvZCqu9KagExC6tHwpJXVnCN0mHYppglY9sL5HAZggR+5VG+birga5fnQSQt
	 27TSTzQHRPgaUgjY+flqKtYRvF/uXH1mqzP2BpbgLzrLLNTTvtcnJkpY8BhRSn9ttu
	 ufQ13R4qK90Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-2-dd5700299390@linaro.org>
References: <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-2-dd5700299390@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 08:38:20 +0000
Message-Id: <20260521083821.998661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Uninitialized stack variable `dsi_ctx` causes undefined behavior i=
n DSI initialization
- [High] Incorrect MIPI DCS initialization sequence (Set Display On before =
Exit Sleep Mode)
- [High] Race condition due to panel registration before DSI hardware is at=
tached
--

commit 1aa27fde3d1fe4c1d08cfa9a63d3e7e28912831f
Author: KancyJoe <kancy2333@outlook.com>

drm: panel: add support for the Renesas R63419 based dual-DSI video mode Di=
splay Panels

Implement support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

> diff --git a/drivers/gpu/drm/panel/panel-renesas-r63419.c b/drivers/gpu/d=
rm/panel/panel-renesas-r63419.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-renesas-r63419.c

[ ... ]

> +static int renesas_r63419_on(struct renesas_r63419_panel *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx;

[Severity: High]
Does leaving dsi_ctx uninitialized here leave dsi_ctx.accum_err with
random stack garbage?

The helper dsi_link_switch() only assigns the dsi pointer, so subsequent
multi-context calls like mipi_dsi_dcs_set_display_on_multi() might immediat=
ely
return if accum_err is non-zero, silently skipping the initialization.

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
Is it intentional to send the Set Display On command before Exit Sleep Mode?

According to the MIPI DCS specification, the display must exit sleep mode a=
nd
stabilize before it can process the Set Display On command. Sending these
commands in this order will likely result in the panel ignoring Set Display=
 On,
causing it to remain blank.

> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int renesas_r63419_disable(struct drm_panel *panel)
> +{
> +	struct renesas_r63419_panel *ctx =3D to_renesas_r63419_panel(panel);
> +	struct mipi_dsi_multi_context dsi_ctx;

[Severity: High]
Like in renesas_r63419_on(), can this uninitialized struct leave
dsi_ctx.accum_err with stack garbage? This might cause the panel disable
commands to be silently skipped.

> +
> +	dsi_link_switch(ctx, &dsi_ctx, 0);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);

[ ... ]

> +static int renesas_r63419_probe(struct mipi_dsi_device *dsi)
> +{

[ ... ]

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
Could registering the panel before the DSI hardware is attached cause a race
condition?

If a bridge driver concurrently finds the panel and triggers a display enab=
le
sequence, it might invoke the panel's callbacks before the DSI endpoints are
actually attached, leading to DCS command timeouts or crashes.

Additionally, because devm actions are executed in reverse order on cleanup,
the DSI devices would be detached before the panel is unregistered, exposing
an unattached panel during driver unload. Should devm_drm_panel_add() be
called only after all hardware setup and DSI attachments are complete?

> +		if (ret < 0)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to attach DSI device %d\n", i);
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-topic-sm86=
50-ayaneo-pocket-s2-r63419-v5-0-dd5700299390@linaro.org?part=3D2
