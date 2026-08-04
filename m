Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF39641DDE5
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827135; cv=none; b=ZB/AtmfFPaWbmrV0KtRVingN7xW713HRWsjwuSqH7zgNm+0DSgZW+IDjqbpVq6KKyMM1kepOctI9WbAeX7SzCpP0KPPsOQoFxzk7yueHdTA75n+QVkrtLZJoQ8YvjTjbvL7GPAUy1+Y907I1bi97nGmAk3dKApLZdzNecX1pvWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827135; c=relaxed/simple;
	bh=AwIZwXEfpw2UB2C7CXzKzHZCWoo+YKuvYBCmCKSj5+s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RDy74euKs/H1KiXEJydZw1VdZ+sL1MhqTVqT5iQQCwlbbnj/Ids7Wy4hv3asDJjuqsemPpOvcQwAc1OylAInJ7Joxk1ipqJKWGZ9OsoZxwQKLPXZxsDf1QZ00741dB26GOZsuC7Lmw0+bVKb6v+LHqKko8/8+WVlXFeNgIjzuaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ig2OqDXw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ig2OqDXw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240B31F00A3A;
	Tue,  4 Aug 2026 07:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785827134;
	bh=2mfbqur8BLTrv4FOoX3rD02xi72kONFW1rm9bGG+Kp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ig2OqDXwrlBGNFycWcNYGZCQhX4m6fnNiIjKIXYYSks1UftKfNr3PDvtDMhbsKB/C
	 YVWx56xQ/G2tKykyNTHFZYQvad8EAp7CZ1FvtQq39ZZTn1hPK0FzGX/ldM+B1hLk0N
	 HTOtKqq3JqrLOFxrDS290C/GMXuO9unSreTBlBxF4E6UEo328wZhm295rV6/EUlvl6
	 gIocBkwb9B9SQB8f5OUi5qRbXhDoPBYyhGD7B4K9ZC5yuSYKt27Ogzs9JBi+yUovVO
	 ysCNYZoGU8mQ6TxHi9laVZ53gGjc+LRaTrI8Ko1YZdAympU1zFd9F6aYYDdpkJq0zP
	 lmKAW3+mYK4Fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: agilex5: Enable pagepool Tx buffer
 quirk
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260803070513.4657-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260803070513.4657-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260803070513.4657-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 07:05:33 +0000
Message-Id: <20260804070534.240B31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unsafe use of page_pool_recycle_direct() from hardirq context caus=
es fast-cache corruption.
- [Medium] Redundant full-page DMA sync due to PP_FLAG_DMA_SYNC_DEV on a TX=
 bounce buffer.
- [Low] Encoding a software optimization policy into Devicetree.
--

--- Patch [3]: [PATCH 3/3] arm64: dts: agilex5: Enable pagepool Tx buffer q=
uirk ---
commit 4b5b56ba27a76622b7269e1715c07a2f16e86382
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

arm64: dts: agilex5: Enable pagepool Tx buffer quirk

Enable snps,pagepool-tx-buf-quirk for Agilex5 gmac0/1/2. These ports
use an IOMMU, where avoiding per-packet dma map/unmap invalidate cost
improves Tx performance.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index b06c6d5d60eed..525e6a2319c10 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -574,6 +574,7 @@ gmac0: ethernet@10810000 {
>  			snps,mtl-tx-config =3D <&mtl_tx_emac0_setup>;
>  			snps,pbl =3D <32>;
>  			snps,tso;
> +			snps,pagepool-tx-buf-quirk;

[Severity: Low]
Does a software optimization policy belong in Devicetree? Usually, Devicetr=
ee
describes hardware topology rather than software configuration like this qu=
irk.

[Severity: High]
By enabling this quirk, does this expose a fast-cache corruption regression
in the driver?

When a hardware Tx error occurs, the hardirq handler calls stmmac_tx_err(),
which iterates buffers and eventually calls:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_free_tx_buffer()
			page_pool_recycle_direct(tx_q->page_pool,
						 tx_q->tx_skbuff_dma[i].page);

If this interrupts napi softirq running on the same CPU, or races with napi
on another CPU, won't calling the napi-only page_pool_recycle_direct()
without the Tx lock corrupt the lockless page_pool fast cache?

[Severity: Medium]
Will enabling this quirk introduce redundant performance overhead that defe=
ats
its purpose?

The driver initializes the Tx page pool with PP_FLAG_DMA_SYNC_DEV:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:__alloc_dma_tx_desc_resou=
rces()
	pp_params.flags =3D PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;

This causes a full 4KB page sync on every recycle. However, the driver
already performs a precise sync manually:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_xmit()
			dma_sync_single_for_device(priv->device, dma_addr,
						   nopaged_len,
						   DMA_BIDIRECTIONAL);

Could the sync upon recycle be syncing stale data before the next packet is
written, making the PP_FLAG_DMA_SYNC_DEV flag redundant?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803070513.4657=
-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D3
