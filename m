Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328211D798E
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741240; cv=none; b=n4/VNAkaH/Oaix6o54gqtG1ZGFqAq5//Sg7Ejyx3rYrq/ymRUaNDHEUuoi1CROGkj+NVnPr32GtKinKM6d4zj5dBlAHfBMcmL+hk/9WhJ6kLJXKDb24rObXnSCJeg59+BPH5MbSsyzA2abYqez70Vp+aO4JGlRdu9kq+BfRhlJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741240; c=relaxed/simple;
	bh=YT3lvytYvMk6BaNpVQ9lrTBrXH/oxQi1VPqBmhy9dT4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l0Z1XWCRQdvc1RDE/eibD78NG79A2n/ppMXIvVjtRGlNTrH9pMWaksKJq/IoMsdbBFz9KUvlI1kg5Tc9lh/oxPRHcDdxtWXUaSYwtPMsBhOD2boPjKDFc7VyTof85o1Bc2vSPpKvHb+PouMFWamMAz4x39DWYoFJMuf10iTM4I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtPOK6YU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtPOK6YU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C53C2BCB7;
	Thu, 14 May 2026 06:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778741239;
	bh=YT3lvytYvMk6BaNpVQ9lrTBrXH/oxQi1VPqBmhy9dT4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TtPOK6YUtOO9DXWyw+FQLFtIfO3CTeaQF+hY9H69vSj6EO7x3Ujuqpl13M0qB+5dE
	 GzxIe+mP21sqn3rDB5lIZ1jK1l88iuKepSc6f7Q6urYrCNZAxDboSQfQ+8uZB1UJhX
	 Afg1gt5yIUfrqvziLebEPPPTuiaYZ1cCerIsFDsEjtd0cU1PF6BC9vikQKts4vUNo9
	 Z78eBn37RkpPqCVOA1ASmS6bVkygGIgWDp+PVGVTN/x2/4aiKVtGTRXo7cxYMCtMyU
	 XjkW0+b9JI7QqU2+im1mPQ5Xx9qXKXL9y0SZYJJqs+2sQtyZl55BNW+P4GoNdNI08U
	 GqULp/moD0X9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: i2c: imx678: Add driver for Sony IMX678
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jai Luthra" <jai.luthra@ideasonboard.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-imx678-v1-2-30fc593ed8fa@ideasonboard.com>
References: <20260513-imx678-v1-2-30fc593ed8fa@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 06:47:19 +0000
Message-Id: <20260514064719.99C53C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Double decrement of the Runtime PM usage counter in the error path=
 of `imx678_enable_streams()`.
- [High] Unbalanced `pm_runtime_put()` in `imx678_set_ctrl()` when Runtime =
PM is disabled.
- [High] 32-bit integer overflow in pixel rate and blanking calculations.
- [High] Double clock and regulator disable on `imx678_probe()` error path.
- [High] Inverted reset GPIO polarity and violating hardware teardown seque=
nce.
- [High] Unmet Kconfig dependency for `V4L2_CCI_I2C`.
- [Medium] Unconditional assignment of `dev_pm_ops` causes dead code when `=
CONFIG_PM` is disabled.
- [Medium] I2C communication errors are masked in `imx678_detect()`.
--

commit c1c2386554c6d8d1cfb6969de4f0aafe46f7ec69
Author: Jai Luthra <jai.luthra@ideasonboard.com>

media: i2c: imx678: Add driver for Sony IMX678

Add a V4L2 subdev driver for the Sony IMX678 image sensor supporting
monochrome and color variants via MIPI RAW12.

> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 8f2ba4121586e..4f9e1bf1566c5 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -287,6 +287,16 @@ config VIDEO_IMX415
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx415.
> =20
> +config VIDEO_IMX678
> +	tristate "Sony IMX678 sensor support"
> +	select V4L2_CCI_I2C

Could this cause unmet dependency warnings? V4L2_CCI_I2C depends on I2C, so
selecting it without a "depends on I2C" here might lead to Kconfig warnings=
 or
