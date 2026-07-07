Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CEB437873
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444701; cv=none; b=kMPbFkZbKad1qem5j67TSwgrKcZQuLvuYVLIK7u6+yb1lXVWY//7eOT3bXi1JpP8/85Rg/g2ivkFs6nRFsyepeUDnmepl8ADJgS1tr9ujvyU6gzaR2IzYUWAKYMnwoSwa0wBEBHM75BsEjKyvrjd3Bgo4tstHtay0gn3gmYc/M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444701; c=relaxed/simple;
	bh=hbheoiP4ndce5JMBpA4PH/DDxG/9Hv16c1tmGeY6LDg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iEvytK0j27FYnmPYOS/OmhlVev9bwyYDuLRjlaEogCLNR+951k9vMAKglKqm82QcOeAoQgtcPRfh6d8hjADv6U2CvT1nxKqdm2mPFUA5EgGcAb70UUx/x/5ltsi8UUvnFYojb6WMK29GevVdVh9WHCAHp91HpIH7wmIvpdqh9ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kl20UsiV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kl20UsiV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5381F000E9;
	Tue,  7 Jul 2026 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783444699;
	bh=MleLbItjvEJcNp+6x4YXoJw2LZVG/iGL7Bv/JQ+AoCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kl20UsiVboyjpaJqOC2q69AVWtGxcvg6/3IjVDJQsFL76TFkkVUzbC1EJOnenFUYR
	 sFw6HsqGrzIeECSveN6E7VFYqbmbcUEAf8u7N1zP2QXcCVLQWOSQTDO2vs6QNuLXcO
	 KqJMDrjGRAu5SZ58RiK2O5d6Xd17Kqe/ztn70C7Y/MNFaLDtvY8HDMScvbJlvbC7lQ
	 t0udHrNTg2nfg/qivLLUVly3CZe0V5UdJuh1V0U3Q7pDC8xc6OHrmZmDX9N/XOuCCf
	 r3sPuCsCOdfjEF87MAnY6KU2zwarrCEsCmzM+VWjPqbRZ7kzPkospwnvPRZeuAVjMp
	 In2dkHrkvDiSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/20] media: imx355: Add support for get_selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-media-imx355-v2-11-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
 <20260707-media-imx355-v2-11-1683ec07b897@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 17:18:18 +0000
Message-Id: <20260707171819.5D5381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The TRY crop rectangle is not updated when the TRY format is cha=
nged, causing get_selection(TRY) to return stale or incorrect crop data.
--

--- Patch [11]: [PATCH v2 11/20] media: imx355: Add support for get_selecti=
on ---
commit c10d5f7839a602e25b0eddb66d5d44872dd34f8a
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Add support for get_selection
   =20
Provide all the cropping information via get_selection.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 354092295b7c3..0f5fbe21d7fb2 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
[ ... ]
> @@ -891,6 +899,50 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
> =20
> +static void
> +__imx355_get_pad_crop(struct imx355 *imx355,
> +		      struct v4l2_subdev_state *sd_state, unsigned int pad,
> +		      enum v4l2_subdev_format_whence which, struct v4l2_rect *r)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		*r =3D *v4l2_subdev_state_get_crop(sd_state, pad);

[Severity: Medium]
Will this return stale or incorrect crop data when negotiating the TRY form=
at?

In imx355_set_pad_format(), when the TRY format is changed via
VIDIOC_SUBDEV_S_FMT, only the frame format is updated:

	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
		framefmt =3D v4l2_subdev_state_get_format(sd_state, fmt->pad);
		*framefmt =3D fmt->format;
	} else {
		imx355->cur_mode =3D mode;
        ...

Because the corresponding TRY crop rectangle in the subdev state is left
unmodified, a subsequent call to VIDIOC_SUBDEV_G_SELECTION with
V4L2_SUBDEV_FORMAT_TRY and V4L2_SEL_TGT_CROP seems like it will return
outdated crop geometry.

Should imx355_set_pad_format() be updated to keep the TRY crop rectangle
in sync?

> +		break;
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		*r =3D imx355->cur_mode->crop;
> +		break;
> +	}
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-media-imx3=
55-v2-0-1683ec07b897@raspberrypi.com?part=3D11
