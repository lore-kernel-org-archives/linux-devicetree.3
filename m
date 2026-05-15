Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBDC30569F
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860761; cv=none; b=ix6V4jtKgmrMArbCiAcc7qWlgLG3Q0/6rUwJtjD2UZlXXvNt78IlvxRI+D7594WZiL00AhyTmgDlNsxi9Brr9l5f8Yl7jVu9hXZQZOb1Qd75MDjL/cYAAbH3mESUeGsvGDFY611Jc5tUNDm+PCSek7dbrDqcDu2ixnSYfaxSFqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860761; c=relaxed/simple;
	bh=X+FqpmXKFBMkyZ0RHCnsaWOpHHuiIf8VaFigHQUAHZw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kcp4r+LXquwybkzxtBL9G4MtqBsswMhdXIMqk8CWKsYqW3tpiOGjssvzPP/c+DtKLsEV5qFXOjRgRa2us1VH0q1GPlzGPeTPlwcW1oWObMX7TGEnOWr2SMdJsT9KEA2ocn3sM0K1Q+NFc5H3p4Z3Svx5j/1Yf6WSBpbJdZu7Oak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWkyN5Sg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWkyN5Sg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4EAC2BCC7;
	Fri, 15 May 2026 15:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778860761;
	bh=X+FqpmXKFBMkyZ0RHCnsaWOpHHuiIf8VaFigHQUAHZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gWkyN5SgO9nX4i8ad54VamWOLMoKu+uTZy3DbBAXMP8WmrgAG9iOpH9KRPlCCqen8
	 PMB9TE2fSvypYlXuLcg0o7+evoZpNwlInK+r4+/C+w6SlIpudq7SODNFGJ37YTqeeM
	 ReQSazEryHQqFuHhL4Ybr5PimV0L76TfLHS77JKBwTLxMtRIapaWCF607zhzLJ0GI9
	 1KzPaUUF2xPBpIo7JpqPS1LDKKidVmusSh8df6Xtt78fbANhdTJKUSD1VtVDH5mOu7
	 LTK6AbRgg67YLr6YB0n0bTictab8Plc7xqhl0/vwgjs3f1Xg4Tu397+rTg2XyPvwDl
	 mXL6SQBElIsdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 16/28] media: rockchip: rga: reuse cmdbuf contents
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-spu-rga3-v6-16-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-16-e547152eb9c9@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 15:59:21 +0000
Message-Id: <20260515155921.6A4EAC2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Reducing the scope of `rga->ctrl_lock` in `device_run()` intro=
duces a critical data race with concurrent V4L2 control updates, leading to=
 inconsistent hardware command buffers and potential Out-Of-Bounds (OOB) DM=
A writes.
- [High] The newly introduced `ctx->cmdbuf_dirty` flag is updated in `vidio=
c_s_selection()` without holding `rga->ctrl_lock`, leading to lost updates =
and stale hardware configurations.
--

commit 9452d2457b5f041e524a98332bf069eeaf1ac9a6
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: reuse cmdbuf contents

This commit optimizes the command buffer programming by reusing its contents
instead of rewriting it completely for every frame. It introduces a
cmdbuf_dirty flag to track when rewriting is necessary.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -38,6 +38,11 @@ static void device_run(void *prv)
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(&rga->ctrl_lock, flags);
> +	if (ctx->cmdbuf_dirty) {
> +		ctx->cmdbuf_dirty =3D false;
> +		rga->hw->setup_cmdbuf(ctx);
> +	}
> +	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
> =20
>  	rga->curr =3D ctx;
> =20
> @@ -47,8 +52,6 @@ static void device_run(void *prv)
>  	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> =20
>  	rga->hw->start(rga, vb_to_rga(src), vb_to_rga(dst));
> -
> -	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
>  }

Can dropping rga->ctrl_lock before calling rga->hw->start() introduce a
data race with concurrent V4L2 control updates?

If VIDIOC_S_CTRL executes concurrently, rga_s_ctrl() modifies ctx->vflip,
ctx->hflip, and ctx->rotate under ctrl_lock.

Since rga->hw->start() calls rga_cmd_set() which then calls
rga_cmd_set_dst_info(), it reads these same control values to calculate the
destination DMA base address without holding the lock.

Could this result in setup_cmdbuf() programming the core hardware
transformation settings with old control values, while
rga_cmd_set_dst_info() uses new control values? If a flip control is
toggled during this window, might the hardware execute a normal copy but
start from a flipped destination offset, writing outside the allocated
boundaries of the DMA buffer?

[ ... ]

> @@ -564,6 +570,7 @@ static int vidioc_s_selection(struct file *file, void=
 *priv,
>  	}
> =20
>  	f->crop =3D s->r;
> +	ctx->cmdbuf_dirty =3D true;
> =20
>  	return ret;
>  }

Does setting ctx->cmdbuf_dirty without holding rga->ctrl_lock lead to lost
updates?

Unlike vidioc_s_fmt(), vidioc_s_selection() does not appear to check if the
queue is busy, which means it could execute concurrently with active
streaming and the M2M worker thread running device_run().

If vidioc_s_selection() sets the flag at the same moment device_run()
clears it, could the update be lost?

Additionally, if f->crop is updated between device_run() calling
setup_cmdbuf() and rga_cmd_set_dst_info(), could the hardware be
programmed with mismatched active size and DMA destination addresses,
potentially causing out-of-bounds DMA writes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-spu-rga3-v=
6-0-e547152eb9c9@pengutronix.de?part=3D16
