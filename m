Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC18374E74
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320730; cv=none; b=AydBonagWGcu7vTVJ4uIBJqKcAI+h57QeMCdds662RdMLFs52o8hJm8EmtYNUWoc8+PsKTThUZQEB3WbwSUVwmHP7Wfi0aG9aD9KKLrjgfjJY9pcKYZmVFZnQr4FQncBfpat9DNu5KZwmmSAxZLBZrQNBnrD0sHSgSgaNhzXbeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320730; c=relaxed/simple;
	bh=isf2nylSxz7lZYX7O/TpYnsvhttMkNqfcwfzZlt4jOg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DFMrhcqWc5EfuGnQyYqmmrq8QyfQsVQeHsrzb3eeqbWB1yReoYILaMUFJ3BBr6gV+hFLi5CvgQcGJ/dS3MrUHWoQRdUbc6em7IRF71d2O1yG892/QQInzlxKZoKX33kOi5Jz2ygPm1ViAXFsCp+R9U/EUm9JEFgXEwG69NaQARQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJiuMrLq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJiuMrLq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF461F000E9;
	Wed, 20 May 2026 23:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320723;
	bh=8d7sdH4ian3g/p4nH7bPnLLm6hKJHyJs37ggUjrxbqU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HJiuMrLqCw2oDppcvYnLVO8jUkNfdAzcUIX8ZGiLhwqU1jflQAST9YdeiTPs25jkw
	 xRDpjbuAQ+nl+CuWAC9+g8auZUfGBHzl4KG9OQlBZMLe6A1pD4wWB8WGbH8AcGiqN/
	 JlJ0ESkalYZjW+DrveRr9wLeIfgUmd+CenE14IXsJeUavD2YgCCjO1op0wM7A2FRpH
	 Jsv+pKes4rdj6/upS8ZK+qtTL1GtVJNlqi/0PvuuYJWWarTAyMVPCzBKeGauEI26Pr
	 joM4lLSg8iCKl5SiCam7LRZO060DPzJ+xzuIYyHTESOmpBV9OO8fa2gt6LNIq/AARO
	 ATVbMGOW5IbKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/28] media: rockchip: rga: announce and sync
 colorimetry
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-spu-rga3-v7-10-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-10-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:45:22 +0000
Message-Id: <20260520234523.3AF461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [Medium] Hardware Mismatch / Fake API Implementation
- [Medium] State Corruption / Race Condition in vidioc_s_fmt
- [Medium] Uninitialized State Leak overriding valid TRY_FMT colorspace
- [Low] Missing Validation / API Violation for SET_CSC
- [Low] Code Quality / Documentation Mismatch in vidioc_enum_fmt

Pre-existing issues:
- [High] UAF / NULL Pointer Dereference due to unsynchronized stop_streaming
- [High] NULL Pointer Dereference in ISR when ctx is NULL
--

commit 1fbef10f8fc2594899895cefaffc9c924524b76e
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
Subject: media: rockchip: rga: announce and sync colorimetry

This patch announces the capability to adjust quantization and ycbcr_enc for
capture formats in the Rockchip RGA driver. It checks the SET_CSC flag
when colorimetry changes and synchronizes colorimetry from the output queue
to the capture queue to satisfy v4l2-compliance tests.

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

[Severity: Low]
Does the comment mismatch the code below? It mentions the xfer func, but the
flags set are for YCBCR_ENC.

