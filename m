Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F6B3AF656
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881495; cv=none; b=Pn7+a+IWKiDFkT8oRDNzY9/yvYLqfkLILq2PMpE43vdK0TyKxRvrcJOr+6V2P+c3wEYORkWynAq7DfQCUKY76/AKhvVum1MI+htsHCJBTmHdu6CqegjtamP9Uz++t/JA4d2QQAipJk+KKMrkGa9EG9fkAivYW46UCK29x7f86PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881495; c=relaxed/simple;
	bh=0zdqfNGLJo/SAKfOmn9btLQAGQoCGkPQAg4g7EZKnuU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ERLiMOxN/FhNZ64wW9kQuwR9GQ9Jwpeq6aEH3fgLeaF6Bou9bXTWd3GREYN7wC9FaYg+n+X2aPEaK2/GMsCxOgUybJqVR/br9Md7OiFF4oLVCfelkM8OZWzAy8eDFvV6byjAz+bPBJlY1xSQQPyr7Nxw0+D4BZy4Q7YHsvh0Y48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2IebWs7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2IebWs7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE27D1F000E9;
	Fri, 24 Jul 2026 08:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784881494;
	bh=YHJ109yjTJOIv0UelJRvqx+JhHETW5UMWtLDsFBE74o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S2IebWs7UQhO4MAX1oTb8oF91hghzoKQ11ri4tbT2pyDHpMdzvRaF8luOCa10B/aK
	 SsChhKA37mEt/gvI4I4qiWTHRwpg2xUQnC1I7JkaXxlxPiQn6FNFlrATh/4evHdF+z
	 jAzJKDvqYFqtMskDm/HSIgFj7nL9Z7LHJjui82o7FW6E9Bfw5WTHE/KrD+bGrhq20A
	 FTD9oNZt+8uclbmFMBvgTqy77lowotJQJk98ZskP5D5X++3YSriauPGIVzslQ7H6IZ
	 IU3yN5iA/5wMKZjaoZiUADkxCUuU++xcFgxqSACjY5+v/1IApIajcslGnREGIyhq/h
	 4cOcYLk3fH1Sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] drm/rockchip: lvds: add RK3568 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rok Markovic" <rok@kanardia.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260724080824.115260-4-rok@kanardia.eu>
References: <20260724080824.115260-1-rok@kanardia.eu>
 <20260724080824.115260-4-rok@kanardia.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:24:53 +0000
Message-Id: <20260724082453.BE27D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Missing `phy_exit()` cleanup for the PHY initialized in `rk3568_=
lvds_probe()`.

Pre-existing issues:
- [High] The driver illegally overwrites the `funcs`, `ops`, and `driver_pr=
ivate` fields of a `drm_bridge` object obtained via `drm_of_find_panel_or_b=
ridge()`.
- [High] Unbalanced `of_node_put()` causes a use-after-free/double-free of =
a device node reference.
--

--- Patch [3]: [PATCH v2 3/4] drm/rockchip: lvds: add RK3568 support ---
commit ff72089a77c6360b2f3e3636251c56b8d17b88e7
Author: Rok Markovic <rok@kanardia.eu>

drm/rockchip: lvds: add RK3568 support

The RK3568 LVDS transmitter has no register block of its own. It is
driven entirely through the GRF and re-uses the MIPI DSI0 D-PHY in
PHY_MODE_LVDS.

Link: https://lore.kernel.org/all/20230119184807.171132-1-a1ba.omarov@gmail=
.com/

> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/r=
ockchip/rockchip_lvds.c
> index 150299c12298a..fcf599ae6c6dd 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c

[ ... ]

> @@ -512,6 +614,17 @@ static int px30_lvds_probe(struct platform_device *p=
dev,
>  	return phy_power_on(lvds->dphy);
>  }
> =20
> +static int rk3568_lvds_probe(struct platform_device *pdev,
> +			     struct rockchip_lvds *lvds)
> +{
> +	/* The phy is powered on from the encoder enable path, not here. */
> +	lvds->dphy =3D devm_phy_get(&pdev->dev, "dphy");
> +	if (IS_ERR(lvds->dphy))
> +		return PTR_ERR(lvds->dphy);
> +
> +	return phy_init(lvds->dphy);
> +}
> +

[Severity: Medium]
Since devm_phy_get() does not automatically call phy_exit(), does this code
leak the PHY's initialization state and resources when the driver is unbound
or fails to probe after initialization?

rk3568_lvds_probe() calls phy_init(lvds->dphy) directly. If phy_init()
succeeds but the probe later fails, or when the device is removed, it
appears phy_exit() is never called to clean up.

[ ... ]

> @@ -601,6 +723,8 @@ static int rockchip_lvds_bind(struct device *dev, str=
uct device *master,
>  	encoder =3D &lvds->encoder.encoder;
>  	encoder->possible_crtcs =3D drm_of_find_possible_crtcs(drm_dev,
>  							     dev->of_node);
> +	rockchip_drm_encoder_set_crtc_endpoint_id(&lvds->encoder,
> +						  dev->of_node, 0, 0);
> =20
>  	ret =3D drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_LVDS=
);
>  	if (ret < 0) {

[Severity: High]
This is a pre-existing issue, but I noticed a potential reference counting
issue in rockchip_lvds_bind():

drivers/gpu/drm/rockchip/rockchip_lvds.c:rockchip_lvds_bind() {
    ...
	if (lvds->panel)
		remote =3D lvds->panel->dev->of_node;
	else
		remote =3D lvds->bridge->of_node;
    ...
	pm_runtime_enable(dev);
	of_node_put(remote);
	of_node_put(port);
}

The remote node pointer is borrowed directly without taking a new reference
(e.g. via of_node_get()), but is then unconditionally passed to
of_node_put(). Can this cause a double-free or use-after-free of the
device node when the reference count is decremented incorrectly?

[Severity: High]
This isn't a bug introduced by this patch, but I also noticed that
rockchip_lvds_bind() overwrites the bridge fields:

drivers/gpu/drm/rockchip/rockchip_lvds.c:rockchip_lvds_bind() {
    ...
	if (lvds->bridge) {
		lvds->bridge->driver_private =3D lvds;
		lvds->bridge->ops =3D DRM_BRIDGE_OP_MODES;
		lvds->bridge->funcs =3D &rockchip_lvds_bridge_funcs;
    ...
}

If drm_of_find_panel_or_bridge() returns an external bridge (when
lvds->panel is NULL), does this overwrite the external bridge's own
function pointers and private data?

This could erase the original operations like atomic_enable and
atomic_disable, preventing the external bridge from functioning, and could
cause memory corruption or crashes when the DRM core invokes the
overwritten function pointers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724080824.1152=
60-1-rok@kanardia.eu?part=3D3
