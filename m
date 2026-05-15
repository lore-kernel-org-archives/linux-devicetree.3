Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C253C0A13
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862884; cv=none; b=J2/FqiWntnFYSInIZH9WWq/5qTvGLWagDdxBigOebCyRuYIsr3roJ+JHUnAzEIbUFvAnI6PcXqnSNxN7epHycya2tAcMy1dQkblBIWUr1tMa8hi96ASir4attvlp1Tjde00qaU/pcke8152zXMv/jK3qzeW+3ThmzBwoq84XCJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862884; c=relaxed/simple;
	bh=HgrByMvNZF3vHRBVIiH1R5dJ3gZJqA+h2jvQP6nLDzI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AbRQjxMukMndDaQjNMEZR7ypL5/LSeLHsZkwNN5mn3MYGdDZCvGqpAkcgTXvAQa/c6BODmFjOGtp8GPAop95Z2ptjpJwL3tqsP+Q46AUGJTGVqLh693g5LMEBvMqdb4uwhGg4ZDtB1c3R7SyOaXrOadTsQeGIPK2esg6JWyxEbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6EjXjJi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6EjXjJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73A0C2BCB0;
	Fri, 15 May 2026 16:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778862884;
	bh=HgrByMvNZF3vHRBVIiH1R5dJ3gZJqA+h2jvQP6nLDzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=s6EjXjJifLKfFA3LRqZRRtmmm37qZbdX0YhW3krBPaa3jysKn2zxbIPQvq3Gy3APd
	 vD+/6xcK+wJrVq48iGmPm29kalfdXitMHDSCJVP69lqagWMtgl+jRL/E/3a76tSPyC
	 9vKEhuKeQPjVR6Fa3aGlflfs4yycF54+MPtEJ9b7qQ8aKd1dZe0ZM7aSO5YEdRPSVj
	 CMDaEiiYmC3tNpWEZTnY6n3o2EiVR0ezivqrfZ9iTniXiAkczwoSA++JcAM3ZoE02t
	 76TRI43IMqISAgDhdMwepvQ/T461f29dJhBBw3bXEfcyAhwBx4w9Mq5Rxce51ym7K0
	 BqDz1Yovly/qA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 27/28] media: rockchip: rga: add rga3 support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-spu-rga3-v6-27-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-27-e547152eb9c9@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:34:43 +0000
Message-Id: <20260515163443.B73A0C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Kernel Panic on Shared IRQ due to missing PM Runtime active ch=
eck
- [High] DMA API Violation and Out-of-bounds Cache Sync on Coherent Memory
- [High] Silent API Failure of Crop Coordinates
- [Medium] Hardware Error Interrupts Masked
--

commit 71c16e32b64b60b7b83f81a3d0e8a736dfa30182
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
Subject: media: rockchip: rga: add rga3 support

Add support for the RGA3 unit contained in the RK3588. Only a basic
feature set consisting of scaling and color conversion is implemented.

> diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/medi=
a/platform/rockchip/rga/rga3-hw.c
> new file mode 100644
> index 0000000000000..ca1c268303dd4
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rga/rga3-hw.c

[ ... ]

> +static void rga3_cmd_set_win0_addr(struct rga_ctx *ctx,
> +				   const struct rga_addrs *addrs)
> +{
> +	u32 *cmd =3D ctx->cmdbuf_virt;
> +	unsigned int reg;
> +
> +	reg =3D RGA3_WIN0_Y_BASE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D addrs->y_addr;
> +	reg =3D RGA3_WIN0_U_BASE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D addrs->u_addr;
> +}

Does this code ignore the crop coordinates (ctx->in.crop.top and
ctx->in.crop.left)?

In the existing RGA2 implementation, offsets are applied using
rga_get_corner_addrs(). Here, the unadjusted buffer base addresses are
used. If userspace sets a crop selection with non-zero top/left offsets,
the API call will succeed but the hardware will process the image starting
from (0, 0).

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

Is it safe to use dma_sync_single_for_device() on ctx->cmdbuf_phy?

The command buffer is allocated via dma_alloc_attrs() with
DMA_ATTR_WRITE_COMBINE, which provides coherent memory. The DMA API strictly
forbids using streaming sync functions on coherent or write-combined memory,
which can cause kernel panics or warnings when CONFIG_DMA_API_DEBUG is enab=
led.

Additionally, the sync size is hardcoded to PAGE_SIZE (4096 bytes), but
RGA3_CMDBUF_SIZE is only 184 bytes. Could this cause an out-of-bounds cache
sync and corrupt memory if SWIOTLB bounce buffers are used? Should a standa=
rd
memory write barrier (wmb()) be used instead?

> +	/* set to master mode and start the conversion */
> +	rga_write(rga, RGA3_SYS_CTRL,
> +		  FIELD_PREP(RGA3_CMD_MODE, RGA3_CMD_MODE_MASTER));
> +	rga_write(rga, RGA3_INT_EN, FIELD_PREP(RGA3_INT_FRM_DONE, 1));

Are hardware error interrupts masked here?

RGA3_INT_EN is programmed with only RGA3_INT_FRM_DONE. If the hardware
encounters an error (like RGA3_INT_WR_BUS_ERR), it will halt but fail to
assert the interrupt. This would leave the V4L2 m2m framework waiting
indefinitely for buffer completion.

> +	rga_write(rga, RGA3_CMD_CTRL,
> +		  FIELD_PREP(RGA3_CMD_LINE_START_PULSE, 1));
> +}
> +
> +static bool rga3_handle_irq(struct rockchip_rga *rga)
> +{
> +	u32 intr;
> +
> +	intr =3D rga_read(rga, RGA3_INT_RAW);

Is it possible for this register read to occur while the device is
runtime-suspended?

Since RGA3 sets .has_internal_iommu to false, the interrupt is requested wi=
th
IRQF_SHARED. If another device on the shared line triggers an interrupt whi=
le
the RGA3 clocks are disabled, this register read may return 0xffffffff.

Since FIELD_GET(RGA3_INT_FRM_DONE, 0xffffffff) is true, the ISR would proce=
ss
a spurious frame. When no job is active, rga->curr is NULL, which could lead
to a crash when dereferencing the context.

To comply with PM Runtime guidelines, should the IRQ handler use
pm_runtime_get_if_active() before accessing registers, and should the driver
call synchronize_irq() in the runtime suspend callback?

> +	/* clear all interrupts */
> +	rga_write(rga, RGA3_INT_CLR, intr);
> +
> +	return FIELD_GET(RGA3_INT_FRM_DONE, intr);
> +}

If error interrupts are enabled to prevent job hangs, would returning false
here cause the core ISR to ignore the error interrupt instead of aborting t=
he
job?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-spu-rga3-v=
6-0-e547152eb9c9@pengutronix.de?part=3D27