build failures.

> +	help
> +	  This is a Video4Linux2 sensor driver for the Sony
> +	  IMX678 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called imx678.
> +

[ ... ]

> diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
> new file mode 100644
> index 0000000000000..9725cc473fcef
> --- /dev/null
> +++ b/drivers/media/i2c/imx678.c

[ ... ]

> +static u64 imx678_iclk_to_pix(u32 pixel_rate, u32 cycles)
> +{
> +	const u32 iclk =3D 74250;
> +	const u32 pixclk =3D pixel_rate / HZ_PER_KHZ;
> +	u64 numerator =3D cycles * pixclk;

Can this multiplication overflow before being assigned to the 64-bit
numerator? Since both cycles and pixclk are 32-bit unsigned integers, their
product could exceed the 32-bit maximum, potentially resulting in incorrect
V4L2 blanking limits.

> +
> +	return DIV_ROUND_CLOSEST_ULL(numerator, iclk);
> +}
> +
> +/*
> + * HBLANK control is in units of pixels
> + * Convert to HMAX register units (@ internal 74.25 Mhz)
> + */
> +static u64 imx678_pix_to_iclk(u32 pixel_rate, u32 pixels)
> +{
> +	const u32 iclk =3D 74250;
> +	const u32 pixclk =3D pixel_rate / HZ_PER_KHZ;
> +	u64 numerator =3D pixels * iclk;

Similarly, does this calculation also risk a 32-bit overflow? Casting one of
the operands to u64 before multiplying might be needed here.

> +
> +	return DIV_ROUND_CLOSEST_ULL(numerator, pixclk);
> +}

[ ... ]

> +static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct imx678 *imx678 =3D container_of(ctrl->handler, struct imx678, ct=
rl_handler);
> +	struct v4l2_subdev_state *state;
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);
> +	const struct v4l2_mbus_framefmt *format;
> +	int ret =3D 0;
> +
> +	state =3D v4l2_subdev_get_locked_active_state(&imx678->sd);
> +	format =3D imx678_state_format(state);

[ ... ]

> +	/*
> +	 * Applying V4L2 control value only happens
> +	 * when power is up for streaming
> +	 */
> +	if (pm_runtime_get_if_in_use(&client->dev) =3D=3D 0)
> +		return 0;

If Runtime PM is disabled, pm_runtime_get_if_in_use() can return a negative
error code. Since this check only exits when the value is exactly 0, does
this code proceed to write to the hardware and then call pm_runtime_put()
below, potentially causing a reference count underflow?

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE: {

[ ... ]

> +	default:
> +		dev_warn(&client->dev,
> +			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
> +			 ctrl->id, ctrl->val);
> +		break;
> +	}
> +
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +}

[ ... ]

> +static int imx678_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 mask)
> +{
> +	struct i2c_client *client =3D v4l2_get_subdevdata(sd);
> +	struct imx678 *imx678 =3D to_imx678(sd);
> +	const struct v4l2_rect *crop =3D imx678_state_crop(state);
> +	const bool binning =3D imx678_state_binning(state);
> +	int ret =3D 0;
> +
> +	ret =3D pm_runtime_get_sync(&client->dev);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(&client->dev);
> +		goto err_rpm_put;
> +	}

If we take this error path, pm_runtime_put_noidle() decrements the usage
counter. Does the goto err_rpm_put label then call pm_runtime_put() again,
leading to a double decrement of the usage counter?

> +
> +	ret =3D imx678_write_common(imx678);

[ ... ]

> +	return 0;
> +
> +err_rpm_put:
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +}

[ ... ]

> +static int imx678_power_on(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct imx678 *imx678 =3D to_imx678(sd);
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(imx678_supply_name), imx678->s=
upplies);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable regulators\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	usleep_range(500, 550); /* Tlow */
> +
> +	gpiod_set_value_cansleep(imx678->reset_gpio, 1);

