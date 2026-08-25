Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5E92727F3
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 21:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787692365; cv=none; b=fmAszjSTtGAzKMuMgieX/dW52CU2zcFPawey6pIIFdQeCvWS/qZtHUQ2R5UlXXC6xZ//fRnt5kHxbd+O+jEnlLAIkzBnW56n1LzQZE49ZTTZIxeo91112c8nbF4E0sWG8ureqJHv4Z7ZUDTSS149jHpEqO5sWTs3siUxD0rRn+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787692365; c=relaxed/simple;
	bh=XR8p6AcCrrT1sgm1gdY8V79JOk0rgh335oElm7TTBv0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lnDAqGdZp+rbjqU+EEqRkHVRpoxFbT0xdV+mkVvZQEIKb34seLvWxGatzM9bo/36s5XnaxDS6B4pjJE2RunYbM4B3iBcf8caB9kUAy+jSMc3lHHQCZmayGkG6R/VuOwJQ65P2567Keew/WoUs1dbimTXnRQMRLufHkob97qwA10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBPAHll1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBPAHll1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47871F000E9;
	Tue, 25 Aug 2026 21:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787692364;
	bh=U9ihuMd0IFaOCdcVMdyw5SPNdqupluC6st52WLZhtpo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YBPAHll1EYTPR7k6Vfss+oySjb9GBTc4AHn2dGntyt8AhiS0ylO+XX2y1mATkEzUx
	 wR7BFTQucLDzHXn8b3qt3leB537VoJS6uiDdxjFjTH6gdQ1raegzj4ih5usS7/06Y3
	 sJ4b8GQ0ivapgzlvb8iotryMJJ+kQqvIxAxcnPc1W4f2A8BoItbfnIeekkYwFpDX+6
	 B08rioT1PuTQZ2EEFAWgWAcCA1/jwvLQOGIXAMC+uzvJMg8rshysvBfVnQ9B8Xve8b
	 jjW0sMsEx1yC4vh//Lpw+CzgHDB4tLX1OQLO8P4oEhWt4tnGV3soVyr5YuD7kzckiv
	 7JWJ89uv4XV0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Drake" <dan@reactivated.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825-bcm2712-iommu-submit-v3-4-7f143e7289b6@reactivated.net>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
 <20260825-bcm2712-iommu-submit-v3-4-7f143e7289b6@reactivated.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 21:12:43 +0000
Message-Id: <20260825211243.E47871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] The driver assigns devices sharing the same IOMMU to separate =
groups via `generic_single_device_group`, breaking isolation and corrupting=
 hardware state.
- [Critical] The blocking domain leaves the MMU enabled but does not clear =
`MMMU_ILLEGAL_ADR_OFFSET`, causing a Use-After-Free of the previous domain'=
s default page.
- [High] Missing TLB and cache flush in `bcm2712_iommu_blocking_attach` all=
ows DMA to bypass the blocking domain.
- [High] The default error page is allocated without `__GFP_ZERO`, leaking =
uninitialized kernel memory to devices on illegal DMA reads.
--

commit b630b8b804af580183dabdb17ea88c2d7bc1b777
Author: Daniel Drake <dan@reactivated.net>

iommu: Add Broadcom BCM2712 IOMMU driver

This commit adds a new IOMMU driver for the Broadcom BCM2712 SoC used in the
Raspberry Pi 5. It uses the generic_pt framework for 2-level page tables and
manages a centralized L2 TLB shared across the SoC's IOMMU instances.

> --- /dev/null
> +++ b/drivers/iommu/bcm2712-iommu.c

[ ... ]

