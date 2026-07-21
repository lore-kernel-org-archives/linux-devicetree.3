Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C5D3DE453
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644581; cv=none; b=Hf4RRvV8kGS2ysv8ce8NRBM0OiNu8UI6pIxiUt9FuhT6Lj8STc7/chKQGWkl6/by048oZ88+z/lHTb0aWXVcaYCgquzMXpwFsMsgRTJWz6EXrX7e3JWP/oNnlKTsQFkjBzrppWR8VHdn5zzYWYL450nsnjgWnsnmT8v2h/zt4Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644581; c=relaxed/simple;
	bh=p1jcj2RKjKqNI4Vmk4qm5PT5lcPD/VvMriFXa5KI2JU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hrl8Sde91VMZMBcRkGGR88aU4XgvhLdtyQwHL0BghwArKjSmU9zNEetZ+RLAFut2X2HgHQnpOtB7rDoRrgxqaWOWQeBxSSqiQeEdExwdOfCS3Fyvr9lFl9QVhNxPiXxsDr+9wF5U0nAQu4i7cAtQVYlMRS7PaaezZrf6ha+rlJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSzu0yaR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSzu0yaR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F5B1F000E9;
	Tue, 21 Jul 2026 14:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784644575;
	bh=0eBDsWc2LttCdm2NE+V0GUpztoNIuJCblwAyRdnxd/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kSzu0yaRUTAk5Y7e3TsYVhIbvl2xiu+ktRPaKdrX/Ub9ttH2z9I1gx3hVR3hzDOX1
	 1b72VjELjBSHN5Czm4ONHUF7JkFmWr35vEbg3536R6JiX+XCEaVTsuPU/wJRj8ireI
	 Yt78J9b/JXwL2BPMWlfQvm1mofxtLafJzL+M4539f8V3oH5hJd/4ebPPcngw2/DQxl
	 QZYTzdmNvqSQZB/K1ek/eRGw5A18fJPY28MRO7VqC696e5el74vWZpDOtTzLXN7kHj
	 lXwga3kD329uk3OOYSu1TFSniU+CFGPrezwub9cfiK5vcxH/r/I3mc/kb08KlA6cYe
	 3TF9OnR9XD8gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: Add driver for AMSOSRMA Mira220
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260721-mira220-v5-2-533b0ad1065e@ideasonboard.com>
References: <20260721-mira220-v5-0-533b0ad1065e@ideasonboard.com>
 <20260721-mira220-v5-2-533b0ad1065e@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 14:36:14 +0000
Message-Id: <20260721143615.68F5B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] Dereferencing `mira220->vblank` without checking for NULL in `mira=
220_init_controls()`.
- [High] Missing `v4l2_subdev_cleanup()` in the driver's remove function ca=
uses an active state memory leak.
- [Medium] The uninitialized stack variable `id` is evaluated and logged wi=
thout checking if the I2C read succeeded.
- [Medium] The active state format code is not updated when `V4L2_CID_HFLIP=
` or `V4L2_CID_VFLIP` are modified.
- [Medium] Exposure control maximum limit exceeds the 16-bit hardware regis=
ter width, leading to silent truncation.
- [Medium] Hardware exposure register is not updated when `V4L2_CID_EXPOSUR=
E` is clamped due to a `V4L2_CID_VBLANK` change.
- [Medium] `mira220_power_on()` discards the actual error code when `clk_pr=
epare_enable()` fails.
- [Medium] Missing runtime PM reference hold during probe exposes the devic=
e to concurrent suspend.
- [Medium] The error path in probe unconditionally powers off the device wi=
thout checking its runtime PM state.
- [Medium] V4L2_CID_HBLANK reports an incorrect static value when using a 1=
-lane MIPI CSI-2 configuration, breaking user-space framerate and exposure =
calculations.
- [Low] Typo in user-facing control menu item: 'Vertial Gradient' instead o=
f 'Vertical Gradient'.
--

--- Patch [2]: [PATCH v5 2/2] media: i2c: Add driver for AMSOSRMA Mira220 -=
--
commit fbe78b3a27f19e95a842994664c11c10a075c4aa
Author: Philippe Baetens <philippebaetens@gmail.com>

