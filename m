Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985AF3E0C47
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896686; cv=none; b=SE3j7Ho0FsvK3ncNafI6ld58B3VnO6mMD6kTvzGGShr1ytl/+X+Lumw3Vzh4s9aTXVxg1CZQoBSp+eTGtSpaIm1hf8eH84tdQJgD8ZDHWQa8529CPIQT8lxB8uMNo5IpnLgoz2cImkYhzj8itRDmi2r8dntjpuC3/pVqRR+Z1VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896686; c=relaxed/simple;
	bh=IkDDZu9Q4Fzrg4JgjJU/5swQkuz0J61kMcMOM91ta24=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eZBGT06/rf2l8VGXlO19sOClmWY8aqTvcgY60zOEQkuBXvBy1A/vXzZcpm7v8k8TdC5QU6RcGlj+8KLixkJUw45CeUDcKRGHGMzRTVMTwyNNajBI2oFC1kYgL/nXGjWmW4hjrNzqYOXGBDZa/yMtCo1DOWpytTwI26RynYQn1Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWMRwYIZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWMRwYIZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060E81F00A3A;
	Wed,  1 Jul 2026 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782896685;
	bh=5L1Vqi75bXngTkN/JC7Q5wzCi9MFSzOmzh+LM9jYyoA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZWMRwYIZ6biSVYmLZKKibKoKe/0N0Lal7x2dagunCyyHER5Zrbb7/fB0g4clXXxe7
	 jcYVq+XK+UAkwY3fhPNN/00epYkP2EW4hWaBadYAbKzSAUzzAGJzxIBaTvhAxi8mn6
	 T2vg8KRgGDliu6yDV+KcA2jIhzgcTSh3jwnIXCUneLhzVdMemaoTcWMP/ABhn0iJT+
	 AHcbAUyoUoKjnySNmfCv1SOC9bYDIpJINYuRVQbBZ6YEhnFa1sEXX6FHTcm4PwP8xB
	 EWA/rqLjyY+27uUnTAnZzwMTPOCvA6ulXPyL0YJLMfHSCtWWvkq8JwZEhX+8Nx53Ur
	 uomyk25Fr6I+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: i2c: hm1092: add Himax HM1092 mono NIR
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ramshouriesh R" <rshouriesh@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701-hm1092-driver-v1-2-d1bd81e233b5@gmail.com>
References: <20260701-hm1092-driver-v1-0-d1bd81e233b5@gmail.com>
 <20260701-hm1092-driver-v1-2-d1bd81e233b5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 09:04:44 +0000
Message-Id: <20260701090445.060E81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver incorrectly uses `pm_sleep_ptr()` instead of `pm_ptr()`=
 for the `dev_pm_ops` structure pointer, silently breaking Runtime PM when =
`CONFIG_PM_SLEEP` is disabled.
- [Medium] V4L2 control handler memory and lock resources are leaked on ini=
tialization error paths in `hm1092_init_controls()`.
--

commit 355cde57de68093fd9275a1bf61c01ff0eed341f
Author: Ramshouriesh R <rshouriesh@gmail.com>

media: i2c: hm1092: add Himax HM1092 mono NIR sensor driver

Add a V4L2 subdev driver for the Himax HM1092, a 1 megapixel monochrome
near-infrared image sensor with a single-lane MIPI CSI-2 interface.

> diff --git a/drivers/media/i2c/hm1092.c b/drivers/media/i2c/hm1092.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/i2c/hm1092.c
[ ... ]
> +static int hm1092_init_controls(struct hm1092 *hm1092)
> +{
> +	struct v4l2_ctrl_handler *ctrl_hdlr =3D &hm1092->ctrl_handler;
> +	const struct hm1092_mode *mode =3D &hm1092_mode_560x360;
> +	struct v4l2_fwnode_device_properties props;
> +	s64 hblank, pixel_rate;
> +	int ret;
> +
> +	v4l2_ctrl_handler_init(ctrl_hdlr, 6);
[ ... ]
> +	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &hm1092_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(hm1092_test_pattern_menu) - 1,
> +				     0, 0, hm1092_test_pattern_menu);
> +
> +	ret =3D v4l2_fwnode_device_parse(hm1092->dev, &props);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Could this leak the control handler memory and lock resources if=20
v4l2_fwnode_device_parse() fails?

When hm1092_probe() calls hm1092_init_controls() and it fails here,
probe jumps straight to err_power_off, bypassing v4l2_ctrl_handler_free().

> +
> +	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &hm1092_ctrl_ops, &props);
> +
> +	if (ctrl_hdlr->error)
> +		return ctrl_hdlr->error;

[Severity: Medium]
Similarly, if control creation fails, does returning ctrl_hdlr->error=20
directly leave the allocated control handler resources orphaned?

[ ... ]
> +static struct i2c_driver hm1092_i2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "hm1092",
> +		.pm =3D pm_sleep_ptr(&hm1092_pm_ops),

[Severity: High]
Will this silently drop the Runtime PM callbacks when the kernel is compiled
with CONFIG_PM=3Dy but CONFIG_PM_SLEEP=3Dn?

According to the power management subsystem guidelines, pm_sleep_ptr()
should be used for individual sleep callbacks, while pm_ptr() should be
used for the dev_pm_ops structure pointer. If pm_sleep_ptr() evaluates
to NULL here, the sensor hardware might not power on during
hm1092_enable_streams().

> +		.of_match_table =3D hm1092_of_match,
> +	},
> +	.probe =3D hm1092_probe,
> +	.remove =3D hm1092_remove,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-hm1092-dri=
ver-v1-0-d1bd81e233b5@gmail.com?part=3D2
