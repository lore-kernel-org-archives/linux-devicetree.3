Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103465;
	b=XCt2yhqNLVd+Ml8GiCnX82Vr008ICn98WlHKsc/nmyUqhXvF5r6YuKKFRGu+iWXl2Xe7
	 2PnR66yzUeb4OkTbpCfQYJZaB9OgjEQEb9aVYT8d748niecjAGQIXopsdmUgwFvxsX8ey
	 2yzoZDLVidGZY61cfUKocNVzQRsVHGmMyydIqSTQzjUiaoUsD5sVsAAVfA7I3byfO9QhE
	 QYBxNl5pNyJI3pPrqA50vLb2pOYOIjY4LZBUBbN962dx9cih6IiV7KLJI+pLWIFZIAZot
	 wZrf1rlJFuyJLe857Vs/m7G11DY/fesdDcNqVvfmtJFTFoJqVm3puBocoQ4rQoxqYKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103465;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cN6Vd3gs375ciwupS/k1khT8qdSe+AAAVVS5pRTzCJo=;
	b=Hwp5DrxNMObAEw9396lxI0c7QrGwQ4nUfMljCxoFwrHs29FdHLsjNu2aU8s68iLUurB4
	 U4daNfnGKbjPfXgjFRCFq0XbIVPSP3+x9ahwl/vC7eE+14IvMCbh1m/RqJtK8dfdk6Xt/
	 uXBozETqTU+WPqcc0d3VK9esqRLsogkdaf9GFPW/kR27fYu5sDZErfbyzaYZF1nVxf/Fj
	 l93IqMj/wTFyW+YGW39XybF6osdZaIl2NZjlziTyBXpRfmzZdNUuNjO8HYzM8p78JGVyo
	 fpWM7u+syx/OWx7JNUUcK4rA8FC/X83eGX6drox6DIt1+blsX9ARjKnw3l/pBoPzPyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Et8iPThg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315F0606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Et8iPThg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796AC1F000C4;
	Thu, 19 Nov 2026 15:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103464;
	bh=cN6Vd3gs375ciwupS/k1khT8qdSe+AAAVVS5pRTzCJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Et8iPThgW82S/QiQM77Ln6ner4ett/6VH0TchXKVxBH0fOsB0MUHUzHCTkzbFeVxV
	 GQqbSCV5ihv9HEXtrnX4rrhH2YIjUpoQFXARFzTYebFBDZBXMfCl1k7yerMgSaQ97e
	 vwbZpwyxYqx5dIDM2CG8y/J7GFZevNEc7n9h4zzfn/sfmKU8V2LITUzv5ZQawfE7IF
	 CheJtEWhvF9z+ZGG8cj3DMri59HXnSoF0masjBbgNSF7ZOI5tQ2ij53qp4FlVwag6o
	 TulypfkAmxtvqK6SSdCH6KtLB4tPa+1cUWf0N+qlr+oV4cQD3a3uhLcRZOQUqWiJE3
	 V1qlSUoz39cbw==
Message-ID: <sashiko-outbox-223429@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 15/28] media: mali-vpu: handle firmware RPC requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charvi Mehta" <charvi.mehta@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119153758.1426673-16-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-16-charvi.mehta@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 15:51:04 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] media: mali-vpu: out-of-bounds VA mapping in
  mali_vpu_rpc_mem_alloc()
- [Medium] media: mali-vpu: stale RPC return payload in
  mali_vpu_fw_handle_rpc()
- [Low] media: mali-vpu: log2_alignment ignored in
  mali_vpu_rpc_mem_alloc()
--

commit 6596ddd7663ec38dc1e5a77c8bd517be369bf9ab
Author: Charvi Mehta <charvi.mehta@arm.com>

media: mali-vpu: handle firmware RPC requests

This commit adds handling for firmware RPC requests covering debug print
output and firmware memory allocation, resizing, and freeing, tracking
allocated pages by virtual address in a hash table.

> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c b/dr=
ivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
> index 91a989c098cbc..c11d5c6c0ec5f 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c

[ ... ]

> @@ -908,3 +929,259 @@ int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, s=
truct mali_vpu_fw_msg *msg)

[ ... ]

