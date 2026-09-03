Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066FF490C10
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438749; cv=none; b=kxV/k7k/9AoV8m1T+6bMOm83TvyuwwSq/KIAGPXlitDObDsyN7VhNj1Mtu1WqnK87hLdX3oh+IILUv7G5NHWAgLhQCINyf6NpvRbcYX+t0lzWugyA+ulF6dV1sBjfxOgtY4devW0qtLClLWekYFE5PYStRsSpR2R3xeIl7TYY7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438749; c=relaxed/simple;
	bh=mMBwMHCfi36ymtaMPk31MTTuoplRrfGqfGW9QbB2vFM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GY6DYD0ASuJM4adgQPeTrkV6EvJ7OTsNFQ9lEH/edyR+GzKoY0/b7xvX9UE08xHM13atiyjWgjJHHzRBgPdo8pAWBkLgZS5oZ+HlfzpD8Z6geNlWOvXwjAckZ+3KDL3dEtslhmy94Mx3gm68l12hJHg1aRNXqJY9dgLuwpGouAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bY0b3YTh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bY0b3YTh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5941F000E9;
	Thu,  3 Sep 2026 12:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788438747;
	bh=iveMZYldfNBq7kHBoVDeXj3R9eRbtkFFYRjZWHoPcEI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bY0b3YThG9n3G2hpnKBuN4qhYzO2T3Z3IL6wFpae1Ei+ctV4B+S3isfmGk6CZIoqZ
	 BaeKkC0xhYvjj4th++AyQvJcHomXU1Xt9sBQCzCoE/wemtwf7Pcd/0on7WtvdX02Qk
	 n9HtpmRITF3WQhenQVmk+fJIHyDMfzoDuzn1YUSyj+FNoNULF1mhcT+F42ITJZtMmJ
	 RYwivPcrDUT7K0rAWZ11YtBsi/HozmxrsvJ7vUvqcVzeIHkU7Oho09QGE1pikBv2Xp
	 CWLSzhNxuepVOd+R3u13qJK826KvlerQd9n+4bOkaDXdkyj/lA4pmjyYA9WiQUZ36l
	 pD/BIuuZGyRtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: i2c: mira016: Add driver for Mira016
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260903-mira016-v1-2-af0013ef070d@ideasonboard.com>
References: <20260903-mira016-v1-0-af0013ef070d@ideasonboard.com>
 <20260903-mira016-v1-2-af0013ef070d@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 12:32:26 +0000
Message-Id: <20260903123227.5B5941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] mira016_init_state() mutates global driver state when called for T=
RY states, corrupting active frame timings and creating a data race.
- [High] Out-of-bounds array access in analogue gain lookup table due to of=
f-by-one maximum limit.
- [High] Control handler may access freed active state during driver remova=
l due to incorrect cleanup ordering.
- [Medium] Error codes from I2C writes are silently overwritten and ignored=
 in multiple configuration functions.
- [Medium] Active V4L2 state is modified before rejecting the operation if =
the device is currently streaming.
- [Medium] Severe precision loss in pixel rate calculation due to early int=
eger division.
- [Medium] Hardware minimum vertical blanking is violated due to integer di=
vision rounding down.
--

commit 3cceafc720bbde80fa31e38aaa08374b0f450a04
Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

media: i2c: mira016: Add driver for Mira016

Add driver for the ams OSRAM Mira016 sensor.

> diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/i2c/mira016.c
> @@ -0,0 +1,2284 @@

[ ... ]

> +static inline u32 mira016_nsec_to_lines(struct mira016 *mira016, u32 nse=
c)
> +{
> +	return nsec / (mira016_trow_psec(mira016) / HZ_PER_KHZ);
> +}
> +
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
Will this early integer division cause severe precision loss? The formula
h_tot * HZ_PER_MHZ / trow_psec * HZ_PER_MHZ is evaluated left-to-right.
The division by trow_psec truncates the intermediate result to an integer
before it is scaled back up by HZ_PER_MHZ, discarding all sub-megahertz
precision.

> +}
> +
> +static inline u32 mira016_calc_min_vblank(struct mira016 *mira016, u32 y=
_tot)
> +{
> +	/*
> +	 * See 3.15.2 Frame Rate, equation 4.
> +	 *
> +	 * TODO: The minimum frame duration has to be expanded if embedded data
> +	 * are used.
> +	 */
> +	u32 trow_nsec =3D mira016_trow_psec(mira016) / HZ_PER_KHZ;
> +	u32 min_duration_nsec =3D  trow_nsec * (y_tot + 35) + 50 * HZ_PER_KHZ;
> +
> +	return mira016_nsec_to_lines(mira016, min_duration_nsec) - y_tot;

[Severity: Medium]
Can this result in a vertical blanking duration that is strictly shorter th=
an
the hardware's minimum requirement? mira016_calc_min_vblank() computes a
minimum duration in nanoseconds and converts it to lines using
mira016_nsec_to_lines(). That helper uses integer division, which rounds
down. If the required minimum translates to a fractional number of lines,
the truncated result could violate the minimum duration.

> +}