media: i2c: Add driver for AMSOSRMA Mira220

Add a V4L2 subdev driver for driver for the AMSOSRAM Mira220 image sensor.

diff --git a/drivers/media/i2c/mira220.c b/drivers/media/i2c/mira220.c
index 0000000000000..861f3230375c2
--- /dev/null
+++ b/drivers/media/i2c/mira220.c
@@ -923,10 +923,10 @@ static const cci_reg_sequence mira220_init_reg_list[]=
 =3D {
[ ... ]
> +static const char *const mira220_test_pattern_menu[] =3D {
> +	"Disabled",
> +	"Vertial Gradient",
> +};

[Severity: Low]
Is there a typo in the menu item name? It seems like it should be Vertical
Gradient instead of Vertial Gradient.

@@ -1023,12 +1023,12 @@ static int mira220_power_on(struct device *dev)
[ ... ]
> +	ret =3D clk_prepare_enable(mira220->xclk);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable clock\n", __func__);
> +		goto reg_off;
> +	}
> +
> +	gpiod_set_value_cansleep(mira220->reset_gpio, 0);
> +
> +	return 0;
> +
> +reg_off:
> +	return regulator_bulk_disable(MIRA220_NUM_SUPPLIES, mira220->supplies);
> +}

[Severity: Medium]
Will this discard the actual error code when clk_prepare_enable() fails?

The function returns the result of regulator_bulk_disable(), which typically
returns 0 on success.

This could cause the caller to falsely assume the device was successfully
powered on, potentially leading to confusing I2C read failures later in the
probe process.

@@ -1113,5 +1113,5 @@ static int mira220_write_stop_streaming_regs(struct m=
ira220 *mira220)
[ ... ]
> +static u32 mira220_calc_exposure(struct mira220 *mira220, u32 height, u3=
2 vblank)
> +{
> +	return (height + vblank) -
> +	       (int)(MIRA220_GLOB_NUM_CLK_CYCLES / mira220->row_length);
> +}

[Severity: Medium]
Could this calculation cause the exposure limit to exceed the 16-bit regist=
er
capacity?=20

With vblank up to 65535, max_exposure can reach roughly 66929. When the val=
ue
is written to the hardware register:

ret =3D cci_write(mira220->regmap, MIRA220_EXP_TIME_REG, exposure, NULL);

it might be silently truncated to 16 bits (e.g., 66929 becomes 1393), resul=
ting
in an incorrectly brief exposure time.

@@ -1155,10 +1155,10 @@ static int mira220_set_ctrl(struct v4l2_ctrl *ctrl)
[ ... ]
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		int exposure_max, exposure_def;
> +
> +		/* Update max exposure while meeting expected vblanking */
> +		exposure_max =3D mira220_calc_exposure(mira220, format->height,
> +						     ctrl->val);
> +		exposure_def =3D min(exposure_max, MIRA220_DEFAULT_EXPOSURE);
> +		ret =3D __v4l2_ctrl_modify_range(mira220->exposure,
> +					       mira220->exposure->minimum,
> +					       exposure_max,
> +					       mira220->exposure->step,
> +					       exposure_def);
> +		if (ret)
> +			return ret;
> +	}

[Severity: Medium]
If the current exposure exceeds the new maximum here, the framework clamps =
it,
but does this code miss updating the hardware exposure register?=20

Since exposure and vblank are not clustered, mira220_set_ctrl() is not
triggered for exposure, and only the vblank hardware register is updated.

This could leave the hardware exposure register out-of-sync with the clamped
value.

@@ -1177,10 +1177,10 @@ static int mira220_set_ctrl(struct v4l2_ctrl *ctrl)
[ ... ]
> +	case V4L2_CID_HFLIP:
> +		ret =3D cci_write(mira220->regmap, MIRA220_HFLIP_REG,
> +				mira220->hflip->val, NULL);
> +		break;
> +	case V4L2_CID_VFLIP:
> +		ret =3D cci_write(mira220->regmap, MIRA220_VFLIP_REG,
> +				mira220->vflip->val, NULL);
> +		break;

[Severity: Medium]
Should the active state format code be updated when the layout-modifying
controls change the underlying format?=20

