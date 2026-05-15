Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914323FBB5C
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861662; cv=none; b=P99yg9OYZF1TOuWX/vhF6giwU21debokL0gYo0f4Nc7PBFK1//gxX4iVACa/mmsf5XDVtCfoTpDoD6NqU0tKQvOAaIKLXZG2RGZkr4ANdh2khE2d1LRX8JXUF048C9FUJIs+giUTVPVTNeyWlaZaSouYIb7xfOacC8ZP8vMPTAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861662; c=relaxed/simple;
	bh=0iwJQgkxnZ3S3Z+eMaNDD3tgjmUX1buStqNK/85/jWw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DjpkTgK+osnN9MVOF/7GBnwK84QpED+a2MyLXKHsesLj6CFjGoXUDU4oFgbz0BBJDsQxgZwf9Q95fYw05+/0ACT7CwB7kztRM7nX+jwc6uaFsocxAHAnASZMZFjFDpE7v698n1z/SQd1bbJkCNVnuE1xP+I0C2d0LcY9P6E3lpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqrfzD3d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqrfzD3d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561C0C2BCB0;
	Fri, 15 May 2026 16:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778861662;
	bh=0iwJQgkxnZ3S3Z+eMaNDD3tgjmUX1buStqNK/85/jWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=PqrfzD3dpNUZGA8U7uxUyGmEd1+lR+yRu4mUBXXEKr85eQ9JQxfVC2KjhI2OPBD9a
	 a2qmmoz85gHRpBUTqH2Ds95RexBNNPctm+VJ/CPMWEfhcrYL/erEL9ChepNYLHodzL
	 ZG3q245Q5CwMFNoYxFe5siX5Fo4mXnkcWPlWyaMatpY2e4Tx2EZTBi3MNLG2uPUptl
	 +woJMtuL0HyE4m7V/Ui1pxpUky918L87CWStp6HP4N9lgVaB9SQmySntWsK7epCQL2
	 schggQcE+1vrbWAgvJr4y3d6nE2kqxs4s1dKo1Hy1Ij/dHtHMjhP2zPM05zESMvIzB
	 k2Cyju+F5UlVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/28] media: rockchip: rga: announce and sync
 colorimetry
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-spu-rga3-v6-10-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-10-e547152eb9c9@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:14:13 +0000
Message-Id: <20260515161416.561C0C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Falsely advertising hardware capabilities for CSC quantization and=
 YCbCr encoding.
- [High] Missing validation and clamping of colorimetry fields in `vidioc_t=
ry_fmt`.
- [Medium] `vidioc_try_fmt` uses the CAPTURE queue's state instead of the O=
UTPUT queue's state as the default colorimetry.
- [Medium] `vidioc_try_fmt` accepts user-provided colorimetry for non-YUV f=
ormats, bypassing intended restrictions.
- [Low] Comment in `vidioc_enum_fmt` contradicts the implemented code.
--

commit 0b2b6b238c69f747c597a881c5d1349d57e712fe
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: announce and sync colorimetry
   =20
Announce the capability to adjust the quantization and ycbcr_enc on the
capture side and check if the SET_CSC flag is set when the colorimetry
is changed. Furthermore copy the colorimetry from the output to the
capture side to fix the currently failing v4l2-compliance tests, which
expect exactly this behavior.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index ca8d8a53dc251..8c34f73d69764 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -437,6 +437,15 @@ static int vidioc_enum_fmt(struct file *file, void *=
priv, struct v4l2_fmtdesc *f
>  	fmt =3D &formats[f->index];
>  	f->pixelformat =3D fmt->fourcc;
> =20
> +	if (f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE &&
> +	    f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +		return 0;
> +
> +	/* allow changing the quantization and xfer func for YUV formats */

This isn't a bug, but the comment mentions "xfer func" instead of
"ycbcr_enc", while the code sets V4L2_FMT_FLAG_CSC_YCBCR_ENC. Furthermore,
vidioc_try_fmt explicitly disallows modifying xfer_func.

> +	if (v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
> +		f->flags |=3D V4L2_FMT_FLAG_CSC_QUANTIZATION |
> +			    V4L2_FMT_FLAG_CSC_YCBCR_ENC;

Does the hardware actually support applying custom quantization and YCbCr
encoding matrices?

Looking at rga_cmd_set_trans_info() in rga-hw.c, the hardware configuration
backend appears to ignore quantization and ycbcr_enc, hardcoding the CSC
mode to either RGA_SRC_CSC_MODE_BT709_R0 or RGA_SRC_CSC_MODE_BT601_R0 based
purely on colorspace.

If the capabilities are announced merely to pass v4l2-compliance without
applying them in hardware, could this cause the driver to silently ignore
user requests and produce visually incorrect output?

[ ... ]

> @@ -459,8 +468,25 @@ static int vidioc_g_fmt(struct file *file, void *pri=
v, struct v4l2_format *f)
>  static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_for=
mat *f)
>  {
>  	struct v4l2_pix_format_mplane *pix_fmt =3D &f->fmt.pix_mp;
> +	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
>  	struct rga_fmt *fmt;
> =20
> +	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> +		const struct rga_frame *frm;
> +
> +		frm =3D rga_get_frame(ctx, f->type);

Is it correct to use the CAPTURE queue's state here instead of the OUTPUT
queue's state as the default colorimetry?

For memory-to-memory devices, when V4L2_PIX_FMT_FLAG_SET_CSC is not set on
the CAPTURE queue, it usually falls back to the colorimetry of the OUTPUT
queue (ctx->in). Fetching the frame with f->type resolves to ctx->out for
the CAPTURE queue.

If a user previously used SET_CSC to override the CAPTURE queue's
colorimetry, wouldn't a subsequent call without SET_CSC inherit this
overridden state instead of resetting to the OUTPUT queue's defaults?

> +		if (IS_ERR(frm))
> +			return PTR_ERR(frm);
> +
> +		if (!(pix_fmt->flags & V4L2_PIX_FMT_FLAG_SET_CSC)) {
> +			pix_fmt->quantization =3D frm->pix.quantization;
> +			pix_fmt->ycbcr_enc =3D frm->pix.ycbcr_enc;
> +		}

When V4L2_PIX_FMT_FLAG_SET_CSC is set, does this blindly accept
pix_fmt->quantization and pix_fmt->ycbcr_enc without validating if they are
supported enum values?

Additionally, does this enforce the restriction that colorimetry can only
be changed for YUV formats? vidioc_enum_fmt restricts the CSC flags to YUV
formats, but this code seems to honor SET_CSC on the CAPTURE queue
regardless of the format type, allowing arbitrary colorimetry values even
for RGB formats.

Furthermore, for the OUTPUT queue, the colorimetry fields don't seem to be
validated or resolved. Does the driver need to resolve
V4L2_COLORSPACE_DEFAULT to concrete standards and clamp unsupported values
during try_fmt as required by the V4L2 specification?

> +		/* disallow values not announced in vidioc_enum_fmt */
> +		pix_fmt->colorspace =3D frm->pix.colorspace;
> +		pix_fmt->xfer_func =3D frm->pix.xfer_func;
> +	}
> +
>  	fmt =3D rga_fmt_find(pix_fmt->pixelformat);
>  	if (!fmt)
>  		fmt =3D &formats[0];

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-spu-rga3-v=
6-0-e547152eb9c9@pengutronix.de?part=3D10
