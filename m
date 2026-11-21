Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264288;
	b=xhSp3CjauUqkfh4pyR2iYRPQWhfTpGIkJsw8lSLIXxeRSnR5HhHTjrmtqf4bsA1uUjlt
	 hFiqJg9FDD1/htrDNnVG/M5M/M+hs92QTx8YyXBHmnaHDdHBjgJgH2E2IBOjeiq6bBHLq
	 51cRCD3GbVHY/RoD7g2Bn6E7sA/zuAGUod7KDz0JsKnp9zO2NSrnpqTb6X9gyrvOtGuGZ
	 lNaPim9ll+/nQ5vhJLQkWZG26HJVuorGV8CDrVtqTE+k3HnALi5mhtx+ytIcr9X1aqvp0
	 pWqE17SljYBMOc1grEjJW8ywf4QggnGn1sraNShHgOWF3aogNyLqXjYPMnY+xHtWktg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264288;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ESQYI/3P9BXQs10d4Z2/hJLEH1q0IO43x7wPRKHXBsA=;
	b=VfSeBHdu8zQzRC1SzBKoF4wk4rP+MFhq7w+5XT4JrIKGKrCWcnddr6/q5Su1leDddzms
	 lRGMAqaUnpGtM/gtG7Doq+Prqi017UZ/cl5gxVflKkTkOl40jlEz7l8tJ3/AaDlTJK13p
	 uc6JhhFcLe1ZKM/HXRsYU+CMkgAwgQVC3RkmTWB8XuZWRhdxO0Ef0/8lRsMN1/g/nuQL9
	 Ar0S1bxZhYAnBUISZ9VgZoycdZT4QNULKLePvygR20Wmpd91Qz6I4AY1wsjpxkDbIl5cj
	 pJOhu7u+Y6JyBw10wXXtJmWPV8HhASByvYBHH21ap9XrNlDKw9oCJ8yTL12XCbpiyaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RG8b8EA0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF6F606A32A
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 12:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RG8b8EA0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAABE1F000C0;
	Sat, 21 Nov 2026 12:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264288;
	bh=ESQYI/3P9BXQs10d4Z2/hJLEH1q0IO43x7wPRKHXBsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RG8b8EA0EHQy/Ssu/MskMLBLXsQr0QrEAWptrlfVZOZxtAOwkRdF5v216pGCp9naw
	 llnLAevzaEcnzA48pjpBJxVCNMWV+mgxaRZSKw85bI8K6l+/86njAWwQXv/Y0UF2Qm
	 efn8gnLN0vNo7QMVw91cxqwmIKH/UsVyP6Ncok94mUOwCn++eq7CrDnjbxxTK4gzX1
	 /nNUPEwyCQviMEq5WYl7zATMvuiMpT9cRhGJbxnsqNZiTjljYOEG/jw8+CawMfbjHM
	 ZuTictwcxf9Fp7s9vU/97dxQ7QoD5FTG8ZgZBA85k2GGLt5B0hUgxhpGg1NxTJaBww
	 ihDZrzAuZdqrQ==
Message-ID: <sashiko-outbox-227013@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: Add Samsung S5K5E8YX camera sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tuan Kiet Huynh" <huynhtuankiet33@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261121120731.2028810-3-huynhtuankiet33@gmail.com>
References: <20261121091907.1190346-1-huynhtuankiet33@gmail.com>
 <20261121120731.2028810-1-huynhtuankiet33@gmail.com>
 <20261121120731.2028810-3-huynhtuankiet33@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 12:31:27 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] media: s5k5e8yx: stale mode and unchecked ctrls in
  s5k5e8yx_set_pad_format()
- [Medium] media: s5k5e8yx: missing 0x3307 and 0x3308 writes in 1304x980
  mode table
- [Medium] media: s5k5e8yx: pad format code not updated on flip in
  s5k5e8yx_set_ctrl()
- [Medium] media: s5k5e8yx: missing streaming check in
  s5k5e8yx_set_pad_format()
- [Low] media: s5k5e8yx: unused macro definition S5K5E8YX_AGAIN_SHIFT
--

commit 4982bbedacda1f130bf60b5814bdb3330ccbf970
Author: Andrii Cherniavskyi <chernyav.a@gmail.com>

media: i2c: Add Samsung S5K5E8YX camera sensor driver

