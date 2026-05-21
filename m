Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD3B37DEA9
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 16:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779381041; cv=none; b=ZZRjLR7Pwzci0YrCgpReCRy0C6ahpujgzmN5TYbSmeJ9qD/soC26dNwUB/Eb1Nc/9RPNCB9GcJcW+QbDUHKTQUL+bnxnnNcH+c9BJ8FfnFpaNH9n2sQk8OgE5kPFuf8kvelS9iWIcGfMoRD95I2t7BliEZvX7mgyDHkj1VjwwK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779381041; c=relaxed/simple;
	bh=Kn80HH+1Nr7GjmndM2d+alR9fDByY8z4ffCLALzundg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AGAWJfptcu1VM9IBxasGDxzus/lCPCgq3s8Dz/1yZPP6qXif+SEFlpCK4fKDur1QCS4yBW37hEOFHAT3Js922Sb3lQwq0c+xeoc42eOIKiLSLlHF5ZoMqSg21RlfWeCd1sZ7xmsSf/PdF9fbUtmLMTftEEi7NGTDgkJCILL3jG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nic/eXlg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nic/eXlg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D3A1F000E9;
	Thu, 21 May 2026 16:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779381039;
	bh=3XGStLPF9UJ+wJh0mHFbu3+Wv5kkboH9hCMYV0cX5oM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nic/eXlgf9Ceo+O8YVvcASt04ZHmxdVjOSYe6eoU3CYqhrUlmUHeZMZzhv0DEZeO8
	 erA+CsHYxpK2KJNIOA+1txJH1XgTt9SrCfFfl2oknzqmxMeXG+1Y46elHBlngu2fa0
	 YUv8Upi+SemFZV2Req75qWjHVCZK2lK0R8vdnlytmf6r+ZIZWVxkxmbDAHBp7GoLVr
	 MUfYSA4viTovtvIDI6xNaFQTBAIGFlzghr+zGuUChRUMeEgPK/SPOXPQTUTGp8isJX
	 wHcMO1ymdcQq5q+B/km/xezCyXCLXIM2QcCFhH0wP9iysfnPLK5hmGoBIuVKzyM7oZ
	 QMm7/68KNlAJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] drm/panel: Add driver for Synaptics R63455 DSI
 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Nie" <jun.nie@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-5-a4dd5e0850f1@linaro.org>
References: <20260521-sm8650-7-1-bonded-dsi-v4-5-a4dd5e0850f1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 16:30:38 +0000
Message-Id: <20260521163039.30D3A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Incorrect order of error unwinding labels in `r63455_prepare` caus=
es resource leaks and unbalanced regulator operations.
- [High] The secondary DSI device registered during probe is never unregist=
ered, causing a memory and device leak.
- [High] Endianness extraction macros misuse host-endian functions, resulti=
ng in reversed byte order on Big Endian architectures.
- [High] Unconditional access to `ctx->reset_gpios->desc[1]` leads to an ou=
t-of-bounds array read if only one reset GPIO is provided.
- [High] Failure of `drm_dsc_setup_rc_params` is logged but ignored, leadin=
g to division by zero and uninitialized data usage.
- [High] Backlight updates send DSI commands after the panel has entered sl=
eep mode, risking hardware timeouts.
- [High] Premature publication of backlight and panel interfaces leads to u=
se-before-initialization races.
- [High] Unprotected concurrent read-modify-write on `mode_flags` causes da=
ta races.
- [High] Unaligned pointer cast causes unaligned memory access when packing=
 DSC PPS payload.
- [Low] Missing Kconfig dependencies for DRM DSC helpers causes build failu=
res.
--

commit b5b6e09241eeff17cb03a31aac27b70f4e5ca911
Author: Jun Nie <jun.nie@linaro.org>
Subject: drm/panel: Add driver for Synaptics R63455 DSI panel

This commit adds support for the DSI panels used in the virtual reality
device. The device features two physical panels, each providing a MIPI DSI
interface and a built-in LED backlight, and exposes a single logical panel
to the DRM framework.

> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
[ ... ]
> @@ -1185,6 +1185,15 @@ config DRM_PANEL_SYNAPTICS_TDDI
>  	  namesake, with varying resolutions and data lanes. They also have a
>  	  built-in LED backlight and a touch controller.
> =20
> +config DRM_PANEL_SYNAPTICS_R63455
> +	tristate "Synaptics R63455-based panels"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y if you want to enable support for panels based on the
> +	  Synaptics R63455 controller.

[Severity: Low]
Does this need to select DRM_DISPLAY_DSC_HELPER or DRM_DISPLAY_HELPER?
The driver calls drm_dsc_set_const_params and other DSC helpers, which
might cause link-time failures if the helper infrastructure is not built.

[ ... ]
> diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63455.c b/drivers/gpu=
/drm/panel/panel-synaptics-r63455.c
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-synaptics-r63455.c
[ ... ]
> +#define r63455_dsi_write_buffer(ctx, dsi_ctx, d)					\
> +	do {										\
> +		dsi_ctx.dsi =3D ctx->dsi[0];						\
> +		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, d, ARRAY_SIZE(d));		\
> +		dsi_ctx.dsi =3D ctx->dsi[1];						\
> +		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, d, ARRAY_SIZE(d));		\
> +	} while (0)
> +
> +#define LE16_BYTE0(val) (le16_to_cpu(val) & 0xff)
> +#define LE16_BYTE1(val) ((le16_to_cpu(val) >> 8) & 0xff)

[Severity: High]
Are these macros extracting the correct bytes on big endian architectures?
Using le16_to_cpu() on a native integer constant swaps the bytes on big
endian systems. Applying the bitwise operations afterward will extract the
most significant byte instead of the least significant byte. Would standard
bitwise shifts be safer here?

[ ... ]
> +static int r63455_dsi_populate_dsc_params(struct r63455_ctx *ctx)
> +{
> +	int ret;
> +	struct drm_dsc_config *dsc =3D &ctx->dsc_cfg;
[ ... ]
> +	/* handle only bpp =3D bpc =3D 8, pre-SCR panels */
> +	ret =3D drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(ctx->dev, "failed to setup dsc params\n");
> +
> +	dsc->initial_scale_value =3D drm_dsc_initial_scale_value(dsc);

[Severity: High]
Should this return early if drm_dsc_setup_rc_params() fails? If execution
continues, the driver will use uninitialized DSC configuration parameters.
Because values like initial_xmit_delay might remain zero, it can result in
a division by zero when calculating final_scale inside
drm_dsc_compute_rc_parameters().

> +	dsc->line_buf_depth =3D dsc->bits_per_component + 1;
> +
> +	return drm_dsc_compute_rc_parameters(dsc);
> +}
[ ... ]
> +static int r63455_panel_on_sharp_ls026b3sa06(struct drm_panel *panel)
> +{
> +	struct r63455_ctx *ctx =3D panel_to_ctx(panel);
> +	struct mipi_dsi_multi_context dsi_ctx =3D { 0 };
> +
> +	u8 pps_cmd[1 + sizeof(struct drm_dsc_picture_parameter_set)];
> +
> +	drm_dsc_pps_payload_pack((void *)&pps_cmd[1], &ctx->dsc_cfg);

[Severity: High]
Can this unaligned pointer cause alignment faults? Passing &pps_cmd[1] forc=
es
the base address to be odd. Since drm_dsc_pps_payload_pack() treats the
pointer as a struct and performs 16-bit stores to its fields, this might
trigger alignment panics on architectures that strictly enforce memory
alignment.

[ ... ]
> +static int r63455_set_brightness(struct r63455_ctx *ctx, u16 brightness,
> +				  u16 pulse_offset_rows)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx =3D { 0 };
> +	u16 gpo1_tew1;
> +
> +	gpo1_tew1 =3D brightness > BRIGHTNESS_MAX_120 ?
> +		    BRIGHTNESS_MAX_120 : brightness;
> +
> +	ctx->dsi[0]->mode_flags &=3D ~MIPI_DSI_MODE_LPM;

[Severity: High]
Can this read-modify-write of mode_flags race with the similar modifications
in r63455_enable() and r63455_disable()? Because set_brightness() is called
from sysfs context and enable/disable from DRM commit context, concurrent
access might corrupt mode_flags and drop critical settings like
MIPI_DSI_MODE_VIDEO.

> +	ctx->dsi[1]->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
[ ... ]
> +static int r63455_disable(struct drm_panel *panel)
> +{
> +	struct r63455_ctx *ctx =3D panel_to_ctx(panel);
> +	struct mipi_dsi_multi_context dsi_ctx =3D { 0 };
> +
> +	ctx->dsi[0]->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> +	ctx->dsi[1]->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> +
> +	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_SET_DISPLAY_OFF);
> +	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_SET_TEAR_OFF);
> +	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_ENTER_SLEEP_MODE);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 200);
> +
> +	if (dsi_ctx.accum_err)
> +		return dsi_ctx.accum_err;
> +
> +	return backlight_disable(ctx->backlight);

