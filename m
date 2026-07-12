Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF2834040A
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 21:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783892058; cv=none; b=VzuVYJu7nf5vY7HdPhxg7TrMw8UNlcqycn/+amUoTupSZB5ijuq5UTVrp9eBLpP+9kyATEcjMeCn1VRHdOQl4e9CEjJwDgcGNkqqvAON3KUkQWDwAQsoAZ9siFjLzg6IoVbyWhsTN9Sa1FOOu9AHnhI09cEmbY3TCGCcoX/HW4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783892058; c=relaxed/simple;
	bh=2ltczZ1Cu56KZpdJ5sNu0twuOW8DH0oznYtu0ryFjaA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b6M/mDKy44G69s2G1GPhHRnLn5S0V+uEtMy+O3236ohh2+OwRwUHj9UzRsIbmvkdRlZQqFCWZxboD/CEGhqkIzxa+yrL6twSEeqDZpC9CUOv5NG3yqDSXZUFn43pcQxmI7+6/pNQOOJC87DpIZ1LJEwgpeVTWBl/tHLtc0oLAMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcmwN8uw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcmwN8uw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225A11F000E9;
	Sun, 12 Jul 2026 21:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783892057;
	bh=DkAlr7M4Co+8AD4AV4SBdQj964vrA7lww4hbqM/oJVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BcmwN8uwM0O/QwwiZ2OCNNuBMNjN5JVY+7LT7be5WPrIa78ksw5sqkLHKrLb7mnhV
	 6uuNpnqLRTyblUEr0kUgv3tpP4Eg6o2Z9fSOvjbEEqTQaJPI48z5xAiltg8CuTl2nH
	 tFguKz36ZCWBbYaSlROBRWFttqugzGWT0gYHfsP43LSWaUYNe0p1Oq4plrygKcLy2P
	 OK82C4yZxvrXqI9+uXspq2yycNWZMocC6jX80OYtAeJ24RoGAoCsUuApFOjHGxMaZh
	 mf1xQpmEnuAc4Uxot9iFFITew5Ov3g+GDfaXmKa9Po2cvDZu0myD8zhpIA5Nb6lJ45
	 Q7GBXiPV3SVAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] iommu: Add Broadcom BCM2712 IOMMU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Drake" <dan@reactivated.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-5-80e10cdde2ea@reactivated.net>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-5-80e10cdde2ea@reactivated.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 21:34:16 +0000
Message-Id: <20260712213417.225A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [Critical] IOMMU Grouping Violation leading to Privilege Escalation
- [High] Reference Leak and NULL Pointer Dereference in `bcm2712_iommu_of_x=
late()`
- [High] Unhandled Hardware Timeout in TLB Flush Operations
- [High] Premature Publication of `bcm2712_iommu_cache` via drvdata
- [High] Hardware State Modification While MMU is Active
- [High] Detached Domain Sync Re-Enables MMU Unintentionally
- [High] Unaligned Aperture Size Causes Hardware Rejection
- [Medium] `DEFAULT_APERTURE_BASE` Integer Overflow on 32-bit Builds
--

--- Patch [5]: [PATCH 5/6] iommu: Add Broadcom BCM2712 IOMMU driver ---
commit 9729453735ad30531b63496af1c27a9da3cc01e2
Author: Daniel Drake <dan@reactivated.net>

iommu: Add Broadcom BCM2712 IOMMU driver

This IOMMU translates memory access requests for the VC6 display
pipeline and various multimedia devices in the Broadcom BCM2712 SoC used
on Raspberry Pi 5.

