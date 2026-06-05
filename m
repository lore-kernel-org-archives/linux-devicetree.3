Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB3C3F4832
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 15:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780671629; cv=none; b=f4cwTmEOqC/mWBTSqaARFaDNwi0sTcNIq3FxlnHaCtyPteOhSbbAhyiPYR8qcX8NKlatAtsXnfXgpY4o8EUe3yRPTXtXMoxPcFNO4CxdO77FKUeZ06R1i87BWH+6W1QQBWII3rE0pO8Ut31rDntTXqYugyr4VQ0pjaxLGavPxag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780671629; c=relaxed/simple;
	bh=956BUcuV4AJyy/IBmEM9FVIRCr2ewPfucLDtoPpENCM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XHHloX4aai2s6tIidPTRxAzuJ91DMk1sQlKCeGoh7sz6tRQLhhjne+fT9pxQHHnzLCPC8GtUcHDxx8DqzaM2McQlzMUmee9sMLp/xHuB5R2bPiaf4nwN7PBuLzUoj+OztPIxmGZw98ulcLE7qdQuWleSFUfM5QccewgW7jW8ESE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EA5QY6zG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EA5QY6zG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EA21F00898;
	Fri,  5 Jun 2026 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780671626;
	bh=X7qt2U5Kg8IS800RLQD5ASsMKUGPjHTZz9MSULneqNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EA5QY6zGsUG6lvlR64rxb0syyPBEBZlp2A23phx+8F53MP2F6vvcAqhzM8shszQ3X
	 N9t4Jwz+siQWTWrda1TgDM6oL7Z0pGy0vnLzvqnn1uvgqwNSExk5UMIa0oWBxhtrAv
	 c5J4GtCbzmzaZ5q0eg6viDYcf0QCNN/GRdY3zVdLBh607fbYkyJxQZcBe6BCQaKQMT
	 33PfdI5vbZWUcbASV5peeNSx//cZ/TPshZ7PFpacszi8KFJxbvAL8+x9U94WD5qbA8
	 49PavjJ/vk5gxVaET4phNyLGGoIIVm+vmvB6x8KXewjx3aFgzn1/YroAseDQd2qz/v
	 Lf7EAAyR+OQcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-2-b84b6da84293@linaro.org>
References: <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-2-b84b6da84293@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 15:00:25 +0000
Message-Id: <20260605150025.C6EA21F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The panel is added to the DRM subsystem before its DSI links are f=
ully configured and attached, creating a race condition.
- [High] Asymmetric panel `.prepare`/`.enable` and `.disable`/`.unprepare` =
callbacks.
- [High] Missing device link to the secondary DSI host allows it to be unbo=
und while the panel is still active, leading to a use-after-free.
--

commit c609396440aafc34634a32d089165e7df2d383ce
Author: KancyJoe <kancy2333@outlook.com>

drm: panel: add support for the Renesas R63419 based dual-DSI video mode Di=
splay Panels

Implement support for the Renesas 63419 based dual-DSI video mode Display
Panels found in the Ayaneo gaming handled devices.

> diff --git a/drivers/gpu/drm/panel/panel-renesas-r63419.c b/drivers/gpu/d=
rm/panel/panel-renesas-r63419.c
> new file mode 100644
> index 0000000000000..a70de95d4f215
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-renesas-r63419.c
> @@ -0,0 +1,366 @@
[ ... ]
> +static const struct drm_panel_funcs renesas_r63419_panel_funcs =3D {
> +	.disable =3D renesas_r63419_disable,
> +	.prepare =3D renesas_r63419_prepare,
> +	.unprepare =3D renesas_r63419_unprepare,
> +	.get_modes =3D renesas_r63419_get_modes,
> +	.get_orientation =3D renesas_r63419_get_orientation,
> +};

[Severity: High]
Does this create asymmetric panel callbacks by providing .disable without
an .enable? If the DRM core or a bridge driver performs a simple display cy=
cle
by calling drm_panel_disable() followed by drm_panel_enable() without a full
unprepare/prepare cycle, the panel will be turned off in .disable but never
turned back on since .enable is NULL.

Should the DSI power-on commands in renesas_r63419_on() be moved to an .ena=
ble
callback, or alternatively, should the power-off commands be moved to .unpr=
epare
and .disable removed entirely?

[ ... ]
> +static int renesas_r63419_probe(struct mipi_dsi_device *dsi)
> +{
[ ... ]
> +	/* Register the second DSI device */
> +	ctx->dsi[1] =3D devm_mipi_dsi_device_register_full(dev, dsi1_host, &inf=
o);
> +	if (IS_ERR(ctx->dsi[1]))
> +		return dev_err_probe(dev, PTR_ERR(ctx->dsi[1]),
> +				     "Failed to register second DSI device\n");

[Severity: High]
Does this leave the secondary DSI device vulnerable to uncoordinated unbind=
ing?
Since ctx->dsi[1] is registered as a child of dsi1_host, if dsi1_host is un=
bound
via sysfs or module removal, the driver core will automatically unregister =
and
free its children.

Without a device link to dsi1_host->dev, the panel driver is not notified of
this removal and will retain a dangling pointer to ctx->dsi[1]. If the pane=
l is
subsequently disabled or unbound, it could dereference ctx->dsi[1] in
renesas_r63419_disable() or trigger a double-unregister in the devres clean=
up
path.

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
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to attach DSI device %d\n", i);
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Could this expose the panel to the DRM subsystem too early? Calling
devm_drm_panel_add() before configuring and attaching the DSI devices creat=
es
a race condition where a display controller could bind and attempt to enable
the panel immediately.

This would invoke the panel's .prepare() callback before the DSI lanes, for=
mat,
and mode flags are applied, and before the DSI hosts are actually attached,
potentially leading to DCS command transmission failures or hardware
configuration errors. Should devm_drm_panel_add() be called after the DSI
devices are successfully attached?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-topic-sm86=
50-ayaneo-pocket-s2-r63419-v7-0-b84b6da84293@linaro.org?part=3D2
