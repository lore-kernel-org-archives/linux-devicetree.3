Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542C430FC1C
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779158152; cv=none; b=FramUtskLoVslMC8Ma6LgpJcifAo+e9B7jVfaZHqxnCHB1s0N5VIvNaDn46vRBM9DtFlEDpiavH3V6J5QVHNvrgIdNqYNUyRtw08ZS9SVVq2Jf7cNJitE4xG4k030XugHyV2EZ+V51P/3GVEjb1nC0YZ/a2T/1juGF5GFi/WJu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779158152; c=relaxed/simple;
	bh=RHyvPd7fbU3h0d1H041du+gwX8UBl76Zmp2W5tBbTkk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jipFivgp2gvNMkDO2zs4cxg8Puu+NXHwwArd82kvmH4T44nBV4Gt55rbusz+LiJlCorOwTOo5nfY6HZnZBf5p4PcKS4KWAjHh9ixOgpsbiWtOwQ9hrTHsHLFQQEjsGzblOzpJE5gK0JuN3fIMAikC6jwyforISzLrWgNtLS6yvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGb4wao3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGb4wao3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50ECC2BCB7;
	Tue, 19 May 2026 02:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779158152;
	bh=RHyvPd7fbU3h0d1H041du+gwX8UBl76Zmp2W5tBbTkk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QGb4wao3YUQ5eYVNpLXJnVExYwIX1w5MhxgyU/JavvppFKSv2oDteIvl74NMPP+gW
	 rMsiVYvtjhutsSrMHfLB6nhjHjr/CyTuQSSBwzX5WRNZMyWMHPxn4+sTAbYhsQZezw
	 wl04kSvmQTGMPyRjSz/+Nl6ZSLqqe8pAEQDOUrRQKL1l3A5MDIpInLTPd+FrvIFvfm
	 AUqTZXDdAKE4okoMB9kEVWNwYHzeCdGEnIXJCyNoPEFtkzubjKE4Fa9P6NPDtdpkk9
	 CoKPv+bzVDbwk7Guqy0lQj4OiPx8EKCeFhXweROzvJ+Jo0QFqWZrktiABewh6100Yr
	 deT27U+JROgow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/3] dt-bindings: media: mediatek-jpeg-encoder: add
 MT8189 compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jianhua Lin" <jianhua.lin@mediatek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519021726.19137-3-jianhua.lin@mediatek.com>
References: <20260519021726.19137-3-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 02:35:51 +0000
Message-Id: <20260519023551.B50ECC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The commit silently introduces a new `mediatek,larb` property an=
d makes it mandatory for the MT8189 variant without any mention in the comm=
it message.
- [Low] The new compatible string `mediatek,mt8189-jpgenc` is defined using=
 an `enum` containing a single item instead of `const`.
--

commit de42f55ad078326b54b85cf561d120b901b074be
Author: Jianhua Lin <jianhua.lin@mediatek.com>

dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible string

This commit adds the compatible string for the JPEG encoder block found
in the MediaTek MT8189 SoC. It is added as a standalone compatible string
without falling back to the generic identifier to ensure proper 34-bit IOVA
address space support.

> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encode=
r.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> index 5b15f8977f67f..f75871e72633b 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> @@ -14,13 +14,17 @@ description: |-
> =20
>  properties:
>    compatible:
> -    items:
> +    oneOf:
>        - enum:
> -          - mediatek,mt2701-jpgenc
> -          - mediatek,mt8183-jpgenc
> -          - mediatek,mt8186-jpgenc
> -          - mediatek,mt8188-jpgenc
> -      - const: mediatek,mtk-jpgenc
> +          - mediatek,mt8189-jpgenc

This isn't a bug, but dt_binding_check usually warns about using an enum wi=
th
a single item. Should this use const instead?

> +      - items:
> +          - enum:
> +              - mediatek,mt2701-jpgenc
> +              - mediatek,mt8183-jpgenc
> +              - mediatek,mt8186-jpgenc
> +              - mediatek,mt8188-jpgenc
> +          - const: mediatek,mtk-jpgenc
> +

[ ... ]

> @@ -45,6 +49,10 @@ properties:
>        Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for de=
tails.
>        Ports are according to the HW.
> =20
> +  mediatek,larb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: A phandle to the smi_larb node.
> +
>  required:
>    - compatible
>    - reg
> @@ -54,6 +62,16 @@ required:
>    - power-domains
>    - iommus
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8189-jpgenc
> +    then:
> +      required:
> +        - mediatek,larb

The commit message mentions the standalone compatible string is needed for
34-bit IOVA address space support, but it doesn't mention adding the new
mediatek,larb property or making it mandatory for the MT8189 variant.

Could the commit message be updated to explain the purpose and necessity of
this new hardware constraint?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519021726.1913=
7-1-jianhua.lin@mediatek.com?part=3D2
