Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96203BED0C
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779319836; cv=none; b=fV5vsrwU3j4iikyv+VTTdCOVL+Sjbibu6/D8wMLJ+eEN7Mo/UNCS9uLE5mXiRo5njS5ODhGsSOGErdHqTAsc3cfBc8gTuq7OdQdf/nk9tbumcGakzjBGp6193Jmwz4oLlRgDkG9kUa5PNPQwiVrcXK6XZAvI20lO8DA0fOEpP8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779319836; c=relaxed/simple;
	bh=6wHv0s1YXleKPYXB3arvh9zKaB5ocZTXymlivhtYqKE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nhF8yeDSUeqW2AtOKpEIffly4uJOHOtNMxgFQHdCzVnYDnQ8EUgKW8FUobdTz9cxZkN8GwRTkOrUXR+pDe8L/4UAg+nzXcLLa0vuGLZNEHhHnYQYYmO2zDjoS7EHOwGAhv9110sSgk8V7JIjdN0qlS7TtqmLjN1BG29PzRPEln0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mq1MaOWO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mq1MaOWO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF881F000E9;
	Wed, 20 May 2026 23:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779319834;
	bh=7j7egMXFbr0ES7f8vtVjJSlHUSGRHmMAiPQaqqdaVUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mq1MaOWOoGvoOjVuX4Rn0JajbwBw5t74IxSpGREAEXwIfTQLSFZ0ckAb7fKe3IQ35
	 IzqRJekclqQRmQUFSYpeNpT0eWL0lLenmJb9Ze97X2LRHumqobU9rzW0Tbo4+CDcsx
	 SGNxtogyMfmXfU5jI7KUqLUrB8RD7V0bRGi+WnBN6r/PCK93Ba117tlD23leFyIubW
	 YKjBEHAXIIpotPCZK3nG4LCYgP51qb4ZnCcXMKKy8SAEliqD9fPLLxlwRtu75cdjsS
	 WMwrZty7f21HzgKfPUwuzZ5uCWloLtbmnPrVhg6WksLgAZeUBUBZsyUohs/LStCH1d
	 qDwyv0vtS0hNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 16/28] media: rockchip: rga: reuse cmdbuf contents
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521-spu-rga3-v7-16-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-16-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:30:34 +0000
Message-Id: <20260520233034.6EF881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Prematurely releasing `ctrl_lock` in `device_run()` creates a =
race condition with V4L2 control updates, leading to mismatched DMA offsets=
 and potential out-of-bounds memory writes.
- [Critical] Modifying `ctx->cmdbuf_dirty` and crop settings in `vidioc_s_s=
election()` without holding `ctrl_lock` causes a data race with `device_run=
()`, leading to out-of-bounds DMA reads/writes.
--

commit 1de4a02a0f92b85a965f47ad17f866f83247fbba
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: reuse cmdbuf contents

This commit reuses the command buffer contents instead of completely
rewriting it for every frame. A new cmdbuf_dirty flag tracks whether
the command buffer needs to be rewritten on the next frame.

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

[Severity: Critical]
Could dropping the ctrl_lock before calling rga->hw->start() lead to an
out-of-bounds DMA write?

In device_run(), rga->hw->setup_cmdbuf() is called while holding ctrl_lock,
configuring the hardware transformation flags (e.g., rot_mode based on
ctx->rotate).

After the lock is dropped, rga->hw->start() executes and calls
rga_cmd_set_dst_info(), which reads ctx->rotate again to calculate the
destination DMA start address:

device_run()
  rga->hw->start()
    rga_cmd_set()
      rga_cmd_set_dst_info()
        switch (ctx->rotate) {
        ...

Since device_run() runs asynchronously, could userspace concurrently call
VIDIOC_S_EXT_CTRLS, allowing rga_s_ctrl() to modify ctx->rotate during this
lockless window? This might leave the hardware command buffer with a rot_mo=
de
of 0 but destination offsets calculated for a 90-degree rotation, causing t=
he
hardware to start DMA at an incorrect coordinate and draw linearly past the
buffer bounds.

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

[Severity: Critical]
Does modifying ctx->cmdbuf_dirty and f->crop without holding ctrl_lock caus=
e a
data race with device_run()?

If device_run() executes concurrently and reads cmdbuf_dirty as false, it
would skip calling setup_cmdbuf(), leaving the old active dimensions in
RGA_SRC_ACT_INFO.

Later, device_run() unconditionally calls rga_cmd_set_src_info(), which rea=
ds
the new f->crop.left and f->crop.top to calculate the DMA start offset. If
the new crop offset is large but the hardware retains the old, larger active
width, could the calculated DMA end address exceed the buffer's bounds,
leading to an out-of-bounds DMA read or write?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D16
