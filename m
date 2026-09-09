Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F313B83E1
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788989987; cv=none; b=ZJ4gyQO90vsJPzi5Avr9Htc6Gbfqgshcs9VMYth5VMlRuvszhwfehZ9xGHNDqOe6rVEfzKw6J9W8Wqtibq45Mr5fhUwxse74tSV/GO3vC9HZdRstZcHrHvLQwsaaaoWFigZMzg3xsJ4ZoGl+C0+IH7HpqWXsOQfKwa4N6/Ji0gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788989987; c=relaxed/simple;
	bh=wW5ifA6n9tMS8z3mmmkMuM4S0IGyq4p4sAlmKv8OtA0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TUYMkHsLOsTLPg6WXqk5v/xysvaYLJUr9ZN2CJmOBOnnu0MTs5RxTLLX3UV7jhmpBSS0v9qVhBICj7M5QgkIjnG9+OtFzTgw+zRTNxWRnfOmir1BS57GEJsPjeU71nZ7YQPh8HLxnFtJHIuNQ7FT9gqX7oqX4xq3wCrAso6ORMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POYiFG4u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POYiFG4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A451F000FF;
	Wed,  9 Sep 2026 21:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788989977;
	bh=HWLRX46qflyUpgh/zwxDNfPiT21gsda8guLBjKTOXsE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=POYiFG4uI5kaS48SDseIsnV9q9XLQHcCaaaRuKqxQkUC7hTen27U/SY2FEJ5NX8Te
	 mF9CFQmPYVqhdAiOBhmmkj+s7ARQhTK5pHFW5wn5/ukVnc8sOUCSkBiWt8ZryyWCHH
	 jD7OzLZdgUfuneIrqAJyxOItO0qzM5q+7hGIXa0oF6o1ZrwvkEgAX0SegvQL3iuhE7
	 5TXD4VgwsglQPh/IjnqE7u2HUcmbsdoru79YOyTMQ+VbZLxTvi3PKWCZA4Ibt18pxU
	 lDH0aPUpldnOXKs9sDrm4LA/B1H3Ism/11ThEIToRgziDhYMbC2AfJOCTR7lgWzlp1
	 9Vt94KwKESmxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Drake" <dan@reactivated.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260909-bcm2712-iommu-submit-v5-4-2539c52b249e@reactivated.net>
References: <20260909-bcm2712-iommu-submit-v5-0-2539c52b249e@reactivated.net>
 <20260909-bcm2712-iommu-submit-v5-4-2539c52b249e@reactivated.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 21:39:36 +0000
Message-Id: <20260909213936.B2A451F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The driver incorrectly uses `generic_single_device_group` for mult=
iple devices sharing a single translation domain, violating hardware isolat=
ion semantics.
- [High] Missing device link between the IOMMU and its cache device allows =
Use-After-Free on device removal.
- [High] Missing `.remove` callback leaves a dangling IOMMU device in the g=
lobal list upon device removal.
- [High] The `domain->geometry` structure is left uninitialized, restrictin=
g the translation aperture to 0 and breaking TLB syncs.
--

commit 7e5917775c64fe2961bd6b93fe8f1dd2a7a55a9d
Author: Daniel Drake <dan@reactivated.net>

iommu: Add Broadcom BCM2712 IOMMU driver

This IOMMU translates memory access requests for the VC6 display
pipeline and various multimedia devices in the Broadcom BCM2712 SoC used
on Raspberry Pi 5.

> diff --git a/drivers/iommu/bcm2712-iommu.c b/drivers/iommu/bcm2712-iommu.c
> new file mode 100644
> index 0000000000000..301855475c88b
> --- /dev/null
> +++ b/drivers/iommu/bcm2712-iommu.c

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
> +		/* Configure translation aperture */
> +		bcm2712_iommu_writel(mmu, MMMU_ADDR_CAP_OFFSET,
> +				     MMMU_ADDR_CAP_ENABLE |
> +					     (domain->geometry.aperture_end >>
> +					      ADDR_CAP_SHIFT));

[Severity: High]
Is domain->geometry.aperture_end left uninitialized here?

In bcm2712_iommu_domain_alloc(), domain is allocated with kzalloc_obj(), wh=
ich
zeroes the structure, but geometry.aperture_end is never explicitly initial=
ized.

Would this configure a 0-sized translation aperture when writing to the
hardware register?

> +
> +		/*
> +		 * When the IOMMU handles a request, it adds the
> +		 * PT_PA_BASE_OFFSET to (IOVA>>32) to calculate the PFN of the
> +		 * corresponding L1 directory page.
> +		 * IOVA bits [31:22] are then used to fetch the L1 descriptor
> +		 * within (which in turn points to the L2 table).
> +		 * This clever logic would allow for a L1 table larger than 4kb
> +		 * (and hence a larger aperture).
> +		 */
> +		pt_iommu_bcm2712_hw_info(&mydomain->pt, &info);
> +		bcm2712_iommu_writel(mmu, MMMU_PT_PA_BASE_OFFSET,
> +				     info.pt_base >> IOMMU_PAGE_SHIFT);

