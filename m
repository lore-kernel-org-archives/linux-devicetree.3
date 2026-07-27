Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BC2248F7C
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143444; cv=none; b=SChj9PMUMAHTEO9cNCi4kIbkh/Tu4b5qVgiLJJaV8697gWbfYlUFgpJwtAF37V+G+wVYIHcYQbQfBNxW5DOXNwfNskeeklYF6R81CYlAEqaegh1e7nVa8RU2T42327n0Qw99mbVG12V2jUnZZjahA+MiI8SqtbykHRu8eNlIWQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143444; c=relaxed/simple;
	bh=sRndhr3PrzTqCNKIwfZ3WUaRgHBRLsiTPlJPC/Bit0s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BtNCVJTpVwByU8g2jg7dHq4veHwXP4W/Kwka5J5mvldSqmxIEggd2/U2NeibjokXkZ3wp+tfXw3WqgLTprdG/nIY9AMaqBhoyt4htWBNFYtSvFu2ZLtSf4wW/YDY6cE/wjL41kv4RvYeBSTDu/YIMz2f7w30jHEfviD34AY95HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=depYQheU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="depYQheU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C871F00A3E;
	Mon, 27 Jul 2026 09:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785143442;
	bh=z1QNBSb/TMon013DAfoTQoiSphQ/kVQ5T0NaSkcOIQ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=depYQheUU68Uy9LcFY0n2Hr4amELF2S4EKETJd+T4Q+iz4wdyvusjlbz1IWW3OGCm
	 uLeOwq7/Q1JHVIXMgSeJuG1qYV6QP6y1/RIDZJhWLaLUa9b4+55m0GpFNTXO3oD/R8
	 Ds7B4qxUsLMHeUJUMSoEp8ZvDCLtEOftMIY+nJDUZB6tYAoGe5f/7tJ20wUKZ5ctUP
	 9b2vA/J268nRwpBLkoToILFXXmaDgbFdfY6b8vpayVDvXrn77BM2ZQVb/kmCf7ZEd2
	 uVjWCJwXUIzKfLY+/jOqnPLP/Au1yQFJIPNQW4S+PfsTUj+oua35KEWZzzTWJocDjO
	 7V+lXf62eNu8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260727-mira220-v10-2-8825794e6095@ideasonboard.com>
References: <20260727-mira220-v10-0-8825794e6095@ideasonboard.com>
 <20260727-mira220-v10-2-8825794e6095@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 09:10:41 +0000
Message-Id: <20260727091042.52C871F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] VBLANK and EXPOSURE controls are not clustered, leading to out-of-=
sync hardware registers when exposure is clamped.
- [High] Unconditional destructive reset of the VBLANK control in `mira220_=
set_pad_format()`.
- [Medium] Incorrect runtime PM initialization causes immediate synchronous=
 suspend and race conditions.
- [Medium] Missing stabilization delay after de-asserting the device reset =
GPIO.
--

--- Patch [2]: [PATCH v10 2/2] media: i2c: Add driver for AMS-OSRAM Mira220=
 ---
commit cb83e647803e960559fdc26fb38bc39f07cc82b9
Author: Philippe Baetens <philippebaetens@gmail.com>
Subject: media: i2c: Add driver for AMS-OSRAM Mira220

This commit introduces a new V4L2 subdevice driver for the AMS-OSRAM Mira220
image sensor. It implements support for mono and RGB variants with resoluti=
ons
up to 1600x1400 at 90fps via a MIPI CSI-2 interface.

> diff --git a/drivers/media/i2c/mira220.c b/drivers/media/i2c/mira220.c
> new file mode 100644
> index 0000000000000..40462adc64eb4
> --- /dev/null
> +++ b/drivers/media/i2c/mira220.c
[ ... ]
> +static int mira220_power_on(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct mira220 *mira220 =3D to_mira220(sd);
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(mira220_supplies),
> +				    mira220->supplies);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable regulators\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(mira220->xclk);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable clock\n", __func__);
> +		goto reg_off;
> +	}
> +
> +	gpiod_set_value_cansleep(mira220->reset_gpio, 0);
> +
> +	return 0;

[Severity: Medium]
Could the lack of a stabilization delay here cause unreliable probe failure=
s?

The hardware is taken out of reset and mira220_identify_module() immediately
begins I2C OTP reads, but most image sensors require a documented
stabilization period before their I2C interfaces can reliably acknowledge
traffic.