> diff --git a/drivers/iommu/bcm2712-iommu-cache.c b/drivers/iommu/bcm2712-=
iommu-cache.c
> --- /dev/null
> +++ b/drivers/iommu/bcm2712-iommu-cache.c
[ ... ]
> +void bcm2712_iommu_cache_flush(struct bcm2712_iommu_cache *cache)
> +{
> +	unsigned long flags;
> +	u32 val;
> +
> +	spin_lock_irqsave(&cache->hw_lock, flags);
> +
> +	/* Enable and flush the TLB cache */
> +	writel(MMUC_CONTROL_ENABLE | MMUC_CONTROL_FLUSH, cache->reg_base);
> +
> +	/* Wait for flush to complete: it should be very quick */
> +	readl_poll_timeout_atomic(cache->reg_base, val,
> +				  !(val & MMUC_CONTROL_FLUSHING), 0, 1000);

[Severity: High]
Does this code need to handle the -ETIMEDOUT return value?

If the hardware times out, the function silently returns success. During
page unmap operations, the IOMMU core assumes the TLB is clear and
proceeds to free the physical pages, which could lead to memory
corruption if the hardware stall allows continued DMA.

> +
> +	spin_unlock_irqrestore(&cache->hw_lock, flags);
> +}
> +
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
Could this lead to a race condition where the drvdata is used before
initialization?

The drvdata is published via platform_set_drvdata() before
cache->reg_base is initialized. If the main IOMMU driver discovers this
cache device concurrently via of_find_device_by_node(), it might
retrieve the drvdata and call bcm2712_iommu_cache_flush(), resulting in
a dereference of the uninitialized cache->reg_base.

> diff --git a/drivers/iommu/bcm2712-iommu.c b/drivers/iommu/bcm2712-iommu.c
> --- /dev/null
> +++ b/drivers/iommu/bcm2712-iommu.c
[ ... ]
> +#define MMMU_DEBUG_INFO_SUPERPAGE_WIDTH_MASK   0x0FF00000u
> +#define MMMU_DEBUG_INFO_BYPASS_4M              BIT(28)
> +#define MMMU_DEBUG_INFO_BYPASS                 BIT(29)
> +
> +#define DEFAULT_APERTURE_BASE (40ul << 30)

[Severity: Medium]
Could this shift operation overflow on 32-bit builds?

On 32-bit builds (which can be compiled via COMPILE_TEST), the unsigned
long type is 32 bits. The bitwise shift (40ul << 30) overflows this type
and evaluates to 0, which would incorrectly set the aperture base
address.

