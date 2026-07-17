Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F245391E74
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279498; cv=none; b=gxj0p9heQo26BOj9aj+NhTCJRh//osLhdJ5YAZ5xOBlTUsS4uCR9LU3YEKJsHhQ39upbzChBN0NF3QUdoaZdJE+zj3KqJqEe+U5nncKWa6RLqFhMworbrGF4cSLki+d6UOvq551UZbMAQo2e4KWcPjR2IRdp9atgtXHGPDICnwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279498; c=relaxed/simple;
	bh=q80S4hJ5VMiugLZ39tBCk6x7bjp2a8lfgTYJBehql1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n6DA1ycSzsyV2Zu6wQG8IqwIWVbqyAhGatBOLLerob/vvBATUDBoe5V9U5XZOt2nrB3NkkvqIAwE04ih1Qh/fyPyTu9ATfRpCin0W3DXPW2HO0ALhmc7XkVU3/IFe6j9MYEx7GeofuTt7u130aVqTbDgzlhiTdrsLA7cSNuhOmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMLDIAdj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMLDIAdj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FCE1F00A3A;
	Fri, 17 Jul 2026 09:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279486;
	bh=No1rcMsUN82wN+/ermWbys83pe4pJkJsQbcM7JLliQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aMLDIAdjdX6IYtaAZXlUTgcx+kjSjCjXrD5t+41pfEDmqbm0yGbLLTrUnsj6yiRJv
	 3/N/qpPXmXtxprANLXBiksViLHcmLJsblFP5qW5vcbL9kREkQKikf/tn2eqcvh+QFg
	 75nnQxRTAMhA2abqJDdXhQfTfJylisCbcuBF2irEC6M4pyxnKB2FmNFgB2c2dtme/F
	 vi2zGCKcCCvyQqef3qfWtHP0fAyXna/wC8ui207G/CkRmsKokVCebVjlEaCGfY3uTx
	 KVgiEV7KBDHAsqafiLsCu0F8XUJBh2Df6lECIyTmmNk1OWHaSPG/jOlpeyspBooTp+
	 Jvx60h0QxdUCw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 4/9] iommu/rockchip: skip orphaned-fault banks in
 rk_iommu_is_stall_active
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260717085220.3212274-5-gahing@gahingwoo.com>
References: <20260717085220.3212274-1-gahing@gahingwoo.com>
 <20260717085220.3212274-5-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 09:11:25 +0000
Message-Id: <20260717091126.49FCE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Skipping orphaned-fault banks in `rk_iommu_is_stall_active` caus=
es `rk_iommu_disable_stall` to unconditionally time out if all banks are sk=
ipped (e.g., on a single-bank IOMMU).

Pre-existing issues:
- [High] Multi-bank disable operations (`rk_iommu_disable_stall` and `rk_io=
mmu_disable_paging`) prematurely terminate their waits as soon as the first=
 bank completes its operation.
--

--- Patch [4]: [RFC PATCH 4/9] iommu/rockchip: skip orphaned-fault banks in=
 rk_iommu_is_stall_active ---
commit 0709b1254bd6d532239176eba388c28b0ed8ea3c
Author: Jiaxing Hu <gahing@gahingwoo.com>

iommu/rockchip: skip orphaned-fault banks in rk_iommu_is_stall_active

This commit updates rk_iommu_is_stall_active() to detect and skip
orphaned-fault IOMMU banks that were left in a faulted state by boot
firmware. This ensures the driver doesn't treat them as "not stalled"
which would otherwise cause stall wait loops to fail.

> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iomm=
u.c
> index 87ae036d64145..ad462cee6bd89 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -380,9 +380,23 @@ static bool rk_iommu_is_stall_active(struct rk_iommu=
 *iommu)
>  	bool active =3D true;
>  	int i;
> =20
> -	for (i =3D 0; i < iommu->num_mmu; i++)
> -		active &=3D !!(rk_iommu_read(iommu->bases[i], RK_MMU_STATUS) &
> -					   RK_MMU_STATUS_STALL_ACTIVE);
> +	for (i =3D 0; i < iommu->num_mmu; i++) {
> +		u32 status =3D rk_iommu_read(iommu->bases[i], RK_MMU_STATUS);
> +
> +		/*
> +		 * A bank stuck with PAGE_FAULT_ACTIVE but without STALL_ACTIVE
> +		 * and with IDLE set has an orphaned fault left by firmware before
> +		 * paging was configured.  It cannot enter stall mode but has no
> +		 * transaction in flight, so it is already quiescent.  Skip it
> +		 * rather than treating it as "not stalled."
> +		 */
> +		if ((status & RK_MMU_STATUS_PAGE_FAULT_ACTIVE) &&
> +		    !(status & RK_MMU_STATUS_STALL_ACTIVE) &&
> +		    (status & RK_MMU_STATUS_IDLE))
> +			continue;

[Severity: Medium]
Does skipping banks here cause a timeout if all banks are skipped?

If an IOMMU has a single bank (num_mmu =3D=3D 1) and encounters this orphan=
ed
fault, the loop skips the only bank and the active variable remains true.

When rk_iommu_disable_stall() polls for the stall to complete:

	ret =3D readx_poll_timeout(rk_iommu_is_stall_active, iommu, val,
				 !val, RK_MMU_POLL_PERIOD_US,
				 RK_MMU_POLL_TIMEOUT_US);

It expects rk_iommu_is_stall_active() to return false, but it will return
true, causing an unconditional timeout and a spurious error log.

> +
> +		active &=3D !!(status & RK_MMU_STATUS_STALL_ACTIVE);

[Severity: High]
This is a pre-existing issue, but does this bitwise AND reduction cause
multi-bank disable operations to terminate their waits prematurely?

When disabling an IOMMU with multiple banks (num_mmu > 1), returning false
as soon as the first bank drops its STALL_ACTIVE status leaves subsequent
banks still active.

The same logic exists in rk_iommu_is_paging_enabled(), where the bitwise
AND causes readx_poll_timeout() to terminate its wait as soon as one bank
is disabled, rather than waiting for all banks:

	for (i =3D 0; i < iommu->num_mmu; i++)
		enable &=3D !!(rk_iommu_read(iommu->bases[i], RK_MMU_STATUS) &
					   RK_MMU_STATUS_PAGING_ENABLED);

Can this lead to modifying register state or disabling hardware clocks while
some MMU banks are still actively processing commands?

> +	}
> =20
>  	return active;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717085220.3212=
274-1-gahing@gahingwoo.com?part=3D4
