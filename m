Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1511A682A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378676; cv=none; b=B7UiM9+RYcI5RsOFsZs2UM2Iwibe2aQaW8ZNi30lCRBYDhCrX5hNmdht6CG8em6lsT5wJEH3fsWyacfJ5/zvQxXnCu+wDdu4b5ilT13PpcmUsI//ddm45kyLFiTHWKMx2yLalnhkyv75siVeVXpsyc0EsFqZ5tKWy71ERchOCDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378676; c=relaxed/simple;
	bh=/v0swBZ8hf05upOtX/2Y1ywuQt1DjN4CSdCbTbQcP44=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K1fO24onrTg0UAEj5/RMh9icIM7T9tE4vvU2Sb7Jj04VZTL1Q1qFy5/uCDnqRtfGq20WgkOVkT1Q3BIJh41NDdcQSNSmyZDLlug38k4T7YLO8AMvY5zvpUmUyTEA2E2gXAQg0Tbo17QaiFjPshrLBI1HJXpgtlMkWrjCAkVFMUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X24HsPM5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X24HsPM5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741E11F000E9;
	Thu, 30 Jul 2026 02:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785378674;
	bh=HjK1YGvTkXFMHacoXaUNy3E/2/TaOAAuHlAhIBAq4Lc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X24HsPM5rIv2EEMCE3kDXYUJ36Pe8hwn2nzZGL+N9BI9p+sow7Hfqe1eCkVbAM4ZJ
	 fEaazdSPO3tjVqp9SAOqWL6E5f6PLoyMwv4T3PLCpiMlDl8pjjcXRBVV8h0YInS+ko
	 clWdNaNnuDddjlhWpNieFoVbht9v+2NhqPD4uh+Aldn9AmLMrqfd3z/V9AzRGspp30
	 r+FwKVhc4d5Yo6J3uANvQFEPiJGUjlgrZWrURDQhT2eTiw09QOVz6/7cs68O6sidSo
	 gHoP2R0s/RicfizlIbXhBdTHnPSMLyA8SUZKxgYSoERUQMED5iQUFO/mOFfOqQUaFl
	 vEZW8I5LrqXkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: i2c: Add Sony IMX908 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lachlan Michael" <lachlan.michael@sony.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730021525.166811-3-lachlan.michael@sony.com>
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-3-lachlan.michael@sony.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 02:31:14 +0000
Message-Id: <20260730023114.741E11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] The HMAX (line length) register is never programmed when streaming=
 in window crop mode.
- [High] Improper handling of negative return values from `pm_runtime_get_i=
f_in_use()` causes a usage counter underflow.
- [High] Uninitialized 'err' variable passed to `cci_read()` causes unpredi=
ctable probe failures.
- [High] Incorrectly ordered goto labels in probe skip `pm_runtime_disable(=
)`, leading to Use-After-Free.
- [Medium] Stale `V4L2_CID_HBLANK` control value in window crop mode breaks=
 userspace framerate calculations.
- [Medium] `VIDIOC_SUBDEV_S_FMT` completely ignores requested format dimens=
ions.
- [Medium] Failure to parse fwnode properties leaks the V4L2 control handle=
r.
- [Low] Using `DIV_ROUND_UP` with a 64-bit divisor causes a link error on 3=
2-bit architectures.
- [Low] Passing a `const u64 *` array where `const s64 *` is expected cause=
s compiler errors.
- [Low] Mixing signed and unsigned types in the `max()` macro triggers a st=
atic assertion failure.
--

--- Patch [2]: [PATCH 2/2] media: i2c: Add Sony IMX908 image sensor driver =
---
commit fec18c7296fb27d6d3b1fc169701ad50039de074
Author: Lachlan Michael <lachlan.michael@sony.com>

media: i2c: Add Sony IMX908 image sensor driver

This commit adds a V4L2 sub-device driver for the Sony IMX908 CMOS image
sensor. It supports RAW10 and RAW12 formats, exposure/gain controls,
blanking, window cropping, and test patterns.

