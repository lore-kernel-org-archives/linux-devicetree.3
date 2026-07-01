Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D78A393DF0
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 07:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892368; cv=none; b=dHot/Nt64kjRfjNVo668y8r/Qbl0Ur9Yi20ACKMxlP9LWsj57IaYGCM4sfLqg1X54hInn4i/qhULXxHKZnnv7bOvwBeSz9VS9if3j4ultlYgOpoIq9qRxJE2amPuyPDUtSRwduKIIP3+10P9qP483rKWIIn4I95TJgWw0esHvwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892368; c=relaxed/simple;
	bh=5bobVkewzrgLDhKEFwJ7W18zWL/MkgncCrbmrvJgyCc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EornAbHdwI98B7SYszoWEYTljjT5zCGdxwCzoG7f/Etob+S93bkGz412ExRvrTvEm+b1tseeJFKKakzqZiG7JaBX6Qb2dZ4sRvVJsbud1Pu4pOfpy4PAr+qWdl9YOHAMxcbR9Cd3u4K3QZSE+GalVO7Uo/MuSZvpincD7dTulpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPtDKc+C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPtDKc+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C809E1F00AC4;
	Wed,  1 Jul 2026 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782892367;
	bh=fzYUc596fyV/RI2fDTezAq6aqndgLqCoA5+a82PSGeo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cPtDKc+CoGGrA2skO3CZalL/cceVOLvWAATao7Wy4OYzRuAWK9SG5cI9JPEgV4fQp
	 Vk/iAowWS5LHIaNSZDIcXdxFB9VdMHeHKUWogctnJxmk6wFF3dvCJG/RIVTwcI7/qL
	 ULWvb4h94sbo14sgi/PPMzjKvg1RMz1023mcyPklMB/OpjmGOJypOUv5k0S8pmWNg9
	 Wa6ij5lVpASxqzUwshfsWGzmpckJanCuHwlhk+xuWjh8D8YvXcMyPvXvJm7jgF/irD
	 a8FXxtYk2A57siYvYDmG8A45cwRlLOqFcp0og0jOvhkuGXaZAQtXz8OjYYEaqQ4NkU
	 RrmS6PkIjx4FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: memory-controllers: mtk-smi: Add
 support for mt8189
Reply-To: sashiko-reviews@lists.linux.dev
To: "Congcong Yao" <Congcong.Yao@mediatek.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260701074533.175803-2-Congcong.Yao@mediatek.com>
References: <20260701074533.175803-1-Congcong.Yao@mediatek.com>
 <20260701074533.175803-2-Congcong.Yao@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 07:52:46 +0000
Message-Id: <20260701075246.C809E1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The newly added compatible string `mediatek,mt8189-smi-common` i=
s omitted from the `if-then` generational conditional blocks that define st=
rict clock constraints.
- [Low] The SoC generation list in the binding description was not updated =
to include mt8189.
--

commit 6c2bad5d055d1f72dd33d20414abab2cdf2654cb
Author: Zhengnan Chen <zhengnan.chen@mediatek.com>

dt-bindings: memory-controllers: mtk-smi: Add support for mt8189
   =20
Add smi larb, common and sub-commom binding description for mt8189.

> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediate=
k,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/me=
diatek,smi-common.yaml
> index 0762e0ff66ef0..4e1deeff92b14 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-c=
ommon.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-c=
ommon.yaml
> @@ -25,6 +25,21 @@ description: |
>    SMI generation 1 to transform the smi clock into emi clock domain, but=
 that is
>    not needed for SMI generation 2.

[Severity: Low]
This isn't a bug, but the generation 2 SoC list earlier in this description
block reads: "generation 2: mt2712, mt6779, mt8167, mt8173, mt8183, mt8186,
mt8188, mt8192 and mt8195." Should mt8189 be added to this list as well?

> +  The smi-common connects with smi-larb and IOMMU. The maximum inputs nu=
mber of
> +  a smi-common is 8. In SMI generation 2, the engines number may be over=
 8.

[ ... ]

> @@ -40,6 +55,8 @@ properties:
>            - mediatek,mt8186-smi-common
>            - mediatek,mt8188-smi-common-vdo
>            - mediatek,mt8188-smi-common-vpp
> +          - mediatek,mt8189-smi-common
> +          - mediatek,mt8189-smi-sub-common

[Severity: Medium]
Is mediatek,mt8189-smi-common missing from the generational conditional blo=
cks
that enforce strict clock constraints?

Looking further down in mediatek,smi-common.yaml at the allOf block:

  - if:  # for gen2 HW that have gals
      properties:
        compatible:
          enum:
            - mediatek,mt6779-smi-common
            - mediatek,mt8183-smi-common
            ...

If mt8189-smi-common shares the same clock constraints as these Gen 2 devic=
es,
omitting it from this conditional block will cause device trees with invalid
clock configurations to silently pass validation. Should it be added to the
enum list here (or the corresponding Gen2 block without gals)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701074533.1758=
03-1-Congcong.Yao@mediatek.com?part=3D1
