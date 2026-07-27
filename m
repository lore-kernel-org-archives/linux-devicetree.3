Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BDE3E2AB0
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140421; cv=none; b=GXFBOK/Du5+PNc9egzsEOoIGIcPZbSxptt/KgKaQ9lF89MEk1aJkH1n5LT8M/KDBUCwGFE6FcqTbvp1jCuxhk/Z9bNHjvRT3zE/7g1JI+J5xOzDS0YZ1u8G6bFR/Ak4iDou7X5I/3eSlrO5adUfI6jdn6R4E1o9kX4O1gvs5Ky4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140421; c=relaxed/simple;
	bh=ExpwzbkVSmGOkBK5OxiLIB5tRyrzExWzgWb+iZHUVTU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qEzeConHML/JK+IZ9srxZJC4DSAJMXmh8WoluWlq+GZt2c+qWZJsC4Cqr9U6VTQ/rCjgnAywzeEor16ttNcHtyFRH/Z9rU8p3yj5YdUf65knY0+b2AK3dsRfKs7IeA51TPCDIa/y0vypbIf9IGmSDQ9mNXi97PvFGH45IkaSbQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V51A253W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V51A253W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7221F000E9;
	Mon, 27 Jul 2026 08:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785140418;
	bh=Am3yW1HNNXNMQvNLmR3Zzt8yNP6CAfl+560RxZ2c2cA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V51A253WtrL63OgI6tMc6HtAPZKhUr/ULz76D+AOLy1VYwOI3DhAoQymq88th/m72
	 fyVv3aE7MqPUkI32GE5PIAOKDIHvGO6rHyC3hQ13ORiBx+iWEaPZxJ31tC74tiIwqZ
	 A1oINwNn9Kho9heNZQBp4G/tHr/D8rZDViSITJibdWPvr6PCjNJW2daO7cIkfYiDKs
	 fmDmOdHyffjnmD/KILWwLFIZwzvN1zmXPgMcz+wp3KeSDgK2kQjIS3Do285zazzDqa
	 2NC/PHJUhcw861Zpgfy+qrEsivd1dDcSE03SoJalptLY50901hpDeI9arEEv38zQp6
	 pdThMuc6ZnPaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] drm/panel: Add driver for Synaptics R63455 DSI
 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Nie" <jun.nie@linaro.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-6-c042266b9eeb@linaro.org>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-6-c042266b9eeb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:20:17 +0000
Message-Id: <20260727082018.2E7221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] A copy-paste error in the BOE panel initialization sequence duplic=
ates command bytes, corrupting the DSI payload.
- [High] Concurrent non-atomic read-modify-write operations on DSI `mode_fl=
ags` can corrupt the transmission mode state.
- [High] Missing IS_ERR() check on the return value of devm_drm_panel_alloc=
() leads to an immediate dereference of an error pointer.
- [High] The backlight sysfs interface is exposed to userspace before the D=
SI device is fully configured and attached.
- [Medium] The macros LE16_BYTE0/1 and BE16_BYTE0/1 use endianness conversi=
on functions before bitwise masking, causing incorrect byte order on Big En=
dian architectures.
- [Medium] Returning PTR_ERR() on a valid pointer when the GPIO array size =
is incorrect leaks a kernel heap address and produces a positive error code.
- [Medium] The backlight update_status callback blindly sends DCS commands =
without checking the panel's power state.
- [Low] An early return in the panel disable path on DSI command failure sk=
ips disabling the backlight.
--

--- Patch [6]: [PATCH v5 6/6] drm/panel: Add driver for Synaptics R63455 DS=
I panel ---
commit 89f5e4df3241a9188e302ee5028a24a7b0bc9542
Author: Jun Nie <jun.nie@linaro.org>
Subject: drm/panel: Add driver for Synaptics R63455 DSI panel

This commit adds support for the Synaptics R63455 DSI panel used in virtual
reality devices. It exposes a dual-panel configuration as a single logical
panel to the DRM framework.

> --- a/drivers/gpu/drm/panel/panel-synaptics-r63455.c
> +++ b/drivers/gpu/drm/panel/panel-synaptics-r63455.c
[ ... ]
> +/*
> + * Extract the low byte and high byte of the 16bit number converted
> + * to the cpu endianness.
> + */
> +#define LE16_BYTE0(val) (le16_to_cpu(val) & 0xff)
> +#define LE16_BYTE1(val) ((le16_to_cpu(val) >> 8) & 0xff)
> +#define BE16_BYTE0(val) (be16_to_cpu(val) & 0xff)
> +#define BE16_BYTE1(val) ((be16_to_cpu(val) >> 8) & 0xff)

[Severity: Medium]
Will this generate the correct byte order on Big Endian architectures?

Since be16_to_cpu is a no-op on Big Endian systems, applying the bitwise
shift and mask afterward will extract the bytes in Little Endian order
rather than Big Endian. This will cause the panel initialization sequence to
receive payload bytes in reversed order.

Could we directly shift and mask without the endian conversion macros to
safely serialize CPU-native integers across all architectures?

