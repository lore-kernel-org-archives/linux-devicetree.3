Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559B02DECD3
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 20:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783457439; cv=none; b=PM5dOOGfFuKszrTIFETiZlZ7MJT41T49459VRvYCADFLCSUbQiYV5XmM1lZD033C1tFdOSk131Dl4xCq/Ai9X/QmfIFQuwzLGGiRidMZlJBEIKZawyyjh9u9qxRXk5JOfNz8tnjmX2TLVxFNZUfJGexToxLWbDsjWUb5VGNG7l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783457439; c=relaxed/simple;
	bh=i1J2WRajPeCxwMPsuoNZLIx6ZjKF5AGLJKOqVTd/u0k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O0OWhHP0Fol/P7pe6VWAaYyBHRNTfv9o0t9DJbC6TYw5rAQtfNatYPPaMtY5vz28FLFkrINte5lI6tgQsCIYKH30E2nudfcb58FsheBppGo/LG1IDiToIY+Qawb9Aoj2GZqtLEToeOxbR29WZHjEr7XhoylYm1vXLosJ+dlIAQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X43xxTC0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X43xxTC0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9811F000E9;
	Tue,  7 Jul 2026 20:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783457437;
	bh=Zgvcbep2n2y2wFvMgxqmSzDQgs+x2CAKIdLQ1rV6nqA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X43xxTC0ChXJjovdfim5SzBwizQgsArDqXoYHCehyCGz2IpTVPQHvm5CvNU0rdzNS
	 6YN/V4V3m/MVc9VLqqryLxoP682ECdLUAxISrr+GJ0/pRISg8fskylnoG2ms9IrPfA
	 RSEq6D4UpcDNX6Qh6WnV9TLKDrV6bFiKjalLkwoCW0GMFwPakx9J/IP9HdeMZp5N8i
	 hC6uGYRpTvEzMQ4hs8GR/RFIuWft4JcZorirWvur87K8D+441tfVulRSOtI3JkNyrz
	 RG0nIg7ADRkJv74A8Ib1WDMvqUdzVrAwPtWoLpz7JVr8Gz91MUV5T4o2YJl9aQDb3s
	 mWJ6ijG7udT9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: iommu: ti,omap-iommu: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-ti-omap-iommu-v1-1-48cfc53aaa46@gmail.com>
References: <20260708-ti-omap-iommu-v1-1-48cfc53aaa46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 20:50:37 +0000
Message-Id: <20260707205037.9B9811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `ti,syscon-mmuconfig` property allows an unbounded number of ph=
andle-args pairs instead of exactly one pair.
- [Low] The default value for `ti,#tlb-entries` was lost during the text-to=
-YAML conversion.
--

--- Patch [1]: [PATCH] dt-bindings: iommu: ti,omap-iommu: Convert to DT sch=
ema ---
commit 2b3347ad9c4854330b15c49c45269b76eeec7cd3
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: iommu: ti,omap-iommu: Convert to DT schema

Convert Texas Instruments OMAP2+ IOMMU from text to DT schema. Make the
'ti,hwmods' property optional and mark it deprecated as it is no longer
used, it is kept to support legacy dtbs.

> diff --git a/Documentation/devicetree/bindings/iommu/ti,omap-iommu.yaml b=
/Documentation/devicetree/bindings/iommu/ti,omap-iommu.yaml
> new file mode 100644
> index 0000000000000..c23156b9b3126
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/ti,omap-iommu.yaml
> @@ -0,0 +1,112 @@

[ ... ]

> +  '#iommu-cells':
> +    const: 0
> +
> +  ti,#tlb-entries:
> +    description: Number of entries in the translation look-aside buffer.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [8, 32]

[Severity: Low]
The original text binding stated "(default: 32)" for this property. Should =
we
add `default: 32` here to preserve that information in the schema?

> +
> +  ti,iommu-bus-err-back:
> +    description:
> +      Indicates the IOMMU instance supports throwing back a bus error re=
sponse
> +      on MMU faults.
> +    type: boolean
> +
> +  ti,syscon-mmuconfig:
> +    description:
> +      Pair of the phandle to the DSP_SYSTEM syscon node that
> +      contains the additional control register for enabling the MMU, and=
 the
> +      MMU instance number (0-indexed) within the sub-system. The instanc=
e number
> +      should be 0 for DSP MDMA MMUs and 1 for DSP EDMA MMUs.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle to the DSP_SYSTEM syscon node
> +        - description: MMU instance number
> +          enum: [0, 1]

[Severity: Low]
Does this schema allow an unbounded number of phandle-args pairs?

Without a `maxItems: 1` constraint on the outer property (or using a list
constraint for the outer `items`), could a device tree with multiple pairs
(e.g., `<&sys1 0>, <&sys2 1>`) silently pass validation even though the text
binding implies only a single pair is expected?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ti-omap-io=
mmu-v1-1-48cfc53aaa46@gmail.com?part=3D1
