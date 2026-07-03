Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBF63B0AD6
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071344; cv=none; b=HXRvYm0g1tWYWUYF08bh2mhO85qwmTDosFXfvyWv0aC3+eMMAMeS2k8MJvAe1Qq0kuoYXRk1TIrunw+Gi+wMorcUTwEd4VaCfCs/C6jR639LyNFk2pCu6e02NO/cbc8/xESCdzz2gML1OecL//bdMtgA7i+mMcsxd7dFn5T9GFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071344; c=relaxed/simple;
	bh=YVhN7ogufptzOgMejP7+2gAOpGLDTeGVby2qhlEC3g0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uG5/jcBDuyBbvsoTUdmHJFo1ubLJoLEh0yHHkVAvJlp+amT1wKQoLYYWatTwlvZh5PJ3ei7jKh4qE/cIUCCIBTFth+tnwxZMZ5cliOqqu1nTQpaq9BfV/lxZeXVUl/K1KmhkEakHusA3/bXUhrSQ5yaUaowWEI3xYOf77kVwivY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ToNRTLFO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ToNRTLFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B657A1F000E9;
	Fri,  3 Jul 2026 09:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783071339;
	bh=QyLSkU+TlpKs4kkAhey/11cODFfCs91Gj+x9HD8mK68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ToNRTLFOcHXpK1IlW9uTnobNiBx8fzi8biyxgALSTVnE3EBy9kbwewI5uQhoHPG0j
	 aUbFtxROA5zKW3ap1ZZNsXOTi6c8KUDMa+DcLkOM8oD5BZdu9ncgcehyLTnjpWtJ9m
	 EIY+rL7XGtP+lgmVIzGSFb4aJnBaXQUnhAT+XqWw4vzudWOg53vreVV63DcZXJ8KJM
	 ke/8JXLFmM2ColLbSLX4G+GtXXm5EKdsJ7iTDD10bat4cm6UwDhF9QHElVG+lZW1fn
	 U6OX8oUYM2KZglZ16tlcNOtJ77xRgjZJyexTImVFiu0fx+Z4hKOVMn41wSus4tDXnm
	 J3zsgjs4UZ4Yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: imx678: Add driver for Sony IMX678
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jai Luthra" <jai.luthra@ideasonboard.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703-imx678-v5-2-0523dbed0dad@ideasonboard.com>
References: <20260703-imx678-v5-0-0523dbed0dad@ideasonboard.com>
 <20260703-imx678-v5-2-0523dbed0dad@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 09:35:36 +0000
Message-Id: <20260703093537.B657A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Sensor is left in STREAMING mode after model identification, lea=
ding to power drain and potential hardware state issues.
- [Low] Incompatible pointer type warning when passing `const u64 *` to `v4=
l2_ctrl_new_int_menu()` and `v4l2_link_freq_to_bitmap()` which expect `cons=
t s64 *`.
--

commit faaa0977c251c6b8135131c5875cd627b67a4017
Author: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: media: i2c: imx678: Add driver for Sony IMX678

This commit adds a V4L2 subdev driver for the Sony IMX678 image sensor. It
provides support for MIPI RAW12 output, various clock and link frequencies,
along with basic V4L2 controls.

> diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
> new file mode 100644
> index 0000000000000..83626c3eb744b
> --- /dev/null
> +++ b/drivers/media/i2c/imx678.c

[ ... ]

> +static const u64 link_freqs[] =3D {
> +	[IMX678_LINK_FREQ_297MHZ]  =3D 297000000,
> +	[IMX678_LINK_FREQ_360MHZ]  =3D 360000000,
> +	[IMX678_LINK_FREQ_445MHZ]  =3D 445500000,
> +	[IMX678_LINK_FREQ_594MHZ]  =3D 594000000,
> +	[IMX678_LINK_FREQ_720MHZ]  =3D 720000000,
> +	[IMX678_LINK_FREQ_891MHZ]  =3D 891000000,
> +	[IMX678_LINK_FREQ_1039MHZ] =3D 1039500000,
> +	[IMX678_LINK_FREQ_1188MHZ] =3D 1188000000,
> +};

[ ... ]

> +static int imx678_init_controls(struct imx678 *imx678)
> +{

[ ... ]

> +	/* LINK_FREQ is also read only */
> +	link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx678_ctrl_ops,
> +					   V4L2_CID_LINK_FREQ,
> +					   ARRAY_SIZE(link_freqs) - 1,
> +					   __ffs(imx678->link_freq_bitmap),
> +					   link_freqs);

[Severity: Low]
Will this cause a build failure due to incompatible pointer types?

The array link_freqs is defined as u64, but v4l2_ctrl_new_int_menu() expects
a const s64 pointer for its qmenu_int parameter. A similar issue exists bel=
ow=20
where link_freqs is passed to v4l2_link_freq_to_bitmap() in=20
imx678_check_hwcfg(), which also expects an s64 array.

Should link_freqs be defined as s64 instead?

[ ... ]

> +static int imx678_identify_model(struct imx678 *imx678)
> +{
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);
> +	const struct imx678_model_info *info;
> +	enum imx678_type detected;
> +	int ret =3D 0;
> +	u64 val =3D 0;
> +
> +	info =3D device_get_match_data(&client->dev);
> +
> +	/*
> +	 * This sensor's ID registers become accessible 80ms after coming out
> +	 * of STANDBY mode.
> +	 */
> +	cci_write(imx678->cci, IMX678_REG_MODE_SELECT, 0, &ret);
> +	fsleep(IMX678_MODULE_ID_DELAY);
> +
> +	cci_read(imx678->cci, IMX678_REG_MODULE_ID, &val, &ret);

[Severity: Medium]
Is the sensor left in STREAMING mode after model identification completes?

The code writes 0 to IMX678_REG_MODE_SELECT to wake the sensor to read the
ID registers, but it doesn't appear to write 1 back to return it to STANDBY
mode before exiting the imx678_identify_model() function.

Could this leave the sensor streaming indefinitely on the bus if PM is
disabled, or cause configuration issues later when s_stream(1) is called
since the driver will be writing configuration while actively streaming?

> +
> +	if (ret) {
> +		dev_err(&client->dev,
> +			"I2C transaction failed ret =3D %d\n", ret);
> +		return ret;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-imx678-v5-=
0-0523dbed0dad@ideasonboard.com?part=3D2