[ ... ]

> +static int mira016_calc_row_length(struct mira016 *mira016,
> +				   struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_framefmt *fmt =3D v4l2_subdev_state_get_format(state, =
0);
> +	u32 phy_timings =3D mira016_calc_phy_timings(mira016, fmt);
> +	u32 adc_timings =3D mira016_calc_adc_timings(mira016, fmt);
> +
> +	mira016->timings.row_length =3D max(phy_timings, adc_timings);

[Severity: High]
Does this corrupt the active streaming configuration?

When userspace opens the V4L2 subdevice node, the V4L2 core allocates a new
TRY state and calls the driver's init_state callback. The mira016_init_stat=
e()
callback unconditionally calls mira016_calc_row_length(), which reads the
format from the newly created TRY state and directly overwrites the
driver-wide global variable mira016->timings.row_length.

This could reset the active device row length to match the default 8-bit
format even if the camera is currently streaming in a 10-bit or 12-bit form=
at.

> +
> +	return 0;
> +}
> +
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
> +
> +	crop =3D v4l2_subdev_state_get_crop(state, 0);
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

[Severity: Medium]
Does this permanently alter the active state before validating if it is safe
to do so?

The subdevice state's format and crop configuration are immediately
overwritten with user-supplied values. Only after these changes does the
function check if the device is streaming and return -EBUSY. This leaves the
internal software state desynchronized from the actual hardware configurati=
on.

> +
> +	switch (fmt->format.code) {
> +	case MEDIA_BUS_FMT_Y8_1X8:
> +		gain_max =3D ARRAY_SIZE(mira016_gain_lut_8bit);
> +		break;
> +	case MEDIA_BUS_FMT_Y10_1X10:
> +		gain_max =3D ARRAY_SIZE(mira016_gain_lut_10bit);
> +		break;
> +	case MEDIA_BUS_FMT_Y12_1X12:
> +	default:
> +		/*
> +		 * TODO: Clarify how to handle 12 bit 2x fixed gain which
> +		 * changes the line timings while streaming. Only allow 1x
> +		 * for the time being.
> +		 */
> +		gain_max =3D 1;
> +		break;
> +	}
> +
> +	ret =3D __v4l2_ctrl_modify_range(mira016->gain, 1, gain_max, 1, 1);

[Severity: High]
Does this set up an out-of-bounds array access? The V4L2 control's maximum
value is set to ARRAY_SIZE(...) rather than ARRAY_SIZE(...) - 1. When
mira016_write_analogue_gain() is called with this maximum value, it uses the
1-based maximum directly as a 0-based array index, reading past the end of
the gain lookup table.

[ ... ]

