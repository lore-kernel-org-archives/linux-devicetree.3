Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C3B31717E
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784261945; cv=none; b=BLJxUvibYwSvET4sWBmrY6njjRqky7Bz/YRZowIxCsII6s8M0zd0b9T6l38BEIRfLRqD0lgMBYseOUc2i7wMkY76rXZtjyT5NxayACBoW172ihzsYaBmS29aAYix+n+QeeuxRv2gmFQf+9RiitYyGbq2W5FEtqY024Yd/pXVwY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784261945; c=relaxed/simple;
	bh=dR7sBDPeGZb3niwL1ORem/GU+QFIDvio0qtW1htlXBY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PiJfGx3ONo8ut1o+EUDWQHTl8sgplYcMT6LPKlD5kPzVXMUEuMqr+nwp+M5WyJbw9pep9DWxMs0X33AlFpsbecBkYHfOiSJdXnbxL+O4BfGV4ZVpxU3GjUvSunjWcnNvHUdjOQCj5/OcwlgG4QiBuFV289OEqBS0Mk460DEkrgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jd05xSVg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jd05xSVg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 795841F000E9;
	Fri, 17 Jul 2026 04:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784261943;
	bh=z1wwVdBsI0jycD06bF58wE/fLaO/BJJaGmkNPqPL7HM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jd05xSVgaRQs8OQ0VIAgjQrKDVLWR8cW3mWkBu7+UympY9KDGHU0+CjtC6uLTz/LC
	 q8iQaHqtcwRZRoNJcDzay19p1gf2bjgUhRsA6YClHSjzgIP8jQll4ruFdmOWoWkb2F
	 SEP9tqe4uSU/lFBL03hD1gNUBDX8Z0l6ab7bQoLfsp7/LIatMAG5e4WM828QMGz78q
	 6I7ZfsQLe2GvaNI75oVVGahUPDqj65eCVIShe1H5VKjbLeLrRJpFNwvPk2mwHShEMp
	 JFQbkBMxkfgYZ+Ul2ahVXNXsTS60Kj2Y7P0e8VFsy35glU4+vN4eu7Y6XqxzDstQSG
	 KMkQQMlNMJXUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: i2c: Add Samsung S5KJN5 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260717-sk5jn5-v1-2-da610d7fd494@oss.qualcomm.com>
References: <20260717-sk5jn5-v1-0-da610d7fd494@oss.qualcomm.com>
 <20260717-sk5jn5-v1-2-da610d7fd494@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 04:19:02 +0000
Message-Id: <20260717041903.795841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect hardware power-on/off sequence: reset is de-asserted wit=
hout a running clock.
--

--- Patch [2]: [PATCH 2/2] media: i2c: Add Samsung S5KJN5 image sensor driv=
er ---
commit 05e0426a4b9d13689d0f80d9c414692c4736124c
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

media: i2c: Add Samsung S5KJN5 image sensor driver

This commit adds a V4L2 sub-device driver for the Samsung S5KJN5 image
sensor. It supports the 4096x3072 mode and exposes standard controls for
exposure, gain, blanking, and test patterns.

> diff --git a/drivers/media/i2c/s5kjn5.c b/drivers/media/i2c/s5kjn5.c
> new file mode 100644
> index 0000000000000..294a4c3c5d2c5
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
Does this sequence de-assert the reset line before the master clock is
running? Releasing reset without an active master clock can sometimes cause
the sensor's internal state machines to enter an undefined or locked-up
state, which might lead to I2C communication failures or unreliable
initialization.

[ ... ]

> +static int s5kjn5_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct s5kjn5 *s5kjn5 =3D sd_to_s5kjn5(sd);
> +
> +	clk_disable_unprepare(s5kjn5->inclk);
> +	gpiod_set_value_cansleep(s5kjn5->reset_gpio, 1);

[Severity: High]
Similarly, does this stop the clock before placing the sensor back into
reset? Typically, the sensor should be placed into reset while the clock is
still running to ensure a clean shutdown state.

> +	regulator_bulk_disable(S5KJN5_NUM_SUPPLIES, s5kjn5->supplies);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-sk5jn5-v1-=
0-da610d7fd494@oss.qualcomm.com?part=3D2
