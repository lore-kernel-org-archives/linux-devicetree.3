Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103844;
	b=g8c3tLBwwGWxk8rtjrpGQRdV+rQOGFvJpc90fu+3+3Pscf7ExUXcjKTHKtSbPePuyBih
	 qBaODUDti9u1kUpujVkUBru40/rkZas/mO/dfIAdf7I32J9GKYi2saYxrHTOtB3Gc3xBo
	 /K12BlYDz7GOi5HbIPmP/tzSWw0Az4QBQa/2wgpsi0WxzMSliYAA1riQqGc8xYVQVgucu
	 DCK5IGGh30FtctVqPTzFTqZunC1txARITfO6scTNE9o0aJcbzFq5bFn1jAZa29FETMJRO
	 V2lk7+VfdKlXj4ipEjYF4DcW51msMNIzAT+PTmui53xGo3fCpStUSQez+FFHsv7cutw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103844;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ear7BbXZo1erWkwnXi9WUQQtPsbSelk6scXXnS5U++g=;
	b=VnIRKQz2srB1q1nt+rJ4mJ76XDU0MDgOQs+yqpqRKhn0eLb1T1aYqFeSmSGXUP9Dnra1
	 ISi7a2nvr+wBRxm6iWeC4U+4aDR9omHJj5ReItb7BZ9pjYPoeSDSJY4qVMuHuMpOe3HQX
	 RtMO8lNLybg7vhK4ucFt535pwbPb8x3m2iX7DqpxQWjW54tTCToIgrBRY6yuV8/GJUjlu
	 lNve/8mGT83ud4MdRtz0Mt0lheY7r86yLd1rkD7Z+It1lZOOCq1tmm2SpzaUL1ps9eh1c
	 GzEJ13jq4Swz9rFCHhXV5+v6LyRXNLTOL2vE7FDqiQIf5W6w8ryj6fga4TZdffSisEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AHM3ruVL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3405606A326
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AHM3ruVL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADE71F000C7;
	Thu, 19 Nov 2026 15:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103844;
	bh=ear7BbXZo1erWkwnXi9WUQQtPsbSelk6scXXnS5U++g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AHM3ruVLTeeW+yHlFDKVpwlKeShT3h3PF08RZniZszQQtZ0FVbqqAWQyOK7lYS64i
	 Z2x+TjX+grHQl7/PPa73VISmKKdDaNimjmTE7cYLw8vxRLXpX0qyV8jG18dvxGxnX/
	 uSyD5sQ69FdhhKXe9dpQ9fBoYgnQCVUBn2QMW94NS1UY7SxGQUKEkBvteRrYUSFjdT
	 NTAfU/1yGfWerZURTCmnfDv98AyfMyL2a7mB1o83diFyppOfzPisubML4fxBTEPha/
	 l7MXd6IqFEC7W8DWwgdnI4v8a52nKj4wHvbSmaxzfEzimGslYsg4y0Krk8N9/smu89
	 538GXbceVtCTw==
Message-ID: <sashiko-outbox-223446@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 12/28] media: mali-vpu: prepare firmware address
 space
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charvi Mehta" <charvi.mehta@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119153758.1426673-13-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-13-charvi.mehta@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 15:57:23 +0000
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
- [Medium] media: mali-vpu: rounded-up text_pages mapping in
  mali_vpu_fw_map_one_core()
- [Medium] media: mali-vpu: unmapped core walk in
  mali_vpu_fw_unmap_core_regions()
--

commit df911b80c99884b502e4cb4ba2acac413ae6c21d
Author: Charvi Mehta <charvi.mehta@arm.com>

media: mali-vpu: prepare firmware address space

This commit adds per-session firmware address space management, allocating
and mapping firmware text, BSS, shared BSS, and host communication protocol
pages across the hardware cores.

> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c b/dr=
ivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
> new file mode 100644
> index 0000000000000..3c552b5fb2d9b
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c

[ ... ]

