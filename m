Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A664C042E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778864073; cv=none; b=K16X36qehzYxL5GSY+ol5RU3nLVC8csx4Jg4xfqKcixy8g0RkaIRXNjETzV8ISXJXkY8QT7MMfyavt9UqC4SfkH1+qqT6/uzVcCNyQPaN1VO/id2B+ui3A1UXzYRKfiLsoDX9CJUB9eJPGNofVQIZtJL5oz/6B4UUWu362MLgpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778864073; c=relaxed/simple;
	bh=HD80Lt+xbz3gfjEsuQT/Dzd7y4NTG/QP/Y76EPq4eoM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AZQdXaNk0QvoBvVUJOHtb0FAmMvxu5WceBloWz66sG2NIh0dGg5zZjBjZVbqzvxlBtYKwbqQ7NwDlkWbDqmSmu3gq+Fq1itp5uLY70oLPFZVENKAM1wNFYaE257P0gHLpcrQU3YaVirVknB6P2qmpoX+eP8plqDhGBR2NRCYVO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqxSQLHy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqxSQLHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E7EC2BCB0;
	Fri, 15 May 2026 16:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778864073;
	bh=HD80Lt+xbz3gfjEsuQT/Dzd7y4NTG/QP/Y76EPq4eoM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=NqxSQLHyJyKTKzLR97359bxEy11blSB2116vv+Bh2AtJTwdc3YxQH55k8/UqXPheS
	 r1j7C3nOe4lvp/a5gj+Rmo2Eml88lhSilEOEk6CrzvL3A3d9O5Ba6eYOUqV5tvo7sn
	 Dfj2zhbEM8Yp2UGpi3i0pyuv89NZP2RBnRplgT5jL+uh116glQpqYjHV1cjS2XCIwg
	 aXrbjiY3ZVKag3VaWwE9PouqCtBq3l5K7SgoP56Tbw9yJyEobAxpTgJXD44OnekSbU
	 1bHNaN7Vx36LfId49BhHXo6tVDKVTZWmALXLGmSbNJnoN/QflwRePf/lWvwUc27aDV
	 5AnfYXwSkXhDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 17/28] media: rockchip: rga: check scaling factor
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-spu-rga3-v6-17-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-17-e547152eb9c9@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:54:32 +0000
Message-Id: <20260515165433.30E7EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Data race and torn reads in vidioc_s_selection due to missing spin=
lock protection.
- [High] Concurrency between V4L2 controls and IOCTLs bypasses hardware sca=
ling limits, allowing device hangs.
- [Medium] vidioc_s_selection violates V4L2 API contract by returning an er=
ror instead of adjusting the rectangle.
--

commit 807ac9fa5320ff60d938b4d5476ad5199ff6b979
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: check scaling factor

This commit introduces checks for the scaling factor to avoid potential han=
gs
in the RGA hardware when the maximum scaling limit is exceeded. It adds
checks in prepare_streaming, vidioc_s_selection, and when setting the
rotation control.

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

Can this validation be bypassed due to concurrent calls?

rga_s_ctrl() operates under the V4L2 control lock and ctx->rga->ctrl_lock,
but vidioc_s_selection() operates under the global rga->mutex. If Thread A
calls VIDIOC_S_SELECTION and Thread B calls VIDIOC_S_CTRL concurrently, cou=
ld
they both independently validate their new states against the old state,
resulting in a combined crop and rotation that exceeds the hardware scaling
limit?

Also, if Thread A is in the middle of preparing a stream and q->streaming is
still 0, could Thread B invoke S_CTRL, see that vb2_is_streaming() is false,
and apply an invalid rotation without validation?

> +			if (ret < 0)
> +				goto s_ctrl_done;
> +		}
>  		ctx->rotate =3D ctrl->val;
>  		break;

[ ... ]

> @@ -569,10 +611,25 @@ static int vidioc_s_selection(struct file *file, vo=
id *priv,
>  		return -EINVAL;
>  	}
> =20
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

Does this violate the V4L2 API specification for VIDIOC_S_SELECTION?

The V4L2 specification requires drivers to adjust the requested rectangle
coordinates and sizes to the closest possible valid values rather than
returning an error code when hardware constraints are violated. Could
returning -EINVAL here break userspace applications that rely on standard
format negotiation?

> +	}
> +
>  	f->crop =3D s->r;
>  	ctx->cmdbuf_dirty =3D true;

Can this cause a data race resulting in torn reads?

This updates f->crop, which is a 16-byte struct v4l2_rect, and
ctx->cmdbuf_dirty without holding ctx->rga->ctrl_lock. Since the driver
permits selection changes while streaming, can the M2M worker thread read
these crop rectangles concurrently during rga_hw_setup_cmdbuf() while
holding ctrl_lock?

If the assignment is not atomic, could the worker thread read a torn struct
(such as the new width but the old height) and program the DMA engine with
invalid coordinates, potentially leading to out-of-bounds memory accesses or
device hangs?

> =20
> -	return ret;
> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-spu-rga3-v=
6-0-e547152eb9c9@pengutronix.de?part=3D17
