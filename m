Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F9C442135
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777353; cv=none; b=bKEJbvs1ZUOb8iFSvICFZXjxgKWsLC1YRQuQLLDDyzmkd7TFPHOYKTJk2NDxVCBMPYbJkFiBRLnpAq+4fz34H0HT8ePtHB0yv0AvNQlfahytAK+A04Zc+0+BArriEFR+YAWKNyS7dxZlV02LVT3XppIgsLU8uRsuEroCKfeMXyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777353; c=relaxed/simple;
	bh=uSGqTy2MPgqSL2vsenvOmTcsfgqVZDF8W6riKuvynXM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=midy3NPd3uxNkhRWSyiwbAWgeU/bic9xeB06k9ZTeXWPvw+WyByAJgf5zvSRB7sgfozy9wx4xx/5nzFAoU14fe0VLj1mnpbuD4oxaGwbreRh//E+svHsL0PTGkDzi7S3+7NxGCNW4GcZgLEYcBjjvxiGvF/exNyntupF7KcsbFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3n0NAkh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3n0NAkh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A7D1F00A3A;
	Mon,  7 Sep 2026 10:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788777351;
	bh=+WA+KE+/MtkhEF0f/C3I56LhndDg1ATZ5rtpZaJsblY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G3n0NAkhaRuFXMpTS8D/sq1EmctOCm8VAsDVEH1RV+vFPe/UCaU94T1p1I6F6USd1
	 xksK1IitcESDO1ZETDaJdHjvgTb7CnctK2bbkMhhAlMbDuP7y5D+upOhOa+7Avcs5R
	 VbVN6/pU1YaZ3ePI1R8X9UNI2w/A3o92Rv11UoCcOOyo6pJlD2mQRX9sAmHh8QDv0i
	 y/0GTjuwnb7nEI07Gq5oxGhrgrfCm8fIAoZa75fbMw087rkvd2dUzjWLkLzWN1370T
	 jeSXwjy1iDTJolQxaQLQQQyoiUVMrAtZBo9rjnriRyqA+U0XpqL3WLgZ145Hdpp/1c
	 P0OfocZ8RE3rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: mira016: Add driver for Mira016
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-mira016-v3-2-b078a6793d65@ideasonboard.com>
References: <20260907-mira016-v3-0-b078a6793d65@ideasonboard.com>
 <20260907-mira016-v3-2-b078a6793d65@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 10:35:50 +0000
Message-Id: <20260907103550.E9A7D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] Unconditional dereference of v4l2_subdev_state_get_format() re=
sult causes NULL pointer dereference when CONFIG_MEDIA_CONTROLLER is disabl=
ed.
- [High] Incorrect handling of pm_runtime_get_if_in_use() return value trea=
ts negative error codes as success, causing usage counter underflow.
- [High] Use-After-Free due to V4L2 control handler being freed before unre=
gistering the subdevice.
- [High] The read_poll_timeout macro swallows the error code from cci_read =
and fails silently.
- [High] Horizontal ROI registers are improperly defined as 8-bit, truncati=
ng their 16-bit values.
- [High] Active state format is overwritten before checking if the subdevic=
e is currently streaming, corrupting the software state.
- [High] Missing delays after enabling regulators, clock, and deasserting r=
eset.
- [Medium] Severe precision loss in pixel rate calculation due to premature=
 integer division.
- [Medium] Mixing goto-based error handling with __free() scope-based clean=
up in the same function.
- [Medium] Inconsistent initialization of row_length creates a mismatch bet=
ween default control limits and explicit format control limits.
- [Low] Integer division always evaluates to 0 in unused esc_period calcula=
tion.
--

commit 9c6378991c811d36f2a5849235c3c88b6af0b9b5
Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

media: i2c: mira016: Add driver for Mira016
   =20
Add driver for the ams OSRAM Mira016 sensor.

> diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
> new file mode 100644
> index 0000000000000..8286b7e2c0a42
> --- /dev/null
> +++ b/drivers/media/i2c/mira016.c
@@ -0,0 +1,2300 @@
[ ... ]
> +/* X ROI */
> +#define MIRA016_XWIN_LEFT_REG		CCI_REG8(0xe02c)
> +#define MIRA016_XWIN_RIGHT_REG		CCI_REG8(0xe02e)

[Severity: High]
Does this code improperly truncate 16-bit register values?

The horizontal window boundaries can exceed 255 (up to 400), but using
CCI_REG8 limits them to 8 bits. When writing these values later via
cci_write(), they will be masked to 8 bits, completely breaking the
horizontal window boundaries. Should these be defined as 16-bit registers?