[Severity: High]
Can this violate IOMMU isolation and corrupt DMA?

The hardware seems to share a single translation table across all connected
devices, as noted in the commit message. However, the driver configures
.device_group =3D generic_single_device_group, allowing the IOMMU framework=
 to
assign a unique group and potentially a different domain to each device.

When bcm2712_iommu_attach_dev() is called for a subsequent device, won't it
unconditionally reprogram the shared MMMU_PT_PA_BASE_OFFSET register, silen=
tly
hijacking and breaking DMA translations for previously attached devices?

[ ... ]

> +static void bcm2712_iommu_sync_all(struct iommu_domain *domain)
> +{
> +	size_t aperture_size =3D domain->geometry.aperture_end -
> +			       domain->geometry.aperture_start + 1;
> +
> +	bcm2712_iommu_sync_range(domain, domain->geometry.aperture_start,
> +				 aperture_size);
> +}

[Severity: High]
Since domain->geometry.aperture_end is uninitialized and zero, wouldn't
aperture_size evaluate to 1 byte, failing to invalidate the full TLB mappin=
g?

[ ... ]

> +static struct iommu_domain *bcm2712_iommu_domain_alloc(struct device *de=
v)
> +{
> +	struct bcm2712_iommu *mmu =3D dev_iommu_priv_get(dev);
> +	struct bcm2712_iommu_domain *domain;
> +	struct pt_iommu_bcm2712_cfg cfg =3D {};
> +	int ret;
> +
> +	domain =3D kzalloc_obj(*domain);
> +	if (!domain)
> +		return NULL;

[Severity: High]
Does this code miss initializing the domain->base.geometry fields, which
results in the issues pointed out in bcm2712_iommu_attach_dev() and
bcm2712_iommu_sync_all()?

[ ... ]

> +static const struct iommu_ops bcm2712_iommu_ops =3D {
> +	.identity_domain     =3D &bcm2712_identity_domain,
> +	.domain_alloc_paging =3D bcm2712_iommu_domain_alloc,
> +	.probe_device        =3D bcm2712_iommu_probe_device,
> +	.device_group        =3D generic_single_device_group,
> +	.get_resv_regions    =3D iommu_dma_get_resv_regions,
> +	.of_xlate            =3D bcm2712_iommu_of_xlate,
> +};

[Severity: High]
Does configuring generic_single_device_group incorrectly isolate devices th=
at
share a single hardware translation table, leading to the domain hijacking =
in
bcm2712_iommu_attach_dev()?

[ ... ]

> +static int bcm2712_iommu_init_cache(struct bcm2712_iommu *mmu,
> +				    struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +
> +	struct device_node *cache_np __free(device_node) =3D
> +		of_parse_phandle(dev->of_node, "brcm,iommu-cache", 0);
> +	if (!cache_np)
> +		return dev_err_probe(dev, -ENOENT,
> +				     "missing brcm,iommu-cache property\n");
> +
> +	struct platform_device *cache_pdev __free(platform_device_put) =3D
> +		of_find_device_by_node(cache_np);
> +	if (!cache_pdev)
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				     "waiting for cache device\n");
> +
> +	mmu->cache =3D platform_get_drvdata(cache_pdev);

[Severity: High]
Does this leave a dangling pointer if the cache device is unbound?

The reference to cache_pdev is automatically put when leaving this function
due to __free(platform_device_put), and no device link is established.

If the cache device is dynamically destroyed, its devres allocations will be
freed, leaving mmu->cache pointing to freed memory which could cause a
use-after-free during a TLB flush.

[ ... ]

> +static struct platform_driver bcm2712_iommu_driver =3D {
> +	.driver	=3D {
> +		.name		     =3D "bcm2712-iommu",
> +		.of_match_table	     =3D bcm2712_iommu_of_match,
> +		.suppress_bind_attrs =3D true,
> +	},
> +	.probe	=3D bcm2712_iommu_probe,
> +};

[Severity: High]
Can removing the device cause a use-after-free in the IOMMU subsystem?

Because this driver registers the IOMMU device using iommu_device_register()
but does not provide a .remove callback, iommu_device_unregister() is never
called.=20

If the platform device is removed, the driver core frees the devm_kzalloc
allocated struct bcm2712_iommu, but it remains in the global iommu_device_l=
ist,
leading to a use-after-free when traversed by other parts of the kernel.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-bcm2712-io=
mmu-submit-v5-0-2539c52b249e@reactivated.net?part=3D4
