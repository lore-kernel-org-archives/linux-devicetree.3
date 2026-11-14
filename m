Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655391;
	b=Avy6vpmBflXtamD5PA+dFzY7E/Gp84hbu4r4NTCHB7BItZfLQIOQZeFMol7b8gEBd1v/
	 b5vnJJu9EbvPg59MxgCCVy2TKUzIYcxL4eNe1LkFZrZnJzXtMLSamTIL6Xfke58si/+ls
	 XVq/lmlZiVz83bYRni0osblZU/HB3loaA8qhnA0n3nGesvKGSgf9imbBGAp35rEtR8zQ4
	 6IVXewsHvY4w9/EOGjkxyqBoQ6cXTps9h8zXeRSZRK6Yjh7qeVqRzPvtW/p28vgz4+MLP
	 3ePwDPfNdk+Jiv2+cXSlWZnhYAbMdwg0Y+U2kxVDgM4qAegRMesDD+0jpIyAlDL7ShQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655391;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=izJSX8U+Wf+79cvivFvyHPpZOBe246cK5q7q6I/f2xo=;
	b=Y7uPXTHkoeFzI1TcE8zLMvSX0TkVHfFj0eG9ywP2QmkyPu97XOQppl6wabLmrVyjMer9
	 bv1dCf9tWD/vVRJGoLKNqBPfHi861nrLo5QAvzThTZrelUoKwXKYgq5SLxSljk7aE9A2u
	 73mFnj+HICMRNaNtZZKmYXXkIBUamehzWxhSeDDfK9/aJYBHB2yHg1XIo1Mm4K8eNgKvw
	 RibMxdpUY1LCwTkn8NgS92wNdviPST4M0rR353ye7PxQpmEus/czkVKqOtdtU+WI+p+pa
	 LnJ6M85fsM4YpfUpCjFNWsBrSgBmol+fBq7Dz+fvSwr0g97bInUEHVL1ncPpodtA3hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MP2sLcG4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC27606A323
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MP2sLcG4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D965C1F000C4;
	Sat, 14 Nov 2026 11:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794655391;
	bh=izJSX8U+Wf+79cvivFvyHPpZOBe246cK5q7q6I/f2xo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MP2sLcG4frzJa4sh2OSooA59opeoJzwWUpm/0W9+qMRQ09w+AjSxl+Z/nozw12a+Y
	 Ano+RR/855F7svNIx82fOkzuG76SLmkQN02lq1q2Zoa5Tn+OxLRhvauC/kgZuAeSQQ
	 KRsjtAVKFN3U6ALGt1rmSNP0eCLEsmFZc/jSb+UaYlzCyMka8ouCActTxxP7gpnOki
	 e4KEdtckXEr6aeOGxmaOMkkSPWGacGuNqBIOWaTyCAO7ZhrHK1EsvhmChAM6oneViD
	 WRzODvdC8IoN0x+MT8rLSxoyQFKUTZretyvmqMo46qQtvVq1XMenFVFP+V30GXnfm6
	 O0KPzwAr8qDWg==
Message-ID: <sashiko-outbox-214399@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] media: rkvdec: vdpu381: Program the read caches
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Golle" <daniel@makrotopia.org>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <c052b9e59c9871315a24bbf129457b4dccbe3030.1794654074.git.daniel@makrotopia.org>
References: <cover.1794654074.git.daniel@makrotopia.org>
 <c052b9e59c9871315a24bbf129457b4dccbe3030.1794654074.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 11:23:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] media: rkvdec: missing device link for SRAM pool in
  rkvdec_probe() [1]
--

commit 99da5f7b908ec0166f8a92ee5d45147870aca1c8
Author: Daniel Golle <daniel@makrotopia.org>

media: rkvdec: vdpu381: Program the read caches

This commit maps the VDPU381 "cache" register block in rkvdec_probe() and
configures and clears the three read caches before starting each H.264 and
HEVC decode run.

> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index ba61e373b4342..5673c5205bfcd 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c

[ ... ]

> @@ -1910,6 +1924,10 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
>  		rkvdec->link =3D devm_platform_ioremap_resource_byname(pdev, "link");
>  		if (IS_ERR(rkvdec->link))
>  			return PTR_ERR(rkvdec->link);
> +
> +		rkvdec->cache =3D devm_platform_ioremap_resource_byname(pdev, "cache");
> +		if (IS_ERR(rkvdec->cache))
> +			return PTR_ERR(rkvdec->cache);
>  	}
> =20
>  	ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));

[Severity: Critical]
This problem wasn't introduced by this patch, but can unbinding the SRAM
provider cause a use-after-free on rkvdec->sram_pool [1]?

Later in rkvdec_probe(), rkvdec->sram_pool is obtained via
of_gen_pool_get(pdev->dev.of_node, "sram", 0) without creating a device
link to the SRAM provider device.  of_gen_pool_get() drops its device
reference before returning, so if the SRAM provider is unbound, devres
frees the gen_pool while rkvdec retains a dangling pointer that
rkvdec_allocate_rcb() and rkvdec_free_rcb() pass to
gen_pool_dma_zalloc_align() and gen_pool_free().

[1] https://sashiko.dev/#/bug/linux-052dff48-14cb-4d3e-8996-c834344fcb16

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794654074.gi=
t.daniel@makrotopia.org?part=3D4
