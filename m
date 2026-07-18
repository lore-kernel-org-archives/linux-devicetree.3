Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62487287246
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 03:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784345178; cv=none; b=IM594RguLvGt41Zhz3lge/wUcvihxQ9JQzTvQDaGh6dw8p0LcaRFybrRk80C49xd6eihMsu1OU3XpSVChIntECLA1pBtKQQqHsQ1DmkFLLkS30Ko8H4HeO3N6DdQ5TfScD+p4RCWxwcjuqXvkxV2e0OR2apWqUZiRfoPFc3Wk5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784345178; c=relaxed/simple;
	bh=7bPTietjCakK2PmQbU0QNh/g3FG2tGr469H9yW/wkLI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PQbJD5O5qAysJLO/F51lllA8zw47ZjtD3B2AEGwjUV8vrVf5bVWTscH74636K/mA911LOJ3aZg4xWERt3mr2nGatl1rWgjg7yNsfF1ecAh3uXb3c0oUMbpSTWlPrda9fFMpSj2bqLPnSIUBkllobRlHTgZnxNugYzW/XtKnTYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKcUNjNo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKcUNjNo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47901F000E9;
	Sat, 18 Jul 2026 03:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784345177;
	bh=LSx28TOuVNe8SUcOcXDT1YcouPryj+VLbg8krEMi+qk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kKcUNjNo33m1EinqMFmBAOty9ySMsAX0sec/Pr2ibcSmCUbBCg+hj98Ygk8Hh0Kca
	 N7cjRpuAwNNjOEbof3lJI3IVkBXD90SjUatVFAdkMZYq8iRvKA9Q9sNf4rfpZbe3k0
	 rkYfVYJsN4vwBXhE+AadeSQHG4/Rp4ygBQ2sojljXZ38AjtKwSxH8UUoKinApw2b/T
	 Z/VbruYH7IfCpaUnl0/NepW8FYLa1uotMGXUPsg8EujqPxgNtfNcSd6whDjCG9tvxc
	 JtIyf0gwK1tozHHjmOQJt7XSp9Ld4lyY/fyzjF/vMQaMoydtkVPSd7LNfZTTdPeLcp
	 UBbYm6fIKjLiQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 5/8] iommu/rockchip: clear stale page faults
 before enabling stall
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260718031146.3368811-6-gahing@gahingwoo.com>
References: <20260718031146.3368811-1-gahing@gahingwoo.com>
 <20260718031146.3368811-6-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 03:26:16 +0000
Message-Id: <20260718032616.B47901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Clearing the stale page fault state without clearing the associate=
d interrupt status leads to a spurious IOMMU interrupt upon unmasking if th=
e MMU reset is disabled.
--

--- Patch [5]: [RFC PATCH v2 5/8] iommu/rockchip: clear stale page faults b=
efore enabling stall ---
commit 6445c2bf287495e424096d491a8245a58e126724
Author: Jiaxing Hu <gahing@gahingwoo.com>

iommu/rockchip: clear stale page faults before enabling stall

Boot firmware can leave an IOMMU bank in PAGE_FAULT_ACTIVE before the
driver has configured paging. This commit acknowledges these stale faults
with CMD_PAGE_FAULT_DONE before enabling stall so all banks start clean
and avoid timing out.

> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iomm=
u.c
> index 2ac65c0c5c0b4..e477fe79ca4a3 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -417,6 +417,19 @@ static int rk_iommu_enable_stall(struct rk_iommu *io=
mmu)
>  	if (!rk_iommu_is_paging_enabled(iommu))
>  		return 0;
> =20
> +	/*
> +	 * Boot firmware can leave a bank in PAGE_FAULT_ACTIVE with no handler
> +	 * (PAGE_FAULT_ACTIVE & !STALL_ACTIVE & IDLE).  Such a bank ignores
> +	 * CMD_ENABLE_STALL and never reaches STALL_ACTIVE, timing out the poll
> +	 * below.  Acknowledge any stale fault first so every bank starts clean.
> +	 */
> +	for (i =3D 0; i < iommu->num_mmu; i++) {
> +		if (rk_iommu_read(iommu->bases[i], RK_MMU_STATUS) &
> +		    RK_MMU_STATUS_PAGE_FAULT_ACTIVE)
> +			writel(RK_MMU_CMD_PAGE_FAULT_DONE,
> +			       iommu->bases[i] + RK_MMU_COMMAND);

[Severity: High]
Does clearing the page fault state here also require clearing the associate=
d=20
interrupt status in RK_MMU_INT_CLEAR?

If a device uses rockchip,disable-mmu-reset, the hardware reset during
rk_iommu_enable() is skipped. When interrupts are subsequently unmasked
by writing to RK_MMU_INT_MASK, an uncleared raw interrupt bit would
immediately trigger a spurious interrupt.

Could this spurious interrupt lead to report_iommu_fault() being called
prematurely, potentially panicking the system or failing device attachment?

> +	}
> +
>  	rk_iommu_command(iommu, RK_MMU_CMD_ENABLE_STALL);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718031146.3368=
811-1-gahing@gahingwoo.com?part=3D5
