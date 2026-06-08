Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0C837DEAD
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 18:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942000; cv=none; b=ofVEfygIXaX8Q1P40Me6Zu4Lf/rV24shEeHbsXj+HvMdqUVLM8THA6peEV4FVveEZ8wA5Mc2LuzypSRBxk4BR1ydnNZrJyMJOxaFMkKOGw9oUXxuYYlWhwNGGKSCPVKsWzpvfx23gbP8IpbM5rfcPgTA2Q0Aq+hRb8vIuLr2KzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942000; c=relaxed/simple;
	bh=zAFcrGaQAso8Ywv5/x0tdeRCBLYHToLioe+qiKzfd1k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b9Z442yOR1MVKUKBTzgtw4xM1MeykWNg5B8qhJ/Gq6P5kOTPKPveih3DhdKBINwVx1Hlpsdp/h3dMsK7sGK3auhq6a00me1vVnNIugDfvLwkP95lgNnLvzT+VmfNzOHYy6TfhSDVwZsPXrnRS/dwX6BDHa2UDwxjLBCfdCf6MPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkX5E8qk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkX5E8qk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72171F00893;
	Mon,  8 Jun 2026 18:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780941998;
	bh=wmOzaNPMLMTRlAiuUaUCwxooKMPfOzABb3y8AaIFtNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CkX5E8qkmgdi9EIwF9C26Psb+iabErXzv+FQXPSLSpVzDpOI5DfDgjcRKAwbFhdX+
	 ikLgMPg9nddhI6KR9mRy185Nbv9Kk1g9EQ1J2j6+PA9a/YApbYxsL6E1Q612UYntcB
	 OE9w3XTRZu0qMlqTdSudWXALe7S1gTu7eg/eQGp/G2A94y5k8zboSVWWqQ4jh/od3e
	 S5T9Q6dH+zkH8NQdEWpct71iwP5lIO3reZ3E5ks+QSr+wwzCLKytrIzzHPdFYdlmeZ
	 5VayweFuItnav+0WQnIlaD6kg04cdIpqZ2vIAkHwsYkB+/suKCO/A5SBy8muaju1w9
	 gRNt/Apdu4pjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 4/6] drm/panel: anbernic-td4310: Add RG Vita Pro
 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608175521.67449-5-macroalpha82@gmail.com>
References: <20260608175521.67449-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 18:06:38 +0000
Message-Id: <20260608180638.A72171F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Requesting `reset_gpio` as `GPIOD_OUT_LOW` in probe backpowers the=
 panel, and missing reset assertion in the `prepare` error path leaves the =
panel backpowered.
- [Low] The driver calls a non-existent function `devm_drm_panel_add()`, ca=
using a compilation failure.
--

commit 0a4500b372d995ebf665c9896430451a3e287a41
Author: Chris Morgan <macromorgan@hotmail.com>

drm/panel: anbernic-td4310: Add RG Vita Pro panel

The panel used by Anbernic in the RG Vita-Pro is a DSI panel based
on the TD4310 controller IC.

> diff --git a/drivers/gpu/drm/panel/panel-anbernic-td4310.c b/drivers/gpu/=
drm/panel/panel-anbernic-td4310.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-anbernic-td4310.c
[ ... ]
> +static int panel_anbernic_td4310_prepare(struct drm_panel *panel)
> +{
[ ... ]
> +	if (dsi_ctx.accum_err) {
> +		ret =3D dsi_ctx.accum_err;
> +		goto err_reset;
> +	}
> +
> +	return 0;
> +
> +err_reset:
> +	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
> +err_enable:
> +	regulator_disable(ctx->vdd);

[Severity: High]
The err_reset path disables the VDD regulator without re-asserting the reset
GPIO (setting it to logical 1 / physical LOW). Could this leave the unpower=
ed
panel backpowered through its IO lines if the prepare sequence fails?

> +	return ret;
> +}
[ ... ]
> +static int panel_anbernic_td4310_probe(struct mipi_dsi_device *dsi)
> +{
[ ... ]
> +	ret =3D of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get panel orientation\n");
> +
> +	ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);

[Severity: High]
Assuming the reset GPIO is configured as active-low in the device tree,
requesting it with GPIOD_OUT_LOW sets its logical value to 0, which drives
the physical pin HIGH.

Because the panel's VDD supply is off at probe time, will driving the
reset pin HIGH backpower the panel via its IO protection diodes?

> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Cannot get reset gpio\n");
[ ... ]
> +	dsi->mode_flags =3D ctx->panel_info->mode_flags;
> +
> +	ret =3D drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return ret;
> +
> +	devm_drm_panel_add(dev, &ctx->panel);

[Severity: Low]
Is devm_drm_panel_add() defined in the DRM panel API? It appears only
drm_panel_add() and devm_drm_panel_add_follower() are available, which
might cause an implicit declaration build error here.

> +
> +	ret =3D devm_mipi_dsi_attach(dev, dsi);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608175521.6744=
9-1-macroalpha82@gmail.com?part=3D4
