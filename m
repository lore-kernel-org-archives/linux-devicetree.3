Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA8B4483A8
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924147; cv=none; b=Oq5cHuUB9nsr/ezeH/xSCXtC3EkluxvfAdyXMM6AuiWRRVqbf2/ljLngRLc0sy38m0kRmA4gdJ5puS1Bw++4yCFmv9EjvXRo5ADv39MvPrAoiq2elVRbKp8VpxTMKs+taJ35ycaAmkvszjAjdE8Jeya2AH8SnG8Xd7AWb3tq6U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924147; c=relaxed/simple;
	bh=OVHLZ6BFPBu9UdjrNsxSXWVBEoltatZFoeY+Db3WlRI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VtyleM6SfAxADUKC0zMDGSjgMZ/fnpedBnUJLSs47+/8hDLJWqQ6EM+Oy0Ad34eBHI8J+71mYQPpfRIoki/ET5Gzfp1xXnDeJn55TbY3/HqX3T5SFeHhjozwFOm5Jfio7NCGbTgtIAIaamHXabEAmRFHGE605gmPLLQHKcteTns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mi8Wjy/W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mi8Wjy/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61EC1F00A3A;
	Fri, 28 Aug 2026 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787924138;
	bh=zn1DGxf4LXObeaLljp2nclykUZu5jwUC9s9Si8VCD5k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mi8Wjy/WWl1PxXcLljJjMLq457KK6y29DrVYop5HMlnrX071HgaV5qxoCzl1jAxBK
	 JgFkyZCvvI2R1gnw5RzzrgPvDp64h5OV15WM99Osmw70ZGOZ53Mni+OJ0WQpr+rNWU
	 uFNfyaIV4jaFQVistYJ5YnayGGwIG4r+WNmW1J5n99yD3He6y6Tnb01tTGsmxTMMjC
	 UEdIv8ic7sqScHAdN51CaJyHJokU0dUXwLzjEcJYL3INhnCaALfjWSYgo/pfsH2Wox
	 tSw37X6TCrO9ZXTY1Ew2lk8Tqin5OpbHngWochOThxo0ac3b6iykYgE1umYgIw1qVw
	 npg5cuppkJtdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] media: i2c: Add driver for OmniVision OV32C4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Bozik" <robertbozik@gmail.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828132104.21473-3-robertbozik@gmail.com>
References: <20260828132104.21473-1-robertbozik@gmail.com>
 <20260828132104.21473-3-robertbozik@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 13:35:37 +0000
Message-Id: <20260828133537.C61EC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Potential NULL pointer dereference in ov32c4_set_format() when sd_=
state is NULL.
--

commit 1f7b42ee8c447c7e85f922c97bb8dbc3b6847261
Author: Robert Bozik <robertbozik@gmail.com>

media: i2c: Add driver for OmniVision OV32C4

This commit adds a Video4Linux2 I2C sensor driver for the OmniVision
OV32C4 camera. The driver supports basic streaming functionality,
analogue and digital gain, and flip controls.

> diff --git a/drivers/media/i2c/ov32c4.c b/drivers/media/i2c/ov32c4.c
> new file mode 100644
> index 0000000000000..8d11e1b00d73c
> --- /dev/null
> +++ b/drivers/media/i2c/ov32c4.c
[ ... ]
> +static int ov32c4_set_format(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *sd_state,
> +			     struct v4l2_subdev_format *fmt)
> +{
> +	const struct ov32c4_mode *mode =3D &supported_modes[0];
> +	struct ov32c4 *ov32c4 =3D to_ov32c4(sd);
> +	s32 vblank_def, h_blank;
> +
> +	ov32c4_update_pad_format(mode, &fmt->format);
> +	*v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format;

[Severity: High]
Can this code cause a NULL pointer dereference?

If the driver is compiled without CONFIG_MEDIA_CONTROLLER, the V4L2 core
does not allocate a fallback active state. A legacy bridge driver invoking
v4l2_subdev_call(sd, pad, set_fmt, NULL, &fmt) can pass sd_state =3D=3D NULL
to ov32c4_set_format().

Because the core check_format() guard permits state =3D=3D NULL when
which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE, this function will still execute.

When v4l2_subdev_state_get_format() is passed a NULL state, it returns NULL.
The subsequent structure assignment then unconditionally dereferences it,
which would lead to a kernel panic.

> +
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +		return 0;
> +
> +	vblank_def =3D mode->vts_min - mode->height;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828132104.2147=
3-1-robertbozik@gmail.com?part=3D2
