Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2E2356772
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967974; cv=none; b=EwVLDbMfVECuDnAKIlAOcujMssyM4I8IPGWxsRug8l8up/jwWB/WCGIYbmV/udWm2jKqbsXojZZml99O2U4ZNwSxH65GrAgP8ZiBqIAH75A+fx5uY71dEZnL+rqk8Gi6G0/TyuQhbR7ms0uMNBgVOK61wyf977dR6DXvTJW1aEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967974; c=relaxed/simple;
	bh=aLq/9poOHSW2CZK30xBTidTbvLIzYcPe2Ed9NAUlYos=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=m3Kry3M26KCBLlLWdnOxu0OX9h1nFfloKiAAAlX6Xt7lw0qJ9xA3yDlvPAw4wvJcpDAxizeJuh5d2A2BKjgcRPbqzhKtXL20fzU9acgiJxxa0fdKzn+14dqL25FWWOcncUwOnN2uAQLCznPkGeIgwDRCvXshomngcRD+F9xIezc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YvlvTZl0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvlvTZl0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148F51F000FF;
	Wed, 14 Oct 2026 08:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791967973;
	bh=pgcnWIl1ebJoyKPhbdG65WUJc7B3m+GDIbjIM433k78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YvlvTZl0GHORfEM/6PEwS51xVGFOvJLAE6UMQVqGQF0Txb4w3EA2o04uQunH6pGoU
	 90BZe2GVV+zIGZhO9QEtRQ95adyw5ik3dLnLZuTSm0xZQBs3sJaIyoUfaS83jSovbJ
	 x+RYUD3T4CnVF7ZXYY3UJAWhr9YqXvDsIWp0L82LEp09DkVKyt41pe6gHE6p0NZuZd
	 TQ+7viyaG75yl+ge3Wq69AXcomRu/HFDIlaAlgN5iJrwdUjInBfIlpvOaZJDNV4iV3
	 s27iCRowsRdNSX60yOFN+k7dkxeRzaebWVKG79ewcr/TMQoAlIOhS5yj9ghPXYSNg8
	 8BIHaK9IDjv9g==
Message-ID: <sashiko-outbox-171042@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: talos: Make the ADSP remote heap
 no-map
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jianping Li" <jianping.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
References: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 08:52:52 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: talos: SEA crash shifted to FastRPC dma_alloc_co=
herent due to un-restored HLOS permissions
--

commit af4a6b835881c10ea8fa53c33cf956e604f98923
Author: Jianping Li <jianping.li@oss.qualcomm.com>

arm64: dts: qcom: talos: Make the ADSP remote heap no-map

This commit isolates the ADSP remote heap by changing its declaration
from reusable to no-map. This is intended to prevent normal kernel
allocations from triggering a Synchronous External Abort (SEA) when
accessing pages within the heap.

Link: https://lore.kernel.org/all/20260424-talosaudio-v3-1-9e2ad5d78a2e@oss=
.qualcomm.com/

> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qc=
om/talos.dtsi
> index eedfdce3c479e..163c14971374c 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -683,7 +683,7 @@ pil_gpu_mem: pil-gpu@97715000 {
>  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>  			compatible =3D "shared-dma-pool";
>  			alloc-ranges =3D <0x0 0x80000000 0x0 0x80000000>;
> -			reusable;
> +			no-map;

[Severity: High]
Does changing this to no-map just shift the Synchronous External Abort
from ZRAM to the FastRPC driver's dma_alloc_coherent() path?

By marking this region no-map, it becomes a coherent DMA pool, shifting
its allocations to FastRPC's dma_alloc_coherent() path.

FastRPC dynamically assigns the allocated memory chunk to the DSP during
fastrpc_req_mmap(), which revokes HLOS access:

drivers/misc/fastrpc.c:fastrpc_req_mmap() {
        ...
        err =3D qcom_scm_assign_mem(buf->dma_addr, (u64)buf->size,
                &src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
        ...
}

When the user unmaps the memory, fastrpc_req_munmap_impl() calls
fastrpc_buf_free() and returns the memory to the DMA pool without
restoring HLOS permissions.

The next allocation from the DMA pool will trigger an SEA when
dma_alloc_coherent() attempts to memset() the still-DSP-owned pages:

drivers/misc/fastrpc.c:__fastrpc_buf_alloc() {
        ...
        buf->virt =3D dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
                                       GFP_KERNEL);
        ...
}

>  			alignment =3D <0x0 0x400000>;
>  			size =3D <0x0 0x800000>;
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014083820.468-=
1-jianping.li@oss.qualcomm.com?part=3D1