Does writing 1 to the reset GPIO assert the reset state? If a logical 1
asserts the reset, the sensor might be held in reset while it is supposed to
be operating.

> +
> +	ret =3D clk_prepare_enable(imx678->xclk);

[ ... ]

> +static int imx678_power_off(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct imx678 *imx678 =3D to_imx678(sd);
> +
> +	gpiod_set_value_cansleep(imx678->reset_gpio, 0);
> +	regulator_bulk_disable(ARRAY_SIZE(imx678_supply_name), imx678->supplies=
);
> +	clk_disable_unprepare(imx678->xclk);

Is it safe to disable the regulators before disabling the clock? This seque=
nce
drives an active clock into an unpowered CMOS sensor, which might violate
hardware teardown specifications.

> +
> +	/* Force reprogramming of the common registers when powered up again. */
> +	imx678->common_regs_written =3D false;
> +
> +	return 0;
> +}

[ ... ]

> +static int imx678_detect(struct imx678 *imx678)
> +{
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);
> +	int ret =3D 0;
> +	u64 val =3D 0;
> +
> +	/*
> +	 * This sensor's ID registers become accessible 80ms after coming out
> +	 * of STANDBY mode.
> +	 */
> +	cci_write(imx678->cci, IMX678_REG_MODE_SELECT, 0, &ret);
> +	usleep_range(IMX678_MODULE_ID_DELAY, IMX678_MODULE_ID_DELAY +
> +		     IMX678_MODULE_ID_DELAY_RANGE);
> +
> +	cci_read(imx678->cci, IMX678_REG_MODULE_ID, &val, &ret);
> +
> +	if (val !=3D IMX678_ID) {
> +		dev_err(&client->dev,
> +			"Chip ID mismatch: %x!=3D%llx\n", IMX678_ID, val);
> +		return -ENXIO;
> +	}

If cci_read() fails, the actual I2C error code stored in ret is ignored her=
e,
and val defaults to 0. Since 0 doesn't match IMX678_ID, does this log a
potentially misleading "Chip ID mismatch" error and discard the I2C error
code?

> +
> +	cci_read(imx678->cci, IMX678_REG_MONOCHROME, &val, &ret);

[ ... ]

> +static int imx678_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct imx678 *imx678;
> +	const struct of_device_id *match;
> +	int ret, i;

[ ... ]

> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	ret =3D imx678_init_controls(imx678);
> +	if (ret)
> +		goto error_pm_runtime;

[ ... ]

> +	return 0;
> +
> +error_subdev_cleanup:
> +	v4l2_subdev_cleanup(&imx678->sd);
> +
> +error_media_entity:
> +	media_entity_cleanup(&imx678->sd.entity);
> +
> +error_handler_free:
> +	imx678_free_controls(imx678);
> +
> +error_pm_runtime:
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +
> +error_power_off:
> +	imx678_power_off(&client->dev);
> +
> +	return ret;
> +}

Because pm_runtime_idle(dev) was called during probe before
imx678_init_controls(), the device could already be suspended via the
imx678_power_off() callback. If we take this error path, does the driver
unconditionally call imx678_power_off() again, causing unbalanced clock and
regulator disable calls?

> +
> +static void imx678_remove(struct i2c_client *client)
> +{

[ ... ]

> +MODULE_DEVICE_TABLE(of, imx678_dt_ids);
> +
> +static const struct dev_pm_ops imx678_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(imx678_power_off, imx678_power_on, NULL)
> +};
> +
> +static struct i2c_driver imx678_i2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "imx678",
> +		.of_match_table =3D imx678_dt_ids,
> +		.pm =3D &imx678_pm_ops,

This isn't a bug, but omitting the pm_ptr() wrapper around &imx678_pm_ops h=
ere
can leave unused structures and trigger dead code warnings when CONFIG_PM is
disabled.

> +	},
> +	.probe =3D imx678_probe,
> +	.remove =3D imx678_remove,
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-imx678-v1-=
0-30fc593ed8fa@ideasonboard.com?part=3D2
