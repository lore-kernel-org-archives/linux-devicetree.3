Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CA01C84DC
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887699; cv=none; b=LuulgK5ep1KDTvp+S1dss5whb18eUjJ4zqjSZBOLo/wDvJkJZWnbSSrc/DV8AWRQ3L9CAclSZp2msVRYvfkIwrWvAOB2dwEFO4GElgL3Rr8LUdHD1gW4jUqt/A6AjsQokHphFIXcp25qh6yTfGFMCMfju8AOUupV2vJQbTU7wnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887699; c=relaxed/simple;
	bh=K3deSjeQMmx7UU5/jNAwgC4jaHRTmH+R4yfxVkOp83I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JfpLIKHbZqqAp2HTcU78Sf8IBV8vjtulWPf3ChL3FixvGG/U0Bx4wDSGWW6WB808eWJZ47Rfo5yLdlZuY6zYmaHYPxlAXF+Wm5r/gWBEhjYUTqjqPG86UJ8yDfBvRpUYBPxoEUgVTd222whK/seti3OcRgh0dEORC25/x6f7rRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dh936rMt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dh936rMt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29B31F000E9;
	Fri, 24 Jul 2026 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784887698;
	bh=13/TUJQu/mTEywO741VUcp6+OOeDVFYM3SI4KVeubx0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dh936rMt035+UjtO6p6xdSOME0KUz3CHdFTo9ssuh1iGkLMJ1khXorf0XQ4e51pOq
	 XdW7i+uxuZc1N638EP31t47cypgFFTQod5YE1AyYZZdcAOX1AQUS1CzpTG4/FgIoW0
	 fBp7RgvohQQByjX4tNE2D+u9HrhXjNVS7Wt/AoX+fWhDafX4Fc4+XhPK6ttaMFTTs3
	 45pis0YF4DQLUKIsGIwrQD0MZpSrWIqRuyc28OmZ/y2+ORovCfyQp0DZk8jr26b6Ph
	 IBNYkyLFSIXq/0aCb+6B7Zkf5mbgrBCHBKhnuYwr0UARvZGKVO3FaTiv4wJaUCkbvr
	 i3LNDL7aAjvfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: Add Samsung S5KJN5 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724-sk5jn5-v2-2-871d3b9a2e47@oss.qualcomm.com>
References: <20260724-sk5jn5-v2-0-871d3b9a2e47@oss.qualcomm.com>
 <20260724-sk5jn5-v2-2-871d3b9a2e47@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:08:17 +0000
Message-Id: <20260724100817.A29B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The exposure hardware register is not updated when the maximum exp=
osure limit changes due to a VBLANK modification, leaving the hardware out =
of sync.
- [Medium] V4L2 controls are silently ignored when CONFIG_PM is disabled, l=
eaving the sensor unconfigured.
--

--- Patch [2]: [PATCH v2 2/2] media: i2c: Add Samsung S5KJN5 image sensor d=
river ---
commit 583bdec13ff5578760991a928a272b7f11a48522
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

media: i2c: Add Samsung S5KJN5 image sensor driver
   =20
This commit adds a V4L2 sub-device driver for the Samsung S5KJN5 50 MP
GBRG 10-bit RAW MIPI CSI-2 image sensor. It supports 4096x3072 mode and
exposes standard controls such as exposure, gain, and vblank/hblank.

> diff --git a/drivers/media/i2c/s5kjn5.c b/drivers/media/i2c/s5kjn5.c
> new file mode 100644
> index 0000000000000..865db808aabcf
> --- /dev/null
> +++ b/drivers/media/i2c/s5kjn5.c
[ ... ]
> +static int s5kjn5_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct s5kjn5 *s5kjn5 =3D
> +		container_of(ctrl->handler, struct s5kjn5, ctrl_handler);
> +	const struct s5kjn5_mode *mode =3D &s5kjn5_modes[0];
> +	struct device *dev =3D s5kjn5->sd.dev;
> +	u32 exposure_max;
> +	int ret =3D 0;
> +
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		/* Update max exposure while meeting expected vblanking */
> +		exposure_max =3D mode->height + ctrl->val - mode->exposure_margin;
> +		__v4l2_ctrl_modify_range(s5kjn5->exposure,
> +					 s5kjn5->exposure->minimum,
> +					 exposure_max,
> +					 s5kjn5->exposure->step,
> +					 s5kjn5->exposure->default_value);
> +	}

[Severity: High]
If a user decreases VBLANK causing the V4L2 framework to clamp
s5kjn5->exposure->val to the new exposure_max, will this leave the hardware
exposure register out of sync?

Since the vblank and exposure controls are not clustered, s_ctrl is only
invoked for VBLANK. It updates the VTS register but does not sync the newly
clamped exposure value to the hardware, potentially leaving it with an inva=
lid
value that exceeds the new frame length.

> +
> +	if (pm_runtime_get_if_active(dev) <=3D 0)
> +		return 0;

[Severity: Medium]
When the kernel is built without CONFIG_PM, pm_runtime_get_if_active() is
stubbed to return -EINVAL.

Will this cause the check to evaluate to true and silently drop all hardware
writes in s_ctrl, leaving the camera unconfigurable?

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		ret =3D cci_write(s5kjn5->regmap, S5KJN5_REG_EXPOSURE,
> +				ctrl->val, NULL);
> +		break;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-sk5jn5-v2-=
0-871d3b9a2e47@oss.qualcomm.com?part=3D2
