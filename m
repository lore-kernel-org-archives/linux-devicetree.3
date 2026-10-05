Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244412E401
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199500; cv=none; b=QDKQdLYXsjiwqvnc6Kq8st9JN0IGgHgnsseh4TxmuKT+ZgLrNyBtmdnLqxPYeHa61sj45H5MejJBRExg+VXi3Ji1QZf/UUhfydSVvgpltP+Ctq76+WKy0iwbBexRXhkgYAxExNiyT/+qwFnmOSx8CGOqvqF0mmZtqHD0xM/kt3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199500; c=relaxed/simple;
	bh=0dRDoXJ2CngZunZKl/j8CknQwNymN0ydZxR6w0VQXvc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WuI9ncTl2Siqag6I3I4gLBuF6oOitYJsaDnQTN3cyzyqSV/ubyR+QqkVDqj7wJV7ra2XtnWnmRZZuQ0ax1swyLyKzCgfdwDipmZ548If8lQRolUa/tSbAXC+dgsQmtmsucKfox/cbVW94o2Wv2/QwjE+y4Qd0UL1C6BWuRC3c9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Awt2YUEx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Awt2YUEx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAE61F000FF;
	Mon,  5 Oct 2026 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791199498;
	bh=jcRgs9d0ct8cogoJ7Um3PsBicoM+zoc2DCfJdd206UI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Awt2YUEx7f83NdJeqFIqoTgvkb+jfkmhHtNaTnu6ds5r/G68v26HJYF9lHxYFomUK
	 w4mGN5w6963GIc1LQqmqcKsjU4BqgjKVLGDmhD2sGTtNZ6zOVcNFvUJxse8zkSN2vH
	 Fy65sh4sA3Rwst7dh1/V0ovVvy1UKi3KKcCDYHq1DauXieqUMGoWYBPBwQukgL4t6S
	 qFvxoFAt0wKrXzvuU+Q8OEeUvPzE+mhOIVSivYluqH1LV3VTvGy2RgXxnH2Nnl+1dW
	 iC8p4qIAw8ihIYzOMWNRW/hnJ8fW242QAVeJAwEcCs3RL1WBBxpmZpD5sRQ22C+uYj
	 /F+HQG8v6DibQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 3 IOMMUs for LPAICP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261005-shikra-el2-v3-1-618f7343695c@oss.qualcomm.com>
References: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
 <20261005-shikra-el2-v3-1-618f7343695c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 11:24:58 +0000
Message-Id: <20261005112458.6FAE61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: remoteproc: qcom,shikra-pas: Broken inheritance dro=
ps #cooling-cells
- [Low] dt-bindings: remoteproc: qcom,shikra-pas: Missing minItems: 3 for i=
ommus
--

commit e7d5ea05bb3cbb1ebebda930478b2df76f82dd6e
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,shikra-pas: Allow 3 IOMMUs for LPAICP

This patch removes the common PAS schema inheritance (qcom,pas-common.yaml)
and specifies local IOMMU entry limits for each Shikra PAS compatible. It
allows 3 IOMMU entries for the LPAICP variant, resolving a conflict where t=
he
common schema previously limited iommus to a single entry.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> index 34a2f15e93616..4196f61a8ba0c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml

[ ... ]

> @@ -92,10 +95,14 @@ required:
>    - compatible
>    - reg
>    - memory-region
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - qcom,smem-states
> +  - qcom,smem-state-names
> =20
>  allOf:
> -  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
> -
>    - if:
>        properties:
>          compatible:

[Severity: Medium]
Does removing the $ref to qcom,pas-common.yaml# cause the schema to lose
support for standard PAS features like #cooling-cells?

Because json-schema allOf cannot loosen constraints, the inheritance from t=
he
common PAS schema was severed to resolve the conflict with the inherited
maxItems: 1 constraint on iommus.

However, this prevents qcom,shikra-pas.yaml from receiving future updates to
the common PAS schema and silently drops support for inherited properties.
Since unevaluatedProperties: false is used, any attempt to use #cooling-cel=
ls
in a Shikra PAS node will now trigger a schema validation error.

Would it be better to relax the iommus: maxItems constraint in
qcom,pas-common.yaml (e.g., to 3 or higher) and apply stricter local
constraints where needed, rather than breaking the inheritance chain?

[ ... ]

> @@ -134,6 +143,8 @@ allOf:
>            minItems: 2
>          firmware-name:
>            minItems: 2
> +        iommus:
> +          maxItems: 3

[Severity: Low]
Should there be a minItems: 3 constraint added here?

The commit message explicitly states: "The Shikra LPAICP PAS requires three
IOMMU entries." However, maxItems only sets an upper bound.

Without minItems: 3, incomplete device tree overlays with only 1 or 2 iommus
entries will silently pass schema validation despite violating the strict
hardware requirement.

Making the property mandatory via required: would be incorrect since iommus
is intentionally omitted from the base DT and added via an EL2 overlay, but
when the property is present, the 3-entry minimum size constraint must be
enforced.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-shikra-el2=
-v3-0-618f7343695c@oss.qualcomm.com?part=3D1
