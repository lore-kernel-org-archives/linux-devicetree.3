Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F4547C0F2
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049449; cv=none; b=Q8Wwg5DBizRs+ogY/P04OaVjioP1uGOsdGNGlhtQk77NQBJND/mdoZhfktx/XKdYQnEqTckka/QSx+52Pk1Hm5MzfI2h/j49DLjcS6ZUm0uQ2TTqcPGMKK6FjVGwyJl8Pxo4iJ9Hy9PFJ960qFQw8t0vnwz5yMcRh9eoI/mFm1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049449; c=relaxed/simple;
	bh=FbNoRTS5DT0NwKeUQhs4KtwjCPvMh7nZqMq2kwemFAA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cHQSjsgvN2zBWPKcc8geMivKfLYmWnu9yF1Z4e8SrS+GOiwRjIIOWm57iXT5mhXM6OGpCWdH6noQAx9FkkIOeBcSop46Y7iOWJqPopo4drqoA5UOO3037Dtc3plSun2tNowitPLY67YbAgeEgan5AD8rPYZZ9Vski/iQYX62AnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JH7cBP4D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JH7cBP4D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6D31F000C4;
	Thu, 15 Oct 2026 07:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792049438;
	bh=12BKe1xj9pC6MgzoNl3599/TNBdGsbQUNe2Ksth+S/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JH7cBP4DK+jf3Nli+PbMMMYphShfl5T1VAgPJNDTfw6P41jggL71OXAiZUhlrYval
	 YasiNaXH0fLnDg4Q3DejppcliPV5Xq+01iFLuvvytCT6q4YWKmc4i23r0Oinf/2kWY
	 4J/2t7beV5GM7c0FvrBXQAVGLPzcxHudDhP4uPD64HVwGrl+z4kgft63tpT5T70zhb
	 pZRW+0IEc59fG+iOD2h0FO5ApBqRj0Jn0f1Kc9/87nh7TW+BDWIro+8/5IbuxezhNN
	 7h/n4Sn3SAiDnKN9PihEy2wE9kfq3vqkTAnGsDdnZfILsZ+h3Qxp5s4bVdmMVwwvsm
	 ir05g9f+Rt7eg==
Message-ID: <sashiko-outbox-172420@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: sm8750: Make the ADSP remote
 heap no-map
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jianping Li" <jianping.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015071511.977-5-jianping.li@oss.qualcomm.com>
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-5-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 07:30:37 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] fastrpc: missing HLOS permission restore causes dma_alloc_coherent=
 crash
--

commit 7b6c7a04a288b135d8a9c50d62b4084748ab88f0
Author: Jianping Li <jianping.li@oss.qualcomm.com>

arm64: dts: qcom: sm8750: Make the ADSP remote heap no-map

This commit changes the ADSP remote heap declaration from a reusable shared
DMA pool to a no-map region. This is intended to prevent the kernel from
accessing pages that have been handed over to the DSP.

Link: https://lore.kernel.org/all/20251209-sm8750-fastrpc-adsp-v3-1-ccfff49=
a8af9@linaro.org/

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index dd738d13df8e0..ad71d30377c70 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -560,7 +560,7 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>  			alloc-ranges =3D <0x0 0x00000000 0x0 0xffffffff>;
>  			alignment =3D <0x0 0x400000>;
>  			size =3D <0x0 0xc00000>;
> -			reusable;
> +			no-map;

[Severity: High]
Does changing this region to no-map expose a missing permission restore iss=
ue
in the fastrpc driver that could lead to a synchronous external abort?

In fastrpc_req_mmap(), the memory is assigned to the DSP, which removes HLOS
permissions:

drivers/misc/fastrpc.c:fastrpc_req_mmap() {
    ...
    err =3D qcom_scm_assign_mem(buf->dma_addr, (u64)buf->size,
        &src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
    ...
}

When the memory is freed via fastrpc_req_munmap_impl(), it calls
fastrpc_buf_free() without restoring the HLOS permissions first:

drivers/misc/fastrpc.c:fastrpc_buf_free() {
    ...
    dma_free_coherent(buf->dev, buf->size, buf->virt,
              fastrpc_ipa_to_dma_addr(buf->fl->cctx, buf->dma_addr));
    ...
}

Because this patch changes the memory to no-map, the allocation is moved
to the DMA coherent pool. When the freed block is returned to the pool,
the next allocation from that pool will execute a memset():

kernel/dma/coherent.c:__dma_alloc_from_coherent() {
    ...
    memset(ret, 0, size);
    ...
}

Could this memset() trigger a kernel panic due to the missing HLOS
permissions on the re-issued memory block?

>  		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015071511.977-=
1-jianping.li@oss.qualcomm.com?part=3D4