[ ... ]
> +static int mira220_set_pad_format(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  struct v4l2_subdev_format *fmt)
> +{
> +	struct mira220 *mira220 =3D to_mira220(sd);
> +	struct v4l2_rect *crop;
> +	u32 min_vblank;
> +	int ret;
> +
> +	mira220_update_pad_format(mira220, &fmt->format, fmt->format.code);
> +	*v4l2_subdev_state_get_format(state, 0) =3D fmt->format;
> +
> +	crop =3D v4l2_subdev_state_get_crop(state, 0);
> +	crop->width =3D fmt->format.width;
> +	crop->height =3D fmt->format.height;
> +	crop->left =3D MIRA220_PIXEL_ARRAY_LEFT;
> +	crop->top =3D MIRA220_PIXEL_ARRAY_TOP;
> +
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +		return 0;
> +
> +	/* Update vblank based on new mode. */
> +	min_vblank =3D mira220_calc_min_vblank(mira220);
> +	ret =3D __v4l2_ctrl_modify_range(mira220->vblank, min_vblank,
> +				       MIRA220_MAX_VBLANK, 1, min_vblank);
> +	if (ret)
> +		return ret;
> +
> +	return __v4l2_ctrl_s_ctrl(mira220->vblank, min_vblank);
> +}

[Severity: High]
Does this code unintentionally discard the user's explicitly requested frame
rate?

Calling __v4l2_ctrl_s_ctrl() unconditionally forces the VBLANK control to
min_vblank whenever the format is negotiated or set, which overwrites any
custom settings previously established by the user.

[ ... ]
> +static int mira220_init_controls(struct mira220 *mira220)
> +{
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&mira220->sd);
> +	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	struct v4l2_fwnode_device_properties props;
> +	struct v4l2_ctrl *ctrl;
> +	u32 max_exposure =3D 0;
> +	u32 min_vblank;
> +	u32 hblank_val;
> +	int ret;
> +
> +	ctrl_hdlr =3D &mira220->ctrl_handler;
> +	ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> +	if (ret)
> +		return ret;
> +
> +	/* By default, PIXEL_RATE is read only */
> +	v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops, V4L2_CID_PIXEL_RATE,
> +			  MIRA220_PIXEL_RATE, MIRA220_PIXEL_RATE, 1,
> +			  MIRA220_PIXEL_RATE);
> +
> +	min_vblank =3D mira220_calc_min_vblank(mira220);
> +	mira220->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
> +					    V4L2_CID_VBLANK,
> +					    min_vblank, MIRA220_MAX_VBLANK, 1,
> +					    min_vblank);
> +
> +	ctrl =3D v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL, V4L2_CID_LINK_FREQ,
> +				      0, 0, &mira220_link_freqs[0]);
> +	if (ctrl)
> +		ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	/*
> +	 * Scale hblank according to the number of enabled data lanes to match
> +	 * row_length.
> +	 */
> +	hblank_val =3D MIRA220_LLP_1600x1400_304 * (2 / mira220->lanes)
> +		   - MIRA220_PIXEL_ARRAY_WIDTH;
> +	ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK, hblank_val,
> +				 hblank_val, 1, hblank_val);
> +	if (ctrl)
> +		ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	/* Max exposure is determined by vblank + vsize and Tglob. */
> +	max_exposure =3D mira220_calc_exposure(mira220,
> +					     MIRA220_PIXEL_ARRAY_HEIGHT,
> +					     min_vblank);
> +
> +	mira220->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
> +					      V4L2_CID_EXPOSURE,
> +					      MIRA220_EXPOSURE_MIN,
> +					      max_exposure, 1,
> +					      MIRA220_DEFAULT_EXPOSURE);

[Severity: High]
Should VBLANK and EXPOSURE be registered as a control cluster using
v4l2_ctrl_cluster()?

When VBLANK is modified in mira220_set_ctrl(), it updates the exposure boun=
ds.
If the current exposure exceeds the new maximum, the V4L2 core clamps the
software value. Without a cluster, the s_ctrl handler for EXPOSURE is not
invoked, meaning the clamped value is never written to hardware.

[ ... ]
> +static int mira220_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct mira220 *mira220;
> +	int ret;
[ ... ]
> +	ret =3D v4l2_async_register_subdev_sensor(&mira220->sd);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret,
> +			      "failed to register sensor sub-device\n");
> +		goto error_subdev_cleanup;
> +	}
> +
> +	pm_runtime_idle(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	return 0;

[Severity: Medium]
Is it intentional to call pm_runtime_idle() before configuring autosuspend?

Because the usage count is 0 and autosuspend is not yet active, this trigge=
rs
an immediate synchronous suspend, defeating the 1000ms delay and causing an
unnecessary power cycle during the probe path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-mira220-v1=
0-0-8825794e6095@ideasonboard.com?part=3D2