[ ... ]
> +static int bcm2712_iommu_attach_dev(struct iommu_domain *domain,
> +				    struct device *dev,
> +				    struct iommu_domain *old)
> +{
[ ... ]
> +	/*
> +	 * Set address cap and bypass range (note unintuitive off-by-ones).
> +	 * Requests to the bypass window pass straight through unchanged: this
> +	 * is useful for blocks which share an IOMMU with other blocks whose
> +	 * drivers are not IOMMU-aware.
> +	 */
> +	MMU_WR(MMMU_ADDR_CAP_OFFSET,
> +	       MMMU_ADDR_CAP_ENABLE +
> +	       ((mmu->aperture_start + mmu->aperture_size) >> ADDR_CAP_SHIFT)
> +	       - 1);

[Severity: High]
Could this calculation truncate if the aperture size is unaligned?

If mmu->aperture_size is not a multiple of 256MB, the bitwise shift
by ADDR_CAP_SHIFT will truncate the remainder. This can lead to an end
capacity that is mathematically lower than the start base, causing the
hardware to reject DMA accesses.

[Severity: High]
Is it safe to modify these hardware registers while the MMU is active?

The page table capacity registers (and page table base below) are being
updated without first clearing the enable bit (MMMU_CTRL_ENABLE). If the
MMU is actively processing DMA transactions during a domain transition,
in-flight requests might be evaluated against a mixed or corrupted state.

> +	MMU_WR(MMMU_BYPASS_START_OFFSET, 0);
> +	MMU_WR(MMMU_BYPASS_END_OFFSET,
> +	       MMMU_BYPASS_END_ENABLE + (mmu->aperture_start >> byp_shift));
> +
> +	/*
> +	 * When the IOMMU handles a request, it adds the PT_PA_BASE_OFFSET to
> +	 * (IOVA>>32) to calculate the PFN of the corresponding L1 directory pa=
ge.
> +	 * IOVA bits [31:22] are then used to fetch the L1 descriptor within
> +	 * (which in turn points to the L2 table).
> +	 * This clever logic would allow for a L1 table larger than 4kb (and he=
nce
> +	 * a larger aperture.
> +	 */
> +	pt_iommu_bcm2712_hw_info(&mydomain->pt, &info);
> +	MMU_WR(MMMU_PT_PA_BASE_OFFSET, (info.pt_base >> IOMMU_PAGE_SHIFT) -
> +				       (mmu->aperture_start >> 32));
[ ... ]
> +static int bcm2712_iommu_sync_range(struct iommu_domain *domain,
> +				    unsigned long iova, size_t size)
> +{
[ ... ]
> +	/* If invalidating more than 16MB, just do a full TLB clear */
> +	if (size >=3D SZ_16M) {
> +		MMU_WR(MMMU_CTRL_OFFSET,
> +		       MMMU_CTRL_OPERATING_FLAGS | MMMU_CTRL_TLB_CLEAR);

[Severity: High]
Can this unintentionally re-enable the MMU for a detached domain?

The MMU_WR call unconditionally applies MMMU_CTRL_OPERATING_FLAGS to the
hardware control register. If iommu_unmap() is called on a detached
domain, writing these operating flags would blindly re-enable the MMU.
This could break identity/bypass mode and disrupt active DMA bypass
transactions.

> +		readl_poll_timeout_atomic(mmu->reg_base + MMMU_CTRL_OFFSET, val,
> +					  !(val & MMMU_CTRL_TLB_CLEARING), 0,
> +					  1000);

[Severity: High]
Does this code need to handle the -ETIMEDOUT return value?

If the hardware times out, the function silently returns success, masking
hardware failures.

> +	} else {
> +		bcm2712_iommu_shootdown_range(mmu, iova, size);
> +	}
> +
> +	spin_unlock_irqrestore(&mmu->hw_lock, flags);
> +	return 0;
> +}
[ ... ]
> +static int bcm2712_iommu_of_xlate(struct device *dev,
> +				  const struct of_phandle_args *args)
> +{
> +	struct platform_device *iommu_dev =3D of_find_device_by_node(args->np);
> +	struct bcm2712_iommu *mmu =3D platform_get_drvdata(iommu_dev);

[Severity: High]
Is there a missing NULL check and a reference leak here?

of_find_device_by_node() acquires a reference to the device node and can
return NULL if the platform device is not found. Unconditionally passing
this pointer to platform_get_drvdata() would cause a NULL pointer
dereference. Also, the reference acquired by of_find_device_by_node() is
never released.

> +
> +	dev_iommu_priv_set(dev, mmu);
> +	return 0;
> +}
[ ... ]
> +static const struct iommu_ops bcm2712_iommu_ops =3D {
> +	.identity_domain =3D &bcm2712_identity_domain,
> +	.domain_alloc_paging =3D bcm2712_iommu_domain_alloc,
> +	.probe_device =3D bcm2712_iommu_probe_device,
> +	.device_group =3D generic_single_device_group,

[Severity: Critical]
Does assigning generic_single_device_group allow isolating devices that
share identical hardware translation state?

The hardware does not distinguish between different devices sharing the
IOMMU. Placing each device in a separate IOMMU group tells the IOMMU
core they are safely isolated.

If one of these devices is passed to a userspace driver (like VFIO), a
new domain attachment will blindly overwrite the shared hardware page
table registers for all connected devices, potentially allowing
unauthorized DMA access to kernel memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712-bcm2712-io=
mmu-submit-v1-0-80e10cdde2ea@reactivated.net?part=3D5
