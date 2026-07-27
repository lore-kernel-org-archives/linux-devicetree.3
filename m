Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21E731714F
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 22:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785190104; cv=none; b=dpNsrnoG0iYRd+TVN0Cg25H2EiSxMqu3VXpAMDELGX5QzBs5XUBFMS8ZC5Jj3L+5vDnmhyrVgoZkmxgKLqFmiYLlL+jyuLMY4PkawgQDtrUMTliDVBq56JPHbFdNw20D3B5hr9s8L1fG6AyDUhobVfT0xnmOoy1cobhhXsOiv/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785190104; c=relaxed/simple;
	bh=V/vVVN2kulSk3WLKWDXxUZfuzxuFd8fLRCR06SjF35E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FLpm8DMQGmB5JhMYaasT3YASbQ66wXNP9y8CFb32VNbGbnsjvBc/XNizTG0QWd8E1A4+eLXQlOhnIS09xJaHjQaCbzV+oCI5jCSitoTMRFODaZ7reEe1IdDKAWmAjHIFLRl9pHaKG5IC8BqM1TIOaL3tcllA95sjW+COW+AJ9GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWpcOA0d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWpcOA0d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1136D1F000E9;
	Mon, 27 Jul 2026 22:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785190102;
	bh=dTf7efpo3FblNLAmKELD1qJO7n2U3Oq+MhF+XgsIcAA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BWpcOA0dh4a2M0d1FnHFxS2wbRiV9e9sZLWFeDanC5pSZ+Hn/TQokTiTelv02jGwg
	 jNakJM5vrgO0t5B6wqw9ffq0k9ecJQ0HaVsen6b/y4vOSoqxD7SiIkMn9xEwMpJm3T
	 glqoQJRMHz3kF8kJdNsq1g+uAyl1olBxbq5ij5yUNXU32YhHoQbwtoQq7De1Nec1PU
	 MnN4ELDIbZmEAepd7mOYJzUjinV4rlkqKCfjOXrkQShSNeeqJrI0hTDG47z2gmxKFc
	 zzWn64Bpcyl2tdKQ1O/OMXnGoGhl1oheKYEPb599ArDdHSHiPPOSpKXy1KKoXT74vL
	 iDVpIEHHpBpOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Drake" <dan@reactivated.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727-bcm2712-iommu-submit-v2-4-0247b5c03de8@reactivated.net>
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260727-bcm2712-iommu-submit-v2-4-0247b5c03de8@reactivated.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 22:08:21 +0000
Message-Id: <20260727220822.1136D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Race condition in cache initialization exposes uninitialized memor=
y to IOMMU devices.
- [High] TLB synchronization only flushes the original MMU when a domain is=
 shared across multiple MMUs.
- [High] Generic page table is misconfigured with a 32-bit VASZ for 36-bit =
IOVAs.
- [High] Missing device links for devres-managed dependencies leading to Us=
e-After-Free.
- [High] Missing MMU local TLB flush when attaching a domain.
- [High] TLB synchronization corrupts live hardware state for unattached do=
mains.
- [Medium] Format string vulnerability via dynamic device name in `iommu_de=
vice_sysfs_add`.
- [Low] COMPILE_TEST allows 32-bit builds, causing 64-bit IOVA constants to=
 truncate.
--

--- Patch [4]: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver ---
commit cf5d6742acaca9334ddee5d5953d5aba3f7cdcb7
Author: Daniel Drake <dan@reactivated.net>

iommu: Add Broadcom BCM2712 IOMMU driver

This commit introduces the Broadcom BCM2712 IOMMU driver used on Raspberry =
Pi
5, enabling memory translation for the VC6 display pipeline and multimedia
devices. It supports a 4GB translation aperture at a high memory address and
includes a shared IOMMU cache.

