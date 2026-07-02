Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA4831195B
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977824; cv=none; b=bMGla5myoVGDw+JEC0zKuH5370Uy3LBe/6pBcJEZeTFFssP2TY3NkAjqosBj6UsHsoh28CuSoCW47X+tICURBeec9bpGGlmJ13SakxXy27KSRsyFEsEnVyzJcYq7UP7lAXmiZMURFOfExCnh/HZ/NXjIQasbmjmGXk74zFuuW8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977824; c=relaxed/simple;
	bh=JXKWmqeet5vRozQE3hVaF5fBwRRIOcioFpc8poGVy84=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FmGZQ5sySVQieK8/uuaVHt8WcCHYOmdZrRmleCzZjU1DLmAT4w4XE2ftNJKnj/cSTl+a74W35N/VOvOMEL8VT28MJwq3iE16d84H0c0WztKfDwkEVV0U5XcPffrBS0lz0bp63JJWIltdhy8VXzlOxcYQqlzZOcnTA2uTI67EVdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPoz6wGE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPoz6wGE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1721F000E9;
	Thu,  2 Jul 2026 07:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782977823;
	bh=6Eae3WnVOAxd66erC/WKfuEjL1Eib38TUGSvzd9zv6U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NPoz6wGEUF308qGAc2M04597p1I7xKPhbZ6aH5Y80cZZt2Csvznz1zKLQEQQnT4aQ
	 Whqf2t6FCmndgYKsAxexHocNLZAySNhxB6xsNfXfwWN/vliRfGFdLkmAeNj7b7ns10
	 Ln3dtWTg6MBPrExl+dDe11/wQ2o4QUxVI91e2zJH2om5rQlqOCkQNgF/fpZZp2mey0
	 Hx730J6y/2vK2CILfMwqAjFIZopB5rWcC1HI2jX+n3Q9da/W3zjs+G/JZQrMYl/og2
	 jDW/WxBx+OgOCYoTvHw0pw9L70JDdYvXqcFyhUBB0o3MVi0vwpqOPYvy8tsyS4/pBO
	 oXSiG47zUK5VQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] media: i2c: add os02g10 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elgin Perumbilly" <elgin.perumbilly@siliconsignals.io>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702072502.7907-3-elgin.perumbilly@siliconsignals.io>
References: <20260702072502.7907-1-elgin.perumbilly@siliconsignals.io>
 <20260702072502.7907-3-elgin.perumbilly@siliconsignals.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 07:37:02 +0000
Message-Id: <20260702073702.AF1721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Incorrect check of `pm_runtime_get_if_active()` return value leads=
 to usage count underflow and unpowered hardware access.
- [Medium] Setting the maximum digital gain value (2048) wraps around and w=
rites 0 to the sensor registers.
- [Medium] The driver fails to update the active state format code when the=
 VFLIP or HFLIP controls are modified.
- [Low] Variable declaration immediately following a `case` label causes a =
fatal compilation error.
- [Low] The commit message claims to add hblank control support, but the im=
plementation is completely missing.
- [Low] Data race due to lockless access to V4L2 control values during `TRY=
` format operations.
--

commit 1a00e4a5be365f56d7cb5766573edc7528f13024
Author: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

media: i2c: add os02g10 image sensor driver

Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.

> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support

[Severity: Low]
The commit message mentions hblank support, but the V4L2_CID_HBLANK control
is never initialized in os02g10_init_controls(). Was the implementation
accidentally omitted?

> diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.c
> new file mode 100644
> index 0000000000000..105ca3d6322e6
> --- /dev/null
> +++ b/drivers/media/i2c/os02g10.c

[ ... ]

> +static u32 os02g10_get_format_code(struct os02g10 *os02g10)
> +{
> +	static const u32 codes[2][2] =3D {
> +		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
> +		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
> +	};
> +
> +	return codes[os02g10->vflip->val][os02g10->hflip->val];

[Severity: Low]
Does this access race against concurrent VIDIOC_S_CTRL calls during
V4L2_SUBDEV_FORMAT_TRY operations?=20

The control handler lock isn't guaranteed to be held here when modifying the
try state.

> +}
> +
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

[Severity: High]
Because pm_runtime_get_if_active() returns negative error codes like -EINVA=
L,
will this check allow errors to fall through?=20

If an error falls through, it would result in writing to unpowered hardware
and then decrementing the usage counter without a successful increment when
pm_runtime_put() is called at the end of the function.

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

[Severity: Medium]
Since OS02G10_DIGITAL_GAIN_MAX is 2048, when the maximum value is requested,
(2048 >> 8) evaluates to 8.=20

Applying & 0x7 results in 0. Does this wrap around and inadvertently write
0 to the high byte of the digital gain?

> +		break;
> +	case V4L2_CID_VBLANK:
> +		u64 vts =3D ctrl->val + fmt->height;

[Severity: Low]
Does declaring the variable u64 vts immediately following a case label caus=
e a
compilation error under C11 rules?

> +
> +		cci_update_bits(os02g10->cci, OS02G10_REG_FRAME_TEST_CTRL,
> +				OS02G10_FRAME_EXP_SEPERATE_EN,
> +				OS02G10_FRAME_EXP_SEPERATE_EN, &ret);
> +		cci_write(os02g10->cci, OS02G10_REG_FRAME_LENGTH, vts, &ret);
> +		break;
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +		cci_write(os02g10->cci, OS02G10_REG_FLIP_MIRROR,
> +			  os02g10->hflip->val | os02g10->vflip->val << 1, &ret);
> +		cci_write(os02g10->cci, OS02G10_REG_SIF_CTRL,
> +			  OS02G10_ORIENTATION_BAYER_FIX, &ret);

[Severity: Medium]
While the hardware registers are updated for the new Bayer sequence here, t=
he
driver doesn't seem to update fmt->code in the active state.=20

Will subsequent format queries return a stale Bayer format code to userspac=
e?

> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		cci_update_bits(os02g10->cci,
> +				OS02G10_REG_FRAME_TEST_CTRL,
> +				OS02G10_TEST_PATTERN_ENABLE,
> +				ctrl->val ? OS02G10_TEST_PATTERN_ENABLE : 0,
> +				&ret);
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +	cci_write(os02g10->cci, OS02G10_REG_FRAME_SYNC, 0x01, &ret);
> +
> +	pm_runtime_put(os02g10->dev);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702072502.7907=
-1-elgin.perumbilly@siliconsignals.io?part=3D2
