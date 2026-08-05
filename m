Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08CF3DAACA
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913830; cv=none; b=jWx9LoyT+XCSXTIWTTQ+fNmBfN/3Qh/QEh2VO9ne8t7XknJgvk/FDkvi/eNJ2B/Cp7DhX5w4O+DVWIHnuV50vqkd2GcvrpBBzvIJDp+54zqxD3ALWkYZtg2bfSRb5KFCjS7XrU648ORhH9Y5upTj2d9MOlG3iQ6lWzG4vmRJoIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913830; c=relaxed/simple;
	bh=n/xKw7njViNZjOi4RkUeYbvqmlXqSRxnd9R7vPo+nok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Pazll42WfOFbXDDU6tCbKwCBKLNJkRlVoyvTHWPGkKesZ17auHFDnxGCYfdbi5vP91+/zZI21wY+4Ydc6707s7qyzO4wKHQrc+jKvi4gdZisDm8EmfAsYZCyD1feukRgkP709mdBX2KheoYzB8tzcpfh4FwRWjyezaU5C9VJbSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPZ15+XP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPZ15+XP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F761F000E9;
	Wed,  5 Aug 2026 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913829;
	bh=aolS9Ca9raWdpg5QvzhPGa2r//yx13k7GNM0NsVuz54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LPZ15+XPe+SCp+z5EQNe4bTTP1MC9qBBkztTMpXZXaMD0PKyEOOYj6H/KoHrcbUwV
	 hT4quAW06FkWX5QXAy+A7dTmocRPdzlIzB4Rg61nq8QN9FfZ9I5T+Hlbw+dbr1vD1E
	 lfuuW4mjNpfK/KDHh6L45RGhyT2oHluu5/flAjt5TOo7KX0I+sTmRbfiwSdX2RNxQa
	 vW/olyaNgnHAZrDaNZ/P8EXSKpx5NFT+zzSzfszJQnI6qZHeOWUJf9D6D1Q5i+2T/V
	 /jDBbK9D3Uq2svFKuVOAdudVQqkYUKOzX7cz53d7obXrjqAe15SC2X5WIjJKMmOuVo
	 47IbspOomne7A==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v5 v5 3/8] dt-bindings: iommu: rockchip: allow the
 RK3576 NPU MMU clock set
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260805063826.95682-4-gahing@gahingwoo.com>
References: <20260805063826.95682-1-gahing@gahingwoo.com>
 <20260805063826.95682-4-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 07:10:28 +0000
Message-Id: <20260805071029.57F761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Adding the three NPU clocks globally relaxes the maximum allowed=
 clocks to 5 for all Rockchip IOMMUs, disabling strict validation for older=
 hardware.
- [Medium] The failure to introduce a distinct compatible string for the NP=
U MMU hardware variant prevents the schema from enforcing its mandatory ext=
ra clocks.
--

--- Patch [3]: [RFC PATCH v5 v5 3/8] dt-bindings: iommu: rockchip: allow th=
e RK3576 NPU MMU clock set ---
commit 1dfa4f75475ad14a765f82a9e6d6d985e8af62dc
Author: Jiaxing Hu <gahing@gahingwoo.com>

dt-bindings: iommu: rockchip: allow the RK3576 NPU MMU clock set

This commit expands the clocks and clock-names properties in the Rockchip I=
OMMU
binding to allow up to 5 items to support the RK3576 NPU MMU. It maintains a
minimum item count of 2 to keep existing device trees valid.

> diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml =
b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> index 6ce41d11ff5e5..a3cedcaaa9792 100644
> --- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> @@ -42,14 +42,22 @@ properties:
>      minItems: 1
> =20
>    clocks:
> +    minItems: 2
>      items:
>        - description: Core clock
>        - description: Interface clock
> +      - description: Compute clock, RK3576 NPU MMUs only
> +      - description: Convolution buffer core clock, RK3576 NPU MMUs only
> +      - description: Convolution buffer interface clock, RK3576 NPU MMUs=
 only

[Severity: Medium]
Does expanding the items list globally cause a regression by relaxing the
maximum allowed clocks to 5 for all Rockchip IOMMUs?

If older hardware variants specify 3, 4, or 5 clocks in their device trees,
they will now silently pass schema validation. Would it be better to restri=
ct
the maximum clocks to 2 for older variants using an allOf: if-then
conditional block?

Additionally, because the generic rockchip,rk3576-iommu compatible string is
used for both standard and NPU MMUs, the schema forces minItems: 2 globally.
Does the lack of a distinct compatible string for the NPU MMU hardware vari=
ant
introduce a regression where the schema is prevented from enforcing its
mandatory extra clocks?

If a device tree node for the RK3576 NPU MMU is missing its required extra
clocks, won't it silently pass validation but fail at runtime by dropping
register writes?

> =20
>    clock-names:
> +    minItems: 2
>      items:
>        - const: aclk
>        - const: iface
> +      - const: npu
> +      - const: aclk_cbuf
> +      - const: hclk_cbuf

[Severity: Medium]
Similar to the clocks property above, does widening the clock-names property
without conditional constraints cause a regression that allows invalid
configurations for older hardware variants to silently pass validation?

Should an allOf: if-then block be used here as well?

> =20
>    "#iommu-cells":
>      const: 0

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805063826.9568=
2-1-gahing@gahingwoo.com?part=3D3
