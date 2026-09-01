Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723E947140F
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250000; cv=none; b=ukRQTnBpAuuG19ZRlElyBN7kQCOf0j5vbQu2NlCZsX2/fFFjVGs31Jv/27misxgkuDjpbtTjKMhQ7/opDcfalsJcePkIP+Hha1qg4ZOdS6ydFbaPV57JYq8898wCIKCqLKvDK3KPlC4j5FdayT7ijVLy1y3sznJCdIH8Y1/lOzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250000; c=relaxed/simple;
	bh=wMPeovMZYggUvx2CTQGucO9TKOUKzF+sy7gNXuHqH/0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PJkKs9W26tYibgQVfBTyYk/5fePtuooRv+bnmcV1gqELfcMUkjFgd17AG6Z2g0MIyqa4DHCFSRpiFFSQIF+KH5Y6WEWEih3jZIZp7prjmABLI8slwobADKEnZkU4AOn1zffspVFbiiMLOORE6iSna5krfvQuLv+Xg+vKHiFSMEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWSvJXsb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWSvJXsb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429571F000E9;
	Tue,  1 Sep 2026 08:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788249993;
	bh=9jYqNNpHUYgOcSYjwjB8EhoRh01E4HIEZ04HdqrXoYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YWSvJXsb3Gq3p9jHIF6EykK+2h0P6rv2cpgluVFEXHIjuNCeqlaDmlVXOXgrs8Nlx
	 fNCUQajX5SvQlornVbd19drg7dJD7uM9W8Y9lAX4semrWwuu2KaconCoHKZ7z4VW1U
	 jx0+L6PMu37E/BkuoOV/YWbEeZejVtBl7aMle4OIFSdcU6iA4VIeglk+rGc6pZyKuY
	 7Q9jvEoaCcKpbuB7ZhcAMeNq39D+Sh9ih9hCDT1zzcTvr6nuDjqgaL6dm9C0cTBymw
	 nfmYHjN0wbZN4p0DcBztedJDhB9BDCHOrLw5UarBtnI1Makn1BmGyk49P/m5nMBW69
	 EXqi9hBHtFW1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3 2/2] media: i2c: Add Samsung S5KJN5 image
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-sk5jn5-v3-2-17e728917bd4@oss.qualcomm.com>
References: <20260901-sk5jn5-v3-0-17e728917bd4@oss.qualcomm.com>
 <20260901-sk5jn5-v3-2-17e728917bd4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 08:06:32 +0000
Message-Id: <20260901080633.429571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect check of pm_runtime_get_if_active() return value leads t=
o usage count underflow and unsafe hardware access.
--

commit 7a020d143de8df2df23fab327b8ef8884815a0d1
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

media: i2c: Add Samsung S5KJN5 image sensor driver

This commit adds a V4L2 sub-device driver for the Samsung S5KJN5, a 50 MP
10-bit RAW MIPI CSI-2 image sensor. It supports the 4096x3072 mode and expo=
ses
the standard controls (exposure, gain, vblank/hblank, test pattern).

> diff --git a/drivers/media/i2c/s5kjn5.c b/drivers/media/i2c/s5kjn5.c
> new file mode 100644
> index 0000000000000..02ba83af9965e
> --- /dev/null
> +++ b/drivers/media/i2c/s5kjn5.c

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
> +		/* Update max exposure while meeting expected vblanking */
> +		exposure_max =3D mode->height + ctrl->val - mode->exposure_margin;
> +		__v4l2_ctrl_modify_range(s5kjn5->exposure,
> +					 s5kjn5->exposure->minimum,
> +					 exposure_max,
> +					 s5kjn5->exposure->step,
> +					 s5kjn5->exposure->default_value);
> +	}
> +
> +	/* V4L2 controls are applied when the sensor is powered up for streamin=
g. */
> +	if (!pm_runtime_get_if_active(dev))
> +		return 0;

[Severity: High]
Does this code handle negative error codes properly?

pm_runtime_get_if_active() can return a negative error code (like -EINVAL)
when runtime PM is disabled. In that case, !pm_runtime_get_if_active(dev)
evaluates to false, causing the function to proceed with hardware access
even though the device might be powered off.

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		ret =3D cci_write(s5kjn5->regmap, S5KJN5_REG_EXPOSURE,
> +				ctrl->val, NULL);
> +		break;

[ ... ]

> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put_autosuspend(dev);

[Severity: High]
Could this result in a usage count underflow?

Since pm_runtime_get_if_active() only increments the usage count when it
returns 1, an unconditional pm_runtime_put_autosuspend() here will cause an
underflow if the get function returned a negative error code.

> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-sk5jn5-v3-=
0-17e728917bd4@oss.qualcomm.com?part=3D2
