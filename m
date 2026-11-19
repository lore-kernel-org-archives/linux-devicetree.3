Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103956;
	b=1CUiJXZlQF9QyhO8ePSiyiGWiQftsq+nMoE+R56pAqAx9Xge5BmZ76t9Z+/M8tk4qgmy
	 J/negbUjUf0FYiaGMlwhFvZVqeVFWSz4czMUgjNVLA9raN2HnOzsjycyJZcDYnSTlPx3i
	 xz1M4H1wdBzuWhfGYwdNL0A38dZaVa7LX/B277K6SfbPu1J8MsapiwdJb/6zlLGmI0cw2
	 qzV1gcDm6aKOykb6BoszI99HWCWQMoJ+GxTXM4k2ac/VpL5qrkiUgC64cxnHfd1j8zlch
	 +nmBu0hmk6DhaVU+E0XpISaKVypop38xo8tAj5C1RQT/+SDYQFV/DbvD1K8pcHPpS1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103956;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ey8KIaX+bGifW71//v1TmUVnT6b7qEeIToVxv1L/Eqs=;
	b=cvg1H1y48PFAfi4o78TV40EIYQJ9ECleZ+2PHnTaA9fJZvcYoIonGVx0AXPTYNdOD/+H
	 brtQsA7ogY5mEXh0acbx197bUjDxkEQgS4yu3ft3oiQZuE3waSGzOCOkwcehKp1d5Dbk0
	 k65KUFRdlalCxp0Gykugx0qA1v0MBvLTMskTR7Hn+A54RaUun8bHERSab+U0Qjr8YL1NQ
	 O2o4Et9UAvKUy6DMFHcvJxHfxkXTtlIMZYNEpV3yfHxHFqawy5CqoQyMwa4Uql5fa/rG0
	 FMsCf/K9j6uSuN+MpfWHerAxriW+ALyMyBK3//hQZ/DdQWOMnNuHYyAynB7ONeCnlRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnFJbTdb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CD3606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnFJbTdb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA37C1F000C4;
	Thu, 19 Nov 2026 15:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103956;
	bh=Ey8KIaX+bGifW71//v1TmUVnT6b7qEeIToVxv1L/Eqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DnFJbTdb2eWim++vFnVqn9BBrYpaX3xoisKY+NM+ZK4xJPuyaIyP27xXOTgZiPQp/
	 oI9hxye9dlY+1PQ9j9UTKU1xtoRBfSa+S/rW+aAT7OMgx1lVGEuAvYEkczIv1HSkVg
	 hTX0cbKqr3Rzr17A1Azf2lat+kdwU2LoazGNAzs/M3gUyTH90V0Z2Jpg4LGS+FUpss
	 dYBFMuj8fte5hBxhaT+nW2B5/w0ch4VFP9z2d6iSO9t5xLcmk9EdpeO5+A7L/tAfE7
	 arxgS7apVEzEB+R6idY88reYn23+qvP2yjtA8yCNy591duE8nbrBhRB9F+xGYh6hI7
	 2vTbeB6H3m4uw==
Message-ID: <sashiko-outbox-223455@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 09/28] media: mali-vpu: add MMU software page table
 manager
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charvi Mehta" <charvi.mehta@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119153758.1426673-10-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-10-charvi.mehta@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 15:59:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] media: mali-vpu: tautological VA range check and 32-bit VA
  truncation
- [Medium] media: mali-vpu: devm_kzalloc() lifetime and size mismatch
  for MMU pages
--

commit 635e5f0a32c7b907a3a802ff85c63c68b877a3e5
Author: Rath Sankaralingam <rath.sankaralingam@arm.com>

media: mali-vpu: add MMU software page table manager

This commit adds the software MMU two-level page table manager for the
Mali VPU driver and configures the 40-bit DMA mask and maximum DMA
segment size.

> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c b/drivers=
/media/platform/arm/mali-vpu/mali-vpu-mmu.c
> new file mode 100644
> index 0000000000000..00cf5251eff5e
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c
> @@ -0,0 +1,693 @@

[ ... ]

