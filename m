Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563643921F1
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782116958; cv=none; b=GLxxAbKspyq1cxQw8nUwhyRiovaNxTK3nwiiwxRyE22DC4Hd5SEUicuwp8WceLOGxTU1VfqbfXDkp3Xh3OWgU5Jo/Zl+hdEXZvRn+I/HNY2lY2vL4jtHt4GLUO6Oh5mjK5fAK75fgzTVbMiQgyVCKr9shtkM9bDdq70WehFgydk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782116958; c=relaxed/simple;
	bh=H8J4UJj+h9XfnH39XDeZVLYP5jPs3JHKhjKNoEPbu2s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KC4FjDsqrXJ9fRbHY5Ax1thkKjG0hXCqZcW5nV10qjc4o34cM1xim6uMpptvAuNOSFcnq6ScTR2fVluT4DVPPPu8akBmDKf7whRDUnfyNoJE+AY8gxrjxYV+6+5k/9thS59ol+dL8D4fOattnqGwbDb+11Ps8XEU5ayWUWbmp60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IE05ZNGf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IE05ZNGf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2C01F000E9;
	Mon, 22 Jun 2026 08:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782116949;
	bh=upqD3b7g6OCqsrZXQosc6W1+TqzcoaJTkhcVvu/b/1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IE05ZNGfInzJjUytIUSA4YsepjYhpugz++sYQzT1sX5+OhKS5dlrOH01Rcg3z/wYe
	 W4QGfksBHUpwpC8kez6hILMG5cl9Qo13IrxURx8WbLsSA/uQnKqeD9RA4k+RptkBVt
	 OnFjB9aVKjkPakoTTmVDWl6YiIcnvWLxjz46CL8de0k0T1uW5ydK2MAJSBcKclnWMR
	 kgc2M88HFEWpg8gbPkUr8Yt7HvYPRnIYXHnO/tEAcEbh2DjKoJO1Tvr4x1lbURWGMh
	 zGIyVklmVmh0msEj39CQ78XCjBvfxC8CqZvgUrStzEo/tHV8Vo7Rqm07i+oqgk164o
	 /Xr4KF8Rgjf0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/2] media: i2c: add Himax HM1246 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matthias Fend" <matthias.fend@emfend.at>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260622-hm1246-v11-2-c62ef9516ab1@emfend.at>
References: <20260622-hm1246-v11-0-c62ef9516ab1@emfend.at>
 <20260622-hm1246-v11-2-c62ef9516ab1@emfend.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 08:29:08 +0000
Message-Id: <20260622082909.4C2C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect handling of negative error codes from pm_runtime_get_if_=
active() leads to usage counter underflow and invalid hardware access.
- [High] Integer overflow in vco_out calculation and logical flaw completel=
y break PLL configuration for high link frequencies.
- [High] Use-After-Free race condition during device removal due to incorre=
ct cleanup ordering.
- [Medium] Active subdev format code is not updated when modifying HFLIP or=
 VFLIP controls.
--

commit afbc7b4c289cadb0abe3caa02a219adf435617bf
Author: Matthias Fend <matthias.fend@emfend.at>
Subject: media: i2c: add Himax HM1246 image sensor driver

This commit adds a V4L2 sub-device driver for the Himax HM1246 image sensor,
supporting raw mode operations through an I2C interface.

> diff --git a/drivers/media/i2c/hm1246.c b/drivers/media/i2c/hm1246.c
> new file mode 100644
> index 0000000000000..f87ccb9b5a560
> --- /dev/null
> +++ b/drivers/media/i2c/hm1246.c
> @@ -0,0 +1,1285 @@

[ ... ]

