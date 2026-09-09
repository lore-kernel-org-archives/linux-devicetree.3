Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502F5548577
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987174; cv=none; b=kujemUcq6nWzRmWLEn17BN7LIiv58vQ4Z3DaqR0JL1b8JmdsAGg4igIoerLrrpQAugHNyzMOMmFbmrlSVg+HmffoGsklwDXFRttYp8mMEpkaSO6nNlI3JqvmUG++rDEgm04lZmzPDyBIdX/14GsL2K4Dd+2qw3o1XExm9XPhprs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987174; c=relaxed/simple;
	bh=mrdnlgQ6Rkt2HU5IlqxpCbwoR8r3ktUYo2WumV4V9TA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h39/+nm2QCmTWprXvv1wRZO0vsvs+nA4gTIwDxaXHYeAUrUuRxXfESxY0p3QllXydAZOif2ugqqbIpn0kdqNsiDChtJO6KJsiTGafFj9bxVlO2I1ztNou3z45eu+wpxyGcqzDTeGRvyAOr2NO+yNtBj3kn7lhV3LdcZhBydhSUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPSxfYgl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPSxfYgl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB941F000FF;
	Wed,  9 Sep 2026 20:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788987165;
	bh=X64/7qmIkNbYXdYQ/7We1leVgfNDJdkX6/jdAmDEP2E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aPSxfYgl+xX04+N8+8LHqSXdlYNCJU1eiDZ6jlKRnB8nQdR7NKAc8XL/g/lJtOllQ
	 o+Ko8ZfqRU4Pzd5gi04VLiTexMIDJk7fxHa4Xmr3vvmP5zhHvOJnvNCZ2f7rkWzWLG
	 OESTYdZ8DFDAeb2a/AbPWAFxUP9fX5Aj7BNnB6JFOzIF9mHy8LDiZ+seX/GiMHk5CY
	 iHJW8w5TEuBX47q+nLa+sThn3+nArqYIyKl2SCgNgcqs1Ytz7u/f/k4+c+8i57vmKe
	 rDU56lqtJHmy/01W+yuE3mkWYwjvVLbYZ4SMJOTvFZzyrqoVaSCz0k2g+FuxzRxuEH
	 MYSHqYTB/fHRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] media: i2c: Add Sony IMX681 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergey Lebedev" <lsa.uz@pm.me>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260909203717.90605-3-lsa.uz@pm.me>
References: <20260909203717.90605-1-lsa.uz@pm.me>
 <20260909203717.90605-3-lsa.uz@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 20:52:43 +0000
Message-Id: <20260909205244.EDB941F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Hardware exposure register becomes out of sync with V4L2 state w=
hen VBLANK is changed.
- [Medium] Independent toggling of group hold register defeats atomic param=
eter updates.
--

commit 7db2a0f5a0754b78ccc388a5ff14535efd86e6ff
Author: Andre Gilerson <andre.gilerson@gmail.com>

media: i2c: Add Sony IMX681 sensor driver

This commit adds a new V4L2 I2C sensor driver for the Sony IMX681 camera,
which is used on the Surface Pro 11 for Business. It implements standard
functionality including register initialization, the streams API, and
runtime PM.

> diff --git a/drivers/media/i2c/imx681.c b/drivers/media/i2c/imx681.c
> new file mode 100644
> index 0000000000000..eba792ca18ef4
> --- /dev/null
> +++ b/drivers/media/i2c/imx681.c
[ ... ]
> +static int imx681_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct imx681 *imx681 =3D container_of(ctrl->handler, struct imx681,
> +					     ctrl_handler);
> +	s64 exposure_max;
> +	int pm_status;
> +	int ret =3D 0;
> +
> +	/* Update exposure max when VBLANK changes (even when not streaming) */
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		exposure_max =3D IMX681_HEIGHT + ctrl->val - IMX681_EXPOSURE_OFFSET;
> +		__v4l2_ctrl_modify_range(imx681->exposure,
> +					 IMX681_EXPOSURE_MIN, exposure_max,
> +					 1, IMX681_EXPOSURE_DEFAULT);
> +	}
> +
> +	/*
> +	 * 1 with a reference taken, 0 if the device is not active, or -EINVAL
> +	 * if runtime PM is unavailable. Only the 0 means there is nothing to
> +	 * do: without runtime PM the sensor is powered from probe and never
> +	 * suspended, so the write still has to go out - but no reference was
> +	 * taken then, and none may be dropped.
> +	 */
> +	pm_status =3D pm_runtime_get_if_active(imx681->dev);
> +	if (!pm_status)
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x01, &ret);
> +		cci_write(imx681->cci, IMX681_REG_FRAME_LENGTH,
> +			  IMX681_HEIGHT + ctrl->val, &ret);
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x00, &ret);

[Severity: Medium]
Does this leave the hardware exposure register out of sync with the V4L2
state?

When VBLANK is modified, the exposure control range is clamped earlier in
this function. However, if the old exposure value is clamped to a new, smal=
ler
maximum, the newly clamped exposure value is never written to the hardware
because VBLANK and EXPOSURE are not clustered. This could leave the sensor's
hardware exposure register with an out-of-bounds value.

> +		dev_dbg(imx681->dev, "set frame_length: %d, ret=3D%d\n",
> +			IMX681_HEIGHT + ctrl->val, ret);
> +		break;
> +
> +	case V4L2_CID_EXPOSURE:
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x01, &ret);
> +		cci_write(imx681->cci, IMX681_REG_EXPOSURE, ctrl->val, &ret);
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x00, &ret);

[Severity: Medium]
Does this independent toggling of the group hold register defeat its purpos=
e?

Group hold is intended to defer register updates until a frame boundary to
ensure multiple settings apply atomically. By toggling it independently for
each V4L2 control, simultaneous user updates to VBLANK, EXPOSURE, and GAIN
will take effect individually and may split across different frames,
potentially causing temporary visual tearing or artifacts.

Would it be better to cluster these controls and use a single group hold bl=
ock
when they are updated together?

> +		dev_dbg(imx681->dev, "set exposure: %d, ret=3D%d\n",
> +			ctrl->val, ret);
> +		break;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909203717.9060=
5-1-lsa.uz@pm.me?part=3D2
