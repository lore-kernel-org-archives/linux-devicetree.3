Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CA91C3318
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380578; cv=none; b=AdGgKOfoWBp8fG0mkFaFb5h/ZlL1xLpsu9akWBin39a/Y/YvwRag9r32FT0op1H1cpAI9SQtb66mXDF5t1beYcZB5ipYdE4Nw9rbdwAmM5EVxjy7lxxo3+wVC7v336Jk8ITe+7QWj5u2Ajf1lwUu70LqKTl4u6fnm6kJkpN+MRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380578; c=relaxed/simple;
	bh=AH2C25HdothtoWG3bHnwvISTABuQM4xCnKMaASU+fIg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FSoW7s9Ks3jeTBE0N+zSD1LDOLu8DNqx9sG9JxTNuaGBy2/+trcsoIhRk0F6IN65XdjqmwVaJQKvuy5AFAMeD/OHNj2p+5UICiM3r0WQz1BJhWcXweUD4KRrbPSpZAi+5NNFFaY+8n8U6h4pqoatZCsLYOPK+qZPhiVZ++40o3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoniiuU/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoniiuU/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387981F000E9;
	Thu, 25 Jun 2026 09:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782380576;
	bh=zfMsCknnq/TurMLwW2vBaRAzkOpT493eWxYZHZP8Zxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IoniiuU/Hvc8ISCoEs2SCXWKRQJGD2hd5JmpGlgNU7D/Q68o/6rsWbEzSL888wB2o
	 B2nKMKjNYaFdyX3pVX05PEB3u1MFw0AbrIQB+leX/gLIDO8gNvQI72a+bm7hNNxzv+
	 U7GwhxoGyoOWT5c/yS7WtRD7xDUU/jd+qxzW0iQ5LMWgmvDHUPMgN2Rp6zqEWJY+R4
	 GaVHxbjCilgWmmbkKyQpuyrtXbblpW3ieZOpnmOTzaml2kOhtwSHz/xjgQqZONCMz1
	 1KXoTW0sqKby95e8fFqfmgWSn9082lKhfGv2bEcFd+EeXeMBts+jWednv7NF50Uzik
	 JoWczTP5PDXzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-2-8570e692143e@linaro.org>
References: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-0-8570e692143e@linaro.org>
 <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-2-8570e692143e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 09:42:55 +0000
Message-Id: <20260625094256.387981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Asymmetric panel callbacks for DCS commands (display on/off) cause=
s state mismatch and permanent blanking.
- [High] The panel initialization sequence sends the `set_display_on` comma=
nd before the `exit_sleep_mode` command.
- [High] Missing device link between the panel and the secondary DSI host l=
eads to Use-After-Free and Double-Free.
--

commit bd7c7e227b10119b2ca8cfde561c22808d05f4f2
Author: KancyJoe <kancy2333@outlook.com>
drm: panel: add support for the Renesas R63419 based dual-DSI video mode Di=
splay Panels

This commit implements support for the Renesas 63419 based dual-DSI video
mode Display Panels used in the Ayaneo handheld gaming devices.

> diff --git a/drivers/gpu/drm/panel/panel-renesas-r63419.c b/drivers/gpu/d=
rm/panel/panel-renesas-r63419.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-renesas-r63419.c
[ ... ]
> +static int renesas_r63419_on(struct renesas_r63419_panel *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx =3D { 0 };
> +
> +	/*
> +	 * Panel registers are loaded from DDIC Non Volatile Memory
> +	 *
> +	 * The DDIC expects this sequence to get out of sleep and enable display
> +	 */
> +
> +	mipi_dsi_dual(mipi_dsi_dcs_set_display_on_multi,
> +		      &dsi_ctx, ctx->dsi[0], ctx->dsi[1]);
> +	mipi_dsi_msleep(&dsi_ctx, 50);
> +
> +	mipi_dsi_dual(mipi_dsi_dcs_exit_sleep_mode_multi,
> +		      &dsi_ctx, ctx->dsi[0], ctx->dsi[1]);

[Severity: High]
Are these MIPI DCS commands sent in the correct order?=20

According to the standard, a display must exit sleep mode and wait for
internal initialization before processing the set_display_on command.
Sending set_display_on first might cause the sleeping DDIC to ignore it.

> +	mipi_dsi_msleep(&dsi_ctx, 150);
> +
> +	return dsi_ctx.accum_err;
> +}
[ ... ]
> +static int renesas_r63419_disable(struct drm_panel *panel)
> +{
> +	struct renesas_r63419_panel *ctx =3D to_renesas_r63419_panel(panel);
> +	struct mipi_dsi_multi_context dsi_ctx =3D { 0 };
> +
> +	mipi_dsi_dual(mipi_dsi_dcs_set_display_off_multi,
> +		      &dsi_ctx, ctx->dsi[0], ctx->dsi[1]);
> +	mipi_dsi_msleep(&dsi_ctx, 50);
> +
> +	mipi_dsi_dual(mipi_dsi_dcs_enter_sleep_mode_multi,
> +		      &dsi_ctx, ctx->dsi[0], ctx->dsi[1]);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	return 0;
> +}
[ ... ]
> +static const struct drm_panel_funcs renesas_r63419_panel_funcs =3D {
> +	.disable =3D renesas_r63419_disable,
> +	.prepare =3D renesas_r63419_prepare,
> +	.unprepare =3D renesas_r63419_unprepare,

[Severity: High]
Should there be an enable callback to match the disable callback?

If the display pipeline is disabled and re-enabled during DPMS transitions,
the bridge framework cycles disable and enable. Since the panel receives
set_display_off and enter_sleep_mode during disable, but the enable
callback is missing, won't the panel remain permanently asleep when waking
up?

> +	.get_modes =3D renesas_r63419_get_modes,
> +	.get_orientation =3D renesas_r63419_get_orientation,
> +};
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
Does the secondary DSI device registration require a device link to protect
its lifetime?

If the secondary host is unbound via sysfs, the DSI core unregisters all
child devices, freeing this pointer. Without a device link to force the
panel to unbind first, could devm teardown or subsequent panel accesses
lead to a use-after-free or double-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-topic-sm86=
50-ayaneo-pocket-s2-r63419-v8-0-8570e692143e@linaro.org?part=3D2
