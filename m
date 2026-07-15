Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0C03C9885
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117631; cv=none; b=N0gr3S8gim4pycG84Obs//0NOWmtSp5VsfvYkEJ30EqgtBESx36tbIQ5OsCriGPHzDNYK7MrI3QCI2k9AoqQaUOS0LPOsZLXmOCU0oaoT/apfy9+Vlm5NQot56kJ43WKrnYzlUHX4utDmJcTsGAnq1sB7pxvXAIUfnE/lp0elNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117631; c=relaxed/simple;
	bh=5mXKte3WQEpI3K93UHa8xeLYYbJnGNAqQJ1aRO6j05Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k6CtIPjMxQZDyV6kWYlazVclNCOCVnqp7Zoq5L3xN9ADKxrdat0SytuQcubfC4c0L0ZpS4FEnNXpHdHxAilhxXxM8ZTSEe6sGsx/c+3Gup4FlYFKK6lhBDag1hbyhspZXh/BsfLtYFii35NMi08nQ3Nel+5+TNmqiVtoCpNRe3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLx9fC8J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLx9fC8J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE301F00A3A;
	Wed, 15 Jul 2026 12:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117630;
	bh=aRces2UNjQDuttRDFCWOUxnQdIBSc/tgGfqmyII9hHk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iLx9fC8JpImVsnWz04mkp2tsXhL9sZluEPAqcwIFqhrKEb+9lW1MDBvQBcqVE39/D
	 efV6qFeBQiVo+m5mDQLRysUa56cUDlAinmoXg4vrV6TxpF65yFr2xSDVNqXGh0ZQ7L
	 QNQYdOPgFX6KVQj+xlhsBXeMjbsYHuyYjw+0tfAHW+k9DcpOOB+arXz+Av/l06vrZl
	 VWbvND4TyWWMPy/OG58eNY0s2Vzf8MDngoM3Vjui2FXggMnkuqrSTDtDyTphk+ROZf
	 MO8KEv33BSzxkGXfFLXQxpZfbAoIjruedvdbKWsk8STmFRiB6BdP7ec/LnVd3z1dWK
	 7jF+f/3+FFStg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 20/21] media: imx355: Switch to using the subdev
 state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-media-imx355-v4-20-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
 <20260715-media-imx355-v4-20-f7f966fb9ffd@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 12:13:49 +0000
Message-Id: <20260715121349.BFE301F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] v4l2_subdev_get_fmt returns a stale format code after HFLIP/VFLIP =
changes, breaking frame size enumeration.
--

--- Patch [20]: [PATCH v4 20/21] media: imx355: Switch to using the subdev =
state ---
commit 742fe3da9be2474160e24d38a786d4c4d792ff1f
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Switch to using the subdev state

This commit switches the imx355 driver to use the V4L2 subdev state
for managing crop and format rather than handling them within the
driver state.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 0462e0feee362..97f4594f7ed9a 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c

[ ... ]

> @@ -1034,7 +960,7 @@ static const struct v4l2_subdev_video_ops imx355_vid=
eo_ops =3D {
> =20
>  static const struct v4l2_subdev_pad_ops imx355_pad_ops =3D {
>  	.enum_mbus_code =3D imx355_enum_mbus_code,
> -	.get_fmt =3D imx355_get_pad_format,
> +	.get_fmt =3D v4l2_subdev_get_fmt,

[Severity: High]
Does switching to v4l2_subdev_get_fmt return a stale format code after
HFLIP/VFLIP changes?

In imx355_set_ctrl(), the hardware orientation and logically the Bayer
format change when HFLIP or VFLIP are updated:

imx355_set_ctrl()
    ...
    case V4L2_CID_HFLIP:
    case V4L2_CID_VFLIP:
        ret =3D cci_write(imx355->regmap, IMX355_REG_ORIENTATION,
                        imx355->hflip->val | imx355->vflip->val << 1,
                        NULL);
        break;

However, the active state's format code is not updated here. Because
get_fmt now relies on v4l2_subdev_get_fmt instead of the dynamically
evaluated imx355_get_pad_format(), VIDIOC_SUBDEV_G_FMT returns the
stale format.

This appears to break frame size enumeration, as
VIDIOC_SUBDEV_ENUM_FRAME_SIZE will evaluate the correct format code and
reject the stale code with -EINVAL:

imx355_enum_frame_size()
    if (fse->code !=3D imx355_get_format_code(imx355)) {
        return -EINVAL;
    }

Should the active subdev state format be updated when the orientation
controls change?

>  	.set_fmt =3D imx355_set_pad_format,
>  	.enum_frame_size =3D imx355_enum_frame_size,
>  	.get_selection =3D imx355_get_selection,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-media-imx3=
55-v4-0-f7f966fb9ffd@raspberrypi.com?part=3D20
