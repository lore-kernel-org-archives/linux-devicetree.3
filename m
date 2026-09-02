Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1364F38B135
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372766; cv=none; b=RVdjOi5F2BvElVcEWazE6gTCUZhwB8VzyNo9Mf/eHhvV8odcdbRf++tahqZbiiTwQ+QOSn+0deBTMcj3r/XncnB5nUT51Ujn6QVOPd9ki6vbIKhLl4mJ28/3j8qRuyevMkCs8dkJG/CaJRQGJRrIDFfATGZ/g+IJwcRUg/d/zGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372766; c=relaxed/simple;
	bh=AcAMXtNRjExTP5GAcrbegG4QIMgmnqhGLz1D9fCQ1Sc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CApaQxOYUU4IlzyO8yh85SfwTAZkpJXXY4I33/uoezDBO/JAu8vjbtOBDlzrEuMc/uHUZUcOivwJVg0OiAwYb/bNyR/AM64rB4WkiLU1BtEHOV1wzY0vEmB7G9B1KKlLfVNfdou9qVkt8Ga8VckIaRj7tt99zulzoPmNyw/uF4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzMLrFoe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzMLrFoe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204E81F000E9;
	Wed,  2 Sep 2026 18:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372764;
	bh=PtkmDWDtZuoIv8ssdjqbt/+RUznQpFuLyRz/o1sUN5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NzMLrFoehk7UrGTVBJtaMChDvseKAekaXBBmFmlMYOUkgUSuXuxvNj3ezfloXbaj1
	 /gGyuSD9PuItjGgiWPcEnz7SqCZOouS/yOdYEzA1EkU/bmp0Uaue3p3bHo00YdpMur
	 PgZF+b1l7OHfrAocF9a6Qr6ov8TluqeW3aBkZFp2n+cK6QYTsFkB8v0WiYrR30OiuG
	 tcYSsYKBe36DL0mNIOLMyS9aOEIkyDE8dqMMvj6YHmB6wvn+ycxxlNxb88Ytjty62m
	 kjuGbhezID0Xl4OP2PfIiv41X0hipPn77G5iX6H48GZd+NTCgvwl26e1Jna2RBttfP
	 kh73ajTmzDsXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Drake" <dan@reactivated.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902-bcm2712-iommu-submit-v4-4-9dbb657578c1@reactivated.net>
References: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
 <20260902-bcm2712-iommu-submit-v4-4-9dbb657578c1@reactivated.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:12:43 +0000
Message-Id: <20260902181244.204E81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] bcm2712_iommu_blocking_attach leaves a 256MB translation apert=
ure open and the MMU enabled, causing a hardware Use-After-Free of the IOMM=
U page tables.
--

commit 62f0e0782086d4384ce15907946195c825fc95b3
Author: Daniel Drake <dan@reactivated.net>
iommu: Add Broadcom BCM2712 IOMMU driver

This commit introduces a new IOMMU driver for the Broadcom BCM2712 SoC used
on Raspberry Pi 5. It uses the generic_pt framework for its 2-level page ta=
bles
and supports the centralized L2 TLB.

> diff --git a/drivers/iommu/bcm2712-iommu.c b/drivers/iommu/bcm2712-iommu.c
> new file mode 100644
> index 0000000000000..27dad375b7d4b
> --- /dev/null
> +++ b/drivers/iommu/bcm2712-iommu.c
[ ... ]
> +static int bcm2712_iommu_blocking_attach(struct iommu_domain *blocking_d=
omain,
> +					 struct device *dev,
> +					 struct iommu_domain *old)
> +{
> +	struct bcm2712_iommu *mmu =3D dev_iommu_priv_get(dev);
> +	int ret =3D 0;
> +
> +	scoped_guard(spinlock_irqsave, &mmu->hw_lock) {
> +		/*
> +		 * Completely block DMA by disabling both the bypass window
> +		 * and the translation aperture.
> +		 */
> +		bcm2712_iommu_writel(mmu, MMMU_BYPASS_START_OFFSET, 0);
> +		bcm2712_iommu_writel(mmu, MMMU_BYPASS_END_OFFSET, 0);
> +		bcm2712_iommu_writel(mmu, MMMU_ADDR_CAP_OFFSET,
> +				     MMMU_ADDR_CAP_ENABLE);
> +		bcm2712_iommu_writel(mmu, MMMU_ILLEGAL_ADR_OFFSET, 0);
> +		ret =3D bcm2712_iommu_clear_and_enable(mmu);
> +		mmu->domain =3D NULL;

[Severity: Critical]
Does this mistakenly enable a 256MB translation aperture rather than
disabling it?

The code writes MMMU_ADDR_CAP_ENABLE to the MMMU_ADDR_CAP_OFFSET register
and leaves the MMU enabled via bcm2712_iommu_clear_and_enable(), without
safely resetting the page table base register.

Also, clearing mmu->domain to NULL here appears to prevent the old domain
from disabling the hardware before its page tables are freed.

> +	}
> +
> +	if (ret)
> +		dev_err_ratelimited(mmu->dev,
> +				    "TLB clear timed out during blocking attach\n");
> +
> +	return ret;
> +}
[ ... ]
> +static void bcm2712_iommu_domain_free(struct iommu_domain *domain)
> +{
> +	struct bcm2712_iommu_domain *mydomain =3D to_bcm2712_domain(domain);
> +	struct bcm2712_iommu *mmu =3D mydomain->mmu;
> +
> +	scoped_guard(spinlock_irqsave, &mmu->hw_lock) {
> +		if (mmu->domain =3D=3D mydomain) {
> +			bcm2712_iommu_writel(mmu, MMMU_CTRL_OFFSET, 0);
> +			mmu->domain =3D NULL;
> +		}
> +	}
> +
> +	pt_iommu_deinit(&mydomain->pt.iommu);

[Severity: Critical]
Can this cause a hardware use-after-free of the IOMMU page tables?

When a device is detached or bound to a blocking domain,
bcm2712_iommu_blocking_attach() clears mmu->domain to NULL. When the old
domain is subsequently freed here, the mmu->domain =3D=3D mydomain check
evaluates to false.

Because the MMU hardware is not disabled, it can continue fetching page
table entries from memory while they are being freed back to the kernel
allocator via pt_iommu_deinit().

> +	if (mydomain->default_page)
> +		iommu_free_pages(mydomain->default_page);
> +	kfree(mydomain);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-bcm2712-io=
mmu-submit-v4-0-9dbb657578c1@reactivated.net?part=3D4
