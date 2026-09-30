Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250EC386567
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756619; cv=none; b=PyDOKVz3OvIWwVgXJfA+tSyK+x/DTlN+BVa/vMF/j4WI9IISEx60xZUr422/j+g8uAZXBUSIxW7fbBga1/76VWiyaLfubKSlGIEksTDzuY7n7W0XfvClzesNn0Hzg2TxkNUo4ujAyZq5hL7XHiTbTmab+3ygSO/DGk6tzx+sWko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756619; c=relaxed/simple;
	bh=ZsJ5mEcHdDOEYKd3r+XwfuX9vvg+P36NohW9Fc4oQm0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wv0SYor1Nv9QdTgRPw6z1quO5TYF31y/QNSFUAU26e1g1ZIFDrIgrQQfXDKcSHkfYP0yHBQUbkcg9tOnIEsEpXUCFT5C9vhe6STewImIS+/ivxRRp3G6Q9ZSx6sOt5UbR3xb7Tu2ggA9CBot0QEOktY0wcf6W93STiljkiVIIeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYYDmSKT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYYDmSKT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49931F000FF;
	Wed, 30 Sep 2026 08:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790756617;
	bh=rOwEAD3dyvzJAIA6UAjBOLU2KcpXZImvi+rYWjWaxY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QYYDmSKTgVborqGyCT3WB+wP0VqE5V05yA9V4QIlNJFkZCSj1S8SD4jKagte8CYeV
	 ++Xu3dFfZCNc3i3Si58+SmyLfnR5Uh1m9Mu3pt8QjoamCFqHg8S+/0pEEr6o1YljCs
	 g9IoFEkhovWKSzKag43ZDG0VRhcSFmSAlvSK42j1kz06zQ6jXt81117aBg6mzs4k4W
	 L/Q0NPBv69+7GvPn922tK2++tWLb6vjY3gz/vsR1zs/4AWPUQXKy3qx8OWmh5VvUdq
	 wnOPrssepVXzVyZq/g2iPXZPAOYepbarh8EfQkiMDj98hdBSdeHA3HvyFmwORhC2Aw
	 0iyb2RoRAPaWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] media: i2c: Add Samsung S5KJN5 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260930-sk5jn5-v6-2-517c9b34008a@oss.qualcomm.com>
References: <20260930-sk5jn5-v6-0-517c9b34008a@oss.qualcomm.com>
 <20260930-sk5jn5-v6-2-517c9b34008a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 08:23:37 +0000
Message-Id: <20260930082337.A49931F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pm: Refcount underflow in s5kjn5_s_ctrl() due to mishandled pm_run=
time_get_if_active() error
- [Medium] media: i2c: s5kjn5: Incorrect clock and reset sequencing
--

commit 3459a342207994da314f1844556c8af1fbac48b5
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

media: i2c: Add Samsung S5KJN5 image sensor driver

Add a V4L2 sub-device driver for the Samsung S5KJN5, a 50 MP 10-bit
RAW MIPI CSI-2 image sensor.

> diff --git a/drivers/media/i2c/s5kjn5.c b/drivers/media/i2c/s5kjn5.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/i2c/s5kjn5.c

[ ... ]

> +static int s5kjn5_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct s5kjn5 *s5kjn5 =3D sd_to_s5kjn5(sd);
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(s5kjn5_supply_names),
> +				    s5kjn5->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(s5kjn5->reset_gpio, 0);
> +	usleep_range(8000, 10000);
> +
> +	ret =3D clk_prepare_enable(s5kjn5->inclk);

[Severity: Medium]
Does releasing the reset line before providing a stable clock put the
sensor in an indeterminate state? Many camera sensors require the clock
to be active before de-asserting reset to ensure a correct transition.

> +	if (ret) {
> +		dev_err(dev, "failed to enable clock: %d\n", ret);
> +		gpiod_set_value_cansleep(s5kjn5->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(s5kjn5_supply_names),
> +				       s5kjn5->supplies);
> +		return ret;
> +	}
> +
> +	usleep_range(10000, 12000);
> +
> +	return 0;
> +}
> +
> +static int s5kjn5_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct s5kjn5 *s5kjn5 =3D sd_to_s5kjn5(sd);
> +
> +	clk_disable_unprepare(s5kjn5->inclk);
> +	gpiod_set_value_cansleep(s5kjn5->reset_gpio, 1);

[Severity: Medium]
Could this also leave the hardware in a bad state? The clock is being
disabled here before the sensor is safely put back into reset.

> +	regulator_bulk_disable(ARRAY_SIZE(s5kjn5_supply_names),
> +			       s5kjn5->supplies);
> +
> +	return 0;
> +}

[ ... ]

> +static int s5kjn5_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct s5kjn5 *s5kjn5 =3D
> +		container_of(ctrl->handler, struct s5kjn5, ctrl_handler);
> +	struct device *dev =3D s5kjn5->sd.dev;
> +	const struct s5kjn5_mode *mode =3D &s5kjn5_modes[0];
> +	u32 exposure_max;
> +	int ret;
> +
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		exposure_max =3D mode->height + ctrl->val - mode->exposure_margin;
> +		ret =3D __v4l2_ctrl_modify_range(s5kjn5->exposure,
> +					       s5kjn5->exposure->minimum,
> +					       exposure_max,
> +					       s5kjn5->exposure->step,
> +					       s5kjn5->exposure->default_value);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!pm_runtime_get_if_active(dev))
> +		return 0;

[Severity: High]
Can this lead to a reference count underflow if the device's runtime PM
is disabled?

If pm_runtime_get_if_active() returns a negative error code (like
-EINVAL), the boolean check evaluates to false, allowing execution to
continue down to the hardware access path.

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		ret =3D cci_write(s5kjn5->regmap, S5KJN5_REG_EXPOSURE,
> +				ctrl->val, NULL);
> +		break;

[ ... ]

> +	case V4L2_CID_TEST_PATTERN:
> +		ret =3D cci_write(s5kjn5->regmap, S5KJN5_REG_TEST_PATTERN,
> +				ctrl->val, NULL);
> +		break;
> +
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put_autosuspend(dev);

[Severity: High]
Since the getter didn't actually increment the usage counter on a
negative error return, won't this put operation unconditionally
decrement it and trigger an underflow?

> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-sk5jn5-v6-=
0-517c9b34008a@oss.qualcomm.com?part=3D2