> +static int mali_vpu_fw_map_one_core(struct mali_vpu_fw *fw,
> +				    const struct mali_vpu_fw_bin *fw_bin,
> +				    u32 core)
> +{
> +	/* Map pages for the text and BSS segments for one core. */
> +	enum mali_vpu_fw_region region =3D MALI_VPU_FW_REGION_CORE_0 + core;
> +	mali_vpu_mmu_va begin, end, va;
> +	const struct mali_vpu_fw_header *hdr =3D fw_bin->header;
> +	u32 bss_count =3D core * fw_bin->bss_page_count;
> +	u32 shared_bss_count =3D 0;
> +	u32 master_rw_start, master_rw_size, bss_bitmap_size, i;
> +	bool is_shared;
> +	int ret;
> +
> +	/*
> +	 * Get the base address where the pages for this core should be
> +	 * mapped.
> +	 */
> +	ret =3D mali_vpu_fw_get_region(region, &begin, &end);
> +	if (ret)
> +		return ret;
> +
> +	/* Map text segment. */
> +	ret =3D mali_vpu_mmu_map_pages(fw->mmu, begin + MALI_VPU_FW_TEXT_BASE_A=
DDR,
> +				     fw->text_pages, MALI_VPU_ATTR_PRIVATE,
> +				     MALI_VPU_ACCESS_EXECUTABLE);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Can mali_vpu_mmu_map_pages() map trailing VPU subpages of fw->text_pages
into the BSS range or past the end of the core region on 16K/64K PAGE_SIZE
kernels?

mali_vpu_mmu_alloc_pages() rounds fw->text_pages->count up to a multiple of
MALI_VPU_PAGES_PER_LINUX_PAGE, whereas mali_vpu_fw_parse_header() validates
bss_start >=3D text_end and text_end <=3D region_size at 4 KB VPU page
granularity:

drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c:mali_vpu_mmu_alloc_pages=
() {
    ...
	count =3D roundup(count, MALI_VPU_PAGES_PER_LINUX_PAGE);
	capacity =3D roundup(capacity, MALI_VPU_PAGES_PER_LINUX_PAGE);
    ...
}

When fw_bin->text_page_count is not aligned to
MALI_VPU_PAGES_PER_LINUX_PAGE and the 4 KB-aligned bss_start falls within
the trailing subpages of the last Linux page, mali_vpu_mmu_map_dma() below
fails with -EAGAIN because the PTE is already occupied.  If
fw_bin->text_page_count lies in the final MALI_VPU_PAGES_PER_LINUX_PAGE - 1
pages of the 256-page core region, the rounded-up mapping at
begin + MALI_VPU_FW_TEXT_BASE_ADDR also spills into begin + 0x100000
(outside [begin, end)), leaving dangling PTEs on teardown for cores
0 .. ncores - 2 because mali_vpu_fw_unmap_core_regions() only unmaps
[begin, end) and mali_vpu_mmu_free_pages() only unmaps the single
fw->text_pages->va recorded by the last core.

> +
> +	bss_bitmap_size =3D le32_to_cpu(hdr->bss_bitmap_size);
> +	master_rw_start =3D le32_to_cpu(hdr->master_rw_start_address);
> +	master_rw_size =3D le32_to_cpu(hdr->master_rw_size);
> +
> +	/* Map bss shared and private pages. */
> +	va =3D le32_to_cpu(hdr->bss_start_address);
> +	for (i =3D 0; i < bss_bitmap_size; i++) {
> +		dma_addr_t dma;
> +
> +		is_shared =3D (va >=3D master_rw_start &&
> +			     va < (master_rw_start + master_rw_size));
> +
> +		if (is_shared) {
> +			dma =3D fw->shared_bss_pages->pages[shared_bss_count++].dma;
> +		} else if (mali_vpu_test_bit_le32(i, hdr->bss_bitmap)) {
> +			dma =3D fw->bss_pages->pages[bss_count++].dma;
> +		} else {
> +			va +=3D MALI_VPU_PAGE_SIZE;
> +			continue;
> +		}
> +
> +		ret =3D mali_vpu_mmu_map_dma(fw->mmu, begin + va, dma, MALI_VPU_PAGE_S=
IZE,
> +					   MALI_VPU_ATTR_PRIVATE, MALI_VPU_ACCESS_READ_WRITE);
> +		if (ret)
> +			return ret;
> +
> +		va +=3D MALI_VPU_PAGE_SIZE;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mali_vpu_fw_unmap_core_regions(struct mali_vpu_fw *fw)
> +{
> +	enum mali_vpu_fw_region region;
> +	mali_vpu_mmu_va begin, end;
> +	u32 core;
> +	int ret;
> +
> +	if (!fw)
> +		return;
> +
> +	for (core =3D 0; core < fw->ncores; core++) {
> +		region =3D MALI_VPU_FW_REGION_CORE_0 + core;
> +		ret =3D mali_vpu_fw_get_region(region, &begin, &end);
> +		if (!ret)
> +			mali_vpu_mmu_unmap_va(fw->mmu, begin, end - begin);
> +	}
> +
> +	if (!IS_ERR_OR_NULL(fw->text_pages)) {
> +		mali_vpu_mmu_free_pages(fw->text_pages);
> +		fw->text_pages =3D NULL;
> +	}
> +
> +	if (!IS_ERR_OR_NULL(fw->bss_pages)) {
> +		mali_vpu_mmu_free_pages(fw->bss_pages);
> +		fw->bss_pages =3D NULL;
> +	}
> +
> +	if (!IS_ERR_OR_NULL(fw->shared_bss_pages)) {
> +		mali_vpu_mmu_free_pages(fw->shared_bss_pages);
> +		fw->shared_bss_pages =3D NULL;
> +	}
> +}

[Severity: Medium]
Does calling mali_vpu_fw_unmap_core_regions() from the err_unmap path in
mali_vpu_fw_map_core_regions() walk unallocated L2 page tables for cores
that were never mapped?

mali_vpu_fw_construct() sets fw->ncores before calling
mali_vpu_fw_map_core_regions(), and each core's L2 page table is only
allocated on demand when mali_vpu_fw_map_one_core() maps its pages.  If page
allocation or per-core mapping fails before all fw->ncores cores are mapped,
mali_vpu_mmu_unmap_va() walks 256 pages per unmapped core and
mali_vpu_page_table_walk() logs a dev_err() on every 4 KB page:

drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c:mali_vpu_page_table_walk=
() {
    ...
	if (!l2->linux_page) {
		if (!alloc) {
			dev_err(mmu->dev, "missing L2 page in PTW. va=3D0x%x", va);
			return ERR_PTR(-EFAULT);
		}
    ...
}

Also, when mali_vpu_mmu_alloc_pages() fails, the !IS_ERR_OR_NULL() checks
above leave the ERR_PTR value stored in fw->text_pages, fw->bss_pages, or
fw->shared_bss_pages instead of clearing it to NULL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119153758.1426=
673-1-charvi.mehta@arm.com?part=3D12
