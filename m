Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83652355F2A
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320027; cv=none; b=pdIuomV+Xhn/GXeSSztawVXa6kTz+0+A5yZHifhuwpxRRwcjIzxpLuNRol3bJkm72Sh/mIyfqmQHh+HYQfK5HTjH3vXmdHYHulYizKy39x0CTAnB3zbr3tndkn8PRwnlxhJQFjEcwdUhZ5w2FsqtebzB4nUBjO3v4Sl6f/pko9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320027; c=relaxed/simple;
	bh=cjTYJ2S4GVYuucIuUli1Qf7rKs+Ort2Z4DuY62RWKic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lv2OTXj4uZ0QgkY+cAcAOKWPEj+/hFhZTFq6+u5nIyBm9tUbZ0InmqKMZ2PbVAL5s1PO4QdexicwuNZmRP9sTjjqSEgrC1dWuY6U76E5Jx5t13YnuplyyU21takAjn+Cw0OxMyLo7KfhUe49BYbs9fg6vxE6AjJ82q86w6sqDNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKBrclEj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKBrclEj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF031F000E9;
	Wed, 20 May 2026 23:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320026;
	bh=HlwKcJJgi0hcd6lSLK9VSLhik+k8RD8oGmXhFeuSRm8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lKBrclEjPsPxAQKqQI07SEvLuB/FDc1Pjf5te5mD8LKB96dAgzRW7AYs37f/UdtgI
	 qdYJ3Gej++e2IH4cJCLY5UTTVKqc3nsyKXjtaffACnTxcVEh9boPvzRvaQW/h2oyqZ
	 wM8uvogKDnGGTMUk8JKQW43N5BhGms12W2unmTjXxXZXEsbsgDX937rJYAGV6d8JxZ
	 W6/epBtw/R8ZjyC79S4/rgBXB8LTKAI6cgGT5zS9LUcQO6001dzQ4GZhaPS8v21Y4R
	 fKMctTDNR/WNQiUNAKfJ8T6bSQRtF0AnA9lE3slsBL2YfAQBRroVQsC+nm4VAf4iCZ
	 SkohtXPZADedg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 21/28] media: rockchip: rga: share the interrupt when
 an external iommu is used
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-spu-rga3-v7-21-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-21-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:33:45 +0000
Message-Id: <20260520233345.DBF031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] Accessing hardware registers in the shared interrupt handler w=
hile the device is runtime suspended causes a bus fault and system crash.
- [High] The interrupt handler unconditionally returns `IRQ_HANDLED`, viola=
ting shared interrupt semantics and breaking spurious interrupt detection.

Pre-existing issues:
- [High] Missing early returns after `WARN_ON` checks leads to deterministi=
c NULL pointer dereferences in the interrupt handler.
--

commit d55d317809ea4314d29aae5edd3429021099007b
Author: Michael Olbrich <m.olbrich@pengutronix.de>

media: rockchip: rga: share the interrupt when an external iommu is used

This commit updates the RGA driver to request a shared interrupt when
paired with an external IOMMU, allowing both drivers to share the IRQ line.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index e3c99c3f7c5be..cda3cecb1ce8c 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -767,7 +767,8 @@ static int rga_probe(struct platform_device *pdev)
[ ... ]
> -	ret =3D devm_request_irq(rga->dev, irq, rga_isr, 0,
> +	ret =3D devm_request_irq(rga->dev, irq, rga_isr,
> +			       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,

[Severity: Critical]
If the external IOMMU triggers an interrupt while the RGA device is idle
and its clocks are disabled via rga_runtime_suspend(), will rga_isr() still
attempt to read the hardware registers?

Since rga->hw->handle_irq(rga) directly reads RGA_INT, could this cause an
external abort or bus fault? Does the ISR need to verify the device's
power state with pm_runtime_active() before accessing registers?

[Severity: High]
With IRQF_SHARED added, does rga_isr() correctly return IRQ_NONE when the
RGA hardware didn't generate the interrupt?

If it unconditionally returns IRQ_HANDLED even when rga->hw->handle_irq(rga)
returns false, could this defeat the spurious interrupt detection mechanism
and lead to lockups during an interrupt storm?

[Severity: High]
This is a pre-existing issue, but does adding IRQF_SHARED make the
WARN_ON(!ctx) check in rga_isr() susceptible to a NULL pointer dereference?

If an IOMMU interrupt fires while RGA is idle and rga->curr is NULL, and
reading gated registers returns 0xFFFFFFFF, handle_irq might incorrectly
return true. Since the WARN_ON(!ctx) lacks an early return, will this
proceed to call v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx) and dereference
the NULL pointer?

>  			       dev_name(rga->dev), rga);
>  	if (ret < 0) {
>  		dev_err(rga->dev, "failed to request irq\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D21