> +/* Number of bits for the virtual address space. */
> +#define MALI_VPU_VA_BITS		32
> +#define MALI_VPU_VA_MASK		GENMASK(MALI_VPU_VA_BITS - 1, 0)

[ ... ]

> +static int mali_vpu_map_page(struct mali_vpu_mmu *mmu,
> +			     mali_vpu_mmu_va va,
> +			     dma_addr_t dma,
> +			     enum mali_vpu_mmu_attr attr,
> +			     enum mali_vpu_mmu_access access)
> +{
> +	struct mali_vpu_mmu_pt_page *l2;
> +	mali_vpu_mmu_pte *pte;
> +
> +	/* Check that both VA and DMA address are page aligned. */
> +	if ((va | dma) & MALI_VPU_PAGE_MASK) {
> +		dev_err(mmu->dev, "VA and DMA address must be page aligned. va=3D0x%x,=
 dma=3D%pad",
> +			va, &dma);
> +		return -EFAULT;
> +	}
> +
> +	/* Check that VA is within valid address range. */
> +	if (va & ~MALI_VPU_VA_MASK) {
> +		dev_err(mmu->dev, "VA out of valid range. va=3D0x%x", va);
> +		return -EFAULT;
> +	}

[Severity: Medium]
Can (va & ~MALI_VPU_VA_MASK) ever evaluate to true here?  mali_vpu_mmu_va
is a u32 and MALI_VPU_VA_MASK is GENMASK(31, 0), so the check is always
zero, and 64-bit address arithmetic in callers such as
mali_vpu_mmu_map_pages() (va + i * MALI_VPU_PAGE_SIZE) and
mali_vpu_mmu_map_dma() (va + offset) is truncated to u32 before reaching
mali_vpu_map_page(), wrapping around to address 0 if a mapping crosses
4 GiB.

[ ... ]

> +struct mali_vpu_mmu_pages *mali_vpu_mmu_alloc_pages(struct device *dev,
> +						    size_t count,
> +						    size_t capacity)
> +{
> +	struct mali_vpu_mmu_pages *pages;
> +	int ret;
> +
> +	count =3D roundup(count, MALI_VPU_PAGES_PER_LINUX_PAGE);
> +	capacity =3D roundup(capacity, MALI_VPU_PAGES_PER_LINUX_PAGE);
> +	capacity =3D max(count, capacity);
> +
> +	pages =3D devm_kzalloc(dev,
> +			     sizeof(*pages) + sizeof(pages->pages[0]) * capacity,
> +			     GFP_KERNEL);
> +	if (!pages)
> +		return ERR_PTR(-ENOMEM);

[ ... ]

> +void mali_vpu_mmu_free_pages(struct mali_vpu_mmu_pages *pages)
> +{
> +	unsigned int i;
> +
> +	mali_vpu_mmu_unmap_pages(pages);
> +
> +	if (!pages->is_external)
> +		for (i =3D 0; i < pages->count; i +=3D MALI_VPU_PAGES_PER_LINUX_PAGE)
> +			mali_vpu_mmu_free_page(pages->dev, pages->pages[i].dma,
> +					       pages->pages[i].linux_page,
> +					       DMA_BIDIRECTIONAL);
> +
> +	devm_kfree(pages->dev, pages);
> +}

[Severity: Medium]
Should mali_vpu_mmu_alloc_pages() and mali_vpu_mmu_alloc_pages_sg() use
kvzalloc(struct_size(pages, pages, capacity), GFP_KERNEL) and kvfree()
instead of devm_kzalloc() and devm_kfree()?

Because the backing pages and DMA mappings are not devres-managed,
unbinding the platform device while a V4L2 session fd is open frees the
struct mali_vpu_mmu_pages container in devres_release_all() (leaking the
backing pages), and when the fd is later closed, mali_vpu_mmu_free_pages()
reads the freed pages struct and hits WARN_ON(rc) in devm_kfree().  In
addition, devm_kzalloc() requires physically contiguous slab memory and
will fail above KMALLOC_MAX_SIZE for large buffer capacities.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119153758.1426=
673-1-charvi.mehta@arm.com?part=3D9
