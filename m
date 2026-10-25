Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792946549;
	b=0lA6BquLMYUPF4Iisrm53bsCf+LoosI54986Q5TeBPg1Whulb7tbYnOFtvahUN+x2gAR
	 R9lNYPiyQP3/ZXZweqYpEZ9pW7N+tIgHtD9BajxayAwQCt22Pr1kRIFo+TjPAARBYiqdd
	 4FCVuEnKJWs4/+2b07vV2xpWzalyVya7HD/RQ9wyMCp0r/Bfm7zZYOilT/nh8sJdAT819
	 xLwodshVMfxnDsVMkKeQ3RnFYcx+GKJKzRN62FiC85X2yJ1vnGfmAKCAkhMM7g5YFi0xZ
	 ByCp38U0rYTTLqHebLvPFRoNOT7Sgi2J7EmMCnpD9jR1WTVPrSAkNg2K9XNpyw6pfFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792946549;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cPJgO1+8d5mUNiWnEOFR8vqpitnJgqR/qZvpv/l/KWU=;
	b=fIiLlM5viFaqvGHDdYOHlw3uC5rbTYnJZVnjaYpsKdWsXufZQ3aiB+aXLwKjkhquX/wE
	 8RS8Wp/OCKA9Q50/uNPAGrvhioj34k2iiH4JAkGGtdpIWv4PUryS6fgxkIwAfwSrBoXL9
	 uEpiAcDIhn8olZiJQytBZA5u6E5j3T0gbYgjIukPuK+Bd0AC6tV/csJ1Ksqxbgm4+Aq4W
	 FMf92BjyTWiwN04P9nFQujuE+cdLgykj1/B3uxunkQncMpJH/QgDgv7pWj3HWRSQA/8QG
	 WgAsqcOEtns42sOjqjl/80Vj3qR0MrbZQBw2fbuRgA73ZH9758uOLsL90tNE/j6/f6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dfGbTAqX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1925A606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 16:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dfGbTAqX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B84E1F01825;
	Sun, 25 Oct 2026 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792946548;
	bh=cPJgO1+8d5mUNiWnEOFR8vqpitnJgqR/qZvpv/l/KWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dfGbTAqXqsIlo9jwMJYxUedMTER0GY0oG+lSvZl3Yfm5q86Dlbxu/Tl4yGae3Lon4
	 yogYUGnUrFaSQtyrUrCQEPBjSUju/GFqjmN8T6IGVhhUF9OHMfyOaTIzoMyVA0F3Zu
	 1Cj9NZKIHVeynMlopi1K2JzlcQWvo9VdQXzf6+B4L3ZFl2JJTqJabELUC4sH53C8qh
	 AV3PHeST665YL+T4j/Ynp/61SnYsLheJMFpIiXCrK2ahdZ6XVJg+w3T2Wbv0p0I3aq
	 /dT6CJxsPWxkSahPk0ieBtOb+qdnir3DlTBP7izVoREoRmKpuG0CMJS5AGuzswe81j
	 h2agp2DHUIawQ==
Message-ID: <sashiko-outbox-184277@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/3] media: i2c: hm1092: add Himax HM1092 mono NIR
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ramshouriesh R" <rshouriesh@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261025-hm1092-driver-v8-2-9cd575c366cf@gmail.com>
References: <20261025-hm1092-driver-v8-0-9cd575c366cf@gmail.com>
 <20261025-hm1092-driver-v8-2-9cd575c366cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 16:42:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] media: i2c: hm1092: broken CONFIG_PM=3Dn and disabled runtime PM=
 handling
- [Low] media: i2c: hm1092: invalid max range on read-only VBLANK in hm1092=
_init_controls()
--

commit f1e4ed7ce54114835ec68f36cc7257ae9a2789c1
Author: Ramshouriesh R <rshouriesh@gmail.com>

media: i2c: hm1092: add Himax HM1092 mono NIR sensor driver

This commit adds a V4L2 subdevice driver for the Himax HM1092 monochrome
near-infrared CMOS image sensor over a single-lane MIPI CSI-2 interface. It
supports the sensor's 560x360 10-bit monochrome mode, standard controls
including exposure, analogue gain, digital gain, and test patterns, and
manages sensor power via runtime PM.

Link: https://lore.kernel.org/r/20260727131252.1580332-1-j@metarealtyinc.ca
Link: https://lore.kernel.org/r/20260727154058.2350497-1-j@metarealtyinc.ca

> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 7de2d095c9696..24ea806768493 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -137,6 +137,17 @@ config VIDEO_HI847
>            To compile this driver as a module, choose M here: the
>            module will be called hi847.
> =20
> +config VIDEO_HM1092
> +	tristate "Himax HM1092 sensor support"
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor driver for the Himax HM1092
> +	  monochrome near-infrared CMOS image sensor, used as the
> +	  face-authentication IR camera on laptops.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called hm1092.

[ ... ]