This commit adds a V4L2 subdev driver for the Samsung S5K5E8YX 5MP CMOS
image sensor supporting 2592x1944 (30 fps) and 1304x980 (60 fps) RAW10 GRBG
modes.

> diff --git a/drivers/media/i2c/s5k5e8yx.c b/drivers/media/i2c/s5k5e8yx.c
> new file mode 100644
> index 0000000000000..5ad42e2fc7e14
> --- /dev/null
> +++ b/drivers/media/i2c/s5k5e8yx.c
> @@ -0,0 +1,972 @@

[ ... ]

> +#define S5K5E8YX_REG_AGAIN		CCI_REG16(0x0204)
> +#define S5K5E8YX_AGAIN_MIN		0x020
> +#define S5K5E8YX_AGAIN_MAX		0x200
> +#define S5K5E8YX_AGAIN_STEP		1
> +#define S5K5E8YX_AGAIN_DEFAULT		0x020
> +#define S5K5E8YX_AGAIN_SHIFT		5

[Severity: Low]
S5K5E8YX_AGAIN_SHIFT is unused since S5K5E8YX_AGAIN_MIN and
S5K5E8YX_AGAIN_MAX are already pre-shifted and written directly to
S5K5E8YX_REG_AGAIN.

[ ... ]

> +static const struct cci_reg_sequence s5k5e8yx_2592x1944_30fps_mode[] =3D=
 {

[ ... ]

> +	{ CCI_REG8(0x3306), 0x00 },
> +	{ CCI_REG8(0x3307), 0x08 },
> +	{ CCI_REG8(0x3308), 0x0a },
> +	{ CCI_REG8(0x3309), 0x27 },
> +	{ CCI_REG8(0x330a), 0x01 },
> +	{ CCI_REG8(0x330b), 0x01 },
> +	{ CCI_REG8(0x330e), 0x00 },
> +	{ CCI_REG8(0x330f), 0x08 },
> +	{ CCI_REG8(0x3310), 0x07 },
> +	{ CCI_REG8(0x3311), 0x9f },
> +	{ CCI_REG8(0x3312), 0x01 },
> +	{ CCI_REG8(0x3313), 0x01 },
> +};
> +
> +static const struct cci_reg_sequence s5k5e8yx_1304x980_60fps_mode[] =3D {

[ ... ]

> +	{ CCI_REG8(0x3306), 0x00 },
> +	{ CCI_REG8(0x3309), 0x2f },
> +	{ CCI_REG8(0x330a), 0x01 },
> +	{ CCI_REG8(0x330b), 0x01 },
> +	{ CCI_REG8(0x330e), 0x00 },
> +	{ CCI_REG8(0x330f), 0x00 },
> +	{ CCI_REG8(0x3310), 0x07 },
> +	{ CCI_REG8(0x3311), 0xa7 },
> +	{ CCI_REG8(0x3312), 0x03 },
> +	{ CCI_REG8(0x3313), 0x01 },
> +};

[Severity: Medium]
Should s5k5e8yx_1304x980_60fps_mode[] also program registers 0x3307 (0x00)
and 0x3308 (0x0a)?

s5k5e8yx_2592x1944_30fps_mode[] writes 0x08 to 0x3307 and init_array_setting
does not touch 0x3307 or 0x3308.  If streaming is restarted in 1304x980
mode before runtime-PM autosuspend powers down the sensor (or when optional
reset/standby GPIOs are absent), 0x3307 retains 0x08 from the 2592x1944
mode instead of 0x00.

[ ... ]

> +static int s5k5e8yx_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct s5k5e8yx *s5k5e8yx =3D
> +		container_of(ctrl->handler, struct s5k5e8yx, ctrl_handler);
> +	const struct s5k5e8yx_mode *mode =3D s5k5e8yx->mode;
> +	s64 exposure_max;
> +	int ret;
> +
> +	/* Propagate change of current control to all related controls */
> +	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		/* Update max exposure while meeting expected vblanking */
> +		exposure_max =3D
> +			mode->height + ctrl->val - S5K5E8YX_EXPOSURE_MARGIN;
> +		__v4l2_ctrl_modify_range(s5k5e8yx->exposure,
> +					 s5k5e8yx->exposure->minimum,
> +					 exposure_max, s5k5e8yx->exposure->step,
> +					 s5k5e8yx->exposure->default_value);
> +		break;
> +	}

[Severity: Medium]
Does changing V4L2_CID_HFLIP or V4L2_CID_VFLIP leave the active subdev state
pad format code out of sync with the hardware Bayer order?