> +static int mira016_configure_timings(struct mira016 *mira016)
> +{
> +	int ret =3D 0;
> +	u64 val;
> +
> +	/* Configure the PLL clock tree. */
> +
> +	cci_write(mira016->regmap, MIRA016_BANK_SEL_REG, 0, &ret);
> +
> +	cci_write(mira016->regmap, MIRA016_PLL_DIV_N_REG, mira016->pll.n, &ret);
> +	cci_write(mira016->regmap, MIRA016_PLL_DIV_M_REG, mira016->pll.m, &ret);
> +	cci_write(mira016->regmap, MIRA016_CLKGEN_CP_DIV_REG,
> +		  mira016->pll.cp_div, &ret);
> +	cci_write(mira016->regmap, MIRA016_OTP_GRANULARITY_REG,
> +		  mira016->pll.otp_gran, &ret);
> +	cci_write(mira016->regmap, MIRA016_GRAN_TG_REG, mira016->pll.gran_tg, &=
ret);
> +	cci_write(mira016->regmap, MIRA016_LUT_DEL008_REG,
> +		  mira016->pll.lut_del, &ret);
> +	cci_write(mira016->regmap, MIRA016_CLKGEN_TX_ESC_H_REG,
> +		  mira016->pll.esc_h, &ret);
> +	cci_write(mira016->regmap, MIRA016_CLKGEN_TX_ESC_L_REG,
> +		  mira016->pll.esc_l, &ret);
> +	cci_write(mira016->regmap, MIRA016_PLL_PD_REG, 0, &ret);
> +
> +	ret =3D read_poll_timeout(cci_read, ret,
> +				((ret < 0 || (val & MIRA016_PLL_LOCKED))),
> +				1000, 1000, false, mira016->regmap,
> +				MIRA016_PLL_LOCK_REG, &val, NULL);

[Severity: Medium]
Does this overwrite the accumulated error code in ret? The read_poll_timeout
assigns the result of cci_read directly to ret, replacing any prior errors
accumulated during the cci_write() sequence.

[ ... ]

> +static int mira016_configure_roi(struct mira016 *mira016,
> +				 struct v4l2_subdev_state *state)
> +{
> +	int ret =3D 0;
> +
> +	/*
> +	 * Write horizontal configuration to context 0 first, then repeat for
> +	 * context 1.
> +	 */
> +	cci_write(mira016->regmap, MIRA016_RW_CONTEXT_REG, 0, &ret);
> +	cci_write(mira016->regmap, MIRA016_BANK_SEL_REG, 1, &ret);
> +	ret =3D mira016_configure_horizontal_roi(mira016, state);

[Severity: Medium]
Is the error code from the preceding cci_write() calls silently lost here?
cci_write() accumulates errors into ret, but the assignment
ret =3D mira016_configure_horizontal_roi(...) completely overwrites ret,
discarding prior failures.

> +	if (ret)
> +		return ret;

[ ... ]

> +static int mira016_init_state(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *state)
> +{
> +	struct mira016 *mira016 =3D to_mira016(sd);
> +	struct v4l2_subdev_format fmt =3D {
> +		.which =3D V4L2_SUBDEV_FORMAT_TRY,
> +		.pad =3D 0,
> +		.format =3D {
> +			.code =3D MEDIA_BUS_FMT_Y8_1X8,
> +			.width =3D MIRA016_PIXEL_ARRAY_WIDTH,
> +			.height =3D MIRA016_PIXEL_ARRAY_HEIGHT
> +		},
> +	};
> +
> +	mira016_set_pad_format(sd, state, &fmt);
> +	mira016_calc_row_length(mira016, state);

[Severity: High]
As mentioned earlier in mira016_calc_row_length(), this call from
mira016_init_state() mutates the driver-wide global state when userspace
allocates a new TRY state.

> +
> +	return 0;
> +}

[ ... ]

> +static int mira016_write_analogue_gain(struct mira016 *mira016,
> +				       struct v4l2_subdev_state *state,
> +				       u32 gain)
> +{
> +	const struct mira016_gain_lut *lut;
> +	struct v4l2_mbus_framefmt *format;
> +	int ret =3D 0;
> +
> +	format =3D v4l2_subdev_state_get_format(state, 0);
> +	switch (format->code) {
> +	case MEDIA_BUS_FMT_Y8_1X8:
> +		lut =3D &mira016_gain_lut_8bit[gain];

[Severity: High]
If gain matches the maximum array size limit established in
mira016_set_pad_format(), this will read memory past the end of the gain
lookup table.

[ ... ]

> +static int mira016_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mira016 *mira016 =3D
> +		container_of(ctrl->handler, struct mira016, ctrl_handler);
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&mira016->sd);
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_rect *crop;
> +	int ret =3D 0;
> +
> +	state =3D v4l2_subdev_get_locked_active_state(&mira016->sd);

[Severity: High]
Could this sequence lead to a use-after-free or NULL pointer dereference
during driver removal?

In mira016_remove(), v4l2_subdev_cleanup() is called before
v4l2_ctrl_handler_free(). The v4l2_subdev_cleanup() frees the subdevice's
active state, but the control handler remains alive and accessible.

If a concurrent ioctl sets a control, it invokes mira016_set_ctrl(), which
calls v4l2_subdev_get_locked_active_state() and dereferences the already
freed state object.

> +	crop =3D v4l2_subdev_state_get_crop(state, 0);

[ ... ]

> +static void mira016_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct mira016 *mira016 =3D to_mira016(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(&mira016->sd);
> +	media_entity_cleanup(&sd->entity);
> +
> +	v4l2_ctrl_handler_free(mira016->sd.ctrl_handler);

[Severity: High]
As mentioned above, the active_state is destroyed by v4l2_subdev_cleanup()
while the ctrl_handler is still active and capable of receiving ioctls.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-mira016-v1=
-0-af0013ef070d@ideasonboard.com?part=3D2
