Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA6C37106A
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320260; cv=none; b=Z7Lz7JUEYRpL3/r7SdoMKQCD2IB2a2fvVcelYx6K+e/ZH9avJ8G8KHltLOHh8DlqxUgv+rZOEw9O7XjUQ1aZmzbV3SmsSqkZCpGfIoJYnfJ91MR5gGjvmzCnxH6QfW5XVJeec+vF2mTlgJlTYo7/WxEZbf2CrCzkdpx6AedFDMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320260; c=relaxed/simple;
	bh=nSo5DmqEsGNJIxvF8d3LjBScC4f4GbXqI6+LILbymVA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZFSVZTvrc1dOflx7H70Dg87dtQJ1M2aQAroMT8JOEW916QzUQ+9dAG4oRnFKUxJH7B2xoxPTOVpnRQvx3FPePPSgAtaXrxFeVe2ZXWXNYQOkS4ADHbNsIB/GFNnMm1Z2MVfsDlhf/9pGqBpnKqU2h5kmJZxw7ofrRuwE+Kyl81Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3iD02z4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3iD02z4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475191F000E9;
	Wed, 20 May 2026 23:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320258;
	bh=0EMS68D7TY6COInzCp9klnrws3U7gH8Cv1fUWjukzWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L3iD02z4fGYbz/ryNb+XiH5j5KHAWlnpvWCF9OxDwNbLe9YhoW3einbrtuA5/ZunJ
	 jx5LXYkrDcb9Qxfvys0ujeeM53ibahS/1ellTf0/GQiRiPyyMiMouvjKseewP2SQ57
	 ldjyeyPFnQCRL4Cd7zI7DqcXYr6I2qK/5TgBG0SR+QC9w5Ok2YdJUcWXTkbobebB1C
	 wJEW+i+2+3/hiSkVPoBQkazFyW0uoVqhuNX2mi9KO4IxibF3q4BM190QMWmh8kPFbO
	 YLKCArd0wnIfvQOMmsrr6QAxf2jvoHdP5tLaQ5Znl0L2fO7Nf0RW8daHfvbnYdc+hF
	 EVilj0IoY2f3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/28] media: rockchip: rga: remove redundant
 rga_frame variables
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-spu-rga3-v7-9-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-9-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:37:37 +0000
Message-Id: <20260520233738.475191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Integer overflow in crop rectangle validation allows out-of-bounds=
 DMA access.
--

commit 33ab9b132f03dd68bd0a1628225764176f65c2db
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: remove redundant rga_frame variables

This commit removes the redundant width, height, and colorspace
variables from the rga_frame struct. It replaces their usage with
the equivalent values already stored in the existing pix member.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index c07207edffdb6..ca8d8a53dc251 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c

[ ... ]

> @@ -629,8 +621,8 @@ static int vidioc_s_selection(struct file *file, void=
 *priv,
>  		return -EINVAL;
>  	}
> =20
> -	if (s->r.left + s->r.width > f->width ||
> -	    s->r.top + s->r.height > f->height ||
> +	if (s->r.left + s->r.width > f->pix.width ||
> +	    s->r.top + s->r.height > f->pix.height ||

[Severity: High]
This is a pre-existing issue, but can this crop rectangle validation
be bypassed via integer overflow?

Since s->r.left is an __s32 (checked to be >=3D 0) and s->r.width is an __u=
32,
could their sum wrap around? For example, if an attacker sets
s->r.left =3D 0x60000001 and s->r.width =3D 0x9FFFFFFF, the sum wraps to 0.
This would bypass the > f->pix.width check, and the huge width also passes
s->r.width < MIN_WIDTH.

Even with the rga_check_scaling mitigation, couldn't the bypass still work?

By setting the destination s->r.width =3D 0xA0000000 (and s->r.left =3D 0x6=
0000000
to wrap), check_scaling_factor() evaluates src_size < dst_size
(0x9FFFFFFF < 0xA0000000) and computes src_size * hw->max_scaling_factor >=
=3D dst_size.
If max_scaling_factor is 8, 0x9FFFFFFF * 8 wraps around to 0xFFFFFFF8 in 32=
-bit
arithmetic, which evaluates to true and completely bypasses the scaling
bounds check.

Would the hardware then be programmed with (src_w - 1) & 0x1FFF
(e.g., 8190), causing the DMA engine to read/write 8190 pixels per line
and wildly exceed the actual V4L2 buffer allocation?

>  	    s->r.width < MIN_WIDTH || s->r.height < MIN_HEIGHT) {
>  		v4l2_dbg(debug, 1, &rga->v4l2_dev, "unsupported crop value.\n");
>  		return -EINVAL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D9