> +static void mali_vpu_rpc_mem_alloc(struct mali_vpu_fw *fw,
> +				   struct mve_rpc_communication_area *rpc_area)
> +{
> +	union mve_rpc_params *p =3D &rpc_area->params;
> +	enum mali_vpu_fw_region region;
> +	struct mali_vpu_mmu_pages *pages;
> +	size_t npages, max_pages;
> +	mali_vpu_mmu_va end, begin =3D 0;
> +	int ret;
> +
> +	if (!p->mem_alloc.size ||
> +	    p->mem_alloc.size > p->mem_alloc.max_size) {
> +		dev_warn(fw->dev,
> +			 "invalid RPC allocation:size=3D%u max_size=3D%u alignment=3D%u\n",
> +			 p->mem_alloc.size, p->mem_alloc.max_size,
> +			 p->mem_alloc.log2_alignment);
> +		goto err;
> +	}

[Severity: Low]
Should mali_vpu_rpc_mem_alloc() validate or apply
p->mem_alloc.log2_alignment?

union mve_rpc_params documents that the allocation must be placed on at
least a 2^(log2_alignment) boundary, and the warning above logs
log2_alignment, but the placement loop always steps candidate addresses by
MALI_VPU_RPC_VA_GRANULE (SZ_16M) without rejecting or honouring larger
alignments.

> +
> +	switch (p->mem_alloc.region) {
> +	case MVE_MEM_REGION_PROTECTED:
> +		region =3D MALI_VPU_FW_REGION_PROTECTED;
> +		break;
> +	case MVE_MEM_REGION_OUTBUF:
> +		region =3D MALI_VPU_FW_REGION_FRAMEBUF;
> +		break;
> +	default:
> +		dev_err(fw->dev,
> +			"unsupported RPC mem alloc region. region=3D%u\n",
> +			p->mem_alloc.region);
> +		goto err;
> +	}
> +
> +	ret =3D mali_vpu_fw_get_region(region, &begin, &end);
> +	if (ret)
> +		goto err;
> +
> +	npages =3D DIV_ROUND_UP(p->mem_alloc.size, MALI_VPU_PAGE_SIZE);
> +	max_pages =3D DIV_ROUND_UP(p->mem_alloc.max_size, MALI_VPU_PAGE_SIZE);
> +
> +	pages =3D mali_vpu_mmu_alloc_pages(fw->dev, npages, max_pages);
> +	if (IS_ERR(pages)) {
> +		begin =3D 0;
> +		goto err;
> +	}
> +
> +	ret =3D -EINVAL;
> +	while (begin < end) {
> +		ret =3D mali_vpu_mmu_map_pages(fw->mmu, begin, pages,
> +					     MALI_VPU_ATTR_SHARED_RW,
> +					     MALI_VPU_ACCESS_READ_WRITE);
> +		if (!ret)
> +			break;
> +
> +		begin +=3D MALI_VPU_RPC_VA_GRANULE;
> +	}

[Severity: Medium]
Can this loop map pages past the end of the target region?

mali_vpu_mmu_map_pages() maps and reserves pages->capacity pages starting
at begin, but the loop only checks begin < end without verifying that the
full reserved range fits within end - begin.  When earlier 16 MiB granules
are occupied and begin advances near end (or when max_size exceeds the
region size), the mapping spills past end into the adjacent address
region.

In addition, p->mem_alloc.max_size and p->mem_resize.new_size in
mali_vpu_rpc_mem_resize() are passed directly to DIV_ROUND_UP(...,
MALI_VPU_PAGE_SIZE) without an upper bound check.  On 32-bit kernels
MALI_VPU_PAGE_SIZE is a 32-bit unsigned long, so values above 0xfffff000
wrap DIV_ROUND_UP() to 0 (causing mali_vpu_rpc_mem_resize() to shrink the
allocation to 0 pages while returning pages->va as a success), and on
64-bit kernels an unbounded max_size can trigger a slab allocator warning
in devm_kzalloc().

[ ... ]

> +int mali_vpu_fw_handle_rpc(struct mali_vpu_fw *fw, bool *flush_mmu)
> +{
> +	struct mve_rpc_communication_area *rpc_area =3D fw->rpc.cpu;
> +	int ret =3D 0;
> +
> +	if (flush_mmu)
> +		*flush_mmu =3D false;
> +
> +	dma_sync_single_for_cpu(fw->dev, fw->rpc.dma, sizeof(*rpc_area),
> +				DMA_FROM_DEVICE);
> +
> +	if (READ_ONCE(rpc_area->state) =3D=3D MVE_RPC_STATE_PARAM) {
> +		/*
> +		 * Firmware publishes param only after writing the RPC request.
> +		 */
> +		dma_rmb();
> +
> +		ret =3D 1;
> +
> +		mali_vpu_fw_dbg_rpc(fw, "fw->host", rpc_area);
> +
> +		switch (rpc_area->call_id) {
> +		case MVE_RPC_FUNCTION_DEBUG_PRINTF: {
> +			if (!rpc_area->size ||
> +			    rpc_area->size > sizeof(rpc_area->params.debug_print.string)) {
> +				ret =3D -EPROTO;
> +				rpc_area->size =3D 0;
> +				break;
> +			}
> +
> +			const char *s =3D rpc_area->params.debug_print.string;
> +			size_t len =3D strnlen(s, rpc_area->size);
> +
> +			/* Strip trailing characters */
> +			while (len && (s[len - 1] =3D=3D '\n' || s[len - 1] =3D=3D '\r'))
> +				len--;
> +
> +			dev_info(fw->dev,
> +				 "firmware DEBUG Print: %.*s\n", (int)len, s);
> +			break;
> +		}
> +		case MVE_RPC_FUNCTION_MEM_ALLOC: {
> +			if (rpc_area->size !=3D sizeof(rpc_area->params.mem_alloc)) {
> +				ret =3D -EPROTO;
> +				break;
> +			}
> +
> +			mali_vpu_rpc_mem_alloc(fw, rpc_area);
> +			break;
> +		}
> +		case MVE_RPC_FUNCTION_MEM_RESIZE: {
> +			if (rpc_area->size !=3D sizeof(rpc_area->params.mem_resize)) {
> +				ret =3D -EPROTO;
> +				break;
> +			}
> +
> +			mali_vpu_rpc_mem_resize(fw, rpc_area);
> +			if (flush_mmu)
> +				*flush_mmu =3D true;
> +			break;
> +		}
> +		case MVE_RPC_FUNCTION_MEM_FREE: {
> +			if (rpc_area->size !=3D sizeof(rpc_area->params.mem_free)) {
> +				ret =3D -EPROTO;
> +				break;
> +			}
> +
> +			mali_vpu_rpc_mem_free(fw, rpc_area);
> +			if (flush_mmu)
> +				*flush_mmu =3D true;
> +			break;
> +		}
> +		default:
> +			dev_warn_ratelimited(fw->dev,
> +					     "unsupported RPC request. call_id=3D%u\n",
> +					     rpc_area->call_id);
> +			ret =3D -EOPNOTSUPP;
> +			break;
> +		}
> +
> +		/*
> +		 * Make sure the whole RPC message body has been written before
> +		 * the RPC message area is returned to the firmware.
> +		 */
> +		dma_wmb();
> +		WRITE_ONCE(rpc_area->state, MVE_RPC_STATE_RETURN);
> +
> +		dma_sync_single_for_device(fw->dev, fw->rpc.dma,
> +					   sizeof(*rpc_area), DMA_TO_DEVICE);

[Severity: Medium]
Does returning MVE_RPC_STATE_RETURN after a size mismatch leave stale
request words in the RPC response payload?

union mve_rpc_params aliases data[0] with mem_alloc.size and
mem_resize.ve_pointer.  When MVE_RPC_FUNCTION_MEM_ALLOC or
MVE_RPC_FUNCTION_MEM_RESIZE breaks out with -EPROTO, rpc_area->state is
still set to MVE_RPC_STATE_RETURN and synced back to the device with
rpc_area->params.data[0] holding the non-zero input size or old
ve_pointer, which the firmware ABI interprets as a valid allocated virtual
address rather than 0 for failure.

Also, MVE_RPC_FUNCTION_DEBUG_PRINTF sets rpc_area->size =3D 0 on its error
path, but leaves rpc_area->size set to the input string length on normal
completion, and the other error paths leave rpc_area->size untouched.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119153758.1426=
673-1-charvi.mehta@arm.com?part=3D15
