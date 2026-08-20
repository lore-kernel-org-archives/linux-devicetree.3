Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6893D7D97
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787213516; cv=none; b=TfQF5IacXZNPzWkvEpaEKBtR41+JMs8l6XPrjr9UNr61x6u94dhDHYrthYhJQbglhd6nKMDNY/wjIY0bsDjIzmR1G/oJOlw+oLOLJET1cHW6543Jvzk7p11PBDEEDpE4c7jGJuxfdvSHU5M/TtKCjHX+rXDpigt/P1omZAKzwvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787213516; c=relaxed/simple;
	bh=tjoO1++p+sNrTGFctEE6xyP4R89yBM8wUyqyH3xGOck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CM6te3tqUkzyXgzNxmkpSCbuOwc46ap1JyKGKl7uN9RyEZj08AYskd8d1ynYfCBMd0NcSSGBCI+ObBoyJWc4ggJvhV3VO+fYePaXKZwaNasyoTV2Jixud37c5vaQ/RmAntLgnMDJZ4BZ89rY0pkvLq/jCNvmJfbMfAL3m2pwmCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpBgueUg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpBgueUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953501F000E9;
	Thu, 20 Aug 2026 08:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787213514;
	bh=SfSlE1I1yMhxAf31d3J+yymKMvyPDDLSI9OSWl2RDRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WpBgueUg2y5CrKP8xkZVpomRO4/75A5ds12N4Ar8mcrkIXV1Y12vd7aexxfK4EkS9
	 pPONHFkCzqTJyT5rXjNUTjNSrvlzddtOiw5ko3xOuxuzPLSRlyXbZ+L6lIGhkZ0WdE
	 lpvYivKZ/9TZUeL5Xz19cdUFrZJleahlnAJGm0sJXP8B7eHhDbqEgnu+OdjYSjZaBh
	 nSEDsSrh888Xzz5HZvDtpC6OXaSubbkWI/NoUILScqltao+4Li9Q7FruVsYBk1C0nY
	 YytiTtNyFKmS/J+ID+yQN29ezWGx9xv1rQrwqIkOwNl3/c6yVKwJE2sgY54T816BVm
	 K8iNxDokhlE4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: Add onsemi AR0234 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Shiyan" <eagle.alexander923@gmail.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260820075524.2056029-3-eagle.alexander923@gmail.com>
References: <20260820075524.2056029-1-eagle.alexander923@gmail.com>
 <20260820075524.2056029-3-eagle.alexander923@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 08:11:54 +0000
Message-Id: <20260820081154.953501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Incorrect initialization order of `v4l2_subdev.state_lock` causes =
a lock mismatch between the subdev state and control handler, resulting in =
lockdep splats and data races.
- [High] Default PLL state is overwritten during probe and does not match t=
he default active format, leading to streaming failures.
- [High] `ar0234_enable_streams()` calls the internal setup function `__v4l=
2_ctrl_handler_setup()` without holding the control handler lock.
- [Medium] Crop rectangle width, height, and negative coordinates are not p=
roperly clamped, allowing invalid 0-size crops to be programmed into hardwa=
re.
- [Medium] ar0234_set_framing_limits incorrectly modifies HBLANK control ra=
nge by passing the dynamic minimum as the default instead of the minimum li=
mit.
- [Medium] ar0234_get_frame_desc returns without unlocking the active state=
 lock on the error path.
--

--- Patch [2]: [PATCH v3 2/2] media: i2c: Add onsemi AR0234 image sensor dr=
iver ---
commit 8532ef0e666030b52590e6a5adfa76a0332b4935
Author: Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: media: i2c: Add onsemi AR0234 image sensor driver

This commit introduces a new V4L2 I2C driver for the onsemi AR0234 CMOS
image sensor. It implements standard subdevice callbacks including pad
operations, streaming control, and PM runtime support. The sensor supports
multiple MIPI CSI-2 data lane modes and resolutions.

