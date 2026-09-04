Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC17F49C4C3
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519750; cv=none; b=Rndvl5z5Ft/TNnt88FBiZ53rdmq5aXtjfYf/SwceCoEmIrwb2cTWrh3D9zugn/Z3828PyqfXdj3NFGTFz4hpt2Ck9b7EC317rnwoaH9Wt4+ETe+xwUzK8LchEfLSmXGPD4xsxoZS2B+DUXhQAy6nx/mj3Ggyw9QfWs76YwLEyLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519750; c=relaxed/simple;
	bh=GM4QH1GulwR22rd92h/XgsDs9WMcF61wjJRvjOENPbc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QJEv2nFkyHk+6RnNMFcNu8/B/UAaMWme0ZiWdx599mkWs7O7BOEHVVLXjfjXN2ozT6UnMt+BpeX8B5ly78f2vtQ/qWgiJsLqOUU7uy8KAieQ89LdMZwLBJXyBPs3UeFXO+VJlCm8ywAjWmYDfLGBxRXhyBghGmIjQzThXY4lpyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADz7CsMS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADz7CsMS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF0C1F00A3D;
	Fri,  4 Sep 2026 11:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788519748;
	bh=mVs+d3wkvIVbQSH4eZFhkUOxi9FUVPWCzZJtyztNLo8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ADz7CsMS77OWE//hZatuTOzFZPkpeizqundjPjPtzSEzqXsnuTouzORRZX2x9V6Ej
	 m+9TY0HNnO0udoqeHXJZIqSAsnnqTim3CK8iRRA7MJxjYQrAulQbR1HQ3gIdcjZtBp
	 6R/YwlwSDl7Cztny/LMFIqTXFpwm39jdC8Qes3Lq+xyLwusYhXDvMGYjNRRHJJUe9R
	 IZExwdbmEguH9oiXWWXhcPrMkthrizA/nq76ZiTkjuHn9NZRXSVtEr4cLkd4O6Kvq1
	 acW5BRqng8EK5gvv/arBljN95S/K+kwYhOhDdCFROFH40nfnIEwqg+57oeIT+UtZRx
	 BKx/HbAQb/TWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: mira016: Add driver for Mira016
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260904-mira016-v2-2-1dcf7b3a807e@ideasonboard.com>
References: <20260904-mira016-v2-0-1dcf7b3a807e@ideasonboard.com>
 <20260904-mira016-v2-2-1dcf7b3a807e@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 11:02:27 +0000
Message-Id: <20260904110228.5BF0C1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] The set_fmt pad operation corrupts the active subdevice state =
if called while streaming, leading to an out-of-bounds array access.
- [High] V4L2 control handler is freed before unregistering the subdevice, =
allowing a use-after-free race condition.
- [High] mira016_init_state() calls set_pad_format() with V4L2_SUBDEV_FORMA=
T_TRY, skipping the active state control range and internal timing initiali=
zation.
- [High] Missing stabilization delay after de-asserting hardware reset and =
enabling clocks before accessing I2C registers.
- [High] I2C errors are silently swallowed by read_poll_timeout macro in mi=
ra016_configure_timings.
- [Medium] Missing pm_runtime_mark_last_busy() causes immediate suspend whe=
n dropping the runtime PM reference.
--

commit e3f67c157423cc82225f8c12e6de36ab28b0fded
Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

media: i2c: mira016: Add driver for Mira016

Add driver for the ams OSRAM Mira016 sensor.

> diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
> new file mode 100644
> index 0000000000000..8b8fcbd50fe23
> --- /dev/null
> +++ b/drivers/media/i2c/mira016.c
> @@ -0,0 +1,2294 @@
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
Does this read_poll_timeout loop unintentionally swallow I2C errors?

If cci_read() fails (for example, returning -EIO), the error is assigned
to ret, making the condition (ret < 0 || ...) evaluate to true. This
causes the loop to break successfully, and the macro evaluates to 0.

Because the return value of read_poll_timeout is stored in ret, it overwrit=
es
the original I2C error with 0, completely defeating the check
if (ret < 0) below. This would cause the driver to silently ignore failures
during PLL configuration.