> +static int hm1246_calc_pll(u32 xclk, u32 link_freq, u32 clocks_per_pixel,
> +			   u8 *pll1, u8 *pll2, u8 *pll3)
> +{

[ ... ]

> +	/* Determine an appropriate post divider. */
> +	for (post_div_index =3D 0; post_div_index < ARRAY_SIZE(post_div_table);
> +	     post_div_index++) {
> +		vco_out =3D pclk * pclk_div_table[pclk_div_index] *
> +			  post_div_table[post_div_index];
> +
> +		if (vco_out >=3D HM1246_PLL_VCO_MIN &&
> +		    vco_out <=3D HM1246_PLL_VCO_MAX)
> +			break;
> +	}

[Severity: High]
Does this calculation overflow the 32-bit vco_out variable for high link
frequencies?

For a maximum allowed link frequency of 96MHz, pclk would be 192MHz. The
product of pclk (192,000,000) * pclk_div (6) * post_div (8) is 9,216,000,00=
0,
which overflows the 32-bit u32 variable. This overflowed garbage value could
falsely fall within the valid VCO bounds, causing the loop to succeed and
the configuration to ultimately fail later with -EINVAL.

[ ... ]

> +static int hm1246_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct hm1246 *hm1246 =3D
> +		container_of_const(ctrl->handler, struct hm1246, ctrls);
> +	struct v4l2_subdev_state *state;
> +	const struct v4l2_mbus_framefmt *format;
> +	u32 val;
> +	bool needs_cmu_update =3D true;
> +	int ret;
> +
> +	state =3D v4l2_subdev_get_locked_active_state(&hm1246->sd);
> +	format =3D v4l2_subdev_state_get_format(state, 0);
> +
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		s64 exposure_max;
> +
> +		exposure_max =3D
> +			format->height + ctrl->val - HM1246_COARSE_INTG_MARGIN;
> +		ret =3D __v4l2_ctrl_modify_range(hm1246->exposure_ctrl,
> +					       hm1246->exposure_ctrl->minimum,
> +					       exposure_max,
> +					       hm1246->exposure_ctrl->step,
> +					       exposure_max);
> +
> +		if (ret) {
> +			dev_err(hm1246->dev, "exposure ctrl range update failed\n");
> +			return ret;
> +		}
> +	}
> +
> +	if (!pm_runtime_get_if_active(hm1246->dev))
> +		return 0;

[Severity: High]
Could this condition mishandle negative error codes returned from the
Runtime PM core?

The function pm_runtime_get_if_active() returns 1 if active, 0 if suspended,
and a negative error code (like -EINVAL) if disabled. If it returns a
negative error code, this check is bypassed. This might allow the driver
to attempt hardware register accesses on unpowered hardware. In addition,
since the usage count wasn't incremented on error, the subsequent call to
pm_runtime_put() at the end of the function could cause a usage counter
underflow. Checking for (ret <=3D 0) might be safer here.

> +
> +	ret =3D 0;
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		cci_write(hm1246->regmap, HM1246_COARSE_INTG_REG, ctrl->val,
> +			  &ret);
> +		break;
> +
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		cci_write(hm1246->regmap, HM1246_ANALOG_GLOBAL_GAIN_REG,
> +			  ctrl->val, &ret);
> +		break;
> +
> +	case V4L2_CID_VBLANK:
> +		val =3D format->height + ctrl->val;
> +		cci_write(hm1246->regmap, HM1246_FRAME_LENGTH_LINES_REG, val,
> +			  &ret);
> +		break;
> +
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +		val =3D 0;
> +		if (hm1246->hflip_ctrl->val)
> +			val |=3D HM1246_IMAGE_ORIENTATION_HFLIP;
> +		if (hm1246->vflip_ctrl->val)
> +			val |=3D HM1246_IMAGE_ORIENTATION_VFLIP;
> +
> +		cci_write(hm1246->regmap, HM1246_IMAGE_ORIENTATION_REG, val,
> +			  &ret);
> +		break;

[Severity: Medium]
Should the active subdev format code be updated here to reflect the new
pixel layout?

Since V4L2_CID_HFLIP and V4L2_CID_VFLIP change the sensor's Bayer color
pattern and are registered with V4L2_CTRL_FLAG_MODIFY_LAYOUT, leaving the
active state's pixel format un-updated could cause subsequent
VIDIOC_SUBDEV_G_FMT ioctls to return stale format information.

[ ... ]

> +static void hm1246_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct hm1246 *hm1246 =3D to_hm1246(sd);
> +
> +	v4l2_async_unregister_subdev(&hm1246->sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&hm1246->sd.entity);
> +	v4l2_ctrl_handler_free(&hm1246->ctrls);

[Severity: High]
Could the order of these cleanup calls lead to a use-after-free?

Calling v4l2_subdev_cleanup() frees the subdevice's active state memory
before v4l2_ctrl_handler_free() destroys the controls. If a concurrent
VIDIOC_S_CTRL ioctl is executing hm1246_set_ctrl(), it could safely
dereference the active state via v4l2_subdev_get_locked_active_state()
since the control handler is still active. If the state is freed underneath
it during removal, this would cause a use-after-free.

> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev)) {
> +		hm1246_power_off(hm1246->dev);
> +		pm_runtime_set_suspended(&client->dev);
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-hm1246-v11=
-0-c62ef9516ab1@emfend.at?part=3D2
