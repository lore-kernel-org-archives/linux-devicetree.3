Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7703368AC
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 21:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781903062; cv=none; b=ek7grY38a9/D5EXsWQhwYiOkc/TrzNsky79gcRRRaa9yj2eonvkSnkg7d0EZ6bzNOwcVwKrYOJfZZue5QBTA+B59ELZdoKa6L+Td1rNoJ2Z1ZPLEAW90PfziqxBhEvckx3+J+Q++ApL+5hVD4ipLCH/MjJgS1CCB1NhEM7G5GhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781903062; c=relaxed/simple;
	bh=8hu1Oddsqo5uRYh6Wf4qnPgs8UkT4lwR6ZpmHuzqDNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=a+qN1E4kyd5BP4t36nKM9sFxP+ZYdUYVbMvxszbR9ii1CGquBw9mQfSK3N4R4o2g7TpA0XkRE6q+CxqsJ6YkS+t5iWCbLPAaF4HsZU1emxn4kw6mZXlkKLvi8ax0+r0yL/BVOMS34dCx8Hm+olYBOZo4Km+w3wrIse8RybJCoeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=p0UJKPfX; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="p0UJKPfX"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260619210417euoutp02ef53928ec27696048b941a4d39999270~6l2Pe40dI0233702337euoutp02p
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 21:04:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260619210417euoutp02ef53928ec27696048b941a4d39999270~6l2Pe40dI0233702337euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781903057;
	bh=r2f6hjSGMoH572lM/Ykcj4QH+SisNj10wZbZJgrsaP8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=p0UJKPfXVK6bJAFirGdROBBCyRh8cFOmDclU1jj1NJMQhLXJlVREv7tNMnCzRmIR5
	 Y4IM1AzG2ho53qxtueDBs7dHbM/8TLMARshQRPnwJxfbEyk8IHqyR8BZBz8/kqculg
	 zvwHiHpDga1gayxLmMKU0OxHSvbMmFTgqxzqVM6k=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260619210417eucas1p10453b07959c6efc6ef5ab9e0520a600a~6l2OwsEDK1265012650eucas1p1V;
	Fri, 19 Jun 2026 21:04:16 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260619210416eusmtip1c42ab3e53832f224de29ef4a70a27b6b~6l2OMSZ6b2659126591eusmtip1D;
	Fri, 19 Jun 2026 21:04:16 +0000 (GMT)
Message-ID: <f9fe4a59-c6f6-4388-a823-fc7bc6b9fd6d@samsung.com>
Date: Fri, 19 Jun 2026 23:04:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Remove non-functional
 EL2 virtual timer
To: Daniel Drake <dan@reactivated.net>, maz@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, andrea.porta@suse.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260619204832.586079-1-dan@reactivated.net>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260619210417eucas1p10453b07959c6efc6ef5ab9e0520a600a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260619204921eucas1p1c4a9fe8e8a41f552d4637dee2b26f4e4
X-EPHeader: CA
X-CMS-RootMailID: 20260619204921eucas1p1c4a9fe8e8a41f552d4637dee2b26f4e4
References: <CGME20260619204921eucas1p1c4a9fe8e8a41f552d4637dee2b26f4e4@eucas1p1.samsung.com>
	<20260619204832.586079-1-dan@reactivated.net>

On 19.06.2026 22:48, Daniel Drake wrote:
> Commit d87773de9efe1 ("clocksource/drivers/arm_arch_timer: Default to
> EL2 virtual timer when running VHE") causes boot to hang on
> Raspberry Pi 5. The newly-selected EL2 virtual timer does not generate
> any interrupts, even though the GIC_DIST_ENABLE_SET flag has been
> confirmed set via readback.
>
> The reasons for this failure are unknown, however it is likely that
> this timer was never tested. Raspberry Pi's original devicetree did
> not include this timer interrupt; it was only introduced via a
> suggestion[1] made in code review as part of the upstreaming process.
> (Current RPi firmware versions do include this timer, but only because
> they rebased on top of the upstreamed devicetree starting with
> Linux 6.12)
>
> Until more is known about this non-firing timer interrupt, remove
> the devicetree entry to enable RPi5 devices to boot.
>
> [1] https://lore.kernel.org/all/12363be5b11c752b7155cc0c416fdfd2@kernel.org/
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/ea15cce1-b393-43f6-8d58-3d6f90f0c0cd@samsung.com/
> Signed-off-by: Daniel Drake <dan@reactivated.net>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> index 761c59d90ffc..09ff5e9959d3 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -678,8 +678,6 @@ IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
>  					  IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
> -					  IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(4) |
>  					  IRQ_TYPE_LEVEL_LOW)>;
>  	};
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

