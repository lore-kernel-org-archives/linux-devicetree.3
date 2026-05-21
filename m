Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D532220ED
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779322131; cv=none; b=nkFR2j7l48OMNlmQ6rmMslHqeoJ49jfWscyKQfVwtLND2wW4/MX+P0M/kp6gcuilyv0E1A/VhK66YvTLJWEzygb/uitgjupj2t6VAsn5KOzJuOONp0RVG+EWacJnFdJxB5LliJpCjTHZTfaiQBMF02p3Rgc76rKTDuZS3XTylcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779322131; c=relaxed/simple;
	bh=D4C/vyh5ZxbCHqlLXqncvluuw/lOa6Re/wwqBMaQD28=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=trt5BDycDW/rs4fEkKKV+qF9XtDoRawOYNh6dXwH5S7OBruExIa3HJH3t9Ys4ZkDOJi0qnxvX1m5Ygl+4z/UBnY9XF9HBn6twCL81DICyAOeAp9XBlvTsYmYWcbBuXeiWVYhYzp3kCwELio8UNKhj9U/k9KLiwkEAqkmVOEzJ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyINO5y2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyINO5y2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1D01F000E9;
	Thu, 21 May 2026 00:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779322128;
	bh=yXE4KnZhJhYMaHXCHTnY7/M2sWdD9OGmTK6Dq7IOIHI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NyINO5y21Mnz5i3Qk+4xXYbqURB1BgLWwF27tNeoh0s3szjL8n+mSN9iScTNQETLx
	 RBfF7j4FRfrgrviTQAIS4KDbXPpGyvCUSfJcjgjJc21qsp5VukhEPWlNEZudSMsB1v
	 hWw4FylapNFknz6Eq9QQHEagr39JbPyVORAofiALFl6QD4ldiD6pDnep3SdWiuBTL3
	 WHeUAdS6ZddIDUYncRznqNcWh2vKKeJ0dW11iABD+Vr7RIJRe7ms4SSoUkT4aC42fs
	 i+mz1DDoG2WAigvwJSwoAhGnAP54c+8EOlvZIJxl4pHT8COOP1ToUd+Ec0JZVTubI+
	 D6TEXQve7ToqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 27/28] media: rockchip: rga: add rga3 support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-spu-rga3-v7-27-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-27-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 00:08:48 +0000
Message-Id: <20260521000848.9A1D01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Critical] Shared IRQ handler accesses hardware without checking Runtime =
PM state, causing kernel panics
- [High] DMA API Violation and Out-of-bounds Memory Sync in `rga3_hw_start(=
)`
- [High] Hardware error interrupts are masked, causing silent data corrupti=
on and indefinite V4L2 M2M job hangs

Pre-existing issues:
- [High] Asynchronous `pm_runtime_put()` is cancelled by `pm_runtime_disabl=
e()`, leaving the hardware powered on
--

commit 5a43e090bcb6b1ca034a9baa9419e29351bc1417
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: add rga3 support
   =20
Add support for the RGA3 unit contained in the RK3588.
Only a basic feature set consisting of scaling and color conversion is
implemented.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 0152b8ef2da2f..b3cb6bf8eb863 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -913,6 +913,10 @@ static const struct of_device_id rockchip_rga_match[=
] =3D {
>  		.compatible =3D "rockchip,rk3399-rga",
>  		.data =3D &rga2_hw,
>  	},
> +	{
> +		.compatible =3D "rockchip,rk3588-rga3",
> +		.data =3D &rga3_hw,
> +	},

[Severity: High]
This is a pre-existing issue, but looking at the overall driver's error
handling in rga_probe() and rga_remove(), is the hardware being properly
powered down?

The driver drops its PM reference using an asynchronous pm_runtime_put(),
followed immediately by pm_runtime_disable().

Since pm_runtime_disable() cancels pending async suspend operations, this
leaves the hardware powered on.

Would it be better to use a synchronous pm_runtime_put_sync() here instead?

>  	{},
>  };

[ ... ]

> diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/medi=
a/platform/rockchip/rga/rga3-hw.c
> new file mode 100644
> index 0000000000000..ca1c268303dd4
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rga/rga3-hw.c

[ ... ]

> +static void rga3_hw_start(struct rockchip_rga *rga,
> +			  struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
> +{
> +	struct rga_ctx *ctx =3D rga->curr;
> +
> +	rga3_cmd_set_win0_addr(ctx, &src->dma_addrs);
> +	rga3_cmd_set_wr_addr(ctx, &dst->dma_addrs);
> +
> +	rga_write(rga, RGA3_CMD_ADDR, ctx->cmdbuf_phy);
> +
> +	/* sync CMD buf for RGA */
> +	dma_sync_single_for_device(rga->dev, ctx->cmdbuf_phy,
> +				   PAGE_SIZE, DMA_BIDIRECTIONAL);

[Severity: High]
Is it correct to call dma_sync_single_for_device() here?

The command buffer (ctx->cmdbuf_virt) appears to be allocated via
dma_alloc_attrs() with DMA_ATTR_WRITE_COMBINE, which returns coherent memor=
y.
Using streaming DMA syncs on coherent allocations violates the DMA API.

Does this sync operation also exceed the buffer bounds? The driver
synchronizes a hardcoded PAGE_SIZE (4096 bytes) despite the actual buffer
size (RGA3_CMDBUF_SIZE) being only 184 bytes. Could this cause memory
corruption or IOMMU faults?

> +
> +	/* set to master mode and start the conversion */
> +	rga_write(rga, RGA3_SYS_CTRL,
> +		  FIELD_PREP(RGA3_CMD_MODE, RGA3_CMD_MODE_MASTER));
> +	rga_write(rga, RGA3_INT_EN, FIELD_PREP(RGA3_INT_FRM_DONE, 1));

[Severity: High]
Are there other hardware error interrupts that should be enabled here?

Currently, only the RGA3_INT_FRM_DONE interrupt is enabled via RGA3_INT_EN,
while error interrupts like bus errors or FIFO errors appear to be masked.

If the hardware halts due to a fault, no interrupt would be triggered.
Could this cause the M2M framework to hang indefinitely while waiting for
v4l2_m2m_job_finish(), or silently pass corrupted data if FRM_DONE is
somehow set?

> +	rga_write(rga, RGA3_CMD_CTRL,
> +		  FIELD_PREP(RGA3_CMD_LINE_START_PULSE, 1));
> +}
> +
> +static bool rga3_handle_irq(struct rockchip_rga *rga)
> +{
> +	u32 intr;
> +
> +	intr =3D rga_read(rga, RGA3_INT_RAW);

[Severity: Critical]
Can this register read trigger an asynchronous external abort if the
device is suspended?

Because RGA3 sets has_internal_iommu =3D false, the driver requests an
IRQF_SHARED interrupt. The shared ISR (rga_isr) can be invoked concurrently
by other devices on the same line, leading to this hardware access without
calling pm_runtime_get_if_active() first.

Does rga_runtime_suspend() also need to call synchronize_irq() to ensure
no IRQ handler is executing mid-flight before the clocks are disabled?

> +	/* clear all interrupts */
> +	rga_write(rga, RGA3_INT_CLR, intr);
> +
> +	return FIELD_GET(RGA3_INT_FRM_DONE, intr);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D27