Modifying these controls alters the Bayer format. Without updating the acti=
ve
state state->pads[0].format.code, subsequent calls to get the format could
return the stale format code without the flip applied.

@@ -1486,8 +1486,8 @@ static int mira220_identify_module(struct mira220 *mi=
ra220)
[ ... ]
> +	mira220_otp_read(mira220, 0x3a, 0, &id, &ret);
> +	if (id < 1 || id > 2) {
> +		dev_err(&client->dev,
> +			"Read OTP 0x3a, id must be 1 or 2, but got: 0x%02x\n", id);
> +		ret =3D -EINVAL;
> +		goto err_power_off;
> +	}

[Severity: Medium]
Does this evaluate the uninitialized id variable before validating the
accumulated ret status?=20

mira220_otp_read() is designed to skip execution if ret is already non-zero.
If any previous OTP read failed, or if reading 0x3a itself fails, id is left
uninitialized.=20

This block could potentially log the uninitialized value before checking the
error code in ret.

@@ -1837,12 +1837,12 @@ static int mira220_init_controls(struct mira220 *mi=
ra220)
[ ... ]
> +	hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
> +				   MIRA220_HBLANK_1600x1400_304,
> +				   MIRA220_HBLANK_1600x1400_304, 1,
> +				   MIRA220_HBLANK_1600x1400_304);

[Severity: Medium]
Will this hardcoded hblank value report an incorrect static value when usin=
g a
1-lane MIPI CSI-2 configuration?=20

It assumes a 2-lane layout where row_length is 304. If the device parses a
1-lane configuration, row_length doubles to 608, which would effectively
double the line time, meaning hblank should be dynamically set to 4480.=20

Because the control remains at 1440, user space might be misled into
calculating a falsely high frame rate.

> +	if (hblank)
> +		hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	/* Max exposure is determined by vblank + vsize and Tglob. */
> +	max_exposure =3D mira220_calc_exposure(mira220,
> +					     MIRA220_PIXEL_ARRAY_HEIGHT,
> +					     mira220->vblank->val);

[Severity: High]
Can mira220->vblank be NULL here?=20

The v4l2_ctrl_new_std() call above could fail and return NULL if memory
allocation fails.=20

Dereferencing mira220->vblank->val immediately without verifying if the
creation succeeded could cause a kernel panic during device probe.

@@ -1936,6 +1936,6 @@ static int mira220_probe(struct i2c_client *client)
[ ... ]
> +	/* Enable runtime PM and turn off the device */
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	ret =3D mira220_identify_module(mira220);

[Severity: Medium]
Is it possible for the device to be concurrently suspended while probe
continues?=20

The device is marked active with a usage count of 0 after pm_runtime_enable=
().
If the PM subsystem or userspace triggers a suspend (e.g. by setting
autosuspend_delay_ms=3D0), the device could be powered down while probe exe=
cutes
mira220_identify_module().

This could lead to I2C timeouts or bus crashes. Taking a pm_runtime referen=
ce
hold could prevent this.

@@ -1985,5 +1985,5 @@ static int mira220_probe(struct i2c_client *client)
[ ... ]
> +error_power_off:
> +	pm_runtime_disable(dev);
> +	mira220_power_off(dev);
> +	pm_runtime_set_suspended(dev);
> +	return ret;
> +}

[Severity: Medium]
Should this error path check the runtime PM state before unconditionally
powering off the device?=20

The PM core might have already suspended the device due to the zero usage c=
ount.

Calling mira220_power_off() unconditionally could redundantly disable clocks
and regulators that are already disabled, potentially causing double-disable
warnings.

@@ -1992,7 +1992,7 @@ static void mira220_remove(struct i2c_client *client)
[ ... ]
> +static void mira220_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct mira220 *mira220 =3D to_mira220(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +
> +	v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);

[Severity: High]
Does this unbind path miss a call to v4l2_subdev_cleanup()?=20

The driver initializes the subdev active state via v4l2_subdev_init_finaliz=
e()
during probe, but fails to clean it up in mira220_remove().=20

This could permanently leak the memory allocated for the active state and p=
ads
every time the driver is unbound.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-mira220-v5=
-0-533b0ad1065e@ideasonboard.com?part=3D2
