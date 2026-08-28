Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14EF3C1D7C
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 07:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900695; cv=none; b=qKMJIeIDEl+tEMal+2No88uN+MRSl8LjNskU6wqG7cqDFiCiAS7fzKrkv1xgk1CwYLAbC3r2VC/lN4ahSsP8QGSmELq8duhPxDJU4uBYyLEDM7WAiyfDYDFwAECusYxoALiTWXMw415Y3uUUhI9jOn2KcSdCm+UdiisQTRt1fXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900695; c=relaxed/simple;
	bh=RZFhoEiJUhAlqrrN8RSC2m1Oq05j6ESnKEAQlSh1d8Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bncyxi4SRsCZSeK0J/Dy74GLBn9WC7TZ+s43sFyTYQJtcZeDU7u/c7fN9ZGrWkJoi9H1TuR+hlSuOfPIwYBD7A5iLw6qVrUsxzJpf3FdKz7qOPtO/IchQ9J0QjvO3zv01wpFqaYgYF41ZqNFbdchDgvmVRuYhscZR28KHF18ZBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKx2JDDP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKx2JDDP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFE41F000E9;
	Fri, 28 Aug 2026 07:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787900693;
	bh=cwdmLZiEaNljGPTidMj9PX63tFwsXV5dCNs1QuBbUzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KKx2JDDPsVPCUqUdXkN+T21rk0v3PBPbwsDSkypBzH3gjY33OBIHLrY4MKgXbWH2X
	 VlqEclAobOz4Po2dS60gw5bU3rJVendFusU9ZJSAuNCyLkV7/dSNwGRdqKYOG2emFE
	 Nnn0XDpTmkHcv56cGGEOpw2nqDvMEYwPUGIcc7mQT4AouBLZhqN2WInTJLX2t6Ah4s
	 RoQbbt2yUmMgoWtHPBFpICLzD5Mb4enPXGx7LPmwl2pGRGLQIuSUCUvByfPMOkiFO7
	 RvYIjkx2B7g7PHXOqX+rmd1ay/HwUi3mavAI+64WvrOVgV6b4Lvkx3YhJo2gkzH7Sh
	 WElalLwyq7Rzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: Add Sony IMX908 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lachlan Michael" <lachlan.michael@sony.com>
Cc: conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260828064843.65047-3-lachlan.michael@sony.com>
References: <20260828064843.65047-1-lachlan.michael@sony.com>
 <20260828064843.65047-3-lachlan.michael@sony.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 07:04:52 +0000
Message-Id: <20260828070453.2CFE41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Incorrect error handling of `pm_runtime_get_if_active()` return va=
lue allows unpowered hardware access and causes reference count underflow.
- [High] Unsigned integer underflow in VBLANK and HBLANK recalculations cau=
ses incorrect clamping and sudden frame rate drops.
- [High] Unbalanced `pm_runtime_disable()` due to explicitly calling it alo=
ngside `devm_pm_runtime_enable()`.
- [Medium] `__v4l2_ctrl_modify_range()` is incorrectly passed the current d=
ynamic control value as the new default value.
- [Medium] The error path in `imx908_probe` leaves the Runtime PM status as=
 `RPM_ACTIVE` while physically powering off the device.
--

commit 213f0fc18bc025f4c6b33dde193e86993ba40da6
Author: Lachlan Michael <lachlan.michael@sony.com>

media: i2c: Add Sony IMX908 image sensor driver

Adds a V4L2 sub-device driver for the Sony IMX908 CMOS image sensor,
supporting RAW10 and RAW12 output formats via a MIPI CSI-2 interface. Inclu=
des
controls for exposure, gain, flipping, blanking, cropping, and test pattern=
s.

> diff --git a/drivers/media/i2c/imx908.c b/drivers/media/i2c/imx908.c
> new file mode 100644
> index 0000000000000..ca85a5cd058ab
> --- /dev/null
> +++ b/drivers/media/i2c/imx908.c
[ ... ]
> +static u32 imx908_hmax_to_hblank(u16 hmax, u32 width)
> +{
> +	return hmax * IMX908_PIX_PER_CLK - width;
> +}

[Severity: High]
Does this expression silently underflow when called with a new width that
exceeds the old horizontal period? If so, an unsigned underflow would cause
the limits to be drastically miscalculated, effectively maximizing horizont=
al
blanking and functionally breaking the video stream.