> +	if (v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
> +		f->flags |=3D V4L2_FMT_FLAG_CSC_QUANTIZATION |
> +			    V4L2_FMT_FLAG_CSC_YCBCR_ENC;

[Severity: Medium]
Is it safe to advertise these CSC flags if the hardware doesn't enforce the=
m?

It appears the hardware programming logic ignores the quantization and
ycbcr_enc fields, determining the CSC mode based solely on the colorspace.

Falsely advertising capabilities to pass compliance tools without actual
hardware enforcement could lead to incorrect colorimetry outputs.

> +
>  	return 0;
>  }
> =20
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
> +		if (IS_ERR(frm))
> +			return PTR_ERR(frm);
> +
> +		if (!(pix_fmt->flags & V4L2_PIX_FMT_FLAG_SET_CSC)) {

[Severity: Low]
Could this accept the SET_CSC flag for any format? The code in enum_fmt
restricts the CSC capability flags to YUV formats, but there doesn't seem
to be a check here to validate if the requested format is actually YUV.

Additionally, should the driver clear the SET_CSC flag from pix_fmt->flags
if the CSC settings are not supported for the requested format?

> +			pix_fmt->quantization =3D frm->pix.quantization;
> +			pix_fmt->ycbcr_enc =3D frm->pix.ycbcr_enc;
> +		}
> +		/* disallow values not announced in vidioc_enum_fmt */
> +		pix_fmt->colorspace =3D frm->pix.colorspace;

[Severity: Medium]
Will this overwrite a valid requested colorspace with an uninitialized valu=
e?

During context initialization, ctx->out.pix.colorspace defaults to 0
(V4L2_COLORSPACE_DEFAULT).

If an application calls TRY_FMT on the capture queue before configuring
the output queue, this logic forcibly replaces the user-provided
colorspace with 0. Returning V4L2_COLORSPACE_DEFAULT from TRY_FMT is
generally disallowed by the API.

> +		pix_fmt->xfer_func =3D frm->pix.xfer_func;
> +	}
> +
>  	fmt =3D rga_fmt_find(pix_fmt->pixelformat);
>  	if (!fmt)

[ ... ]

> @@ -506,6 +532,17 @@ static int vidioc_s_fmt(struct file *file, void *pri=
v, struct v4l2_format *f)
>  	frm->fmt =3D rga_fmt_find(pix_fmt->pixelformat);
>  	frm->stride =3D pix_fmt->plane_fmt[0].bytesperline;
> =20
> +	/*
> +	 * Copy colorimetry from output to capture as required by the
> +	 * v4l2-compliance tests
> +	 */
> +	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
> +		ctx->out.pix.colorspace =3D pix_fmt->colorspace;
> +		ctx->out.pix.ycbcr_enc =3D pix_fmt->ycbcr_enc;
> +		ctx->out.pix.quantization =3D pix_fmt->quantization;
> +		ctx->out.pix.xfer_func =3D pix_fmt->xfer_func;
> +	}

[Severity: Medium]
Can this create a race condition if the CAPTURE queue is currently streamin=
g?

The driver correctly checks if the OUTPUT queue is busy earlier in this
function, but it doesn't verify if the CAPTURE queue is active.

Mutating ctx->out.pix while the CAPTURE queue is active could cause
hardware configuration routines to asynchronously read corrupted or
intermediate state without appropriate queue locks.

> +
>  	/* Reset crop settings */
>  	frm->crop.left =3D 0;
>  	frm->crop.top =3D 0;

[Severity: High]
This is a pre-existing issue, but does rga_buf_stop_streaming() leave
hardware jobs running when clearing the queues?

When rga_buf_stop_streaming() calls rga_buf_return_buffers() with
VB2_BUF_STATE_ERROR, it removes all buffers from the M2M context queues.
However, it does not appear to instruct the hardware to stop processing
the current frame or wait for completion.

When the active hardware job completes, it triggers an interrupt, and
the ISR attempts to fetch processed buffers via v4l2_m2m_src_buf_remove().
Since the queue was emptied, this returns NULL, which then gets blindly
dereferenced in v4l2_m2m_buf_copy_metadata().

[Severity: High]
This is a pre-existing issue, but is it possible for rga_isr() to
dereference a NULL context pointer?

In rga_isr(), the driver assigns ctx =3D rga->curr. If ctx is NULL due to
a spurious interrupt or delayed state update, the driver triggers a
warning via WARN_ON(!ctx).

However, execution continues and the driver immediately dereferences the
NULL ctx pointer in the call to v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx),
leading to a crash.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D10
