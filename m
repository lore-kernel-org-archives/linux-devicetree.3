Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC8B222582
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 21:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783892188; cv=none; b=eMHmgpL6bSt3r6vgPprJzU6ZhCie35FkcT7r9+qFqr0jyexEvV7736Luu3+EHQRZW8QK2SfLEdwb8r0yPThvE49Jr+rHwa98C45I/ysiT6SntdO/4Kr4YbEsj32ByBzZ0PweWaKCDzQjREah+wWlXm7oZN+BkpZ6olDCYahjnBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783892188; c=relaxed/simple;
	bh=wCCF0fNdDZiRazrmg46ZzKRIaPJMN1o6eFbSBpkH5uY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mEylEG22EJ5ro8S7nbaPODzYy3aaEo/HSpFv4lNtjZFh6U5aAULVI7oqtwJ0MTk65WRP7HEllPAFl6uZajc8YyuIbeSkKQ/O3yl8ydq5i4CsEQ4Tup9jePxFcyRhqiOTtazrAsVdxCf3bavtGKeRr71hW4D077A/mKac2DQcX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gON25A/m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gON25A/m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8D41F000E9;
	Sun, 12 Jul 2026 21:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783892186;
	bh=8MvS+TNdwRUudgAAevK0uUHtB759qaVgUEvz5UuBciU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gON25A/mZBA/yfZldfEL3p5+lwtbblVAOCJTh3MZlfnK/o1sXkxZwvHIz5KSNGLYv
	 yKX01OnJkD/qBgq8/KSQqsE49auz17YbXOdOupe1zZPLghIp5hMTliihTrfyw7GUJb
	 E1ceITtfo5bTzgXXLYIMlXugXNC0oaB9lFCV5tpX5XN2vBAj6RBEE1nWc4913x3TL5
	 Ln37l4B8OfNgwn7b0U9p75EnA3JQqWIjr9LFKaefbJIiQbspWgSlsyoWtMUyGZwmoX
	 XbPhMS/iWX5u8UE2ibgZM9EdfnP7uHji8P6wIhrfO/6XIagVQsMeoBMjbPMrLJvK8h
	 S9+BGVurSPbdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] iommu/generic_pt: Add Broadcom BCM2712 page table
 format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Drake" <dan@reactivated.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-4-80e10cdde2ea@reactivated.net>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-4-80e10cdde2ea@reactivated.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 21:36:25 +0000
Message-Id: <20260712213626.1D8D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Physical addresses for page tables are silently truncated if they =
exceed 40 bits.
- [High] Installing a contiguous block for an unsupported page size results=
 in mismatched PAGESIZE hints and partial unmapping.
- [Low] Unnecessary Kconfig dependency on !GENERIC_ATOMIC64 restricts compi=
lation on 32-bit architectures.
- [Low] Missing module test dependency in IOMMU_PT_KUNIT_TEST.
--

--- Patch [4]: [PATCH 4/6] iommu/generic_pt: Add Broadcom BCM2712 page tabl=
e format ---
commit de6027129434bac44f0964115b67d7adb9dca294
Author: Daniel Drake <dan@reactivated.net>

iommu/generic_pt: Add Broadcom BCM2712 page table format

The BCM2712 IOMMU implements a 2-level page table format. It is relatively
simple, with one unusual aspect: leaf entries can only be installed at
Level 0.

> diff --git a/drivers/iommu/generic_pt/Kconfig b/drivers/iommu/generic_pt/=
Kconfig
> index f4ed1add58b74..5c01cebb365fa 100644
> --- a/drivers/iommu/generic_pt/Kconfig
> +++ b/drivers/iommu/generic_pt/Kconfig
[ ... ]
> +config IOMMU_PT_BCM2712
> +	tristate "IOMMU page table for Broadcom BCM2712"
> +	depends on !GENERIC_ATOMIC64 # for cmpxchg64

[Severity: Low]
Is this dependency necessary? The bcm2712 format appears to use 32-bit entr=
ies
(pt_bcm2712_entry_t) and pt_table_install32(), which only requires standard
32-bit cmpxchg.

It doesn't seem to use cmpxchg64, and this dependency artificially restricts
compilation on 32-bit architectures during COMPILE_TEST.

> +	help
> +	  iommu_domain implementation for the Broadcom BCM2712 IOMMU found on
> +	  Raspberry Pi 5. It supports 4K page sizes over a 2-level page table
> +	  format.
> +
> +	  Selected automatically by an IOMMU driver that uses this format.
> +
>  config IOMMU_PT_KUNIT_TEST
>  	tristate "IOMMU Page Table KUnit Test" if !KUNIT_ALL_TESTS
>  	depends on KUNIT

[Severity: Low]
Does this test need a conditional dependency for the new BCM2712 format?

