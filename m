Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6244C248F72
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917048; cv=none; b=bxGNewkoTMBgNZtrGIHxfINKjRqN+GH9/nbLzOZHtMFNKYkn6X5151AMnAShstDy3WCC/dKMGNJ1yP4YQWDvh+adBKQaky5Ntpa+8gTnYqmTNylDuZXEAaX4DL36QTnga+qD5COvgvurnC2mm6MS6lFvExnj0wvLrMuyWlEBkLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917048; c=relaxed/simple;
	bh=v1Rj9zkL4l8AJ04uPodgg0GhoMqFeC7ZruuJrVKxgpc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K8YkgqRTwS+eOfaErsDT0CxfXTlvesKlulTKtEe8qWHlE0yLeEjFhxS0K9SHdmCUqPHxwICFE0psGpchFrjusQ27nCQKvebVIRnk42TiMocXoj24bGch3sBINLIK803qRFS7leVeX8Mf3bPnzgcRxlPwqhrwtzBzVcFd9u1lroQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1WOehx5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1WOehx5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3EBD1F000FF;
	Sun, 20 Sep 2026 15:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789917047;
	bh=CPpo4SpmBZ8d6LIbN7zyXt3CFgHNtyFGzBRcVsBzBYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e1WOehx5J/zns2e4Rethg0jz0AbSgUwO7DjmVKwY8MGHF/pFXTdyHsVG9YtdHVndt
	 ur0tX15U6cZpmvHfHLkrhqFy79hFLrVK/XO4lnI8RgK5aEM+kyvp8ar0FLZFbc+/0f
	 4hghI4oftAa9UpBcvawKEBf6TanOSHMwsiuNpGsAu3Iu8hmz/TdtK/s5PlNKZkUv4Y
	 /3nYt7HA5L3/D1ixAjHwe+ZiO4DkB1gBNll5ykbPdkNosGBZ5RvLcZWdyjheCrYWpY
	 nAu09aswXoEKeiVfuuCdOcbQnV+dGnfFTPz2EdPTRgwreqaUsEWJV/KfgJehW8bzHq
	 BSN9AEjf3Mi9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: i2c: Add Samsung S5K3T2 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armandas Kvietkus" <armandas.kvietkus@proton.me>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260920-upstream-s5k3t2-v1-2-d640740f4013@proton.me>
References: <20260920-upstream-s5k3t2-v1-0-d640740f4013@proton.me>
 <20260920-upstream-s5k3t2-v1-2-d640740f4013@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 15:10:46 +0000
Message-Id: <20260920151046.B3EBD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] media: s5k3t2: stale mode pointer used in synchronous control upda=
tes
- [High] pm: pm_runtime_get_if_active() error bypassed causing usage count =
unbalance
- [Medium] media: v4l2: format not updated when layout-modifying controls c=
hange
- [Low] pm: unconditionally assigned dev_pm_ops causes dead code
--

commit 4a653d96a1e95b8288d1057ab3b4c96de4ec5282
Author: Armandas Kvietkus <armandas.kvietkus@proton.me>
Subject: media: i2c: Add Samsung S5K3T2 image sensor driver

Add a driver for the Samsung S5K3T2 20 Mpixel CMOS image sensor. This
driver supports three RAW10 modes over four D-PHY lanes. The pixel clock
remains constant, while runtime PM manages power through autosuspend.

> diff --git a/drivers/media/i2c/s5k3t2.c b/drivers/media/i2c/s5k3t2.c
> new file mode 100644
> index 0000000000000..4ca44d86d2638
> --- /dev/null
> +++ b/drivers/media/i2c/s5k3t2.c

[ ... ]

> +static int s5k3t2_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct s5k3t2 *s5k3t2 =3D container_of(ctrl->handler, struct s5k3t2,
> +					     ctrl_handler);
> +	const struct s5k3t2_mode *mode =3D s5k3t2->mode;
> +	s64 exposure_max;
> +	int ret;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +	case V4L2_CID_LINK_FREQ:
> +	case V4L2_CID_PIXEL_RATE:
> +	case V4L2_CID_HBLANK:
> +		return 0;

[Severity: Medium]
Can a user query a stale bus format code after layout-modifying controls
(like flips) are changed?

The driver correctly sets V4L2_CTRL_FLAG_MODIFY_LAYOUT in
s5k3t2_init_controls(), but this function returns 0 without updating the
active subdevice state using v4l2_subdev_get_locked_active_state().

> +	case V4L2_CID_VBLANK:
> +		exposure_max =3D mode->height + ctrl->val - S5K3T2_EXPOSURE_MARGIN;
> +		__v4l2_ctrl_modify_range(s5k3t2->exposure,
> +					 s5k3t2->exposure->minimum,
> +					 exposure_max,
> +					 s5k3t2->exposure->step,
> +					 s5k3t2->exposure->default_value);
> +		break;
> +	}
> +
> +	if (!pm_runtime_get_if_active(s5k3t2->dev))
> +		return 0;

[Severity: High]
Does this bypass negative error returns from pm_runtime_get_if_active()?

If pm_runtime_get_if_active() returns a negative error (for example, -EINVAL
when Runtime PM is disabled), this negation evaluates to false.

This allows execution to proceed with I2C hardware accesses and eventually
reaches an unbalanced pm_runtime_put(). Callers must check if the return
value is <=3D 0.

[ ... ]

> +static int s5k3t2_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state,
> +				 struct v4l2_subdev_format *fmt)
> +{

[ ... ]

> +	exposure_max =3D mode->vts - S5K3T2_EXPOSURE_MARGIN;
> +	__v4l2_ctrl_modify_range(s5k3t2->exposure, S5K3T2_EXPOSURE_MIN,
> +				 exposure_max, S5K3T2_EXPOSURE_STEP,
> +				 mode->exposure);
> +	__v4l2_ctrl_s_ctrl(s5k3t2->exposure, mode->exposure);
> +
> +	if (s5k3t2->sd.ctrl_handler->error)
> +		return s5k3t2->sd.ctrl_handler->error;
> +
> +	s5k3t2->mode =3D mode;

[Severity: High]
Does this sequence trigger synchronous control updates via
__v4l2_ctrl_s_ctrl() before the s5k3t2->mode pointer is updated?

When VIDIOC_SUBDEV_S_FMT changes the resolution, the control updates are
dispatched while s5k3t2->mode still points to the old active mode.

In s5k3t2_set_ctrl(), this causes the handler to read the old mode->height
and apply it with the new vblank to the hardware VTS register:

	case V4L2_CID_VBLANK:
		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_VTS,
				ctrl->val + mode->height, NULL);
		break;

This misconfigures the frame's vertical total size.

[ ... ]

> +static struct i2c_driver s5k3t2_i2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "s5k3t2",
> +		.pm =3D &s5k3t2_pm_ops,

[Severity: Low]
Is this unconditionally assigned dev_pm_ops structure preventing dead code
elimination when CONFIG_PM is disabled?

The PM subsystem guide mandates that dev_pm_ops assignments use pm_ptr()
to ensure unused functions are discarded.

> +		.of_match_table =3D s5k3t2_of_match,
> +	},
> +	.probe =3D s5k3t2_probe,
> +	.remove =3D s5k3t2_remove,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-upstream-s=
5k3t2-v1-0-d640740f4013@proton.me?part=3D2