[Severity: High]
Is it safe to disable the backlight here? The backlight_disable() function
calls r63455_set_brightness(), which will send DSI configuration commands to
the panel. Doing so after sending MIPI_DCS_ENTER_SLEEP_MODE violates the DSI
hardware contracts and might cause bus timeouts or hardware crashes.

> +}
> +
> +static int r63455_unprepare(struct drm_panel *panel)
> +{
> +	struct r63455_ctx *ctx =3D panel_to_ctx(panel);
> +	int ret;
> +
> +	gpiod_set_value(ctx->reset_gpios->desc[0], 0);
> +	gpiod_set_value(ctx->reset_gpios->desc[1], 0);

[Severity: High]
What happens if the device tree only provides a single reset GPIO? If ndescs
is 1, accessing desc[1] will read past the end of the flexible array,
resulting in a garbage pointer dereference.

[ ... ]
> +static int r63455_prepare(struct drm_panel *panel)
> +{
> +	struct r63455_ctx *ctx =3D panel_to_ctx(panel);
> +	int ret;
[ ... ]
> +	msleep(20);
> +	gpiod_set_value(ctx->reset_gpios->desc[0], 1);
> +	gpiod_set_value(ctx->reset_gpios->desc[1], 1);
> +
> +	return 0;
> +
> +bl_off:
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->reg_bl), ctx->reg_bl);
> +vdda_off:
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->reg_vdda), ctx->reg_vdda);
> +bias_off:
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->reg_lcd_bias_pos),
> +			       ctx->reg_lcd_bias_pos);
> +	return ret;

[Severity: High]
Are these error labels in the correct order? They appear to fall through
sequentially rather than unwinding in reverse. If reg_vdda fails to enable,
the jump to bl_off will disable the backlight, but then incorrectly fall
through to vdda_off and bias_off. This causes regulators that were never
enabled to be disabled, and completely skips disabling regulators that were
actually enabled.

> +}
[ ... ]
> +static int r63455_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev =3D &dsi->dev;
> +	struct r63455_ctx *ctx;
> +	struct mipi_dsi_device *dsi1_device;
[ ... ]
> +	dsi1_host =3D of_find_mipi_dsi_host_by_node(dsi1);
> +	of_node_put(dsi1);
> +	if (!dsi1_host) {
> +		DRM_DEV_ERROR(dev, "failed to find secondary dsi host\n");
> +		return -EPROBE_DEFER;
> +	}
> +
> +	dsi1_device =3D mipi_dsi_device_register_full(dsi1_host, &info);

[Severity: High]
Does this dynamically allocated dsi1_device need to be unregistered? There
is no call to mipi_dsi_device_unregister() in the error paths below or in a
remove callback for the driver, which could cause a permanent device and
memory leak when the module is unloaded or fails to probe.

> +	if (IS_ERR(dsi1_device)) {
> +		DRM_DEV_ERROR(dev, "failed to create dsi device\n");
> +		return PTR_ERR(dsi1_device);
> +	}
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
Does calling r63455_panel_add() before devm_mipi_dsi_attach() expose the
backlight sysfs interface too early? If userspace writes to the brightness
node before the DSI lanes and formats are configured and attached, it could
trigger a DSI transfer on an unattached device and crash the system.

> +		if (ret < 0) {
> +			DRM_DEV_ERROR(dev, "dsi attach failed i =3D %d\n", i);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-sm8650-7-1=
-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org?part=3D5
