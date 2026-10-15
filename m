Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EB152FE36
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071355; cv=none; b=K3gNsP2OYjnrvTzfsvLB92I2lEPKj1G6ZtPDLczACvyWF/SfRcR9514go1HCmXQFgmd7QK3xetUdLMmMNjQVPwS0LleswLGJVnycvnFHwVZGhxWGPRKBHZ1DXiZrBSQslHlSGHd/H87QnTGSJeBTyz7r5hs16nptl0GbyOQVqIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071355; c=relaxed/simple;
	bh=R1gW4d+O9Q9sEy3AGo0UvbIW70aG8HMJMVpg9O/HdHQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qwXreF1HbJAXejw5W4+N6XoP7lszxrYPHPoYCm4ApJjNuACwZycYNIi/giQfzrAPAG40BKHCXSo2K+NHuGtg4M0DW4HnG+zGv5coa1PW1uJjxI7M0AHlIMfcnpWnlZCcmfBVZcM9FExxI9MgKg7Uz4nZwocVfo2Vlu6pc4hunSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKHyj//M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKHyj//M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF9F1F000C6;
	Thu, 15 Oct 2026 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792071353;
	bh=mOto2H/Szw/PjqaMpCSFJl6c2jU+IloBRKWoX1X7sAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IKHyj//MV2MFGuD3Ub3X68JZA55RD75aAMYus6GVO6ZDuWQadsc3Srp6waJb7WYqF
	 ksZ9OG1i2pLMmx/kkfB0cBJa85Hw/LzhMojlyUP6aXI+/ghQFBQH6xv0+KOJMLfGil
	 YJuo5fPJbDwRYvijx8YhpMrhYxzniQDsUA2Gt07S0jmCpXef/7OgPKDkcKfHaWswj1
	 Ug76jqaN7zRRawp0Bta6N1YokwLeH8V0XxmmD6OL2a+OwU+xI9Y/oaMdQJ12NWJham
	 J+gRFN4MX0B4iGyNkYeeisl4bX9UmyjQCbycICm/5k/OLFHpbzTlCb6MIprDitmR2Z
	 CnBkMk39p0u+g==
Message-ID: <sashiko-outbox-172932@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] media: i2c: mira016: Add driver for Mira016
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261015-mira016-v7-2-828c931c5550@ideasonboard.com>
References: <20261015-mira016-v7-0-828c931c5550@ideasonboard.com>
 <20261015-mira016-v7-2-828c931c5550@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 13:35:52 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] media: use-after-free of control handler in mira016_remove()
- [Medium] media: V4L2_SUBDEV_FORMAT_TRY skips active control limits initia=
lization
- [Medium] media: read_poll_timeout() condition swallows I2C errors
- [Medium] media: integer overflow in pll2 calculation
- [Medium] media: severe precision loss in pixel rate calculation
- [Medium] Runtime PM usage counter underflow in mira016_set_ctrl()
- [Low] media: Kconfig missing select V4L2_FWNODE
--

commit 1bcaca970613b0c6cece4da4dc3fbc5bef5be113
Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: media: i2c: mira016: Add driver for Mira016

This patch adds a new V4L2 I2C driver for the ams OSRAM MIRA016 camera sens=
or.
It introduces configurations for PLL settings, hardware timings, format
negotiation, and integration with the V4L2 subdevice framework including
runtime power management.

> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 7de2d095c9696..34795bccd5d64 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -332,6 +332,18 @@ config VIDEO_IMX678
[ ... ]
> +config VIDEO_MIRA016
> +	tristate "ams OSRAM MIRA016 sensor support"
> +	depends on I2C && VIDEO_DEV
> +	depends on GPIOLIB
> +	select V4L2_CCI_I2C

[Severity: Low]
Does this Kconfig entry need to select V4L2_FWNODE?

The driver relies on firmware node helpers like
v4l2_fwnode_endpoint_alloc_parse() and v4l2_link_freq_to_bitmap(). If the
kernel is configured with CONFIG_VIDEO_MIRA016=3Dy but CONFIG_V4L2_FWNODE is
not enabled, the build might fail during the linking stage due to unresolved
symbols.


> diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
> new file mode 100644
> index 0000000000000..eec6651a2bfcf
> --- /dev/null
> +++ b/drivers/media/i2c/mira016.c
[ ... ]
> +static inline u32 mira016_calc_prate(struct mira016 *mira016, u32 h_tot)
> +{
[ ... ]
> +	u32 trow_psec =3D mira016_trow_psec(mira016);
> +
> +	return h_tot * HZ_PER_MHZ / trow_psec * HZ_PER_MHZ;

[Severity: Medium]
Is there a risk of severe precision loss in this pixel rate calculation?

Because C evaluates operators with the same precedence left-to-right, the
division by trow_psec happens before the final multiplication. For a typical
configuration, h_tot * 1,000,000 is around 400,000,000, and trow_psec is
around 5,663,646. The integer division results in exactly 70.

Multiplying 70 by 1,000,000 yields a flat 70,000,000 Hz, truncating all
fractional megahertz precision. V4L2 pixel rates are exact configurations
used for CSI-2 receiver bandwidths and frame intervals, so this truncation
could lead to timing deviations.


> +static int mira016_set_pad_format(struct v4l2_subdev *sd,
> +				  const struct v4l2_subdev_client_info *ci,
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

[Severity: Medium]
Does this early return prevent the initialization of active control limits?

During initialization, v4l2_subdev_init_finalize() dynamically allocates the
active state and passes it to mira016_init_state() to set the default format
and controls. In mira016_init_state(), the format struct's which field is
hardcoded to V4L2_SUBDEV_FORMAT_TRY and passed here to
mira016_set_pad_format().

Because of this check, the function returns early and entirely skips the
__v4l2_ctrl_modify_range() call for mira016->gain. Consequently, the active
state's analogue gain control remains artificially clamped to the dummy
bounds of [1, 1] until userspace explicitly issues a new VIDIOC_SUBDEV_S_FMT
command.


> +static int mira016_configure_pll(struct mira016 *mira016)
> +{
[ ... ]
> +	cci_write(mira016->regmap, MIRA016_CLKGEN_TX_ESC_L_REG,
> +		  mira016->pll.esc_l, &ret);
> +	cci_write(mira016->regmap, MIRA016_PLL_PD_REG, 0, &ret);
> +	if (ret)
> +		return ret;
> +
> +	return read_poll_timeout(cci_read, ret,
> +				 (ret < 0 || (val & MIRA016_PLL_LOCKED)),
> +				 500, 10000, false, mira016->regmap,
> +				 MIRA016_PLL_LOCK_REG, &val, NULL);

[Severity: Medium]
Does this polling condition swallow I2C errors?

If cci_read() fails due to an I2C communication error, it returns a negative
error code in ret. The condition (ret < 0) then evaluates to true.

Because the condition is met, the read_poll_timeout() macro successfully
breaks out of the polling loop and returns 0 instead of propagating the
error. This could mask hardware initialization failures, letting the driver
blindly proceed as if the PLL locked correctly.


> +static void mira016_pll_calc(struct mira016 *mira016)
> +{
[ ... ]
> +	for (n =3D MIRA016_PLL_N_MIN; n < MIRA016_PLL_N_MAX; ++n) {
> +		u32 pll1 =3D clk_in / n;
> +
> +		if (pll1 < MIRA016_PLL_PLL1_MIN || pll1 > MIRA016_PLL_PLL1_MAX)
> +			continue;
> +
> +		for (m =3D MIRA016_PLL_M_MIN; m < MIRA016_PLL_M_MAX; ++m) {
> +			u32 pll2 =3D pll1 * m;

[Severity: Medium]
Can this 32-bit multiplication overflow for combinations of high pll1 and m?

pll1 is constrained up to MIRA016_PLL_PLL1_MAX (22 MHz, or 22,000,000) and m
is an index up to MIRA016_PLL_M_MAX (255). The maximum product is
22,000,000 * 255 =3D 5,610,000,000, which exceeds the 32-bit unsigned integ=
er
maximum (4,294,967,295).

This integer wrap-around could cause the driver to incorrectly evaluate
wrapped values (e.g., 1,315,032,704 Hz) as falling within the valid
[640MHz, 1500MHz] range, resulting in a broken sensor data rate
configuration. Casting to a 64-bit unsigned integer before multiplication
might be necessary here.


> +static int mira016_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!pm_runtime_get_if_in_use(mira016->dev))
> +		return 0;

[Severity: Medium]
Could this logical NOT operator bypass the check for negative error codes?

If pm_runtime_get_if_in_use() returns -EINVAL (which occurs when runtime PM
is dynamically disabled via pm_runtime_disable(), e.g. during system suspend
or device unbind), the check !pm_runtime_get_if_in_use(...) evaluates to
false.

This causes the function to skip the early return and attempt hardware
register access while the device may be powered off, potentially leading to
I2C errors.

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		ret =3D mira016_write_exposure_reg(mira016, ctrl->val);
> +		break;
> +	case V4L2_CID_VBLANK:
> +		ret =3D mira016_write_frame_duration_reg(mira016, state, ctrl->val);
> +		break;
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret =3D mira016_write_analogue_gain(mira016, state, ctrl->val);
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put_autosuspend(mira016->dev);

Because pm_runtime_put_autosuspend() is then called unconditionally even
though the usage counter was not incremented by the failed get call, this
would trigger a usage counter underflow warning.


> +static void mira016_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct mira016 *mira016 =3D to_mira016(sd);
> +
> +	v4l2_ctrl_handler_free(mira016->sd.ctrl_handler);
> +
> +	v4l2_async_unregister_subdev(sd);

[Severity: High]
Is there a potential use-after-free here if userspace issues a control ioctl
during device removal?

The control handler is destroyed and its locks are freed before the
subdevice is unregistered from the media core. Until
v4l2_async_unregister_subdev() completes, the subdevice's V4L2 devnode
remains exposed and fully accessible to userspace.

If a concurrent userspace application issues a control ioctl
(like VIDIOC_S_CTRL) during this window, the V4L2 core will dereference the
already-freed control handler. It is generally safer to unregister the
subdevice before tearing down its resources.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-mira016-v7=
-0-828c931c5550@ideasonboard.com?part=3D2
