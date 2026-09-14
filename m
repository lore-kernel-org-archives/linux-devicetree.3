Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0400044238E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385077; cv=none; b=HswOGpI+gnj1QE5xgyyNZvGEAZRzNoxe9KKJ/V247GkXCmxinAtQEo+2j4FqSKUmLwZJ5U+7MUPx+CPuOkuQvlMuHQsjI16kCO2EYQQf0/QTuPiIbiAx1Rp6BRnzHkK2sn9T6OZQMD0jtmgkuojNPkmDu6KH9luwXTBsTqo9MkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385077; c=relaxed/simple;
	bh=+rbok683pCVl1YyX4Cv/1MgBmxMn9kXIkyJQvlzP7es=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Og1jG4zD+zaKB7nkJDhsTfMOe/kbSFlXAJw+HzFLn5P+c0lzZiwJIVqeFNeBWll5ZFy+skrL+TMO2OM1YyguRgeNPLkV/QxHJFnQ/5ALzp8n9TzqHxT/iQ6ACwcaUiI7kNOTKXAVOA8liIt9iAuYZdTF1u5fhSg1XJyc+wYQ2eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwjpQcer; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwjpQcer"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A37C1F000FF;
	Mon, 14 Sep 2026 11:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789385075;
	bh=X0NaEhbnJ2qLCSJt0IjXUu1+mtyt1s3dv7Sg8R+UTaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IwjpQcerm7+iNEFn106NGsmS5mIyUCg9uvivlYfLz9/YXxn2XXJmyjYAZ955CSDLC
	 9P7lB53QWqJ6ff1bost0BBHNOWEjtb1BAtYcEqD8wwZKw2euQkNA1iNW5w2KrEt82j
	 QVYEU/EypVwlOVbdyUvyWGLNVHpMQjvIlP/pd0YAZBh3scg3027SkQ8AaL2YYIpRsF
	 nNP0d5WG1wfZCnlGTxzsQKZxNB+vsjwCtx74Lhyc0HDkTLhpsfu0Wtlhqtc5soTVqP
	 wlH9YtnnRCIkdIeq1AMHSB3cJwdxIyh6enIK1tdcHMOaxjy+r71tnbYVTMRQuFpg3e
	 sepFIMsffN7cA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] media: i2c: Add Samsung S5KJN5 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260914-sk5jn5-v4-2-386e84cfb2b3@oss.qualcomm.com>
References: <20260914-sk5jn5-v4-0-386e84cfb2b3@oss.qualcomm.com>
 <20260914-sk5jn5-v4-2-386e84cfb2b3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 11:24:34 +0000
Message-Id: <20260914112435.6A37C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect ordering of clock and reset signals during power-on and =
power-off sequences.
- [Medium] Missing `pm_runtime_mark_last_busy()` before dropping the runtim=
e PM reference defeats the autosuspend delay.
--

commit ba7e808a699f95cdf2ed0596c95aeb83fbeac746
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

media: i2c: Add Samsung S5KJN5 image sensor driver

This commit adds a V4L2 sub-device driver for the Samsung S5KJN5, a
50 MP 10-bit RAW MIPI CSI-2 image sensor. The driver supports the
4096x3072 mode and exposes standard v4l2 controls.

> diff --git a/drivers/media/i2c/s5kjn5.c b/drivers/media/i2c/s5kjn5.c
> new file mode 100644
> index 0000000000000..edf824228bb6f
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

[Severity: High]
Does this power-on sequence introduce a regression with hardware sequencing?
The reset line is de-asserted before the sensor clock is running. Transitio=
ning
the reset signal without an active external clock violates the synchronous
reset requirements of the sensor's digital logic, which might leave the
internal state machine in an undefined or latch-up state.

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

[Severity: High]
Can this sequence cause a hardware latch-up? The clock is killed before the
sensor is put back into hardware reset, which reverses the typical power-off
ordering and violates hardware sequencing rules.

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
[ ... ]
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		ret =3D cci_write(s5kjn5->regmap, S5KJN5_REG_EXPOSURE,
> +				ctrl->val, NULL);
> +		break;
> +
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret =3D cci_write(s5kjn5->regmap, S5KJN5_REG_AGAIN,
> +				ctrl->val, NULL);
> +		break;
[ ... ]
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put_autosuspend(dev);

[Severity: Medium]
Is a call to pm_runtime_mark_last_busy() missing before dropping the runtime
PM reference here?

Without marking the device as busy, the PM core evaluates the delay against=
 a
stale last_busy timestamp (which was set when the device originally resumed=
).
This calculates that the delay has already expired and suspends the device
instantly, defeating the autosuspend optimization.

> +
> +	return ret;
> +}
[ ... ]
> +static int s5kjn5_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  u32 pad, u64 streams_mask)
> +{
> +	struct s5kjn5 *s5kjn5 =3D sd_to_s5kjn5(sd);
> +	struct device *dev =3D sd->dev;
> +	u64 val;
> +	int ret;
> +	int i;
> +
> +	ret =3D cci_write(s5kjn5->regmap, S5KJN5_REG_STREAMING,
> +			S5KJN5_STREAMING_OFF, NULL);
> +	if (ret)
> +		dev_warn(dev, "failed to stop streaming: %d\n", ret);
> +
> +	/* Poll frame count register until it reads standby */
> +	for (i =3D 0; i < S5KJN5_STANDBY_POLL_ITERS; i++) {
> +		usleep_range(5000, 6000);
> +		ret =3D cci_read(s5kjn5->regmap, S5KJN5_REG_FRAME_COUNT,
> +			       &val, NULL);
> +		if (!ret && val =3D=3D S5KJN5_FRAME_COUNT_STANDBY)
> +			break;
> +	}
> +	if (i =3D=3D S5KJN5_STANDBY_POLL_ITERS)
> +		dev_warn(dev, "timed out waiting for standby\n");
> +
> +	pm_runtime_put_autosuspend(dev);

[Severity: Medium]
Similarly, does this stream disable path need to mark the device as busy?

Because pm_runtime_mark_last_busy() is omitted before
pm_runtime_put_autosuspend(), the sensor powers down immediately when strea=
ming
stops instead of remaining active for the configured 1000ms autosuspend win=
dow.
This can cause unnecessary power cycling latency if the stream is restarted
shortly after.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-sk5jn5-v4-=
0-386e84cfb2b3@oss.qualcomm.com?part=3D2
