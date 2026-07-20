Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BEF42A7A7
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557008; cv=none; b=isudISzb56GhtCBYTMICdHKB8rQmejN+XytDNZLY1QxiBnPtgLylOTJyWpU/W6PXvhYb9wcEnshZ1WjR8qNL9ScmgrVaqKb9229Jq05O/9j5R0+NXwfdmrv7G7arvceDAKwz3SA8tb62F0nhqBGTaf2xAm8tOHkMD+MFicH/ecE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557008; c=relaxed/simple;
	bh=ihVUTxbniXM5cEQZEu0+PeQdJItOZam6G4ggvKDscBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RRSfKsx113/d5XigDef0MIsjuLQxfd1mEKE6fXD70m8tasyGVeS1ZRTMOiKe8Xu0z+vEHwjmesQwLjeE7ueTY1Fh05YoT7Pv9arPvXS7GH9Ekm2/5WpZuWyLQJka1S7GuvnHjxz/Ye8Y4WLNKvBDsrw95QpBqXZcrYaJ+EcatQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+CQq8+5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+CQq8+5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD3E1F00A3D;
	Mon, 20 Jul 2026 14:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784557007;
	bh=dNjtLkd9xUGunJVzlUcx49+8ixg2EKm7IfBXFBRa1Qw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l+CQq8+5O05VxJfzKAjBfQgNDeQj1Y6xwZw99cFmxTxIPGuyUu0UfLTR7G9moMoWd
	 JKsbMsJXxUrjuWYK3dKMRkN1eDe7fhlwJAPC4B6wOL/VkIsrng3A7ANX1gGNEge5rG
	 odT+I0M0PZRTt92Q02E36URHb/CHRqodMrl9VIYU5ewLH2aTlb/4AvBN7PHC/NWtlt
	 RaUPRwWueqzAjjevO3em3BB1BvmcYAOtV/S6sdyP6R5eZdTf5lel1nwhDazY++k9p7
	 FIok8eK/RxeXt/15vL/V95paT0zZtnO9stgDKInsBhRFSrMHdLo5thO//nUY+Mdv06
	 k0B/+afG3mxPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 10/12] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgenc compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720133432.1042046-11-kyrie.wu@mediatek.com>
References: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
 <20260720133432.1042046-11-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 14:16:46 +0000
Message-Id: <20260720141646.AAD3E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Inaccurate documentation for the `iommus` property regarding the MT=
8196 SMMU change.
--

--- Patch [10]: [PATCH v16 10/12] media: dt-bindings: mediatek,jpeg: Add me=
diatek, mt8196-jpgenc compatible ---
commit 11c0f39e5d822c22a0e461d70a256b8d2035d561
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc compatible

This patch adds the mediatek,mt8196-jpgenc compatible string to the
MediaTek JPEG encoder binding. The commit message notes that the MT8196
uses an SMMU instead of an IOMMU.

> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpeg=
enc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.=
yaml
> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> @@ -14,14 +14,16 @@ description:
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
> =20
>    iommus:
>      maxItems: 4
>      description:
>        Points to the respective IOMMU block with master port as argument,=
 see
>        Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for de=
tails.

[Severity: Low]
The commit message states that MT8196 uses an SMMU instead of an IOMMU, but=
 the
documentation for properties.iommus still hardcodes references to
mediatek,iommu.yaml and specifies using a master port as argument.

Since SMMUs typically use stream IDs rather than master ports, does this
documentation regression need to be updated or generalized to remain accura=
te
for the newly added mt8196-jpgenc compatible?

[ ... ]

> @@ -44,14 +46,16 @@ patternProperties:
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
> =20
>        iommus:
>          minItems: 1
>          maxItems: 32
>          description:
>            List of the hardware port in respective IOMMU block for curren=
t Socs.
>            Refer to bindings/iommu/mediatek,iommu.yaml.

[Severity: Low]
Similarly, the patternProperties.iommus description for the hardware nodes
still hardcodes the legacy mediatek,iommu.yaml reference.

Would it make sense to update this description as well to account for the
SMMU change described in the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133432.1042=
046-1-kyrie.wu@mediatek.com?part=3D10
