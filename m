Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2BF311C07
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779638; cv=none; b=f5p+M34F7K2cH/S0pr2cJAqzZ69GlecehVaXBZuVAE+QWW7Ts3xEiDRd68XhZ+qextVxm5WD0Ih0UtqU3I236eQReE9b9ltfZ3Rh33UdTw+1ey3wsc5wM+WdN0sWtilUoNUTBceDQ10UtiijXFhv1c4/RFECheUCG8L+WeBSIwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779638; c=relaxed/simple;
	bh=nf35zJC7S3EyaGwJClFMSya5oIFI0woN/fF1d3IVZrU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uSP79EUma/eEoZ23qdC5D0y904Dz1BoXPkdzNpe6JXJiKn9PTCzqvD8ME3fZR7/NOYGg+iswEJ9EAGNgE87an3N3d/xQI18pyRmW9k/lTdhnmb99htylWz11R88lnn3eaPezKUpm1reXxDR4iilUqRXxuK5+aLsWMAKfOsTNB0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odv90Uqx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odv90Uqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEA31F000E9;
	Thu, 18 Jun 2026 10:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781779636;
	bh=GaFsv6jWaw0OqtUuDQutrmEIBankCRZvkHKFLjqnOAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=odv90Uqx7BD2nG/8T8uR8k+EUJSsLUQMa3cU+GNd2VKUC4JBtVymKS7xL5OuLUkf2
	 hZXgcDJqyyuUgSnqOuPcZg1wbj2oenrBUE/4S0UbE+JQrl0d0bxljwtXL+waQFgV6j
	 4zbooKyE1M9fdrrpLM9P6AGRkSUEVN+vO2l4qA0yWDuWXHd3BRpxHoWRCDlTi0DY64
	 jl3xgQE2jzAA8p29QJZA+NT5NurZNxiIN8DGOZmQ+Nk1UXvZ7fEpbAs3SwIhqn8Lnq
	 fexOsKKSZWNI7IzYcy/0Mqkd/+aooChJwLEWifW+XJEnJIRHG3Gzny313I4/dsEbA2
	 PzM9aQAVKOfDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: i2c: og0va1b: Add OmniVision OG0VA1B camera
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260618-og0va1b-v1-2-dda71bb83009@oss.qualcomm.com>
References: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
 <20260618-og0va1b-v1-2-dda71bb83009@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 10:47:15 +0000
Message-Id: <20260618104716.6FEA31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver calculates V4L2_CID_HBLANK as a physically impossible n=
egative value and underreports V4L2_CID_PIXEL_RATE.
- [Medium] Missing `pm_runtime_mark_last_busy()` defeats the configured aut=
osuspend delay.
- [Medium] The power-off sequence incorrectly disables the clock before ass=
erting reset.
--

commit fdebdbb98b4ed425fa89fd8e9a84a3dd03b711db
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

media: i2c: og0va1b: Add OmniVision OG0VA1B camera sensor

Add V4L2 sub device driver for OmniVision OG0VA1B image sensor.
OmniVision OG0VA1B is an image sensor, which produces frames in 10-bit
raw output format (Y10) over a 1-lane MIPI CSI-2 interface and supports
the 640x480 (VGA) resolution.

> diff --git a/drivers/media/i2c/og0va1b.c b/drivers/media/i2c/og0va1b.c
> new file mode 100644
> index 0000000000000..f0505b7ba7f32
> --- /dev/null
> +++ b/drivers/media/i2c/og0va1b.c
[ ... ]
> +static const struct og0va1b_mode og0va1b_modes[] =3D {
> +	{
> +		.width =3D 640,
> +		.height =3D 480,
> +		.hts =3D 376,
> +		.vts =3D 2096,

[Severity: High]
Does this code underreport the pixel rate and result in a physically
impossible negative value for the horizontal blanking?

Looking at og0va1b_modes, hts is 376 and width is 640. Later in
og0va1b_init_controls(), hblank_val is calculated as hts - width, which
equals -264:

og0va1b_init_controls() {
	...
	int hblank_val =3D mode->hts - mode->width;
	...
	og0va1b->hblank =3D
		v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_HBLANK,
				  hblank_val, hblank_val, 1, hblank_val);
}

Could the 376 value represent clock cycles rather than pixels, where the
sensor outputs 2 pixels per clock? If so, should hts be defined in pixels
(752) and the V4L2_CID_PIXEL_RATE be set to 96 MHz (for 10-bit raw over a
480 MHz link) to comply with V4L2 standards?

[ ... ]
> +static int og0va1b_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct og0va1b *og0va1b =3D sd_to_og0va1b(sd);
> +
> +	clk_disable_unprepare(og0va1b->inclk);
> +	gpiod_set_value_cansleep(og0va1b->reset_gpio, 1);

[Severity: Medium]
Does this sequence leave the sensor in a dangling state?

The power-off sequence disables the input clock before asserting the hardwa=
re
reset GPIO. To ensure the sensor's internal state machine enters reset clea=
nly,
should the reset line be asserted while the clock is still running?

[ ... ]
> +static int og0va1b_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
[ ... ]
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put_autosuspend(og0va1b->sd.dev);
> +	return ret;
> +}

[Severity: Medium]
Will this defeat the configured autosuspend delay?

The driver explicitly configures an autosuspend delay of 1000ms in probe(),
but calls pm_runtime_put_autosuspend() here without first updating the
last_busy timestamp via pm_runtime_mark_last_busy().

Without the updated timestamp, the runtime PM core might evaluate the
autosuspend timer as already expired, causing the device to power off
synchronously.

[ ... ]
> +static int og0va1b_disable_streams(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state,
> +				   u32 pad, u64 streams_mask)
> +{
> +	struct og0va1b *og0va1b =3D sd_to_og0va1b(sd);
> +	int ret;
> +
> +	ret =3D cci_write(og0va1b->regmap, OG0VA1B_REG_STREAMING, 0, NULL);
> +	if (ret)
> +		dev_warn(og0va1b->sd.dev,
> +			 "failed to stop streaming: %d\n", ret);
> +
> +	usleep_range(5000, 6000);
> +	pm_runtime_put_autosuspend(og0va1b->sd.dev);
> +
> +	return 0;
> +}

[Severity: Medium]
Similarly, does the missing pm_runtime_mark_last_busy() call before
pm_runtime_put_autosuspend() here cause immediate device suspend, defeating
the autosuspend timer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-og0va1b-v1=
-0-dda71bb83009@oss.qualcomm.com?part=3D2
