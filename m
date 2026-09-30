Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B8645FFAD
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766384; cv=none; b=prHr9qYVbebamEU1V2aF7EEB4g4cQdfz145EmSMuqb85Mo3pS7/oyuHfF5mB0x55eEMIYVeZq+CB9sUed7DWTq+K+q+tblbZ/eR4skXtP3BcRnEOh5ohCM4qENXR35RKYYCfzoBoM6HDn3Fy+pDr8Plkf1dy9Ql9O5gDZ6LV0+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766384; c=relaxed/simple;
	bh=q9hyk+ynF8vP+knmFin+Ok1Mxpbm98HaeasMbTQW1sc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HmoD5ZN0IcNT63tawOKS7gN9S9CUaqIPCs1Qu5eXFqTmNzYYiFjiU8ad3GA/X6H/mZ4Btdj4o7JVuBUbSQNmUnxjAz6Bxy2D6ooGELGX/E2e8sSFBELAWDYRmAIUK7bwHJhMIk8tQBlYfGlkO4ldPiFlF4xK0Rsi+rVM3JtCA6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJgBu1FG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJgBu1FG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10771F000FF;
	Wed, 30 Sep 2026 11:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790766371;
	bh=VeN/xU/hTE/jpejP9onW/Wdxnegpy+uPmxWiOE91Enc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dJgBu1FG2ZrJlxmm0z0CXhAuWwLZvAat7HP5mHHhE4KOWvt3f22ShBzX7hmKfQZHk
	 oATG67ZCchgVrR573nr469CJHmJ0r+DTzsf7/32v1EO1A6fqY7fNTpNdd30TI7zYvI
	 ycYU1NTgvUEeHQQKSL3hGcd/M9Hh8kF+gZl81QTAa25lai+XRIKwvdAh7E8MjGk+X7
	 jkC0BNFb55BNlI0Ty9/UC4N8HRMZL3beKoxOmc/LDjEzOTEU0xZD/kHWABTHZvMese
	 5R+RacFpNtd8lcVDunSD+m4ilw9RvepZXbOZSHCmmiUxYbMzKLSTt5oJOJ24i5DBHH
	 8aCbIG7TNc5qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: mira016: Add driver for Mira016
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930-mira016-v5-2-499a34ab8204@ideasonboard.com>
References: <20260930-mira016-v5-0-499a34ab8204@ideasonboard.com>
 <20260930-mira016-v5-2-499a34ab8204@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 11:06:10 +0000
Message-Id: <20260930110610.C10771F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] pm: usage counter underflow due to incorrect pm_runtime_get_if_in_=
use check
- [High] media: use-after-free in mira016_remove via early control handler =
free
- [High] media: I2C register corruption due to overlapping 32-bit writes
- [Medium] build: missing select V4L2_FWNODE causes unmet dependencies
- [Medium] media: integer precision loss in mira016_calc_prate
- [Medium] media: I2C read errors swallowed during PLL lock polling
--

commit 3aea445f536c7012ef543a433b00f827003a9007
Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

media: i2c: mira016: Add driver for Mira016

Add driver for the ams OSRAM Mira016 sensor.

> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -321,6 +321,18 @@ config VIDEO_IMX678
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx678.
> =20
> +config VIDEO_MIRA016
> +	tristate "ams OSRAM MIRA016 sensor support"
> +	depends on I2C && VIDEO_DEV
> +	depends on GPIOLIB
> +	select V4L2_CCI_I2C

[Severity: Medium]
Could this lead to kernel build failures due to unresolved symbols?

The driver uses APIs like v4l2_fwnode_endpoint_alloc_parse() in
mira016_parse_endpoint() which depend on the v4l2-fwnode module. Because
V4L2_FWNODE is not selected here, linking may fail when this module is not
enabled by other configs.

> +	help
> +	  This is a Video4Linux2 sensor driver for the ams OSRAM
> +	  MIRA016 camera.

[ ... ]

> diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
> --- /dev/null
> +++ b/drivers/media/i2c/mira016.c
> @@ -0,0 +1,2309 @@

[ ... ]

> +#define MIRA016_EXP_TIME_L_REG		CCI_REG32(0x000e)
> +#define MIRA016_EXP_TIME_S_REG		CCI_REG32(0x0012)
> +#define MIRA016_NUM_FRAMES_REG		CCI_REG32(0x0007)
> +#define MIRA016_TARGET_FRAME_TIME_REG	CCI_REG32(0x0008)

[Severity: High]
Does this sequence cause hardware register corruption?

MIRA016_NUM_FRAMES_REG (0x0007) and MIRA016_TARGET_FRAME_TIME_REG (0x0008)
are defined as 32-bit (CCI_REG32) and are written sequentially in
mira016_write_frame_duration_reg().

Because the addresses only have an offset of 1 between them, the first
write spans 0x0007-0x000a, and the second spans 0x0008-0x000b. This will
overwrite the first value and adjacent registers like CMD_REQ_1_REG.

> +
> +#define MIRA016_TIME_UNIT_REG		CCI_REG16(0x0012)
> +#define MIRA016_GLOB_TIME_REG		CCI_REG16(0x015a)

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
Will this evaluation lose significant precision?

The expression h_tot * HZ_PER_MHZ / trow_psec * HZ_PER_MHZ is evaluated
left-to-right. The integer division (h_tot * HZ_PER_MHZ) / trow_psec drops
all fractional sub-MHz precision before the final multiplication.

This can cause the pixel rate reported to userspace to be severely truncated
to 1 MHz boundaries, leading to framing inaccuracies.

> +}

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

[ ... ]

> +	cci_write(mira016->regmap, MIRA016_PLL_PD_REG, 0, &ret);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D read_poll_timeout(cci_read, ret,
> +				(ret < 0 || (val & MIRA016_PLL_LOCKED)),
> +				500, 10000, false, mira016->regmap,
> +				MIRA016_PLL_LOCK_REG, &val, NULL);
> +	if (ret < 0)
> +		return ret;

[Severity: Medium]
Are we masking I2C read errors during PLL lock polling?

The read_poll_timeout macro evaluates its break condition (ret < 0 || ...).
If cci_read() fails, ret is negative, the condition evaluates to true, and
the macro exits returning 0. This return value overwrites ret =3D 0, masking
the I2C failure and potentially proceeding with uninitialized PLLs.

> +
> +	/* Configure the sensor timings. */

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
> +	crop =3D v4l2_subdev_state_get_crop(state, 0);

[ ... ]

> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!pm_runtime_get_if_in_use(&client->dev))
> +		return 0;

[Severity: High]
Could this result in a usage counter underflow and hardware access while
powered off?

When Runtime PM is disabled or not fully active, pm_runtime_get_if_in_use()
returns a negative error code like -EINVAL. The strict negation !(-EINVAL)
evaluates to false, bypassing the abort condition.

This allows the function to proceed with unpowered hardware access and
eventually call pm_runtime_put_autosuspend(), which underflows the usage
counter.

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:

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
Could this early free result in a use-after-free vulnerability?

In this teardown path, v4l2_ctrl_handler_free() is called before
v4l2_async_unregister_subdev(). The subdevice remains active and accessible
to userspace and the media core while its control handler is destroyed.

A concurrent userspace ioctl (like VIDIOC_S_CTRL) can access the freed
control handler, potentially leading to kernel memory corruption.

> +	v4l2_subdev_cleanup(&mira016->sd);
> +	media_entity_cleanup(&sd->entity);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-mira016-v5=
-0-499a34ab8204@ideasonboard.com?part=3D2
