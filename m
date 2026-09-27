Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C837E3EFD27
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 13:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790515490; cv=none; b=hCnPHjzUR3sY6GLKPmNTH8mSQ4tcCS7Sq6Oj2rOYLrTVoDEgECFvuikDJHBhHdsox0sCUiVm8G823SzUs+Lnz79tkIrU2faQXV8MLDhELRsqKM1eJKzOzV/lhJCDvZVoS2Ke4VGuXEamcdSUsEbF56pcFWK3PFZxxn7Wkr+uhG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790515490; c=relaxed/simple;
	bh=rD1JaLzBI+QxeIRyopxjzn+MW6/UAjvXA/AFTi2hIuw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S86z9ErO35YGVAvPa+8ZBWDnqmHpOBk+42iN9BjhdSUo06Cpa4P/gCqR489NYFlCPXOMlDBzadunl3JhvFShu9UE5baWcRa1o2whR3h61MW4Rtgk7n37ATbLyAO1aPVaEpyOExcVOhN2GEMwM16TWhninfPkizTm1ufi+lt4m5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exJQ+04X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exJQ+04X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356051F000FF;
	Sun, 27 Sep 2026 13:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790515488;
	bh=KoOVsfV85HgMVrVt+gmc7IKsWlReGPERzbMkZ6waMac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=exJQ+04X/rsNqnBRbTulCchH3jMD8P7sOn8ZbWBI5L/UjnOHbH3au5plnbxmgxg9+
	 OioP5KkA3WAMI9ugNPABppuhPhVPm1aOg9i6rWg3zC7i+hA/H4+Xg3ucOVB6ZLpM0L
	 2FTnKBeBTSlZakb/u7EmZ7+drly/dnxwz4wXTa2kOLjWy9x9g/kR4UKSQFdYMwiBd1
	 iQp5tKEDyAVi29HFaCAhC6z0nGnFudGaCzD74MqJ1WVbJyqwq1tfsHa5P74MPMMmlY
	 w5ZcK5RvDqKJBZr4mPqIxwcQCKw+wc5+Ws34jTksr9QZ62cX5eovc3bMiMnHIoBEaA
	 4557uEaWcyR7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/6] iommu: Add Broadcom BCM2712 IOMMU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Drake" <dan@reactivated.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260927-bcm2712-iommu-submit-v7-5-dfa2b975cbc9@reactivated.net>
References: <20260927-bcm2712-iommu-submit-v7-0-dfa2b975cbc9@reactivated.net>
 <20260927-bcm2712-iommu-submit-v7-5-dfa2b975cbc9@reactivated.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 13:24:47 +0000
Message-Id: <20260927132448.356051F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] iommu: broken DMA isolation due to generic_single_device_group
- [High] iommu: uninitialized memory leak via incoherent default_page
- [Low] iommu: size_t overflow in bcm2712_iommu_sync_all()
--

commit daad3b662648584593b6a5e3770130350e53fb7b
Author: Daniel Drake <dan@reactivated.net>
Subject: iommu: Add Broadcom BCM2712 IOMMU driver

This commit introduces the IOMMU driver for the Broadcom BCM2712 SoC used
on the Raspberry Pi 5. The driver uses the generic_pt framework to manage
2-level page tables and provides support for the centralized L2 TLB.

> --- /dev/null
> +++ b/drivers/iommu/bcm2712-iommu.c
> [ ... ]
> +static int bcm2712_iommu_attach_dev(struct iommu_domain *domain,
> +				    struct device *dev,
> +				    struct iommu_domain *old)
> +{
> [ ... ]
> +		pt_iommu_bcm2712_hw_info(&mydomain->pt, &info);
> +		bcm2712_iommu_writel(mmu, MMMU_PT_PA_BASE_OFFSET,
> +				     info.pt_base >> IOMMU_PAGE_SHIFT);

[Severity: High]
Since this IOMMU hardware shares a single translation aperture with no stre=
am
ID tagging, what happens if multiple devices are attached to different IOMMU
domains simultaneously?

When a new domain is attached, this unconditionally updates the shared
MMMU_PT_PA_BASE_OFFSET register. Won't this silently hijack the hardware
translation context of any previously attached devices, forcing them into t=
he
new domain and breaking DMA isolation?

> [ ... ]
> +static void bcm2712_iommu_sync_all(struct iommu_domain *domain)
> +{
> +	size_t aperture_size =3D domain->geometry.aperture_end -
> +			       domain->geometry.aperture_start + 1;
> +
> +	bcm2712_iommu_sync_range(domain, domain->geometry.aperture_start,
> +				 aperture_size);
> +}

[Severity: Low]
When this code is built on a 32-bit architecture (for instance, via
COMPILE_TEST), size_t is 32-bit. Since domain->geometry.aperture_end is
populated as 0xFFFFFFFF and aperture_start is 0, does the calculation
0xFFFFFFFF - 0 + 1 mathematically overflow to 0?

If aperture_size overflows to 0, bcm2712_iommu_sync_range() will return ear=
ly
without flushing the hardware TLB. Could this be avoided by using a larger
type or adjusting the size calculation?

> [ ... ]
> +static struct iommu_domain *bcm2712_iommu_domain_alloc(struct device *de=
v)
> +{
> [ ... ]
> +	/* Set up a default (error) page used to catch illegal reads/writes */
> +	domain->default_page =3D iommu_alloc_pages_sz(GFP_KERNEL, PAGE_SIZE);
> +	if (!domain->default_page)
> +		goto err;

[Severity: High]
The default_page allocated here is zeroed by the CPU in its cache, but the
hardware is explicitly configured as DMA-incoherent (PT_FEAT_DMA_INCOHERENT=
).

When the physical address of this unflushed page is later provided to the
hardware's MMMU_ILLEGAL_ADR_OFFSET register, could the IOMMU fetch stale
physical memory contents by bypassing the CPU cache during an illegal read?
Should this page be explicitly flushed to main memory to prevent a potential
information leak?

> [ ... ]
> +static const struct iommu_ops bcm2712_iommu_ops =3D {
> +	.identity_domain     =3D &bcm2712_identity_domain,
> +	.domain_alloc_paging =3D bcm2712_iommu_domain_alloc,
> +	.probe_device        =3D bcm2712_iommu_probe_device,
> +	.device_group        =3D generic_single_device_group,

[Severity: High]
Does assigning generic_single_device_group improperly allocate an independe=
nt
IOMMU group for each device?

Since devices on this IOMMU lack hardware isolation and share the single
translation aperture updated in bcm2712_iommu_attach_dev(), shouldn't they
share a single IOMMU group to prevent userspace or VMs from assigning them
to separate domains?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-bcm2712-io=
mmu-submit-v7-0-dfa2b975cbc9@reactivated.net?part=3D5