> diff --git a/drivers/iommu/bcm2712-iommu-cache.c b/drivers/iommu/bcm2712-=
iommu-cache.c
> new file mode 100644
> index 0000000000000..d97a8cda448ee
> --- /dev/null
> +++ b/drivers/iommu/bcm2712-iommu-cache.c
[ ... ]
> +static int bcm2712_iommu_cache_probe(struct platform_device *pdev)
> +{
> +	struct bcm2712_iommu_cache *cache;
> +
> +	cache =3D devm_kzalloc(&pdev->dev, sizeof(*cache), GFP_KERNEL);
> +	if (!cache)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, cache);
> +	spin_lock_init(&cache->hw_lock);
> +
> +	cache->reg_base =3D devm_platform_ioremap_resource(pdev, 0);

[Severity: High]
Is there a race condition here during parallel device probing? By
publishing the cache driver data globally before the IO memory is mapped,
a concurrent probe of the IOMMU driver could retrieve the cache device and
call bcm2712_iommu_cache_flush() on an uninitialized cache->reg_base. If
the IO remap fails, could this also leave the IOMMU driver with a dangling
pointer?

> diff --git a/drivers/iommu/bcm2712-iommu.c b/drivers/iommu/bcm2712-iommu.c
> new file mode 100644
> index 0000000000000..55678009f9c45
> --- /dev/null
> +++ b/drivers/iommu/bcm2712-iommu.c
[ ... ]
> +static int bcm2712_iommu_attach_dev(struct iommu_domain *domain,
> +				    struct device *dev,
> +				    struct iommu_domain *old)
> +{
[ ... ]
> +	/* Flush (and enable) the shared TLB cache; enable this MMU. */
> +	bcm2712_iommu_cache_flush(mmu->cache);
> +	MMU_WR(MMMU_CTRL_OFFSET, MMMU_CTRL_OPERATING_FLAGS);

[Severity: High]
Does this miss flushing the local TLB on the MMU when attaching a domain?
The hardware is configured with MMMU_CTRL_OPERATING_FLAGS but omits the
MMMU_CTRL_TLB_CLEAR bit. If the device was previously attached to a
different domain or identity mode, will the local TLB retain stale
translation entries?

> +unlock:
> +	spin_unlock_irqrestore(&mmu->hw_lock, flags);
> +	return 0;
> +}
[ ... ]
> +static int bcm2712_iommu_sync_range(struct iommu_domain *domain,
> +				    unsigned long iova, size_t size)
> +{
> +	struct bcm2712_iommu *mmu =3D domain_to_mmu(domain);

[Severity: High]
If a domain is shared across multiple IOMMU hardware instances, will this
only retrieve and flush the original MMU it was allocated with? The IOMMU
framework can attach a single domain to multiple devices. Since
bcm2712_iommu_domain_alloc() hardcodes domain->mmu to the first MMU, will
all other attached MMU instances retain stale TLB entries?

> +	unsigned long flags;
> +	u32 val;
> +
> +	spin_lock_irqsave(&mmu->hw_lock, flags);
> +	bcm2712_iommu_cache_flush(mmu->cache);
> +
> +	/* If invalidating more than 16MB, just do a full TLB clear */
> +	if (size >=3D SZ_16M) {
> +		MMU_WR(MMMU_CTRL_OFFSET,
> +		       MMMU_CTRL_OPERATING_FLAGS | MMMU_CTRL_TLB_CLEAR);

[Severity: High]
Could this corrupt live hardware state for unattached domains?
The IOMMU API allows mapping memory into a domain before it is attached to
a device. When iommu_map() calls bcm2712_iommu_sync_map(), will this
unconditionally overwrite the active hardware state of an MMU that might
currently be operating in identity mode or disabled?

[ ... ]
> +static struct iommu_domain *bcm2712_iommu_domain_alloc(struct device *de=
v)
> +{
[ ... ]
> +	/* 2-level format: 10-bit L1 + 10-bit L2 + 12-bit page offset */
> +	cfg.common.hw_max_vasz_lg2 =3D
> +		(2 * PTES_PER_IOPG_SHIFT) + IOMMU_PAGE_SHIFT;
> +
> +	/* PTEs encode a 28-bit output address PFN */
> +	cfg.common.hw_max_oasz_lg2 =3D 28 + IOMMU_PAGE_SHIFT;
> +
> +	ret =3D pt_iommu_bcm2712_init(&domain->pt, &cfg, GFP_KERNEL);
> +	if (ret)
> +		goto err;
> +
> +	/* Set up a default (error) page used to catch illegal reads/writes */
> +	domain->default_page =3D iommu_alloc_pages_sz(GFP_KERNEL, PAGE_SIZE);
> +	if (!domain->default_page)
> +		goto err;
> +
> +	domain->base.geometry.aperture_start =3D BCM2712_APERTURE_BASE;

[Severity: High]
Does this misconfigure the generic page table for 36-bit IOVAs?
The driver sets cfg.common.hw_max_vasz_lg2 to 32 (4GB capacity), but the
aperture is placed at 40GB (BCM2712_APERTURE_BASE), which requires 36
bits.

Since the generic PT operations are wired up directly via
IOMMU_PT_DOMAIN_OPS(bcm2712) without masking the 40GB base offset from the
incoming IOVAs, will the generic PT allocator process 36-bit IOVAs against
a 32-bit configured capacity and cause out-of-bounds indexing or map
rejections?

[Severity: Low]
Can this cause 64-bit IOVA constants to truncate on 32-bit architectures?
The driver assigns BCM2712_APERTURE_BASE to
domain->base.geometry.aperture_start. Since COMPILE_TEST in Kconfig allows
building without 64BIT guarantees, dma_addr_t might be 32-bit. Will this
assignment overflow and break compile testing correctness?

> +	domain->base.geometry.aperture_end =3D BCM2712_APERTURE_END - 1;
> +	domain->base.geometry.force_aperture =3D true;
> +	domain->base.ops =3D &bcm2712_paging_domain_ops;
> +	return &domain->base;
> +
> +err:
> +	bcm2712_iommu_domain_free(&domain->base);
> +	return NULL;
> +}
> +
> +static struct bcm2712_iommu *
> +bcm2712_iommu_get_by_fwnode(struct fwnode_handle *fwnode)
> +{
> +	struct device *dev =3D
> +		bus_find_device_by_fwnode(&platform_bus_type, fwnode);
> +	struct bcm2712_iommu *mmu;
> +
> +	if (!dev)
> +		return NULL;
> +
> +	mmu =3D dev_get_drvdata(dev);
> +	put_device(dev);
> +	return mmu;
> +}

[Severity: High]
Does dropping the device reference here without a device link risk a
use-after-free? The driver returns a pointer to devres-managed private
data. If the underlying device is unbound via sysfs, devres will free the
object, leaving a dangling pointer.

[ ... ]
> +static int bcm2712_iommu_init_cache(struct bcm2712_iommu *mmu,
> +				    struct platform_device *pdev)
> +{
[ ... ]
> +	mmu->cache =3D platform_get_drvdata(cache_pdev);
> +	if (!mmu->cache) {
> +		put_device(&cache_pdev->dev);
> +		return -EPROBE_DEFER;
> +	}
> +
> +	put_device(&cache_pdev->dev);

[Severity: High]
Similarly, does dropping the cache device reference here require
establishing a device link? If the cache device is unbound, devres will
immediately free the cache object. Any subsequent DMA unmap operation on
the IOMMU side will attempt to flush the cache and dereference the
dangling mmu->cache pointer.

> +	return 0;
> +}
> +
> +static int bcm2712_iommu_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D iommu_device_sysfs_add(&mmu->iommu, dev, NULL, dev_name(dev));

[Severity: Medium]
Is it safe to pass a dynamic string directly as the format string
parameter to iommu_device_sysfs_add()? If the device tree node name
happens to contain format specifiers, kobject_set_name_vargs() will
misinterpret them. Could this be updated to pass "%s", dev_name(dev)?

> +	if (ret)
> +		return ret;
> +
> +	ret =3D iommu_device_register(&mmu->iommu, &bcm2712_iommu_ops, dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-bcm2712-io=
mmu-submit-v2-0-0247b5c03de8@reactivated.net?part=3D4