> diff --git a/drivers/media/i2c/ar0234.c b/drivers/media/i2c/ar0234.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/i2c/ar0234.c
[ ... ]
> +static void ar0234_set_framing_limits(struct ar0234 *ar0234, u32 width)
> +{
> +	int hblank =3D
> +		max(AR0234_LINE_LENGTH_PCK_MIN * 4 - width, AR0234_HBLANK_MIN);
> +
> +	ar0234_update_exposure_limits(ar0234);
> +
> +	__v4l2_ctrl_modify_range(ar0234->hblank, AR0234_HBLANK_MIN,
> +				 AR0234_HBLANK_MAX, 4, hblank);

[Severity: Medium]
Is the dynamic minimum applied to the correct parameter here?

By passing AR0234_HBLANK_MIN as the minimum and the calculated dynamic
hblank as the default value to __v4l2_ctrl_modify_range(), this could allow
userspace to set HBLANK below the hardware's minimum line length constraint.

[ ... ]
> +static int ar0234_set_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *state,
> +				struct v4l2_subdev_selection *sel)
> +{
[ ... ]
> +	max_top =3D AR0234_PIXEL_ARRAY_TOP + AR0234_PIXEL_ARRAY_HEIGHT -
> +		  max(rect.height, AR0234_MIN_CROP_HEIGHT);
> +
> +	rect.left =3D clamp_t(u32, rect.left, AR0234_PIXEL_ARRAY_LEFT, max_left=
);
> +	rect.top =3D clamp_t(u32, rect.top, AR0234_PIXEL_ARRAY_TOP, max_top);
> +
> +	/*
> +	 * Now recalculate width/height as the remaining space. This value
> +	 * is guaranteed to be >=3D AR0234_MIN_CROP_WIDTH/HEIGHT because we
> +	 * clamped left/top using the max() of the current size and the min.
> +	 */
> +	rect.width =3D min(rect.width, AR0234_PIXEL_ARRAY_LEFT +
> +			 AR0234_PIXEL_ARRAY_WIDTH - rect.left);

[Severity: Medium]
Does this code properly bound negative left coordinates?

Since rect.left is clamped using a u32 cast via clamp_t(), a negative
sel->r.left bypasses the minimum bound and is clamped to max_left instead.

Subsequently, rect.width is bounded by min() but never bounded to a minimum,
allowing a zero-width crop to be calculated and eventually written to the
hardware registers.

[ ... ]
> +static int ar0234_init_state(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_selection sel =3D {
> +		.target =3D V4L2_SEL_TGT_CROP,
> +		.which =3D V4L2_SUBDEV_FORMAT_TRY,
> +		.r.left =3D AR0234_PIXEL_ARRAY_LEFT,
> +		.r.top =3D AR0234_PIXEL_ARRAY_TOP,
> +		.r.width =3D AR0234_PIXEL_ARRAY_WIDTH,
> +		.r.height =3D AR0234_PIXEL_ARRAY_HEIGHT,
> +	};
> +	struct v4l2_subdev_format format =3D {
> +		.which =3D V4L2_SUBDEV_FORMAT_TRY,
> +		.format =3D {
> +			.width =3D AR0234_PIXEL_ARRAY_WIDTH,
> +			.height =3D AR0234_PIXEL_ARRAY_HEIGHT,
> +		},
> +	};
> +
> +	ar0234_set_selection(sd, state, &sel);
> +	ar0234_set_pad_format(sd, state, &format);

[Severity: High]
Does hardcoding V4L2_SUBDEV_FORMAT_TRY prevent the default active state from
receiving the correct PLL values?

During probe in ar0234_parse_hw_config(), ar0234_calculate_pll() is called
for all evaluated modes, leaving ar0234->pll globally overwritten with the
final mode's calculations (10-bpp).=20

Because ar0234_init_state() specifies V4L2_SUBDEV_FORMAT_TRY, it bypasses
the PLL recalculation that would normally update the active state. If users=
pace
starts streaming without explicitly setting a format, the 8-bpp mode might =
be
used alongside the leftover 10-bpp PLL configuration, causing a failure.

[ ... ]
> +static int ar0234_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
> +{
[ ... ]
> +	cci_write(ar0234->regmap, AR0234_REG_X_ADDR_START, x_addr_start, &ret);
> +	cci_write(ar0234->regmap, AR0234_REG_Y_ADDR_START, y_addr_start, &ret);
> +	cci_write(ar0234->regmap, AR0234_REG_X_ADDR_END, x_addr_end, &ret);
> +	cci_write(ar0234->regmap, AR0234_REG_Y_ADDR_END, y_addr_end, &ret);
> +
> +	if (ret)
> +		goto start_err;
> +
> +	ret =3D __v4l2_ctrl_handler_setup(ar0234->sd.ctrl_handler);

[Severity: High]
Should the control handler lock be held during this setup call?

The __v4l2_ctrl_handler_setup() function is an internal helper that expects
the caller to hold ctrls.lock. Since the V4L2 core does not hold the
control handler lock when invoking the enable_streams pad operation,
calling this directly can cause lockdep splats and data races.

[ ... ]
> +static int ar0234_get_frame_desc(struct v4l2_subdev *sd, unsigned int pa=
d,
> +				 struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct ar0234 *ar0234 =3D to_ar0234(sd);
> +	const struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;
> +	const struct ar0234_mode *mode;
> +	u32 code;
> +
> +	state =3D v4l2_subdev_lock_and_get_active_state(&ar0234->sd);
> +	fmt =3D v4l2_subdev_state_get_format(state, pad);
> +	if (!fmt)
> +		return -EINVAL;

[Severity: Medium]
Can this error path cause a subdevice state deadlock?

The active state lock is acquired via v4l2_subdev_lock_and_get_active_state=
(),
but if fmt happens to be NULL, the function returns -EINVAL directly without
calling v4l2_subdev_unlock_state().

[ ... ]
> +static int ar0234_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D v4l2_subdev_init_finalize(&ar0234->sd);
> +	if (ret)
> +		goto err_media;
> +
> +	ret =3D ar0234_ctrls_init(ar0234);
> +	if (ret)
> +		goto err_media;
> +
> +	ar0234->sd.state_lock =3D ar0234->ctrls.lock;

[Severity: High]
Is the active state lock initialized properly here?

Because v4l2_subdev_init_finalize() is called before sd->state_lock is
assigned to ar0234->ctrls.lock, the active state ends up allocating and
using its own internal fallback mutex.=20

Later operations like V4L2 control updates will execute with ctrls.lock
held but will access the active state which expects its own separate lock to
be held, causing a lock mismatch and lockdep assertion failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820075524.2056=
029-1-eagle.alexander923@gmail.com?part=3D2