[ ... ]
> +static int r63455_panel_on_boe_vs026c4m_n52_26000(struct drm_panel *pane=
l)
> +{
[ ... ]
> +	r63455_dsi_write_seq(ctx, dsi_ctx, R63455_GEN_OUTPIN_SET,
> +			     0xf, 0xe4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			     0xf, 0xb2,
> +			     0xf, 0xb2, 0x00, 0x64);

[Severity: High]
Does this sequence intentionally send the 0xf, 0xb2 bytes twice for the BOE
panel initialization?

This looks like it could be a copy-paste error that sends 14 bytes instead
of the expected 12 bytes. Could this transmit malformed configuration data
to the display controller and cause initialization failures?

[ ... ]
> +static int r63455_set_brightness(struct r63455_ctx *ctx, u16 brightness,
> +				  u16 pulse_offset_rows)
> +{
[ ... ]
> +	ctx->dsi[0]->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> +	ctx->dsi[1]->mode_flags &=3D ~MIPI_DSI_MODE_LPM;

[Severity: High]
Are these bitwise operations on mode_flags safe from race conditions?

Since r63455_set_brightness executes under the backlight sysfs lock, it can
run concurrently with DRM atomic commit handlers like r63455_enable or
r63455_disable which use independent locks.

Could a concurrent read-modify-write here corrupt the transmission mode sta=
te,
such as unintentionally dropping the MIPI_DSI_MODE_VIDEO flag?

[ ... ]
> +static int r63455_disable(struct drm_panel *panel)
> +{
[ ... ]
> +	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_ENTER_SLEEP_MODE);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 200);
> +
> +	if (dsi_ctx.accum_err)
> +		return dsi_ctx.accum_err;
> +
> +	/* required by hardware to be after MIPI_DCS_ENTER_SLEEP_MODE */
> +	return backlight_disable(ctx->backlight);

[Severity: Low]
Does returning early here leave the backlight subsystem in an active state?

If the DSI ENTER_SLEEP_MODE sequence fails, the driver skips calling
backlight_disable. While the physical regulators are disabled later in
r63455_unprepare, could this leave the backlight framework out of sync?

[ ... ]
> +static int r63455_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> +	struct r63455_ctx *r63455_ctx =3D mipi_dsi_get_drvdata(dsi);
> +
> +	return r63455_set_brightness(r63455_ctx, bl->props.brightness,
> +				     bl->props.pulse_offset_rows);
> +}

[Severity: Medium]
Does this function need to verify the panel power state before sending DCS
commands?

Userspace can modify the brightness via sysfs while the DRM display is
disabled. If this occurs, it might trigger MIPI DSI transmissions to a
powered-off panel or unclocked DSI host.

Could this lead to hardware lockups or DSI timeouts?

[ ... ]
> +static int r63455_panel_add(struct r63455_ctx *ctx)
> +{
[ ... ]
> +	ctx->reset_gpios =3D devm_gpiod_get_array(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpios) || ctx->reset_gpios->ndescs !=3D 2)
> +		return PTR_ERR(ctx->reset_gpios);

[Severity: Medium]
If the GPIO array has a count other than 2, will this return a positive val=
ue
derived from a valid heap pointer?

When devm_gpiod_get_array succeeds but returns an unexpected number of
descriptors, ctx->reset_gpios is a valid pointer rather than an error point=
er.

Could we return an explicit error code like -EINVAL here instead of leaking
the pointer address through PTR_ERR?

[ ... ]
> +static int r63455_probe(struct mipi_dsi_device *dsi)
> +{
[ ... ]
> +	ctx =3D devm_drm_panel_alloc(&dsi->dev, __typeof(*ctx), panel,
> +				   &r63455_drm_funcs, DRM_MODE_CONNECTOR_DSI);
> +
> +	ctx->dsi_init_seq =3D of_device_get_match_data(dev);

[Severity: High]
Should we check the return value of devm_drm_panel_alloc for an error point=
er?

If memory allocation fails during driver probe, devm_drm_panel_alloc returns
ERR_PTR(-ENOMEM). Dereferencing ctx on the very next line to assign
dsi_init_seq will result in a kernel panic.

[ ... ]
> +	ret =3D r63455_panel_add(ctx);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "failed to add panel %d\n", ret);
> +		return ret;
> +	}
> +
> +	for (i =3D 0; i < 2; i++) {
> +		dsi_dev =3D ctx->dsi[i];
> +		dsi_dev->lanes =3D 3;
> +		dsi_dev->format =3D MIPI_DSI_FMT_RGB888;
> +		dsi_dev->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
> +			MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +		ret =3D devm_mipi_dsi_attach(dev, dsi_dev);

[Severity: High]
Is it safe to register the backlight device before the DSI host is configur=
ed
and attached?

Calling r63455_panel_add exposes the backlight sysfs interface to userspace.
However, the lanes, format, mode_flags, and devm_mipi_dsi_attach are not
set up until the loop that follows.

If a udev rule writes to the brightness node during this window, could it
trigger DSI transmissions on an unattached device and lock up the host?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-sm8650-7-1=
-bonded-dsi-v5-0-c042266b9eeb@linaro.org?part=3D6
