Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF49576EBE
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964346; cv=none; b=EiessCVjOJsaICbNbDvFag3S+WEfTVsT0Qu0PHHnu7IGfza3IlMye+C+Sk/D8LZikQMPaIoqejmd/DiY6Oa7d/iNB7VCBXKhyh7glWEjxvdf12ydFlGf2sxXgqBVesRx5qVuS+Tt050vJSdGt8KvpQfE3N6/ACTK+2dQk01cuEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964346; c=relaxed/simple;
	bh=AFKXnEEUWaey4FbEdtnSICqp3TB7C1b2nVW2NIAKHe8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WkyRCIUHj0fPXvBSBUb5vK2A8bkBKUVZC9MYIPjP9Rb7+zt9irfn1nt+sDWuUnGq2JLj5CwOlrld3ErVGnt8d6hfRi8+B4d8QJilxqLvkO3zS19L7704UCOTvKzI9GEPcaAg7mUy7y58ir25xHC4t9FofHhc7GpemBApR/2Awlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwLMY87J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwLMY87J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2ED71F00A3D;
	Wed,  9 Sep 2026 14:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788964344;
	bh=zhMHfy8SouagDPx6OXNzrLwoaDjvrDULHNHzBBNFvwY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HwLMY87J8gQIM679QQI0uPwpU5G6doQvi1jbDuEguIlojs3LuO86ZXxlz3gKoIPAv
	 BGkHnArvghq+vVbf4kEbjon1gY2Tl1cnMs0vULKGZgkDyh38tahBFStCj0stgfa11S
	 oncyDmYGYrfLYpzuQSdi982Yd4Zph0VQOIPCUnaFS3N2s7ByCUoyhfYi92l+OsDO3z
	 lFdbUURBJuBSq0l/3N4vY+f4ne8l58aJwPjcSG+bUr9qYJX41EMxm4jlhcO50WjCju
	 sOP5IGppWdgS459WoxRjJ3m2RFNLIBO48lbR+c5YDqZuZ/7KlTAVNnz0KOajUtku+H
	 52RVVrk8hnZQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] iommu/mediatek-v1: add mt6572 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909-6572-iommu-v1-3-de261da09fb2@protonmail.com>
References: <20260909-6572-iommu-v1-0-de261da09fb2@protonmail.com>
 <20260909-6572-iommu-v1-3-de261da09fb2@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 14:32:24 +0000
Message-Id: <20260909143224.A2ED71F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Insufficient hardware synchronization for MT6572 TLB flush complet=
ion

Pre-existing issues:
- [High] NULL pointer dereference in mtk_iommu_v1_domain_free() if domain w=
as never attached
- [High] Race condition causing use-after-disable in hardware interrupt han=
dling during teardown
- [High] Data corruption and Use-After-Free due to missing lock in TLB flus=
h sequence
--

commit 29773ece1b87d664d6aa369fe95265b2f2898794
Author: Roman Vivchar <rva333@protonmail.com>

iommu/mediatek-v1: add mt6572 support

This commit adds support for the mt6572 SoC, which utilizes an earlier
version of the IOMMU that shares the same v1 architecture but has minor
hardware differences compared to mt2701. It introduces mtk_iommu_type to
distinguish between the mt2701 and mt6572 variants.

> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 72355f41c36af..b6f547b100d10 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c

[ ... ]

> @@ -180,25 +199,33 @@ static void mtk_iommu_v1_tlb_flush_range(struct mtk=
_iommu_v1_data *data,
>  					 unsigned long iova, size_t size)
>  {
>  	int ret;
> -	u32 tmp;
> +	u32 tmp, val =3D F_INVLD_EN0;
> =20
> -	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> -		data->base + REG_MMU_INV_SEL);
> +	if (data->type =3D=3D MTK_IOMMU_V1)
> +		val |=3D F_INVLD_EN1;
> +
> +	writel_relaxed(val, data->base + REG_MMU_INV_SEL);
>  	writel_relaxed(iova & F_MMU_FAULT_VA_MSK,
>  		data->base + REG_MMU_INVLD_START_A);
>  	writel_relaxed((iova + size - 1) & F_MMU_FAULT_VA_MSK,
>  		data->base + REG_MMU_INVLD_END_A);
>  	writel_relaxed(F_MMU_INV_RANGE, data->base + REG_MMU_INVALIDATE);

