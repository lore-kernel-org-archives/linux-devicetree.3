Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD85328B62
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 04:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785989088; cv=none; b=XDPlM6Lt6my7P+99b+AB5vny4HeYzi7Kg8kChpMyP9QKKEJmbp6X0BR/FHNCffXem1WlzrWxJ3mkhJdd9i4r/9qY0has1CMtG4GyLi7sxMicPO+Sa7dDDBV3Kjli9XideXL2SMHQY46eyjZzsmk1NbGhqiNHXoVKyuSJuvPZ/uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785989088; c=relaxed/simple;
	bh=M3zIUBBdhV426JPgs6pznb9qGE6N3SI0aNTsAePyCOE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HTsvaD4S5uPZhrF2gWWEH2gW1p2mlBTWoGBN4pVeXISK3Mtzwe8i+Fi599jjpyXOAUHOXPHga6V8wzOjmSP+UVIFGVOMyrypPdu1OrzZM17abBkpUk7uwv0MH/j0OmKdbBFw4gIjtbzNXa8/HmPJGB8SRh4+9cYFlj68hp6Qkxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cop9EhNO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cop9EhNO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2D11F000E9;
	Thu,  6 Aug 2026 04:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785989086;
	bh=ORfnbj7Y9/e7i0BzYxzCrmdDvPreoyx8YF5mlZPk27Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cop9EhNOpp1+HzSPbygFIXYCCn//g31d7sHld+iTAzRueOVxyjyzp1cz3B6e1CI/u
	 cMvIxOA33WNKR4/MzqSJS/UCk6MZ7gl4U9OyCeO8jg130T/CfM4SVZ0nGkz63WRRmc
	 45IhD0qvWJAwW9JbZFUSffICYiBMJR7IY2I+Tue4dyEweh81atwrOfLp7vptXoAaKS
	 yoS4Yps35MDJnz4ZOr2yAeVxCIOhUuIT0rMTL2v4wCBFilfHnWFyrogHF211AnfmCl
	 Jv6ZIBfhJCM4y0L6oihmRzIVTS8yE0L1SBDGTjQAzpflrPSwgu5KcIZ0fAFCmRnbw2
	 5vEAwCnk1urtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: Add Samsung S5KJN5 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-sk5jn5-v3-2-0b3ac1eadf8a@oss.qualcomm.com>
References: <20260806-sk5jn5-v3-0-0b3ac1eadf8a@oss.qualcomm.com>
 <20260806-sk5jn5-v3-2-0b3ac1eadf8a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 04:04:45 +0000
Message-Id: <20260806040446.3E2D11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] NULL pointer dereference in `s5kjn5_set_fmt` when `state` is NULL.
- [High] Incorrect hardware power sequencing between the reset GPIO and the=
 input clock.
--

--- Patch [2]: [PATCH v3 2/2] media: i2c: Add Samsung S5KJN5 image sensor d=
river ---
commit 0c20120b2e36399c4fc0b31ce99ece2819948b3a
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

media: i2c: Add Samsung S5KJN5 image sensor driver

This commit adds a V4L2 sub-device driver for the Samsung S5KJN5, a 50 MP
10-bit RAW MIPI CSI-2 image sensor. It supports the 4096x3072 mode and
exposes standard V4L2 controls.

> diff --git a/drivers/media/i2c/s5kjn5.c b/drivers/media/i2c/s5kjn5.c
> new file mode 100644
> index 0000000000000..02ba83af9965e
> --- /dev/null
> +++ b/drivers/media/i2c/s5kjn5.c
[ ... ]
> +static int s5kjn5_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct s5kjn5 *s5kjn5 =3D sd_to_s5kjn5(sd);
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(S5KJN5_NUM_SUPPLIES, s5kjn5->supplies);
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
Will this hardware sequence fail on some devices? Standard hardware
sequencing for MIPI CSI-2 image sensors usually requires the external clock
to be running before the chip is brought out of reset, allowing its internal
logic and state machines to safely initialize.

[ ... ]
> +static int s5kjn5_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct s5kjn5 *s5kjn5 =3D sd_to_s5kjn5(sd);
> +
> +	clk_disable_unprepare(s5kjn5->inclk);
> +	gpiod_set_value_cansleep(s5kjn5->reset_gpio, 1);

[Severity: High]
Does the clock need to remain active until after reset is asserted here?
Disabling the clock before putting the sensor back into reset might leave
the hardware in an invalid state.

[ ... ]
> +static int s5kjn5_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *state,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	const struct s5kjn5_mode *mode =3D &s5kjn5_modes[0];
> +	struct v4l2_mbus_framefmt *format;
> +
> +	s5kjn5_fill_format(mode, &fmt->format);
> +
> +	format =3D v4l2_subdev_state_get_format(state, 0);
> +	*format =3D fmt->format;

[Severity: High]
Can this cause a null pointer dereference when called by a legacy bridge
driver?

When the kernel is compiled without CONFIG_MEDIA_CONTROLLER, V4L2 core
wrappers do not fall back to the active state if the provided state is null.

If a driver calls v4l2_subdev_call(sd, pad, set_fmt, NULL, &fmt),
the state parameter passed to s5kjn5_set_fmt() will be null. The lookup
function v4l2_subdev_state_get_format() detects the null state, triggers a
warning, and returns null, leading to a crash on the immediate assignment
to *format.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-sk5jn5-v3-=
0-0b3ac1eadf8a@oss.qualcomm.com?part=3D2