If IOMMU_PT_BCM2712 is compiled as a module, but this test is built-in (=3D=
y),
it might cause a linker failure. Other formats typically have a dependency
list like "depends on IOMMU_PT_X86_64 || !IOMMU_PT_X86_64" to ensure the te=
st
degrades to a module if any supported format is a module.

> diff --git a/drivers/iommu/generic_pt/fmt/bcm2712.h b/drivers/iommu/gener=
ic_pt/fmt/bcm2712.h
> new file mode 100644
> index 0000000000000..e62d59181bfe5
> --- /dev/null
> +++ b/drivers/iommu/generic_pt/fmt/bcm2712.h
[ ... ]
> +static inline void
> +bcm2712pt_install_leaf_entry(struct pt_state *pts, pt_oaddr_t oa,
> +			     unsigned int oasz_lg2,
> +			     const struct pt_write_attrs *attrs)
> +{
[ ... ]
> +	if (oasz_lg2 =3D=3D PT_GRANULE_LG2SZ) {
> +		WRITE_ONCE(tablep[pts->index], entry);
> +		pts->entry =3D entry;
> +	} else {
> +		struct pt_bcm2712 *table =3D
> +			common_to_bcm2712pt(pts->range->common);
> +		u32 *end;
> +
> +		tablep +=3D pts->index;
> +		end =3D tablep + log2_to_int(oasz_lg2 - PT_GRANULE_LG2SZ);
> +
> +		/*
> +		 * Leaf entries can contain hints indicating multi-page
> +		 * contiguous mappings, presumably to permit TLB optimization
> +		 */
> +		if (oasz_lg2 =3D=3D ilog2(SZ_4M))
> +			entry |=3D FIELD_PREP(BCM2712PT_PAGESIZE, 3);
> +		else if (oasz_lg2 =3D=3D table->superpage_lg2)
> +			entry |=3D FIELD_PREP(BCM2712PT_PAGESIZE, 2);
> +		else if (oasz_lg2 =3D=3D table->bigpage_lg2)
> +			entry |=3D FIELD_PREP(BCM2712PT_PAGESIZE, 1);
> +
> +		pts->entry =3D entry;
> +		for (; tablep !=3D end; tablep++, entry++)
> +			WRITE_ONCE(*tablep, entry);
> +	}
> +}

[Severity: High]
If a driver requests a contiguous leaf entry for an unsupported size, does
this logic leave the PAGESIZE hint as 0 while still writing the full block
of PTEs?

If the layout is initialized with an incoming cfg->pgsize_bitmap containing
sizes this format cannot encode, the hint is never set here. Later, when
unmapping, bcm2712pt_entry_num_contig_lg2() will read the 0 hint, assume it
is a single 4KB page, and fail to clear the remainder of the block.

Could this result in stale mappings remaining active in the hardware and
causing memory corruption or use-after-free via DMA?

[ ... ]
> +static inline bool bcm2712pt_install_table(struct pt_state *pts,
> +					   pt_oaddr_t table_pa,
> +					   const struct pt_write_attrs *attrs)
> +{
> +	pt_bcm2712_entry_t entry =3D
> +		BCM2712PT_VALID |
> +		FIELD_PREP(BCM2712PT_PFN,
> +			   oalog2_div(table_pa, PT_GRANULE_LG2SZ));
> +
> +	return pt_table_install32(pts, entry);
> +}

[Severity: High]
Can this silently truncate physical addresses larger than 40 bits?

The framework allocates page tables using standard GFP_KERNEL memory, which
can exceed 1TB on generic ARM64 kernels. Since the BCM2712 format encodes
a 28-bit PFN, and FIELD_PREP silently masks out upper bits, an address
above 1TB could be truncated. This could result in programming an incorrect
physical address into the hardware table.

[ ... ]
> +static inline int bcm2712_pt_fmt_init(struct pt_iommu_table *fmt_table,
> +				      const struct pt_iommu_bcm2712_cfg *cfg)
> +{
> +	fmt_table->bcm2712pt.pgsize_bitmap =3D cfg->pgsize_bitmap;
> +	fmt_table->bcm2712pt.bigpage_lg2 =3D cfg->bigpage_lg2;
> +	fmt_table->bcm2712pt.superpage_lg2 =3D cfg->superpage_lg2;
> +	pt_top_set_level(&fmt_table->bcm2712pt.common, PT_MAX_TOP_LEVEL);
> +	return 0;
> +}

[Severity: High]
Should this pgsize_bitmap be sanitized or masked against the specific sizes
the bcm2712 format can actually encode (4K, bigpage, superpage, 4M)?

Implicitly trusting the incoming configuration is what allows the unsupport=
ed
page size issue in bcm2712pt_install_leaf_entry() to occur.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712-bcm2712-io=
mmu-submit-v1-0-80e10cdde2ea@reactivated.net?part=3D4