[ ... ]
> +static inline u32 mira016_calc_prate(struct mira016 *mira016, u32 h_tot)
> +{
> +	/*
> +	 * Pixel rate is calculate as the row duration divided by the total line
> +	 * length.
> +	 *
> +	 * pixel time (psec) =3D t_row(psec) / h_tot
> +	 * pixel rate (mbps) =3D 10^12 / pixel_time
> +	 *		     =3D 10^12 * h_tot / t_row
> +	 *		     =3D h_tot * 10^6 / t_row * 10^6 to avoid overflows
> +	 */
> +	u32 trow_psec =3D mira016_trow_psec(mira016);
> +
> +	return h_tot * HZ_PER_MHZ / trow_psec * HZ_PER_MHZ;

[Severity: Medium]
Will this evaluate left-to-right and cause severe precision loss?

The integer division by trow_psec happens before the final multiplication
by HZ_PER_MHZ, acting as a floor function and truncating all sub-MHz
precision. Could this be reworked to retain precision?

[ ... ]
> +static int mira016_set_pad_format(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  struct v4l2_subdev_format *fmt)
> +{
> +	struct mira016 *mira016 =3D to_mira016(sd);
> +	struct v4l2_rect *crop;
> +	u32 pixel_rate;
> +	u32 min_vblank;
> +	u32 gain_max;
> +	int ret;
> +
> +	mira016_update_pad_format(mira016, &fmt->format, fmt->format.code);
> +	*v4l2_subdev_state_get_format(state, 0) =3D fmt->format;

[Severity: Critical]
Is it possible for v4l2_subdev_state_get_format() to return a NULL pointer?

When CONFIG_MEDIA_CONTROLLER is disabled, the state parameter can be NULL,
which causes v4l2_subdev_state_get_format() to safely return NULL.
Dereferencing it directly here would cause a kernel panic. Should this
result be checked?

> +
> +	crop =3D v4l2_subdev_state_get_crop(state, 0);

[Severity: Critical]
Similar to the format pointer above, could v4l2_subdev_state_get_crop()
return NULL here and cause a kernel panic if CONFIG_MEDIA_CONTROLLER is
disabled?

> +	crop->width =3D fmt->format.width;
> +	crop->height =3D fmt->format.height;
> +	crop->left =3D MIRA016_PIXEL_ARRAY_LEFT;
> +	crop->top =3D MIRA016_PIXEL_ARRAY_TOP;
> +
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +		return 0;
> +
> +	/*
> +	 * Update the row length: changing the image format implies changing the
> +	 * row_length parameter, which changes the line duration and the pixel
> +	 * rate consequentially. Also, changing the image format changes the
> +	 * analogue gain limits.
> +	 *
> +	 * Do not allow to change image format while the subdevice is streaming.
> +	 *
> +	 * TODO: row length depends on binning, update it also in the
> +	 * implementation of set_selection.
> +	 */
> +	if (v4l2_subdev_is_streaming(sd))
> +		return -EBUSY;

[Severity: High]
Does this code corrupt the active state if streaming is already active?

The active software state is overwritten before checking if the subdevice
is streaming. If this check returns -EBUSY, the rejected format remains
in the software state rather than what's actually active on hardware.

[ ... ]
> +static int mira016_get_selection(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state,
> +				 struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		sel->r =3D *v4l2_subdev_state_get_crop(state, 0);

[Severity: Critical]
Can this dereference a NULL pointer if CONFIG_MEDIA_CONTROLLER is disabled?

The v4l2_subdev_state_get_crop() helper may return NULL, which would cause
a kernel panic when dereferenced here.

[ ... ]
> +static int mira016_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +
> +	if (!pm_runtime_get_if_in_use(&client->dev))
> +		return 0;

[Severity: High]
Does this treat negative error codes as success?

If runtime PM is disabled, pm_runtime_get_if_in_use() returns -EINVAL.
In C, !(-EINVAL) is false, which bypasses the early return. This allows the
driver to proceed accessing hardware that may be unpowered, and later call
pm_runtime_put_autosuspend(), causing an unbalanced usage counter underflow.

[ ... ]
> +static int mira016_power_on(struct device *dev)
> +{
[ ... ]
> +	ret =3D clk_prepare_enable(mira016->xclk);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable clock\n", __func__);
> +		regulator_bulk_disable(ARRAY_SIZE(mira016_supplies),
> +				       mira016->supplies);
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(mira016->reset_gpio, 0);
> +
> +	return 0;

[Severity: High]
Are stabilization delays missing after enabling regulators, clock, and
deasserting reset?

Hardware sensors typically require stabilization time before their I2C
interface becomes responsive. Returning immediately here could cause the
first I2C read in mira016_identify_module() to fail with a NACK.

[ ... ]
> +static int mira016_configure_timings(struct mira016 *mira016)
> +{
[ ... ]
> +	cci_write(mira016->regmap, MIRA016_PLL_PD_REG, 0, &ret);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D read_poll_timeout(cci_read, ret,
> +				((ret < 0 || (val & MIRA016_PLL_LOCKED))),
> +				1000, 1000, false, mira016->regmap,
> +				MIRA016_PLL_LOCK_REG, &val, NULL);
> +	if (ret < 0)
> +		return ret;

[Severity: High]
Does this condition swallow the error code from cci_read?

If cci_read fails and returns a negative error (e.g., -EIO), the condition
(ret < 0 || (val & MIRA016_PLL_LOCKED)) evaluates to true. The macro will
successfully exit the loop and return 0, masking the critical hardware read
failure and bypassing the subsequent error check.

[ ... ]
> +static int mira016_configure_horizontal_roi(struct mira016 *mira016,
> +					    struct v4l2_subdev_state *state)
> +{
[ ... ]
> +	u16 xwin_right =3D crop->left + crop->width - 1;
> +	u16 fifo_threshold;
> +	u16 hsync_length;
> +	int ret =3D 0;
> +
> +	cci_write(mira016->regmap, MIRA016_XWIN_LEFT_REG, crop->left, &ret);
> +	cci_write(mira016->regmap, MIRA016_XWIN_RIGHT_REG, xwin_right, &ret);

[Severity: High]
Can xwin_right be truncated here?

Since MIRA016_XWIN_RIGHT_REG is defined as CCI_REG8, the 16-bit xwin_right
value will be masked to 8 bits by cci_write(), corrupting the horizontal
window boundaries.

[ ... ]
> +static int mira016_parse_endpoint(struct device *dev, struct mira016 *mi=
ra016)
> +{
> +	struct fwnode_handle *endpoint __free(fwnode_handle) =3D NULL;
> +	struct v4l2_fwnode_endpoint ep_cfg =3D {
> +		.bus_type =3D V4L2_MBUS_CSI2_DPHY
> +	};
> +	int ret;
[ ... ]
> +	ret =3D v4l2_link_freq_to_bitmap(dev, ep_cfg.link_frequencies,
> +				       ep_cfg.nr_of_link_frequencies,
> +				       mira016_link_freqs,
> +				       ARRAY_SIZE(mira016_link_freqs),
> +				       &mira016->link_freq_bitmap);
> +	if (ret)
> +		goto err_free_ep;
> +
> +	/* TODO: Implement D-PHY configuration to support continuous clock. */
> +	if (!(ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK))=
 {
> +		dev_err(dev, "Continuous clock is not supported\n");
> +		ret =3D -EINVAL;
> +		goto err_free_ep;
> +	}
> +
> +	mira016->bus_config =3D ep_cfg.bus.mipi_csi2.flags;
> +
> +err_free_ep:
> +	v4l2_fwnode_endpoint_free(&ep_cfg);
> +
> +	return ret;

[Severity: Medium]
Is it safe to mix goto-based error handling with scope-based cleanup here?

The core kernel cleanup subsystem rules forbid mixing goto-based error
handling with __free() scope-based cleanup helpers in the same function,
as it creates confusing ownership semantics.

[ ... ]
> +static int mira016_validate_xclk_freq(struct mira016 *mira016)
> +{
[ ... ]
> +	mira016->pll.esc_l =3D mira016->xclk_freq < MHZ(20) ? 0 :
> +			     mira016->xclk_freq < MHZ(60) ? 1 : 2;
> +	mira016->pll.esc_period =3D mira016->xclk_freq < MHZ(20) ?
> +				  DIV_ROUND_CLOSEST(1000, mira016->xclk_freq)

[Severity: Low]
Does this calculation always evaluate to 0?

Since xclk_freq is constrained to be greater than 12MHz, dividing 1000 by
xclk_freq will always yield 0. Also, this variable appears to be unused
after being assigned.

[ ... ]
> +static int mira016_probe(struct i2c_client *client)
> +{
[ ... ]
> +	/*
> +	 * Calculate the PLL configuration based on the link frequency
> +	 * selected by .dts and compute the sensor timing bases.
> +	 *
> +	 * Initialize row_length to a value matching the default format for
> +	 * exposure and frame time limits calculations.
> +	 */
> +	mira016_pll_calc(mira016);
> +	mira016_timings_calc(mira016);
> +	mira016->timings.row_length =3D 1262;

[Severity: Medium]
Does this hardcoded row_length create a mismatch with dynamic calculations?

This establishes initial frame rate limits. However, if userspace applies
the exact same default format later, mira016_calc_row_length() might
calculate a different value (e.g., 1062), unexpectedly altering the limits
even though the format didn't logically change.

[ ... ]
> +static void mira016_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct mira016 *mira016 =3D to_mira016(sd);
> +
> +	v4l2_ctrl_handler_free(mira016->sd.ctrl_handler);
> +
> +	v4l2_async_unregister_subdev(sd);

[Severity: High]
Does this teardown order create a use-after-free window?

By freeing the control handler before unregistering the subdevice, the V4L2
device node remains accessible to userspace. If a control ioctl is issued
during this race window, the kernel will attempt to dereference the freed
control handler or lock the destroyed mutex. Should these calls be swapped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-mira016-v3=
-0-b078a6793d65@ideasonboard.com?part=3D2
