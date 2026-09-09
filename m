Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D6A58039A
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963771; cv=none; b=Cxai7k16ah3BrLpQm3KQfi47yfY66UwhFtBe7nkAmrO1l0IYGkjoZseJHxtI2dANZ40G16O1/+wbCgbkxTuvp6MztWAtU4NOujkmnjcXS/mfZJb36YcsECF+DkTQAJ2PlJ7t/+F436vYBPvtGr5MgP8IR1u6ETC+ZUxsQtsWrhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963771; c=relaxed/simple;
	bh=yLWe1wzaHUSxWvqL0UFs3Lq6cdqERLtZQBSSxHZn+lQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gtGPamrmEckcqUSF4WPd6w5it4g/SsbyUFyCtVcyAcsMKW5sME9p3vaA+SYgo6Yzb1yhnbxt4OBWGsAy7VXyX50WfBGh2yv2SZJpbNBCXt7iriqkbNJRh1OGtR23QBEbWnHVuaV3AzlRwHIS5nvSoUCTVUmYdh2TTU+XM4TOn7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqA2ir7x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqA2ir7x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988F11F00A3A;
	Wed,  9 Sep 2026 14:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788963769;
	bh=SIvc5mPyMkEWCMpDHyLjbWNFnUdIfSydNldBzd1gJHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fqA2ir7xJY4rstMZplLNB3+XYqXLssvGV2qMh7kgYSmT4zLcY8AWKzkk65ELM7vQp
	 XEekXt32JA6bCJYf0k6lC/oAcPyy+Cx5tmY5Q6m6rGUm8sWNtZ5nJHBXLNcaSFPSPO
	 v8AnVaWhDvbijLZkOC8CW/T3IpCgb6oOnlqGY88vBgXhjHnmf6CU0NRHMQpy2L37gw
	 lPrN3qxwX7SDekMKoMOM4I4sE0wo3lTIhb0vmfSPJK527MKE5bO7DLcu2nc/Mr9c8J
	 H5H5zhrmd1rtkB5S4FyJ8fUa28uQfiGvp5IEi2cxvdq4mf4eF6xlKbDyOt35Zc7QL3
	 Er1GCkhZG58mQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iommu: mediatek: add mt6572
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909-6572-iommu-v1-1-de261da09fb2@protonmail.com>
References: <20260909-6572-iommu-v1-0-de261da09fb2@protonmail.com>
 <20260909-6572-iommu-v1-1-de261da09fb2@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 14:22:49 +0000
Message-Id: <20260909142249.988F11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing SMI (Smart Multimedia Interface) bindings for mt6572 alo=
ngside the new IOMMU binding.
--

commit a4582297bd41ae5d3cd46c52f5db31a076c1b128
Author: Roman Vivchar <rva333@protonmail.com>

dt-bindings: iommu: mediatek: add mt6572
   =20
Add compatible string and header file for mt6572 IOMMU support.

> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml =
b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index 79c573c47b08e..d0ac4bd719116 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -72,6 +72,7 @@ properties:
>        - enum:
>            - mediatek,mt2701-m4u  # generation one
>            - mediatek,mt2712-m4u  # generation two
> +          - mediatek,mt6572-m4u  # generation one

[Severity: Medium]
Will device trees for MT6572 fail dt_binding_check because the required SMI
larb nodes lack documented compatible strings for this SoC?

The schema for mediatek,iommu.yaml strictly requires mediatek,larbs for
this IOMMU in its allOf block:

  - if: # The IOMMUs don't have larbs.
      not:
        properties:
          compatible:
            contains:
              enum:
                - mediatek,mt8188-iommu-infra
                - mediatek,mt8189-iommu-apu
                - mediatek,mt8189-iommu-infra
                - mediatek,mt8195-iommu-infra
    then:
      required:
        - mediatek,larbs

However, the corresponding SMI bindings (mediatek,smi-larb.yaml and
mediatek,smi-common.yaml) do not appear to have been updated to include
the mt6572 compatible strings needed to define those required larb nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-6572-iommu=
-v1-0-de261da09fb2@protonmail.com?part=3D1
