Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F630332614
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 10:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786099630; cv=none; b=TUAfz0qT7QNvfX5IFJ0oc+yoETvyNQnw4q+r18IdF6sQStHV8sv7HW4Al79fE5bXmcq1nw/67WgBoWzHGqNB+JOdbfy7PEE4Opz5fHktZ2pnxVk2rIoAt+MxlVB3OlHdN6JoGe16z4zRxxK2kcl4jdIvHbA3wBXb349Mjti9sZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786099630; c=relaxed/simple;
	bh=s6USWYoLXTKEJltlVNFwrzVFLkf5IrrzYClAro4RVxM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KHfpMsYyouIjFS4LLVy9qXfGivbI8CSX4Osu1TK+aRLOf+GzN9GDBdvOYXaCBdYIFjhUmNJ0Qum+E7nR/+J+DrDvOff+iw3/KbMmOGzoaoN7j/SGQbvlvhpJiRlIEHCh39F7XwJfFHiAjoBPFRu8/CdmDL5GpmFPJiw7xkzfWqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcuJnCmL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcuJnCmL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A630B1F000E9;
	Fri,  7 Aug 2026 10:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786099628;
	bh=EaYc/dwvuXD2bzR+unl6tvPmAS3WwAf2Y7SKEHr8IAQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZcuJnCmLY0yuYUuK7vKFNuiurQlifuSR1jHjwBk5xAz6MZqDVhfnAAilXTBy7TdH2
	 hffDAgXbkLaOFlgqVTGD3db9LKPviXbNm7i8u28BVmlhrMKxxY7UyNGygQw4tpdCjb
	 Z2jvsY/eR3nM0iFgyF6dk/pkEn1BZrtkdcgN3hidqx3uf9M4W22opLlf042/TfDDIW
	 TSSWJ0LWUvKYa6WSaZA5pq/HR7cSq4Ujscf/kwJ+nqwj9QJpHmjWXSKj0SlRAukwhX
	 Z7kJ00lCqvvVQDq0drPE1PCfu6NAWlKKnvRw9Dmzxvv6MM0OvALw6dbLn6RF7TqAIC
	 2upG9aYTb9Bcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: Add onsemi AR0234 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Shiyan" <eagle.alexander923@gmail.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807102847.1813059-3-eagle.alexander923@gmail.com>
References: <20260807102847.1813059-1-eagle.alexander923@gmail.com>
 <20260807102847.1813059-3-eagle.alexander923@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 10:47:08 +0000
Message-Id: <20260807104708.A630B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Incorrect initialization order of the V4L2 active state and contro=
l handler breaks lock sharing, causing lockdep splats, data races, and mask=
ing a self-deadlock in `ar0234_set_pad_format()`.
- [High] Brittle and restrictive parsing of the 'link-frequencies' device t=
ree property.
- [High] Invalid rectangle clamping logic in `ar0234_set_selection()` allow=
s crop width and height to underflow their minimum limits.
- [High] Incorrect power-down sequence disables regulators before stopping =
the external clock.
- [Medium] Unchecked return value from `v4l2_subdev_state_get_format()` in =
`ar0234_get_frame_desc()` may cause a NULL pointer dereference.
- [Medium] Unconditional overwrite of the VBLANK control value upon format =
or crop changes.
- [Medium] Missing `media_entity_cleanup()` in the subdevice cleanup routin=
e causes media graph objects to leak upon removal.
--

--- Patch [2]: [PATCH v2 2/2] media: i2c: Add onsemi AR0234 image sensor dr=
iver ---
commit 2059817c01680d1d154e2e8a6d9f7a79bbf02ecf
Author: Alexander Shiyan <eagle.alexander923@gmail.com>

media: i2c: Add onsemi AR0234 image sensor driver

Add driver for the onsemi AR0234 CMOS image sensor.