Flipping immediately changes the Bayer media bus code returned by
s5k5e8yx_get_format_code(), which s5k5e8yx_enum_mbus_code() and
s5k5e8yx_enum_frame_size() use, and both controls carry
V4L2_CTRL_FLAG_MODIFY_LAYOUT.  However, s5k5e8yx_set_ctrl() never updates
v4l2_subdev_state_get_format(state, 0)->code, so v4l2_subdev_get_fmt() and
v4l2_subdev_link_validate() continue to report the old Bayer format code
unless VIDIOC_SUBDEV_S_FMT is called again.

[ ... ]

> +static int s5k5e8yx_set_pad_format(struct v4l2_subdev *sd,
> +				   const struct v4l2_subdev_client_info *ci,
> +				   struct v4l2_subdev_state *state,
> +				   struct v4l2_subdev_format *fmt)
> +{
> +	struct s5k5e8yx *s5k5e8yx =3D to_s5k5e8yx(sd);
> +	s64 hblank, vblank, exposure_max;
> +	const struct s5k5e8yx_mode *mode;
> +
> +	mode =3D v4l2_find_nearest_size(s5k5e8yx_supported_modes,
> +				      ARRAY_SIZE(s5k5e8yx_supported_modes),
> +				      width, height, fmt->format.width,
> +				      fmt->format.height);
> +
> +	s5k5e8yx_update_pad_format(s5k5e8yx, mode, &fmt->format);
> +
> +	/* Format code could be updated with respect to flip controls */
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY || s5k5e8yx->mode =3D=3D m=
ode)
> +		goto set_format;

[Severity: Medium]
Should s5k5e8yx_set_pad_format() reject V4L2_SUBDEV_FORMAT_ACTIVE changes
with -EBUSY when v4l2_subdev_is_streaming(sd) is true?

The V4L2 subdev core does not block VIDIOC_SUBDEV_S_FMT while streaming.
Without that check, changing the active format mid-stream updates
s5k5e8yx->mode, control ranges, and the active pad format, and writes the
new mode's VTS and exposure registers to the running sensor while its PLL,
binning, HTS, and output size registers remain configured for the old mode.

> +
> +	hblank =3D mode->hts - mode->width;
> +	__v4l2_ctrl_modify_range(s5k5e8yx->hblank, hblank, hblank, 1, hblank);
> +
> +	vblank =3D mode->vts - mode->height;
> +	__v4l2_ctrl_modify_range(s5k5e8yx->vblank, vblank,
> +				 S5K5E8YX_VTS_MAX - mode->height, 1, vblank);
> +	__v4l2_ctrl_s_ctrl(s5k5e8yx->vblank, vblank);
> +
> +	exposure_max =3D mode->vts - S5K5E8YX_EXPOSURE_MARGIN;
> +	__v4l2_ctrl_modify_range(s5k5e8yx->exposure, S5K5E8YX_EXPOSURE_MIN,
> +				 exposure_max, S5K5E8YX_EXPOSURE_STEP,
> +				 mode->exposure);
> +	__v4l2_ctrl_s_ctrl(s5k5e8yx->exposure, mode->exposure);
> +
> +	if (s5k5e8yx->sd.ctrl_handler->error)
> +		return s5k5e8yx->sd.ctrl_handler->error;
> +
> +	s5k5e8yx->mode =3D mode;

[Severity: Medium]
Should s5k5e8yx->mode be updated before updating the vblank and exposure
controls?

__v4l2_ctrl_modify_range() and __v4l2_ctrl_s_ctrl() on s5k5e8yx->vblank
synchronously invoke s5k5e8yx_set_ctrl(), which reads s5k5e8yx->mode->heigh=
t.
Because s5k5e8yx->mode still points to the previous mode here,
s5k5e8yx_set_ctrl() computes exposure_max with the old mode height and, if
the device is runtime-PM active (such as during the 1000 ms autosuspend
window after probe or stream stop), writes ctrl->val + old_mode->height to
S5K5E8YX_REG_VTS.

In addition, __v4l2_ctrl_modify_range() and __v4l2_ctrl_s_ctrl() return
their error code directly and do not set ctrl_handler->error, so checking
s5k5e8yx->sd.ctrl_handler->error never catches control or I2C failures here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121120731.2028=
810-1-huynhtuankiet33@gmail.com?part=3D2
