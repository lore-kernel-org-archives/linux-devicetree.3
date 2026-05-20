Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF9B3C4545
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320540; cv=none; b=VOslsJoiHildxccUA090npzSkOasN4zDvBjp5nPCZwBMWRZoG9KzrwR5hVnFscFtmdgpw6SuB7Ak0/Zh6TGQ2GR8UiQQf1W4AxBVHq4mzeM7TTn7HQYjUUFLVXp+e/Fhvz39yMGBapCfKzEmaWTlDMTpTunRkTmewuL8jaCXYpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320540; c=relaxed/simple;
	bh=V0csnrrI1Tln0aNPGCjQOx6DKi/sH0jgoLl2+oOBHyA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s0+7A2QflReteEy+kgDI+867waKbF0q5yHadwAUclZt5bBDTO/cegiu1ggmNuHm8qGAiQf9wd7G9wFnArc7+3SDjKBe74Mx7FeNdIaA6E5VOwpagMNMNotDh6x5YCRDFzF8l5q5O5KL45tMf644kDutBLundstmDd3itHRc3ZDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CE0DvWIS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CE0DvWIS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2EF1F000E9;
	Wed, 20 May 2026 23:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320538;
	bh=PlZ7YxRDJzRo90b8+UsDvUeuU6qMU2ToHRfsFCxbuYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CE0DvWISZ2nsyDJlFq7LKWp1nJAd/L02FOKI+/xX2EVkdsMlH/5ADstOWW8TMez+Y
	 WpoFEfiOnVtXxtrFwo0Wom2Qcc4wgS+4ETu7kmOm9Gvjkh5j5OCB7IkSpsXN5lNF+8
	 oo3nRoXVHU/b1f6YaEiF48paA063h6NUC0xZHxdPvNVQtU/0RZ5Q41LRMF9y8EXTLo
	 K1Dd/31K8gW9VJ30nyhOlJAGV9StDFo7H1IdBAoGiq6rJ2RienbwreBJAEXKo2brzi
	 kkh0Du3af/+YwlHg/4Ysk7Zu9xSapuUNJ2Z7Wrw/87WX+JQeGd4kU9SafmT03/BM03
	 MF+zWrrGd423A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 17/28] media: rockchip: rga: check scaling factor
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521-spu-rga3-v7-17-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-17-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:42:16 +0000
Message-Id: <20260520234218.7F2EF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Unprotected concurrent accesses and TOCTOU races between `VIDIOC_S=
_CTRL`, `VIDIOC_S_SELECTION`, and `VIDIOC_STREAMON` allow bypass of scaling=
 limits and cause struct tearing.

Pre-existing issues:
- [High] Unsynchronized modification of `f->crop` and `ctx->cmdbuf_dirty` i=
n `vidioc_s_selection` leads to potential data races and struct tearing whe=
n read by `device_run`.
- [High] Integer overflow in `vidioc_s_selection` bounds check allows out-o=
f-bounds crop values.
--

commit 51e5c59f315703fdbb1a5279ab9158d07280eca5
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: check scaling factor

Check the scaling factor to avoid potential problems. This is relevant
for the upcoming RGA3 support, as it can hang when the scaling factor
is exceeded.

> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index ffc6162b2e681..dcaba66f5c1fc 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
[ ... ]
> @@ -197,6 +197,33 @@ static void rga_buf_return_buffers(struct vb2_queue =
*q,
>  	}
>  }
> =20
> +static int rga_buf_prepare_streaming(struct vb2_queue *q)
> +{
> +	struct rga_ctx *ctx =3D vb2_get_drv_priv(q);
> +	const struct rga_hw *hw =3D ctx->rga->hw;
> +	int ret;
> +
> +	/* It's safe to check the streaming state of the other queue,
> +	 * as the streamon ioctl's can't race due to the lock set in
> +	 * the queue_init function.
> +	 */
> +	if ((V4L2_TYPE_IS_OUTPUT(q->type) &&
> +	     vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx))) ||
> +	    (V4L2_TYPE_IS_CAPTURE(q->type) &&
> +	     vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)))) {
> +		/*
> +		 * As the other side is already streaming,
> +		 * check that the max scaling factor isn't exceeded.
> +		 */
> +		ret =3D rga_check_scaling(hw, &ctx->in.crop, &ctx->out.crop,
> +					ctx->rotate);

[Severity: High]
Does this code introduce a TOCTOU race with VIDIOC_S_CTRL?

rga_buf_prepare_streaming() checks the scaling factor just before the V4L2
core sets q->streaming =3D 1. If VIDIOC_S_CTRL executes in this window, its
vb2_is_streaming() check evaluates to false, bypassing the limit check and
applying an invalid rotation just as streaming starts.

> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
[ ... ]
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 394b14b9469df..22954bbae55fc 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -127,7 +127,9 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct rga_ctx *ctx =3D container_of(ctrl->handler, struct rga_ctx,
>  					   ctrl_handler);
> +	const struct rga_hw *hw =3D ctx->rga->hw;
>  	unsigned long flags;
> +	int ret =3D 0;
> =20
>  	spin_lock_irqsave(&ctx->rga->ctrl_lock, flags);
>  	switch (ctrl->id) {
> @@ -138,6 +140,13 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ctx->vflip =3D ctrl->val;
>  		break;
>  	case V4L2_CID_ROTATE:
> +		if (vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)) &&
> +		    vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx))) {
> +			ret =3D rga_check_scaling(hw, &ctx->in.crop,
> +						&ctx->out.crop, ctrl->val);

[Severity: High]
Are there concurrent access issues and TOCTOU races between rga_s_ctrl() and
vidioc_s_selection() here?

This check relies on crop_in and crop_out, but rga_s_ctrl() uses the control
handler lock and ctrl_lock, while vidioc_s_selection() uses rga->mutex.
rga_s_ctrl() reads ctx->in.crop and ctx->out.crop here while holding
ctrl_lock, but vidioc_s_selection() modifies them concurrently without
taking ctrl_lock, which could lead to struct tearing.

Additionally, concurrent calls to VIDIOC_S_CTRL and VIDIOC_S_SELECTION could
validate their new values against the other's stale values, independently
passing the checks but resulting in an invalid combined state.

> +			if (ret < 0)
> +				goto s_ctrl_done;
> +		}
>  		ctx->rotate =3D ctrl->val;
>  		break;
>  	case V4L2_CID_BG_COLOR:
[ ... ]
> @@ -569,10 +611,25 @@ static int vidioc_s_selection(struct file *file, vo=
id *priv,
>  		return -EINVAL;
>  	}
> =20

[Severity: High]
This is a pre-existing issue, but does the bounds check just before this
code allow integer overflows?

If an attacker provides a large s->r.left (e.g., 0x7FFFFFFF) and a huge
s->r.width (e.g., 0x80000001), their 32-bit unsigned addition wraps around
to 0 in the check:

	if (s->r.left + s->r.width > f->pix.width ||
	    s->r.top + s->r.height > f->pix.height ||

Since 0 is not greater than f->pix.width, the check passes. The massive wid=
th
value is then stored and programmed into the RGA hardware registers, bypass=
ing
dimension constraints and leading to out-of-bounds DMA access.

> +	if (vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)) &&
> +	    vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx))) {
> +		int ret =3D 0;
> +
> +		if (V4L2_TYPE_IS_OUTPUT(s->type))
> +			ret =3D rga_check_scaling(rga->hw, &s->r, &ctx->out.crop,
> +						ctx->rotate);
> +		else
> +			ret =3D rga_check_scaling(rga->hw, &ctx->in.crop, &s->r,
> +						ctx->rotate);
> +
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	f->crop =3D s->r;
>  	ctx->cmdbuf_dirty =3D true;

[Severity: High]
This is a pre-existing issue, but can the unsynchronized modification of
f->crop and ctx->cmdbuf_dirty here lead to struct tearing when read by
device_run()?

vidioc_s_selection() modifies f->crop (a 16-byte v4l2_rect struct) and sets
ctx->cmdbuf_dirty =3D true holding only rga->mutex. Concurrently, device_ru=
n()
(running asynchronously in a worker thread) takes ctrl_lock, checks
cmdbuf_dirty, and reads the crop dimensions via setup_cmdbuf().

This lack of synchronization allows setup_cmdbuf() to read partially updated
bounds or process a dirty state before the crop updates are fully visible,
potentially programming the hardware with arbitrary dimensions.

> =20
> -	return ret;
> +	return 0;
>  }
> =20
>  static const struct v4l2_ioctl_ops rga_ioctl_ops =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D17
