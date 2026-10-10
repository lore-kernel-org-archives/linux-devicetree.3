Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08267392823
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620331; cv=none; b=CNnnHt0mt5vSucp1wiDfqJmaYhW3VNQfCwfXx4/B9XbM06aQV/so+UgKZrzWP+yOYytQorHLL5Z9OC+7WS4Hijb9dZAZ3GxiO0H+aogzlgl6Vhoqbhd7bHYvvyQiWp+YhosbGign/f05RfHLLN9Ba2wAoSaGYB3h+1JShyEXl/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620331; c=relaxed/simple;
	bh=qlZgvJ2wF/7J9StRN5+o3LXHL9GdsKglZ0LMeZMRd8I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mgX7qdHuaH+OlqqHX6XbcbAFeqYSrpEodZPHWPitEViR4TC6cA7uI+susXRm5Q74CLtyDmU+gR0G+WqOIGLXrREWsvU7pm4JirKHL/v2Xc4VByrA1bhb91wChVe7UM5XTCD+JfzwCfpR8fFznojrxEtCgC33zkyU+SU7kBdzit0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ba6KHnir; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ba6KHnir"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DB71F000FF;
	Sat, 10 Oct 2026 08:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791620324;
	bh=Natt13Up+m3af6z13OfENsVVrLxANi3BJuxVd0L85EY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ba6KHnirxsOXiiH7Qwyu4u7R/KLRP8qv3+G2/buldmjD6jqBFgVuS7ialjMx2arx3
	 TPQhjyhF3hePm4ReEJp/fgNdmG2wnLL6Z76Kly1ZG8BCtRzUecDucZ+RrrAQRG3u9s
	 WzUk4SJ5uZsv+CUGGgH4TKpMVU5AfWV3smk5TYakf3HhemgXmnmgNNHcYEPDMuBZr6
	 k4mvvSFGjgJOfrAHulYuSU2Jj9S+kGJ5JfSmBHKymH09Z1u485pvRwYfTWbNiTsFGu
	 Eee3/B1xWy9jlM4ALuZTK4VvbF9UrpzeL0NRNAf3QHQdCGWSfkH5JwteEDee6A5InZ
	 mAxyw3Lh8t8zQ==
Message-ID: <sashiko-outbox-166333@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 10/13] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgenc compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <35308d395e71ca6299c53a3268ec7ca7f37f9a4a.1791614327.git.kyrie.wu@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
 <35308d395e71ca6299c53a3268ec7ca7f37f9a4a.1791614327.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:18:43 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: media: hardcoded M4U iommus description applied to SMMU
--

commit 4d170d7f6a62a55e32063d072935c6eaecadd30f
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc compatible

This commit adds the "mediatek,mt8196-jpgenc" compatible string to the Medi=
aTek
JPEG encoder dt-binding document. The commit message notes that the MT8196 =
uses
an SMMU and supports features like dynamic voltage and frequency scaling.

> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpeg=
enc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.=
yaml
> index 596186497b684..e2d772ea0fb01 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> @@ -14,7 +14,9 @@ description:
> =20
>  properties:
>    compatible:
> -    const: mediatek,mt8195-jpgenc
> +    enum:
> +      - mediatek,mt8195-jpgenc
> +      - mediatek,mt8196-jpgenc
> =20
>    power-domains:
>      maxItems: 1

[Severity: Low]
Since the commit message states that MT8196 uses an SMMU instead of an IOMM=
U,
is it correct to retain the existing iommus description for this new
compatible?

Looking at properties:iommus in this file, the top-level description is:

  iommus:
    maxItems: 4
    description:
      Points to the respective IOMMU block with master port as argument, see
      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for detai=
ls.
      Ports are according to the HW.

Because MT8196 uses an SMMU, the "master port" and M4U reference
(bindings/iommu/mediatek,iommu.yaml) seem misleading for the newly added
mediatek,mt8196-jpgenc compatible. While a later patch in this series adds
SMMU configuration properties, it does not appear to fix this descriptive
discrepancy.

Could this be updated or conditionally overridden for MT8196?

> @@ -44,7 +46,9 @@ patternProperties:
> =20
>      properties:
>        compatible:
> -        const: mediatek,mt8195-jpgenc-hw
> +        enum:
> +          - mediatek,mt8195-jpgenc-hw
> +          - mediatek,mt8196-jpgenc-hw
> =20
>        reg:
>          maxItems: 1

[Severity: Low]
The child node iommus property (under
patternProperties:^jpgenc@[0-9a-f]+$:properties:iommus) also has an
M4U-specific description:

      iommus:
        minItems: 1
        maxItems: 32
        description:
          List of the hardware port in respective IOMMU block for current S=
ocs.
          Refer to bindings/iommu/mediatek,iommu.yaml.

Would it make sense to update this description to reflect the SMMU stream I=
Ds
used by the newly added mediatek,mt8196-jpgenc-hw compatible?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791614327.gi=
t.kyrie.wu@mediatek.com?part=3D10