> diff --git a/drivers/media/i2c/hm1092.c b/drivers/media/i2c/hm1092.c
> new file mode 100644
> index 0000000000000..400e9ded21667
> --- /dev/null
> +++ b/drivers/media/i2c/hm1092.c

[ ... ]

> +static int hm1092_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct hm1092 *hm1092 =3D container_of(ctrl->handler, struct hm1092,
> +					     ctrl_handler);
> +	int release_ret;
> +	int ret =3D 0;
> +
> +	/*
> +	 * The control value is cached by the framework and (re)applied from
> +	 * hm1092_enable_streams() once the device is powered up for streaming.
> +	 */
> +	ret =3D pm_runtime_get_if_in_use(hm1092->dev);
> +	if (ret <=3D 0)
> +		return ret;

[Severity: Medium]
Can this return -EINVAL when runtime PM is disabled or when the kernel is
built with CONFIG_PM=3Dn?

pm_runtime_get_if_in_use() returns 0 when the device is runtime suspended, 1
when it is active and in use, and -EINVAL when runtime PM is disabled
(dev->power.disable_depth > 0 or CONFIG_PM=3Dn). Returning ret directly when
ret <=3D 0 propagates -EINVAL to VIDIOC_S_CTRL / VIDIOC_S_EXT_CTRLS callers=
 and
causes hm1092_enable_streams() -> __v4l2_ctrl_handler_setup() ->
hm1092_set_ctrl() to fail if runtime PM is disabled.

Additionally, VIDEO_HM1092 in drivers/media/i2c/Kconfig does not depend on =
PM,
while hm1092_probe() leaves the sensor powered off (with reset asserted via
GPIOD_OUT_HIGH) and relies solely on pm_runtime_resume_and_get() in
hm1092_enable_streams() to invoke hm1092_power_on(). When CONFIG_PM=3Dn:

- pm_runtime_resume_and_get() is a no-op returning 0, so hm1092_power_on() =
is
  never called and the sensor remains unpowered during streaming.
- In hm1092_remove(), pm_runtime_status_suspended() unconditionally returns
  false, so hm1092_power_off() calls clk_disable_unprepare(hm1092->img_clk)
  and regulator_bulk_disable() on resources that were never enabled.

Should hm1092_set_ctrl() return 0 when pm_runtime_get_if_in_use() <=3D 0 (or
use pm_runtime_get_if_active()), and should the driver either depend on PM =
in
Kconfig or handle powering the sensor on/off in hm1092_probe() and
hm1092_remove() when CONFIG_PM is disabled?

[ ... ]

> +static int hm1092_init_controls(struct hm1092 *hm1092)
> +{
> +	struct v4l2_ctrl_handler *ctrl_hdlr =3D &hm1092->ctrl_handler;
> +	const struct hm1092_mode *mode =3D &hm1092_mode_560x360;
> +	struct v4l2_fwnode_device_properties props;
> +	s64 hblank, pixel_rate;
> +	int ret;
> +
> +	ret =3D v4l2_fwnode_device_parse(hm1092->dev, &props);
> +	if (ret)
> +		return ret;
> +
> +	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
> +
> +	hm1092->link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr,
> +						   &hm1092_ctrl_ops,
> +						   V4L2_CID_LINK_FREQ,
> +						   0, 0,
> +						   hm1092_link_freq_menu);
> +
> +	pixel_rate =3D div_u64(HM1092_LINK_FREQ * 2 * hm1092->mipi_lanes,
> +			     HM1092_BITS_PER_SAMPLE);
> +	hm1092->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
> +					       V4L2_CID_PIXEL_RATE, 0,
> +					       pixel_rate, 1, pixel_rate);
> +
> +	hblank =3D mode->hts - mode->width;
> +	hm1092->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
> +					   V4L2_CID_HBLANK, hblank, hblank, 1,
> +					   hblank);
> +
> +	hm1092->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
> +					   V4L2_CID_VBLANK,
> +					   mode->vts - mode->height,
> +					   0xffff - mode->height, 1,
> +					   mode->vts - mode->height);

[ ... ]

> +	if (ctrl_hdlr->error) {
> +		ret =3D ctrl_hdlr->error;
> +		goto err_free;
> +	}
> +
> +	hm1092->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +	hm1092->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +	hm1092->vblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;

[Severity: Low]
In hm1092_init_controls(), V4L2_CID_VBLANK is marked with
V4L2_CTRL_FLAG_READ_ONLY and is not handled in hm1092_set_ctrl(), but its
maximum value is set to 0xffff - mode->height instead of mode->vts -
mode->height.

Will advertising a larger maximum on a fixed, read-only V4L2_CID_VBLANK
control cause userspace camera stacks to compute an incorrect maximum frame
duration? Should the maximum for V4L2_CID_VBLANK match mode->vts -
mode->height, similar to V4L2_CID_HBLANK?

Also, the pixel_rate and exposure pointers in struct hm1092 (along with
HM1092_TEST_PATTERN_MAX) are never read after assignment; could those unused
fields and macro be dropped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025-hm1092-dri=
ver-v8-0-9cd575c366cf@gmail.com?part=3D2