> +static int bcm2712_iommu_blocking_attach(struct iommu_domain *blocking_d=
omain,
> +					 struct device *dev,
> +					 struct iommu_domain *old)
> +{
> +	struct bcm2712_iommu *mmu =3D dev_iommu_priv_get(dev);
> +
> +	guard(spinlock_irqsave)(&mmu->hw_lock);
> +
> +	/*
> +	 * Completely block DMA by disabling both the bypass window and the
> +	 * translation aperture.
> +	 */
> +	MMU_WR(MMMU_BYPASS_START_OFFSET, 0);
> +	MMU_WR(MMMU_BYPASS_END_OFFSET, 0);
> +	MMU_WR(MMMU_ADDR_CAP_OFFSET, MMMU_ADDR_CAP_ENABLE);
> +	MMU_WR(MMMU_CTRL_OFFSET, MMMU_CTRL_OPERATING_FLAGS);
> +
> +	mmu->domain =3D NULL;

[Severity: High]
Does this leave stale translations in the hardware TLB indefinitely?
The IOMMU transitions to a blocking domain and the hardware remains
enabled with MMMU_CTRL_OPERATING_FLAGS, but there is no TLB clear or
cache flush performed before returning. Since mmu->domain is set to NULL
here, subsequent unmap or iotlb_sync calls on the detached paging domain
will return immediately without flushing, which might allow a blocked
device to perform DMA to previously mapped pages.

[Severity: Critical]
Could this also lead to a use-after-free of the default page? When
attaching the blocking domain, MMMU_ILLEGAL_ADR_OFFSET is not cleared,
but the MMU is left enabled. When the previous paging domain is
subsequently freed in bcm2712_iommu_domain_free(), it bypasses disabling
the hardware because mmu->domain is NULL. It will then free
mydomain->default_page, meaning the active hardware will redirect all
further illegal DMA accesses to the physical address of a freed page.

> +
> +	return 0;
> +}

[ ... ]

> +static int bcm2712_iommu_attach_dev(struct iommu_domain *domain,
> +				    struct device *dev,
> +				    struct iommu_domain *old)
> +{
> +	struct bcm2712_iommu *mmu =3D dev_iommu_priv_get(dev);
> +	struct bcm2712_iommu_domain *mydomain =3D to_bcm2712_domain(domain);
> +	struct pt_iommu_bcm2712_hw_info info;
> +	u32 default_page_pfn;
> +	int ret =3D 0;
> +
> +	/* all attached devices must belong to the same IOMMU instance */
> +	if (mydomain->mmu !=3D mmu)
> +		return -EINVAL;
> +
> +	scoped_guard(spinlock_irqsave, &mmu->hw_lock) {
> +		if (mmu->domain =3D=3D mydomain)
> +			break;
> +
> +		mmu->domain =3D mydomain;
> +
> +		/* Configure translation aperture */
> +		MMU_WR(MMMU_ADDR_CAP_OFFSET,
> +		       MMMU_ADDR_CAP_ENABLE +
> +		       (domain->geometry.aperture_end >> ADDR_CAP_SHIFT));

[Severity: Critical]
Will this break mappings for other devices sharing the IOMMU? The commit
states there is no stream ID tagging to differentiate between requests from
different devices. However, because bcm2712_iommu_ops configures
generic_single_device_group, the IOMMU core assigns a distinct group and
domain to each device. When a new device is attached here, it sequentially
overwrites shared registers like MMMU_ADDR_CAP_OFFSET and
MMMU_PT_PA_BASE_OFFSET, silently breaking DMA traffic for previously
attached devices.

> +
> +		/*
> +		 * When the IOMMU handles a request, it adds the

[ ... ]

> +static struct iommu_domain *bcm2712_iommu_domain_alloc(struct device *de=
v)
> +{
> +	struct bcm2712_iommu *mmu =3D dev_iommu_priv_get(dev);
> +	struct bcm2712_iommu_domain *domain;
> +	struct pt_iommu_bcm2712_cfg cfg;
> +	int ret;

[ ... ]

> +	ret =3D pt_iommu_bcm2712_init(&domain->pt, &cfg, GFP_KERNEL);
> +	if (ret)
> +		goto err;
> +
> +	/* Set up a default (error) page used to catch illegal reads/writes */
> +	domain->default_page =3D iommu_alloc_pages_sz(GFP_KERNEL, PAGE_SIZE);

[Severity: High]
Could this leak uninitialized kernel memory to devices? This page is
configured as the sink/source for illegal DMA reads in
MMMU_ILLEGAL_ADR_OFFSET. Without the __GFP_ZERO flag, the allocated page
might contain leftover kernel data that a device could exfiltrate by
issuing an illegal DMA read.

> +	if (!domain->default_page)
> +		goto err;
> +
> +	domain->base.ops =3D &bcm2712_paging_domain_ops;
> +	return &domain->base;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-bcm2712-io=
mmu-submit-v3-0-7f143e7289b6@reactivated.net?part=3D4