[ ... ]
> +static int imx908_update_hblank_limits(struct imx908 *imx, u32 old_width,
> +				       u32 width, u8 bpp)
> +{
[ ... ]
> +	ret =3D __v4l2_ctrl_modify_range(imx->ctrls.hblank, min_hblank,
> +				       max_hblank, IMX908_PIX_PER_CLK, hblank);

[Severity: Medium]
Is it intentional to pass hblank (the current computed blanking) as the
default value here? This overwrites the default value of the V4L2 control
with the user's currently selected dynamic value, meaning a reset to default
will track this dynamic value rather than the true factory baseline.

[ ... ]
> +static int imx908_update_vblank_limits(struct imx908 *imx,
> +				       const struct v4l2_rect *crop,
> +				       u32 old_height)
> +{
> +	u32 min_vblank =3D imx908_calc_min_vblank(crop);
> +	u32 max_vblank =3D IMX908_VMAX_MAX - crop->height;
> +	/* Preserve frame length across height changes when possible. */
> +	u32 vmax =3D old_height + imx->ctrls.vblank->val;
> +	u32 vblank =3D clamp_t(u32, vmax - crop->height,
> +			     min_vblank, max_vblank);

[Severity: High]
Could this expression silently underflow when crop height increases past the
previous frame's vmax via the VIDIOC_SUBDEV_S_SELECTION ioctl? Because vmax
and crop->height are unsigned, if crop->height is larger, the subtraction
will wrap around to a very large positive number, causing clamp_t to cap it
at max_vblank.

> +	int ret;
> +
> +	ret =3D __v4l2_ctrl_modify_range(imx->ctrls.vblank, min_vblank,
> +				       max_vblank, 1, vblank);

[Severity: Medium]
Similar to the hblank limit update, does passing vblank here mistakenly
overwrite the true factory default with the dynamically calculated vblank?

[ ... ]
> +static int imx908_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +		ret =3D __v4l2_ctrl_modify_range(imx->ctrls.exposure,
> +					       IMX908_EXPOSURE_MIN,
> +					       max_exposure,
> +					       IMX908_EXPOSURE_STEP,
> +					       current_exposure);

[Severity: Medium]
Is current_exposure erroneously used as the new default value for the expos=
ure
control here?

[ ... ]
> +	/* Hardware writes only when powered; cached ctrls applied on resume */
> +	if (!pm_runtime_get_if_active(imx->dev))
> +		return 0;

[Severity: High]
Does this logic fail to catch negative error codes? If CONFIG_PM is enabled
but runtime PM is disabled for the device, pm_runtime_get_if_active returns
-EINVAL. The check !-22 evaluates to false, so execution would fall through,
allowing unauthorized I2C register writes on a disabled device.

[ ... ]
> +	default:
> +		dev_warn(imx->dev,
> +			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
> +			 ctrl->id, ctrl->val);
> +		break;
> +	}
> +
> +	pm_runtime_put(imx->dev);
> +
> +	return ret;
> +}

[Severity: High]
Following up on the pm_runtime_get_if_active check above, if -EINVAL was
returned and the function proceeds, won't this pm_runtime_put decrement the
usage count without a prior successful increment, triggering an underflow?

[ ... ]
> +static int imx908_probe(struct i2c_client *client)
> +{
[ ... ]
> +err_power_off:
> +	imx908_power_off(imx->dev);
> +
> +	return ret;
> +}

[Severity: Medium]
Can the PM core be left with a state mismatch in this error path? The
hardware is powered down via imx908_power_off, but the PM runtime state is
left as RPM_ACTIVE because pm_runtime_set_suspended is not called to undo
the earlier pm_runtime_set_active.

[ ... ]
> +static void imx908_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct imx908 *imx =3D to_imx908(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +
> +	pm_runtime_disable(imx->dev);

[Severity: High]
Since devm_pm_runtime_enable is used in imx908_probe, does this explicit ca=
ll
to pm_runtime_disable conflict with the devm cleanup? This could result in a
double disable on driver removal, leaking the reference and permanently
breaking runtime PM for the device upon subsequent re-binding.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828064843.6504=
7-1-lachlan.michael@sony.com?part=3D2