[Severity: High]
This isn't a bug introduced by this patch, but does this sequence of global
register writes lack a lock?

In mtk_iommu_v1_unmap() and mtk_iommu_v1_map(), pgtlock is dropped before
calling mtk_iommu_v1_tlb_flush_range():

drivers/iommu/mtk_iommu_v1.c:mtk_iommu_v1_unmap() {
    ...
	spin_unlock_irqrestore(&dom->pgtlock, flags);

	mtk_iommu_v1_tlb_flush_range(dom->data, iova, size);
    ...
}

If multiple CPUs concurrently perform map/unmap operations, can the
non-atomic sequence of writel_relaxed() calls to these shared global MMIO
registers interleave, causing the IOMMU to flush incorrect IOVA ranges?

> -	ret =3D readl_poll_timeout_atomic(data->base + REG_MMU_CPE_DONE,
> -				tmp, tmp !=3D 0, 10, 100000);
> -	if (ret) {
> -		dev_warn(data->dev,
> -			 "Partial TLB flush timed out, falling back to full flush\n");
> -		mtk_iommu_v1_tlb_flush_all(data);
> +	if (data->type =3D=3D MTK_IOMMU_V1) {
> +		ret =3D readl_poll_timeout_atomic(data->base + REG_MMU_CPE_DONE,
> +						tmp, tmp !=3D 0, 10, 100000);
> +		if (ret) {
> +			dev_warn(data->dev,
> +				 "Partial TLB flush timed out, falling back to full flush\n");
> +			mtk_iommu_v1_tlb_flush_all(data);
> +		}
> +
> +		/* Clear the CPE status */
> +		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
> +	} else {
> +		/* Make sure the TLB flush is done */
> +		wmb();
>  	}
> -	/* Clear the CPE status */
> -	writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
>  }

[Severity: High]
Does a wmb() CPU barrier provide actual hardware synchronization for the
MT6572 TLB flush completion?

A wmb() only orders CPU memory writes; it does not ensure the write has
reached the IOMMU hardware, nor does it poll the hardware status to verify
the TLB flush has finished.

If the software unmap path returns and allows memory to be freed while the
hardware is still performing the TLB invalidation, can a device DMA into
freed memory before the TLB entry actually invalidates, causing
Use-After-Free?

[Severity: High]
This is a pre-existing issue, but is there a race condition during hardware
interrupt handling when tearing down the driver?

In the probe error path and in mtk_iommu_v1_remove(), clk_disable_unprepare=
()
is called while the hardware IRQ is still actively registered:

drivers/iommu/mtk_iommu_v1.c:mtk_iommu_v1_probe() {
    ...
out_clk_unprepare:
	clk_disable_unprepare(data->bclk);
out_put_larbs:
	for (i =3D 0; i < MTK_LARB_NR_MAX; i++)
		put_device(data->larb_imu[i].dev);

	return ret;
}

drivers/iommu/mtk_iommu_v1.c:mtk_iommu_v1_remove() {
    ...
	clk_disable_unprepare(data->bclk);
	devm_free_irq(&pdev->dev, data->irq, data);
    ...
}

If a hardware interrupt fires between the clock disable and the IRQ being
freed (or cleaned up by devres), could mtk_iommu_v1_isr() execute and
perform readl_relaxed() on the unclocked hardware, resulting in a
synchronous external abort?

[Severity: High]
This is a pre-existing issue, but can a NULL pointer dereference happen in
mtk_iommu_v1_domain_free() if the domain was never attached?

If an IOMMU domain is successfully allocated via
mtk_iommu_v1_domain_alloc_paging() but device attachment fails or is
skipped, dom->data remains NULL because it is only populated inside
mtk_iommu_v1_attach_device() (via mtk_iommu_v1_domain_finalise).

When the IOMMU core subsequently invokes iommu_domain_free(), it calls
mtk_iommu_v1_domain_free():

drivers/iommu/mtk_iommu_v1.c:mtk_iommu_v1_domain_free() {
    ...
	struct mtk_iommu_v1_data *data =3D dom->data;

	dma_free_coherent(data->dev, M2701_IOMMU_PGT_SIZE,
			dom->pgt_va, dom->pgt_pa);
    ...
}

Does unconditionally dereferencing data->dev here cause a kernel panic if
data is NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-6572-iommu=
-v1-0-de261da09fb2@protonmail.com?part=3D3
