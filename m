Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD8C340401
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779319638; cv=none; b=kgt0cmcG/Yp2y9sTJNn3ErMAAwR1QWHmQsHdPDuHSUdWNjf7AFYzr4R0huaPD+VRQqFCLN8SFlWyWHN5U2RIFbJuN4cq7tkBzKqoSe9g3L85oP15VDbXH25ABcD1vzWBjn01UBUbMSR9cIxtWfsBCXDSsiCjGtsjJpX/XWhlVnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779319638; c=relaxed/simple;
	bh=gra2Pu9+akw5IpukbaRnuuRxBqg4ayq1oxBXlXIeT5I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V+y3ZrUfaINPIsaGTNes3OSd16RekuI9DIhhbhOqutxRYkqbVyaagiiXSk2D7cuL2a5nQia2rfMK22WDsJBP9qpnEdHIQjjsSAwIOdHXoQyRGbNFLXAHRvCUyzmyleYGhh1fEhEnfHoumc8c3xo22ECafO/GK9R9KI2I/mCERpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUsdRbDo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUsdRbDo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C741F000E9;
	Wed, 20 May 2026 23:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779319636;
	bh=UEs175ANJcMxxHtc1eYJcfv2k6nAzYx2VQ0/tjG9I/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iUsdRbDodz1WWLyW8yLxFk23WxzQ3tpx5wX/jWjjkdmlplxlcDikeZtdLOSmdJXRX
	 mW9V1Z1e07ADI7cOxcuYzk/GLEeqfkCF/WtCh58OdMChrDVY87uC1bR2SdoB53TQ1D
	 kfvWUaHpcgsKcPOiy3NkIknUUR+h82cMSgHhM2lVIG0oNjbRsFkhKH9zhTqtEjj2cD
	 LRuwqymGDjZiRfkCEEN41jXY8d7XEdjmMWZOdm6Gqg8lcbT4DZjJnB8AlU4REBcY3p
	 LAmeHW2psRmqnsauyQ5m7J9CuByn8261z/Y3/3rDo7T1PoP7LeWPMC5GMYKHTtiaJJ
	 0qvcfUl93eFnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/28] media: rockchip: rga: use clk_bulk api
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-spu-rga3-v7-7-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-7-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:27:16 +0000
Message-Id: <20260520232716.A5C741F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The transition to `devm_clk_bulk_get_all()` removes the strict req=
uirement for device clocks, creating a silent failure that leads to a syste=
m crash if clocks are missing in the device tree.

Pre-existing issues:
- [Critical] The device removal process incorrectly orders the teardown ste=
ps and destroys memory while the V4L2 device may still be open in userspace=
, leading to a Use-After-Free.
- [Critical] The interrupt handler accesses hardware registers without ensu=
ring the device is in an active power state.
- [High] Hardware resets are asserted and deasserted while the core, AXI, a=
nd AHB clocks are disabled.
- [High] The driver calls a streaming DMA sync function on a coherent DMA a=
llocation and uses an out-of-bounds size.
--

commit 6a4ac27640e49302f448a7b359bc524f23fc7a61
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: use clk_bulk api
   =20
Use the clk_bulk API to avoid code duplication for each of the three
clocks.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index fea63b94c5f3d..4e710a050cb7c 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
[ ... ]
> @@ -771,23 +733,12 @@ static int rga_parse_dt(struct rockchip_rga *rga)
>  	udelay(1);
>  	reset_control_deassert(ahb_rst);

[Severity: High]
This is a pre-existing issue, but are these hardware resets effective when
the clocks are disabled?

The core, axi, and ahb reset lines are pulsed here before the corresponding
clocks are enabled. For synchronous hardware blocks like AXI/AHB and IP
cores, the clock usually must be active for the reset signal to propagate
correctly through the internal state machine.

Could pulsing resets while clocks are gated leave the hardware in an
undefined state and lead to DMA corruption or hardware hangs?

> -	rga->sclk =3D devm_clk_get(rga->dev, "sclk");
> -	if (IS_ERR(rga->sclk)) {
> -		dev_err(rga->dev, "failed to get sclk clock\n");
> -		return PTR_ERR(rga->sclk);
> -	}
[ ... ]
> +	ret =3D devm_clk_bulk_get_all(rga->dev, &rga->clks);
> +	if (ret < 0) {
> +		dev_err(rga->dev, "failed to get clocks\n");
> +		return ret;
>  	}
> +	rga->num_clks =3D ret;

[Severity: High]
Does this missing clock check lead to a synchronous external abort?

devm_clk_bulk_get_all() returns the number of clocks successfully obtained,
or 0 if none are specified in the device tree.

By only checking ret < 0, a return value of 0 is treated as a success,
setting num_clks =3D 0. The driver will then successfully call
clk_bulk_prepare_enable(0, ...) which does nothing, and immediately attempt
to access unclocked hardware registers.

On ARM platforms, accessing unclocked hardware domains can trigger a
synchronous external abort (bus fault).

Should this code assert that ret > 0 to ensure the mandatory clocks were
acquired?

[ ... ]

While reviewing this patch, I noticed a few other pre-existing issues in
the driver:

[Severity: Critical]
This isn't a bug introduced by this patch, but does the teardown order in
rga_remove() cause a use-after-free?

The driver unregisters the video device (video_unregister_device) and
completely tears down the context (v4l2_m2m_release), relying on devres to
free the rockchip_rga structure upon returning.

However, video_unregister_device does not forcefully close existing
userspace file descriptors. If a userspace process holds an open FD and
later closes it, rga_release() executes and dereferences the already freed
rga structure.

[Severity: Critical]
This is a pre-existing issue, but can rga_isr() access unclocked hardware
when the device is runtime-suspended?

The interrupt handler rga_isr() unconditionally reads the hardware register
RGA_INT. A subsequent patch in this series changes the driver to request a
shared interrupt (IRQF_SHARED).

This means the ISR will be invoked whenever the IOMMU (or another sharing
device) triggers an interrupt, which can occur while the RGA device is
runtime-suspended and its clocks are disabled. Reading from unclocked RGA
registers causes a synchronous external abort.

Should the handler use pm_runtime_get_if_active() before accessing hardware?

[Severity: High]
This isn't a bug introduced by this patch, but does rga_cmd_set() perform a
streaming DMA sync on a coherent allocation?

cmdbuf_virt is allocated using dma_alloc_attrs() with DMA_ATTR_WRITE_COMBIN=
E,
returning a coherent DMA allocation. However, in rga_cmd_set(), the driver
calls dma_sync_single_for_device() on this buffer.

Streaming DMA sync functions must not be used on coherent allocations. Doing
so violates the DMA API and can trigger system faults on strict
architectures.

Furthermore, it synchronizes PAGE_SIZE bytes, but the buffer size is only
RGA_CMDBUF_SIZE (0x80 bytes). Could this create an out-of-bounds DMA
operation that corrupts adjacent memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D7