[ ... ]
> +static int mira016_write_analogue_gain(struct mira016 *mira016,
> +				       struct v4l2_subdev_state *state,
> +				       u32 gain)
> +{
> +	const struct mira016_gain_lut *lut;
> +	struct v4l2_mbus_framefmt *format;
> +	int ret =3D 0;
> +
> +	/*
> +	 * Use 'gain - 1' as the gain control values are indexed from 1
> +	 * while the gain luts are 0-indexed.
> +	 */
> +	format =3D v4l2_subdev_state_get_format(state, 0);
> +	switch (format->code) {
> +	case MEDIA_BUS_FMT_Y8_1X8:
> +		lut =3D &mira016_gain_lut_8bit[gain - 1];
> +		break;
> +	case MEDIA_BUS_FMT_Y10_1X10:
> +		lut =3D &mira016_gain_lut_10bit[gain - 1];

[Severity: Critical]
Can this code trigger an out-of-bounds array read if userspace changes the
image format while the device is streaming?

Looking at mira016_set_pad_format(), the requested format is written to the
active subdevice state BEFORE the driver checks if the subdevice is current=
ly
streaming:

	mira016_update_pad_format(mira016, &fmt->format, fmt->format.code);
	*v4l2_subdev_state_get_format(state, 0) =3D fmt->format;
	...
	if (v4l2_subdev_is_streaming(sd))
		return -EBUSY;

If the subdevice is streaming, it returns -EBUSY and skips updating the
analog gain control limits. The state has already been corrupted, though.

If userspace changes an 8-bit format to a 10-bit format while streaming,
the active state changes to 10-bit, but the control handler range remains
bound to the wider limits of the 8-bit format (max 83).

A subsequent call to VIDIOC_S_CTRL setting the gain to 83 would pass the
V4L2 core range check. Here in mira016_write_analogue_gain(), it would index
into the 49-element mira016_gain_lut_10bit array using 82, leading to an
out-of-bounds kernel memory read and an invalid hardware state.

[ ... ]
> +static int mira016_set_pad_format(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  struct v4l2_subdev_format *fmt)
> +{
[ ... ]
> +	crop =3D v4l2_subdev_state_get_crop(state, 0);
> +	crop->width =3D fmt->format.width;
> +	crop->height =3D fmt->format.height;
> +	crop->left =3D MIRA016_PIXEL_ARRAY_LEFT;
> +	crop->top =3D MIRA016_PIXEL_ARRAY_TOP;
> +
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +		return 0;

[Severity: High]
Does this early return prevent the active state from being fully initialize=
d?

During probe, v4l2_subdev_init_finalize() calls mira016_init_state() to
populate the active state. However, mira016_init_state() constructs a
dummy format using V4L2_SUBDEV_FORMAT_TRY:

	struct v4l2_subdev_format fmt =3D {
		.which =3D V4L2_SUBDEV_FORMAT_TRY,
	...
	mira016_set_pad_format(sd, state, &fmt);

Because mira016_set_pad_format() immediately returns when it sees
V4L2_SUBDEV_FORMAT_TRY, it skips updating the analog gain control limit
and fails to set mira016->timings.row_length for the active state.

This leaves the control range incorrectly clamped to default probe limits
and breaks pixel rate calculations until userspace explicitly issues a
VIDIOC_SUBDEV_S_FMT to override it.

[ ... ]
> +static int mira016_power_on(struct device *dev)
> +{
[ ... ]
> +	ret =3D clk_prepare_enable(mira016->xclk);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable clock\n", __func__);
> +		goto reg_off;
> +	}
> +
> +	gpiod_set_value_cansleep(mira016->reset_gpio, 0);
> +
> +	return 0;
> +}

[Severity: High]
Should there be a delay here to allow the hardware to stabilize after
de-asserting the reset line?

Looking at mira016_probe(), the driver immediately issues I2C reads to the
sensor using mira016_identify_module() right after calling mira016_power_on=
():

	ret =3D mira016_power_on(dev);
	if (ret)
		return ret;
	...
	ret =3D mira016_identify_module(mira016);

Without a stabilization delay (e.g., usleep_range()) after de-asserting
reset and before sending I2C commands, this may cause sporadic or consistent
probe failures due to I2C timeouts or NACKs.

[ ... ]
> +static int mira016_disable_streams(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state, u32 pad,
> +				   u64 streams_mask)
> +{
> +	struct mira016 *mira016 =3D to_mira016(sd);
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&mira016->sd);
> +
> +	mira016_stop_streaming(mira016);
> +
> +	__v4l2_ctrl_grab(mira016->hflip, false);
> +	__v4l2_ctrl_grab(mira016->vflip, false);
> +
> +	pm_runtime_put_autosuspend(&client->dev);

[Severity: Medium]
Will this bypass the configured autosuspend delay of 1000ms?

The driver drops its PM reference here without first calling
pm_runtime_mark_last_busy(&client->dev).

If the streaming duration exceeds the autosuspend delay configured at probe
time, the runtime PM core will calculate the delay expiration against an old
last_busy timestamp. This will evaluate as already expired, causing the
device to immediately suspend rather than honoring the timeout.

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
Does this sequence open a use-after-free race condition?

The control handler and its active state mutex are destroyed by
v4l2_ctrl_handler_free(), but this happens before the subdevice is
unregistered via v4l2_async_unregister_subdev().

Until the subdevice is unregistered, it remains fully visible to userspace.
If an ioctl (like VIDIOC_S_CTRL) is executed concurrently by userspace
while remove() is running, the V4L2 core will access the already-freed
control handler structures and attempt to acquire a destroyed mutex.

Unregistering the subdevice first would prevent userspace from accessing it
while it's being dismantled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-mira016-v2=
-0-1dcf7b3a807e@ideasonboard.com?part=3D2