> diff --git a/drivers/media/i2c/ar0234.c b/drivers/media/i2c/ar0234.c
> new file mode 100644
> index 0000000000000..823cff01fb586
> --- /dev/null
> +++ b/drivers/media/i2c/ar0234.c
> @@ -0,0 +1,1290 @@
[ ... ]
> +static int ar0234_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state,
> +				 struct v4l2_subdev_format *fmt)
> +{
[ ... ]
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> +		int ret =3D ar0234_calculate_pll(ar0234, mode);
> +
> +		if (ret) {
> +			dev_err(sd->dev, "PLL recalculation failed: %d\n", ret);
> +			return -EINVAL;
> +		}
> +
> +		mutex_lock(ar0234->ctrls.lock);

[Severity: High]
Will this cause a recursive self-deadlock once the state lock is properly
unified with the control handler? The V4L2 core invokes this operation with
the active state lock held. Calling mutex_lock() directly on the control
lock here would block forever if they are correctly unified as the same loc=
k.

> +		ar0234_set_link_limits(ar0234, mode);
> +		ar0234_set_framing_limits(ar0234, crop->width);
> +		mutex_unlock(ar0234->ctrls.lock);
> +	}
[ ... ]
> +static int ar0234_set_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *state,
> +				struct v4l2_subdev_selection *sel)
> +{
[ ... ]
> +	rect.width =3D
> +		clamp_t(u32, rect.width, AR0234_MIN_CROP_WIDTH,
> +			AR0234_PIXEL_ARRAY_LEFT + AR0234_PIXEL_ARRAY_WIDTH -
> +			rect.left);

[Severity: High]
Can this logic allow the crop dimensions to underflow their minimum limits?
If a userspace application requests a crop width of 0 and a large left
offset, rect.left is pushed to the maximum allowed edge. The final clamp_t
for rect.width evaluates with a lower bound (AR0234_MIN_CROP_WIDTH) that is
greater than the calculated upper bound. Because clamp_t behaves as
min(max(val, lo), hi), evaluating a clamp where lo > hi results in an
underflow to the upper bound (e.g. 0), bypassing the minimum crop width and
potentially programming invalid addresses into the sensor hardware.

> +	rect.height =3D
> +		clamp_t(u32, rect.height, AR0234_MIN_CROP_HEIGHT,
> +			AR0234_PIXEL_ARRAY_TOP + AR0234_PIXEL_ARRAY_HEIGHT -
> +			rect.top);
[ ... ]
> +static void ar0234_set_framing_limits(struct ar0234 *ar0234, u32 width)
> +{
> +	int hblank =3D
> +		max(AR0234_LINE_LENGTH_PCK_MIN * 4 - width, AR0234_HBLANK_MIN);
> +
> +	__v4l2_ctrl_s_ctrl(ar0234->vblank, AR0234_VBLANK_MIN);

[Severity: Medium]
Does this unintentionally destroy the userspace frame rate configuration?
By unconditionally executing __v4l2_ctrl_s_ctrl() to set the control to
AR0234_VBLANK_MIN, any application calling VIDIOC_SUBDEV_S_FMT or
VIDIOC_SUBDEV_S_SELECTION will silently lose its configured vblank value.
Could __v4l2_ctrl_modify_range() be used here instead to gracefully adjust
the limits without overwriting the current value if it falls within the
new range?

> +
> +	ar0234_update_exposure_limits(ar0234);
> +
> +	__v4l2_ctrl_modify_range(ar0234->hblank, AR0234_HBLANK_MIN,
> +				 AR0234_HBLANK_MAX, 4, hblank);
> +}
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
> +	code =3D fmt->code;

[Severity: Medium]
Is a NULL check required here for the return value of
v4l2_subdev_state_get_format()? If an in-kernel caller or media controller
path passes an invalid pad index (e.g., pad >=3D 1), the state format lookup
will return NULL, leading to a crash when dereferencing fmt->code.

> +	v4l2_subdev_unlock_state(state);
[ ... ]
> +static int ar0234_parse_hw_config(struct ar0234 *ar0234)
> +{
[ ... ]
> +	if (ep_cfg->nr_of_link_frequencies !=3D AR0234_LINK_FREQ_IDX_MAX) {

[Severity: High]
Is it too restrictive to demand exactly AR0234_LINK_FREQ_IDX_MAX (2) link
frequencies in the device tree? If a board only supports one link frequency
(for instance, only 10bpp is possible), or lists them in a different order,
this check will cause the driver to fail probing. Could this be made more
flexible to better accommodate standard device tree semantics?

> +		ret =3D dev_err_probe(ar0234->sd.dev, -EINVAL,
> +				    "Invalid number of link frequencies %u\n",
> +				    ep_cfg->nr_of_link_frequencies);
> +		goto done_endpoint_free;
> +	}
[ ... ]
> +static int ar0234_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct ar0234 *ar0234 =3D to_ar0234(sd);
> +
> +	gpiod_set_value_cansleep(ar0234->reset, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(ar0234->supplies), ar0234->supplies);
> +
> +	clk_disable_unprepare(ar0234->clk);

[Severity: High]
Does disabling the regulators before stopping the external clock risk
hardware damage? Disabling power to the sensor while an external clock
continues to toggle its pins can backpower the chip through its internal
ESD protection diodes. Should clk_disable_unprepare() be called before
regulator_bulk_disable()?

> +
> +	/* 100ms PwrDown until next PwrUp */
> +	fsleep(100000);
> +
> +	return 0;
> +}
> +
> +static void ar0234_subdev_cleanup(struct ar0234 *ar0234)
> +{
> +	v4l2_subdev_cleanup(&ar0234->sd);
> +	v4l2_ctrl_handler_free(&ar0234->ctrls);
> +}

[Severity: Medium]
Does this subdevice cleanup sequence leak media graph objects? The driver
initializes the media entity pads in ar0234_probe() via
media_entity_pads_init(), but appears to be missing a corresponding call to
media_entity_cleanup() here. This would leak dynamically allocated graph
resources every time the driver is unbound or during a late probe failure.

[ ... ]
> +static int ar0234_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D v4l2_subdev_init_finalize(&ar0234->sd);
> +	if (ret)
> +		goto error_pm;
> +
> +	ret =3D ar0234_ctrls_init(ar0234);
> +	if (ret)
> +		goto error_pm;
> +
> +	ar0234->sd.state_lock =3D ar0234->ctrls.lock;

[Severity: High]
Does initializing the active state before assigning the state_lock break the
lock sharing mechanism?=20

Because v4l2_subdev_init_finalize() is called before sd->state_lock is
assigned to ar0234->ctrls.lock, the V4L2 core allocates a separate mutex for
the active state instead of sharing the control handler's lock.

This causes v4l2_subdev_get_locked_active_state() to trigger a lockdep splat
in ar0234_set_ctrl() because the required state->lock is not held, and it
leaves state modifications unprotected.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807102847.1813=
059-1-eagle.alexander923@gmail.com?part=3D2
