Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C634B533595
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868992; cv=none; b=oTHZWNf6/7AXFYu3hrVnGku7Ax+AlzmAQyYXCFeKkZtja0cstlI8uUVS0qGZlkQycMv3criZwWgO/OsTHmH330fuRCIwHr0ERB63KZ4l0jZ92eg8qxEkMqRu7iFljR0+MZii/DGJav+Yf6DYd57JxakvRTd+hSblMlPIKJj3o7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868992; c=relaxed/simple;
	bh=FIe2OvoryOHdkw1zF3XWIgUhFcSfu1ABEHKofcWfdpg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rWp92YFf8Yu45LBsrvXqIwfrwabXgoS2wh7hOBkvMxXiC1YD50f6r+izBiWHn75XAmIDOlQYHUtCtUkp4kKyzDvqx6j588UGddNk4xLqLig33SZQZ7M5n3veM3wlD8VlOtEOMuBaFRTGU6AIFO35Si2Ls/VgzPoPQ9+6XuiI9bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5E11F00A3A;
	Tue,  8 Sep 2026 12:03:07 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [RESEND PATCH v5 2/2] media: i2c: add os02g10 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elgin Perumbilly" <elgin.perumbilly@siliconsignals.io>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260908114235.86568-3-elgin.perumbilly@siliconsignals.io>
References: <20260908114235.86568-1-elgin.perumbilly@siliconsignals.io>
 <20260908114235.86568-3-elgin.perumbilly@siliconsignals.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 12:03:06 +0000
Message-Id: <20260908120307.2C5E11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Setting digital gain to its advertised maximum of 2048 causes a wr=
ap-around to 0, resulting in a black image.
- [Medium] Incorrect error checking for pm_runtime_get_if_active() in os02g=
10_set_ctrl() leads to unbalanced pm_runtime_put() and hardware access whil=
e powered off.
- [Low] Missing HBLANK control implementation despite claims in the commit =
message.
--

commit 1c1498e9a9139b064778f0a3a923b9cecbc3aa62
Author: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

media: i2c: add os02g10 image sensor driver

This commit adds a new V4L2 subdevice driver for the Omnivision os02g10
CMOS image sensor. It supports 1920x1080 resolution at 30fps and includes
manual exposure, gain, blanking, flip, and test pattern controls.

>     The following features are supported:
>     - Manual exposure an gain control support
>     - vblank/hblank control support

[Severity: Low]
Is the HBLANK control missing from this driver?

The commit message advertises support for it, but V4L2_CID_HBLANK is never
instantiated in os02g10_init_controls().

> diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.c
> new file mode 100644
> index 0000000000000..61de45c54d188
> --- /dev/null
> +++ b/drivers/media/i2c/os02g10.c
[ ... ]
> +static int os02g10_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct os02g10 *os02g10 =3D container_of_const(ctrl->handler,
> +						     struct os02g10, handler);
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *fmt;
> +	int ret =3D 0;
> +
> +	state =3D v4l2_subdev_get_locked_active_state(&os02g10->sd);
> +	fmt =3D v4l2_subdev_state_get_format(state, 0);
> +
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		/* Honour the VBLANK limits when setting exposure */
> +		s64 max =3D fmt->height + ctrl->val - OS02G10_EXPOSURE_MARGIN;
> +
> +		ret =3D __v4l2_ctrl_modify_range(os02g10->exposure,
> +					       os02g10->exposure->minimum, max,
> +					       os02g10->exposure->step,
> +					       os02g10->exposure->default_value);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (pm_runtime_get_if_active(os02g10->dev) =3D=3D 0)
> +		return 0;

[Severity: Medium]
Does this check properly handle negative error codes from
pm_runtime_get_if_active()?=20

If runtime PM is disabled, this function returns a negative error code
(such as -EINVAL), which bypasses this check. This allows execution to
proceed to the hardware accesses and subsequently call pm_runtime_put() at
the end of the function, which will underflow the usage counter since it
was never successfully incremented.

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		cci_write(os02g10->cci, OS02G10_REG_LONG_EXPOSURE,
> +			  ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		cci_write(os02g10->cci, OS02G10_REG_ANALOG_GAIN,
> +			  ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_DIGITAL_GAIN:
> +		cci_write(os02g10->cci, OS02G10_REG_DIGITAL_GAIN_L,
> +			  (ctrl->val & 0xff), &ret);
> +		cci_write(os02g10->cci, OS02G10_REG_DIGITAL_GAIN_H,
> +			  ((ctrl->val >> 8) & 0x7), &ret);

[Severity: High]
Does this bitwise mask handle the maximum digital gain value of 2048
correctly?=20

When the user sets the digital gain to OS02G10_DIGITAL_GAIN_MAX (2048 or
0x0800), shifting right by 8 yields 0x08. Masking this with 0x7 evaluates
to 0. This writes 0x00 to both the low and high registers, unexpectedly
setting the gain to 0 instead of the maximum.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908114235.8656=
8-1-elgin.perumbilly@siliconsignals.io?part=3D2