> diff --git a/drivers/media/i2c/imx908.c b/drivers/media/i2c/imx908.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/i2c/imx908.c
[ ... ]
> +static const u64 imx908_link_freqs[] =3D {
> +	[IMX908_LINK_FREQ_297MHZ]  =3D  297000000ULL,

[Severity: Low]
Does this declaration cause a build failure? The array is defined as u64,
but v4l2_ctrl_new_int_menu() and v4l2_link_freq_to_bitmap() expect an s64
pointer. This type mismatch might trigger an incompatible-pointer-types err=
or
during compilation.

[ ... ]
> +static u16 imx908_calc_min_hmax(u32 width, u64 pixel_rate)
> +{
> +	/*
> +	 * Calculate the minimum HMAX that guarantees:
> +	 *     line_length_pixels >=3D width
> +	 * where:
> +	 *     line_length_pixels =3D
> +	 *         ceil(HMAX * pixel_rate / IMX908_XHS_HZ)
> +	 */
> +	return DIV_ROUND_UP((u64)width * IMX908_XHS_HZ, pixel_rate);
> +}

[Severity: Low]
Can this cause a link error on 32-bit architectures? The pixel_rate
variable is a 64-bit value, and using DIV_ROUND_UP with a 64-bit divisor
generates an undefined reference to __udivdi3.

[ ... ]
> +static u32 imx908_calc_min_vmax(const struct v4l2_rect *crop)
> +{
> +	/* In window crop mode constrain VMAX (from datasheet) */
> +	if (!v4l2_rect_equal(crop, &imx908_active_area))
> +		return max(crop->height + IMX908_VMAX_CROP_MIN_MARGIN,
> +			   IMX908_VMAX_CROP_MIN_LIMIT);

[Severity: Low]
Will this trigger a static assertion failure during build? The max() macro
strictly checks for type mismatches, and crop->height is an unsigned 32-bit
value while IMX908_VMAX_CROP_MIN_LIMIT is treated as a signed integer.

[ ... ]
> +static void imx908_mode_build(struct imx908 *imx,
> +			      const struct v4l2_mbus_framefmt *fmt,
> +			      const struct v4l2_rect *crop)
> +{
[ ... ]
> +	if (v4l2_rect_equal(crop, &imx908_active_area)) {
[ ... ]
> +		m->hmax =3D imx908_calc_hmax(fmt->width, hblank, m->pixel_rate);
> +	} else if (!m->hmax) {
> +		u32 hblank =3D imx908_hmax_to_hblank(IMX908_HMAX_DEFAULT,
> +						   m->pixel_rate,
> +						   imx908_active_area.width);
> +
> +		m->hmax =3D imx908_calc_hmax(fmt->width, hblank, m->pixel_rate);
> +	}

[Severity: High]
Is the HMAX register left unprogrammed when streaming in window crop mode?
Since m->hmax is initialized to a non-zero default during probe, this
condition is always false.=20

Additionally, imx908_set_ctrl() actively skips writing to the HMAX register
in crop mode, which might leave the hardware configured with stale timings
or broken output.

[ ... ]
> +static void imx908_update_framing_limits(struct imx908 *imx, struct v4l2=
_subdev_state *state)
> +{
[ ... ]
> +	/* Only update HBLANK in all pixel mode */
> +	if (v4l2_rect_equal(crop, &imx908_active_area))
> +		imx908_update_hblank_limits(imx, fmt->width, pixel_rate);

[Severity: Medium]
Does skipping the HBLANK update in crop mode cause stale control values?

Since the line length remains constant but the active image width is smalle=
r,
the horizontal blanking time should physically increase. Freezing the contr=
ol
could break userspace exposure and frame rate calculations.

[ ... ]
> +static int imx908_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	/* Applying V4L2 controls only if powered up */
> +	if (!pm_runtime_get_if_in_use(&client->dev))
> +		return 0;

[Severity: High]
Can this underflow the power management usage counter?

The pm_runtime_get_if_in_use() function returns a negative error code like
-EINVAL if runtime PM is disabled. The check evaluates that negative number
as true, which allows execution to proceed to the hardware access and the
matching pm_runtime_put() call without ever incrementing the counter.

[ ... ]
> +static int imx908_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_format *fmt)
> +{
[ ... ]
> +	format =3D v4l2_subdev_state_get_format(sd_state, fmt->pad);
> +
> +	if (imx908_mbus_code_supported(imx, fmt->format.code))
> +		format->code =3D fmt->format.code;
> +	else
> +		format->code =3D IMX908_DEFAULT_MBUS_CODE;
> +
> +	/* Fully define metadata */
> +	format->field        =3D V4L2_FIELD_NONE;

[Severity: Medium]
Does this completely ignore the requested format dimensions?
The code updates the format code based on the user request, but skips updat=
ing
format->width and format->height before returning the structure. This causes
VIDIOC_SUBDEV_S_FMT to silently fail resolution negotiation.

[ ... ]
> +static int imx908_init_controls(struct imx908 *imx)
> +{
[ ... ]
> +	/* Pick up rotation and orientation if defined in overlay */
> +	ret =3D v4l2_fwnode_device_parse(imx->dev, &props);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D v4l2_ctrl_new_fwnode_properties(hdl, &imx908_ctrl_ops, &props);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does this memory leak the V4L2 control handler?

If either fwnode parse function fails, this returns early without calling
v4l2_ctrl_handler_free(hdl). Since imx->sd.ctrl_handler is only assigned
at the very end of the function, the cleanup path during probe will try to
free NULL, leaving the handler allocated.

[ ... ]
> +static int imx908_identify_model(struct imx908 *imx)
> +{
> +	int ret;
> +	int err;
> +	u64 val;
> +	u16 chip_id;
[ ... ]
> +	ret =3D cci_read(imx->cci, IMX908_REG_TYPE_ID, &val, &err);
> +	if (ret || err)
> +		return ret ? ret : err;

[Severity: High]
Could the uninitialized err variable cause random probe failures?

The local variable err is uninitialized when passed to cci_read(). Looking
at cci_read(), it checks if the error pointer contains a value to support
error chaining. If the stack contains a non-zero value, cci_read() will
immediately return that garbage value and abort the probe.

[ ... ]
> +static int imx908_probe(struct i2c_client *client)
> +{
[ ... ]
> +err_pm_disable:
> +	pm_runtime_disable(imx->dev);
> +	pm_runtime_set_suspended(imx->dev);
> +	v4l2_subdev_cleanup(&imx->sd);
> +err_entity:
> +	media_entity_cleanup(&imx->sd.entity);
> +err_hdl:
> +	v4l2_ctrl_handler_free(imx->sd.ctrl_handler);
> +err_power_off:
> +	imx908_power_off(imx);
> +
> +	return ret;
> +}

[Severity: High]
Are these error labels ordered correctly to prevent a use-after-free?

The err_hdl label is located below err_pm_disable, meaning failures earlier=
 in
probe will skip executing pm_runtime_disable().=20

The PM core will continue to view the device as active, and a later runtime
suspend will try to access the imx structure that was already freed by devr=
es
on probe failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730021525.1668=
11-1-lachlan.michael@sony.com?part=3D2
