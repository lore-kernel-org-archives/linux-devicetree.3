Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A571121CC5C
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778554014; cv=none; b=LsGgqCTsmsecRC82xZ62Qle35FKunC/uObeGbtnThdBvgHJg3b2w9fi18/Ayu4DaE9xCtWHat8drnsNq4XD5d9Q487Bui2L5rTyDjiIS5Wct5FO0O9qZYeW7nbFm5XFEq1b2RaWqRNq60sRqhhqsUcCqAv8KNMKW28jcU0aJM/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778554014; c=relaxed/simple;
	bh=6wCCFXRpf6UWxC30PjAIFUW2m9T8FJdkLfKPDkJV90I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MBp4o6nexQKZSOiquASEjPuhSALCWJ6yw+gisWdkL4Rz8DPIdblT3C9qtYBhL2pbP9d22FDb1dBvVyoMsC+0uKSId3hcyFdOomYc4DQZvzWc0ZbjmNHXPCt4B2TdB+EeCtkXgXwELsGyHoJq1qeTw+ZjW499hIBkC70MPw5B5JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/WHuXBA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/WHuXBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165D6C2BCB0;
	Tue, 12 May 2026 02:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778554014;
	bh=6wCCFXRpf6UWxC30PjAIFUW2m9T8FJdkLfKPDkJV90I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=e/WHuXBALRIgx03KetMWZpFQvRYuGZcC/XZoGB8KpALZL/khJBI3+v1jSPZlPDLht
	 qiN7Slhiov1kWf0Q5U2Ft+8XWf/4McgCBSx/G2emicq10a0ui6DIS2knRGF2UzSsMm
	 43Vagnjk6r5GCuuG+KNgcKp95ee1g+xjAP438N/pN522lUcUU60UBY4+Ko2OEOLHPE
	 Jd64kPXPIRZKY6YUF2qSo35A0QY8Vx/kPrCl/58NOQdaEzsGqAS/WoOLynMX5XjPYX
	 Y9hLqDr/qWxdcKkcO1JhAPBrMDLhFrayM2P9Xcbp4U15DS3FAkvnMdqskD7/9+fyn9
	 VZVOwo3fEzZMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple
 memory regions for MT8188
Reply-To: sashiko@lists.linux.dev
To: "Arnab Layek" <arnab.layek@mediatek.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511121004.2984149-2-arnab.layek@mediatek.com>
References: <20260511121004.2984149-2-arnab.layek@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:46:53 +0000
Message-Id: <20260512024654.165D6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Schema constraint override failure for `memory-region` maxItems
--

commit 609e858e4a4e669b55ac4136f210e50fe09b79a7
Author: Arnab Layek <arnab.layek@mediatek.com>

dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for MT8188

This commit attempts to allow up to two memory regions for MT8188
compatibles by adding an if/then block. The new regions are
documented with descriptions for the main SCP SRAM and the optional
SCP L1TCM.

> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/=
Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index bdbb12118da43..df13be2026a67 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml

[ ... ]

> @@ -205,6 +205,27 @@ allOf:
>            items:
>              - const: cfg
>              - const: l1tcm
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8188-scp
> +            - mediatek,mt8188-scp-dual
> +    then:
> +      properties:
> +        memory-region:
> +          minItems: 1
> +          items:
> +            - description: Main SCP SRAM memory region
> +            - description: Optional SCP L1TCM memory region

Does this code introduce a regression where 2 items are not actually allowed
for these compatibles?

In dt-schema, constraints are evaluated additively. The base schema
explicitly defines maxItems: 1 for memory-region. Because an if/then
block cannot override or relax a stricter constraint from the base schema,
a device tree specifying 2 memory regions for mediatek,mt8188-scp will
still violate the base maxItems: 1 constraint and fail dt_binding_check.

Does the global constraint need to be increased to maxItems: 2, and then
maxItems: 1 enforced selectively for other SoCs via conditional blocks?

> +      patternProperties:
> +        "^scp@[a-f0-9]+$":
> +          properties:
> +            memory-region:
> +              minItems: 1
> +              items:
> +                - description: Main SCP SRAM memory region
> +                - description: Optional SCP L1TCM memory region

Does this patternProperties block have the same regression?

The base patternProperties block for ^scp@[a-f0-9]+$ also defines
maxItems: 1 for memory-region, which would likewise prevent this
conditional block from allowing multiple items.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511121004.2984=
149-2-arnab.layek@mediatek.com?part=3D1
